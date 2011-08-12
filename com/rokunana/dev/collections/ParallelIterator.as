package com.rokunana.dev.collections {

	/**
	 * 二つ以上のイテレータを同時に回して値を配列で返す
	 * @author kaede
	 */
	public class ParallelIterator implements IIterator {
		
		private var i : IIterator;
		
		public function ParallelIterator(...iterator) {
			i = new ArrayIterator(iterator.concat());
		}
		
		public function reset() : void {
			i.reset();
			while(i.hasNext()){
				var j:IIterator = i.next() as IIterator;
				j.reset();
			}
			i.reset();
		}

		public function next() : Object {
			i.reset();
			var arr:Array = [];
			while(i.hasNext()){
				var j:IIterator = i.next() as IIterator;
				if(j.hasNext()){
					arr.push(j.next())
				}
			}
			i.reset();
			return arr;
		}

		public function prev() : Object {
			i.reset();
			var arr:Array = [];
			while(i.hasPrev()){
				var j:IIterator = i.prev() as IIterator;
				if(j.hasPrev()){
					arr.push(j.prev())
				}
			}
			i.reset();
			return arr;
		}

		public function hasNext() : Boolean {
			i.reset();
			while(i.hasNext()){
				var j:IIterator = i.next() as IIterator;
				if(!j.hasNext()){
					return false;
					break;
				}
			}
			i.reset();
			return true; 
		}

		public function hasPrev() : Boolean {
			i.reset();
			while(i.hasPrev()){
				var j:IIterator = i.prev() as IIterator;
				if(!j.hasPrev()){
					return false;
					break;
				}
			}
			i.reset();
			return true; 
		}

		public function current() : Object {
			i.reset();
			var arr:Array = [];
			while(i.hasNext()){
				var j:IIterator = i.next() as IIterator;
				arr.push(j.current())
			}
			i.reset();
			return arr;
		}
		
		
		
	}
}
