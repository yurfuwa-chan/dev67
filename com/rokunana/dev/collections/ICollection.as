package com.rokunana.dev.collections {
	/**
	 * @author kaede
	 * イテレーターを持つインターフェース
	 */
	public interface ICollection {
		
		function get iterator():IIterator;
		function setCollection(collection:Object):void;
		function getCollection():Object;
		
	}
}
