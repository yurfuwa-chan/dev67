package com.rokunana.dev.triggers {
	import flash.events.EventDispatcher;
	import flash.events.Event;
	
	/**
	 * トリガーの変更に応じてハンドラーにvalueを与える
	 * @author kaede
	 */
	public class TriggerObserver extends EventDispatcher implements IHasValue {
		
		private var _trigger : RangeTrigger;
		private var _target : IHasValue;
		private var _usePercent : Boolean;
		private var _completeRelease : Boolean;
		
		public function TriggerObserver(target:IHasValue=null,trigger:RangeTrigger=null,usePercent:Boolean=false,completeRelease:Boolean=false) {
			this.target = target;
			this.usePercent = usePercent;
			this._completeRelease = completeRelease;
			this.trigger = trigger;//triggerが設定されるタイミングでイベント登録される
		}

		private function registerEventListener() : void {
			trigger.addEventListener(Event.COMPLETE, triggerCompleteHandler)
			trigger.addEventListener(Event.CHANGE, triggerChangeHandler)
		}
		
		public function releaseEventListener() : void {
			trigger.removeEventListener(Event.COMPLETE, triggerCompleteHandler)
			trigger.removeEventListener(Event.CHANGE, triggerChangeHandler)
		}

		protected function triggerChangeHandler(event : Event) : void {
			updateTargetValue();
		}

		protected function triggerCompleteHandler(event : Event) : void {
			if(completeRelease)releaseEventListener();
			dispatchEvent(event);//イベント委譲
		}
		
		protected function updateTargetValue():void{
			if(target){
				target.value = (!usePercent) ? trigger.value : trigger.percent;
			}
		}

		public function get trigger() : RangeTrigger {
			return _trigger;
		}

		public function get target() : IHasValue {
			return _target;
		}

		public function set target(target : IHasValue) : void {
			_target = target;
		}

		/**
		 * 引き渡される数値としてPercentを使用する
		 */
		public function get usePercent() : Boolean {
			return _usePercent;
		}

		public function set usePercent(usePercent : Boolean) : void {
			_usePercent = usePercent;
		}

		public function set trigger(trigger : RangeTrigger) : void {
			_trigger = trigger;
			if(_trigger){
				releaseEventListener();
				registerEventListener();
				updateTargetValue();
			}
		}

		public function set value(value : Number) : void {
			trigger.value = value;
		}

		public function get value() : Number {
			return trigger.value;
		}

		/**
		 * コンプリート時に自動的にリスナーを解除するか
		 */
		public function get completeRelease() : Boolean {
			return _completeRelease;
		}

		public function set completeRelease(completeRelease : Boolean) : void {
			_completeRelease = completeRelease;
		}
		
	}
}
