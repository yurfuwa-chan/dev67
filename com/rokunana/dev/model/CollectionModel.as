package com.rokunana.dev.model {
	import com.rokunana.dev.collections.ICollection;
	import com.rokunana.dev.collections.IIterator;
	import com.rokunana.dev.collections.IteratorLinkList;

	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	/**
	 * @author kaede
	 */
	 [Event(name="change", type="flash.events.Event")]
	 [Event(name="init", type="flash.events.Event")]
	public class CollectionModel extends EventDispatcher implements IIterator,IModel {
		
		protected var _iterator :IIterator;
		protected var _collection :ICollection;
		protected var _current :Object;
		protected var _iteratorClass:Class;
		
		public function CollectionModel(collection:ICollection = null) {
			initialize();
			setCollection(collection);
		}
		
		public function setCollection(collection:ICollection) : void {
			_collection = collection;
			if(collection == null){
				initialize();
			}else{
				_iterator = new IteratorLinkList(_collection.iterator);
				update();
			}
		}
		
		public function getCollection() : ICollection {
			return _collection;
		}

		protected function initialize() : void {
			dispatchEvent(new Event(Event.INIT));
		}
		
		
		protected function update() : void {
			dispatchEvent(new Event(Event.CHANGE));
		}
		
		protected function select() : void {
			dispatchEvent(new Event(Event.SELECT));
		}

		public function reset() : void {
			_iterator.reset();
		}

		public function next() : Object {
			var obj:Object = _iterator.next();
			select();
			return obj;
		}

		public function prev() : Object {
			var obj:Object = _iterator.prev();
			select();
			return obj
		}

		public function hasNext() : Boolean {
			return _iterator.hasNext();
		}

		public function hasPrev() : Boolean {
			return _iterator.hasPrev();
		}

		public function current() : Object {
			return _iterator.current();
		}

		public function get iterator() : IIterator {
			return _collection.iterator;
		}

		
	}
}
