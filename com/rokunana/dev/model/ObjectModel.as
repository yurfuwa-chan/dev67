package com.rokunana.dev.model {
	import flash.events.Event;
	import flash.events.EventDispatcher;

	/**
	 * @author kaede
	 */
	dynamic public class ObjectModel extends ObjectProxy implements IModel {
		
		private var _dispatcher:EventDispatcher;
		
		public function ObjectModel(obj : * = null) {
			_dispatcher = new EventDispatcher();
			super(obj);
		}
		
		override public function set obj(obj : *) : void {
			super.obj = obj;
			dispatchEvent(new Event(Event.CHANGE));
		}

		public function addEventListener(type : String, listener : Function, useCapture : Boolean = false, priority : int = 0, useWeakReference : Boolean = false) : void {
			_dispatcher.addEventListener(type, listener,useCapture,priority,useWeakReference);
		}

		public function dispatchEvent(event : Event) : Boolean {
			return _dispatcher.dispatchEvent(event);
		}

		public function hasEventListener(type : String) : Boolean {
			return _dispatcher.hasEventListener(type);
		}

		public function removeEventListener(type : String, listener : Function, useCapture : Boolean = false) : void {
			_dispatcher.removeEventListener(type, listener,useCapture);
		}

		public function willTrigger(type : String) : Boolean {
			return _dispatcher.willTrigger(type);
		}
		
	}
}
