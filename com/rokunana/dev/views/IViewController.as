package com.rokunana.dev.views {
	import flash.display.DisplayObject;
	/**
	 * @author kaede
	 */
	public interface IViewController {
		
		function get view():DisplayObject;
		function set view(view:DisplayObject):void;
		
	}
}
