package com.rokunana.dev.utils {
	import flash.system.ApplicationDomain;
	import flash.display.DisplayObject;
	/**
	 * @author kaede
	 */
	public class SWFAdapter {
		
		private var _content : DisplayObject;
		private var _ad :ApplicationDomain;
		
		public function SWFAdapter(content:DisplayObject):void{
			this._content = content;
			this._ad = this._content.loaderInfo.applicationDomain;		
		}
		
		public function def(name:String):DisplayObject{
			var __class__:Class = this._ad.getDefinition(name) as Class;
			return (new __class__()) as DisplayObject;
		}
		
	}
}

