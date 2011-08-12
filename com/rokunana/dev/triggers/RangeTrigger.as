package com.rokunana.dev.triggers {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	[Event(name="complete", type="flash.events.Event")]
	[Event(name="change", type="flash.events.Event")]
	
	/**
	 * 指定した範囲を越えるとイベントを発行する
	 * @author kaede
	 */
	public class RangeTrigger extends EventDispatcher {
		
		private var _max : Number;
		private var _min : Number;
		private var _value : Number;
		
		public function RangeTrigger(value:Number=0,max:Number=100,min:Number=0) {
			this.max = max;
			this.min = min;//maxよりもminのほうが大きく設定されてしまっている場合はmax=minとする
			this.value = value;
		}
		
		/**
		 * 実値で指定
		 */
		public function set value(value:Number):void{
			if(value > _max)value = max;
			if(value < _min)value = min;
			if(value != _value){
				_value = value;
				dispatchEvent(new Event(Event.CHANGE));
				if(value >= _max)dispatchEvent(new Event(Event.COMPLETE));
			}
		}
		
		/**
		 * 割合を指定
		 */
		public function set percent(percent:Number):void{
			value = (_max * percent)+min;
		}
		
		public function get percent():Number{
			return ((value-min) / (_max-min)) || 0;
		}
		
		public function get value():Number{
			return _value
		}

		public function get min() : Number {
			return _min;
		}

		public function set min(min : Number) : void {
			_min = (min > max) ? max : min;
		}

		public function get max() : Number {
			return _max;
		}

		public function set max(max : Number) : void {
			_max = max;
		}
		
		public function get completed():Boolean{
			return percent >= 1;
		}
		
		
	}
}
