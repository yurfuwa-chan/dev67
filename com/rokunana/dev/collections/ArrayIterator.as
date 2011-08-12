package com.rokunana.dev.collections {
	/**
	 * @author kaede
	 */
	public class ArrayIterator implements IIterator {
		
		private var _index:int;
		private var collection:Array;

		public function ArrayIterator(collection : Array) {
			this.collection = collection;
		}
		
		public function reset() : void {
			_index = 0;
		}

		public function next() : Object {
			return collection[_index++];
		}		

		public function hasNext() : Boolean {
			return _index < collection.length;
		}

		public function current() : Object {
			return collection[_index];
		}
		
		public function prev() : Object {
			return collection[_index--];
		}

		public function hasPrev() : Boolean {
			return  _index > 0;
		}

		public function get index() : int {
			return _index;
		}
		
		public function get length() : int {
			return collection.length;
		}

		
		
	}
}
