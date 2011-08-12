package com.rokunana.dev.collections {
	/**
	 * @author kaede
	 */
	public interface IIterator {
		
		function reset():void;
		
		function next():Object;
		
		function prev():Object;
		
		function hasNext():Boolean;
		
		function hasPrev():Boolean;
		
		function current():Object;
		
		
	}
}
