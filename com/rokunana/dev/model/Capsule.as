package com.rokunana.dev.model {
	import flash.utils.Dictionary;

	/**
	 * @author kaede
	 */
	public class Capsule {
		
		private var obj : Object;
		
		public function Capsule(isDic:Boolean=false) {
			this.obj = isDic ? new Dictionary() : new Object();
		}
		
		public function add(key:*,value:*):void{
			obj[key] = value;
		}
		
		public function remove(key:*):void{
			obj[key] = null;
		}
		
		public function get(key:*):*{
			return obj[key]
		}
		
		public function toArray():Array{
			var arr:Array = [];
			for each(var content:* in obj){
				arr.push(content)
			}
			return arr;
		}
	}
}
