package com.rokunana.dev.views.selection {
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.utils.Dictionary;

	/**
	 * 複数のDisplayObjectをvalueを持つラジオボタンとして扱う。
	 * IDefeasibleSelectionを実装したDisplayObjectは、他のオブジェクト選択時に自動的に選択解除状態メソッドdissolveが実行される
	 * SelectionAssembleと併用することで、複数のSelectionを管理できる。
	 * @author kaede
	 */
	 [Event(name="change", type="flash.events.Event")]
	public class Selection extends EventDispatcher {
		
		private var dic : Dictionary;
		private var _target :DisplayObject;
		private var _value : * = null;
		
		public function Selection() {
			dic = new Dictionary();
		}
		
		/**
		 * 選択オブジェクトの追加
		 * @param target ターゲット。IDefeasibleSelectionを追加することで非選択時に非選択状態にできる
		 * @param value 値
		 */
		public function add(target:DisplayObject,value:*):void{
			target.addEventListener(MouseEvent.CLICK, clickhandler)
			dic[target] = value;
		}

		private function clickhandler(event : MouseEvent) : void {
			select(event.target as DisplayObject);
		}
		
		public function select(displayObject:DisplayObject):void{
			if(_target is IDefeasibleSelection){
				IDefeasibleSelection(_target).dissolve();
			}
			_target = displayObject as DisplayObject;
			_value = dic[displayObject];
			dispatchEvent(new Event(Event.CHANGE));
		}
		
		public function clear():void{
			if(_target is IDefeasibleSelection){
				IDefeasibleSelection(_target).dissolve();
			}
			_target = null;
			_value = null;
		}
		
		/**
		 * 選択オブジェクトの削除
		 * @param target 選択オブジェクトの削除
		 */
		public function remove(target:DisplayObject):void{
			if(!has(target))return;
			target.removeEventListener(MouseEvent.CLICK, clickhandler);
			dic[target] = null;
			delete dic[target]
		}
		
		/**
		 * このSelectionは指定された選択オブジェクトをもっているか
		 */
		public function has(selection:DisplayObject):Boolean{
			return Boolean(dic[selection])
		}
		
		public function getValue(selection:DisplayObject):*{
			return dic[selection]
		}

		public function get value() : * {
			return _value;
		}

		public function get target() : DisplayObject {
			return _target;
		}
		
		public function get targets():Array{
			var arr:Array = [];
			for (var __target:* in dic){
				arr.push(__target);
			}
			return arr;
		}
		
		
		
	}
}
