package com.rokunana.dev.views {
	import com.rokunana.dev.collections.ArrayCollection;
	import com.rokunana.dev.collections.IIterator;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	
	/**
	 * @author kaede
	 */
	public class ContainAdapter {
		
		private var collection:ArrayCollection;
		private var container:DisplayObjectContainer;
		
		public function ContainAdapter(container:DisplayObjectContainer=null) {
			this.collection = new ArrayCollection();
			this.container = container;
		}
		
		public function create(collection:Array,container:DisplayObjectContainer=null):DisplayObject{
			if(!collection)throw new Error("defined collection");
			this.container = container || this.container;
			this.collection.setCollection(collection);
			var i:IIterator = this.collection.iterator;
			while(i.hasNext()){
				this.container.addChild(i.next() as DisplayObject);
			}
			return this.container;
		}
		
	}
	
}
