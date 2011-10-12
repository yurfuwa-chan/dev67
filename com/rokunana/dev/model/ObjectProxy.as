package com.rokunana.dev.model {
	import flash.utils.flash_proxy;
	import flash.utils.Proxy;
	/**
	 * @author kaede
	 */
	dynamic public class ObjectProxy extends Proxy {
		
		private var _obj:*;
		
		public function ObjectProxy(obj:*=null) {
			this.obj = obj;
		}
		
		override flash_proxy function getProperty(name : *) : * {
			return obj[name];
		}
		

		public function get obj() : * {
			return _obj;
		}

		public function set obj(obj : *) : void {
			_obj = obj;
		}

		public function toString() : String {
			return obj is XML ? obj.toXMLString() : obj.toString();
		}
		
		
	}
}
