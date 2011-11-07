package com.rokunana.dev.model {
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;
	/**
	 * @author kaede
	 */
	dynamic public class ObjectProxy extends Proxy {
		
		private var _obj:*;
		private var _shell:Object
		
		public function ObjectProxy(obj:*=null) {
			this.obj = obj;
			_shell ={};
		}
		
		
		override flash_proxy function getProperty(name : *) : * {
			return (obj.hasOwnProperty(name)) ? obj[name] : _shell[name];
		}
		
		override flash_proxy function setProperty(name : *, value : *) : void {
			if(obj.hasOwnProperty(name)){
				obj[name] = value;
			}else{
				_shell[name] = value;
			}
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
