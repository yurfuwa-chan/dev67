package com.rokunana.dev.collections {

	/**
	 * @author kaede
	 */
	public class XMLListIterator implements IIterator {
		
		private var index:int;
		private var collection:XMLList;
		
		public function XMLListIterator(collection : XMLList) {
			this.collection = collection;			
		}
		
		public function reset() : void {
			index = 0;
		}

		public function next() : Object {
			return collection[index++];
		}

		public function hasNext() : Boolean {
			return index < collection.length();
		}

		public function current() : Object {
			return collection[index];
		}

		public function prev() : Object {
			return collection[index--];
		}

		public function hasPrev() : Boolean {
			return index > collection.length();
		}
		
	}
}
