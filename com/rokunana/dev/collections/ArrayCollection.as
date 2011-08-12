package com.rokunana.dev.collections {

	/**
	 * @author kaede
	 */
	public class ArrayCollection implements ICollection {
		
		protected var collection : Array;

		
		public function ArrayCollection(collection:Array=null):void{
			setCollection(collection);
		}
		
		public function add(value : Object):void {
			collection.push(value);
		}
		
		public function remove(value : Object):void {
			collection.splice(collection.indexOf(value), 1);
		}
		
		public function indexOf(value:Object) : int{
			return collection.indexOf(value);
		}
		
		/**
		 * オブジェクトをコールバックして、返り値を格納して返す
		 * function(obj:Object,i:int,ctrl:ArrayController):Object
		 */
		public function extract(callback:Function):Array{
			var arr:Array = [];
			var i:IIterator = iterator;
			while(i.hasNext()){
				var obj:Object = i.next();
				arr.push(callback(obj,this.collection.indexOf(obj),this));
			}
			return arr
		}
		
		public function getObjectAt(index : int) : Object {
			return collection[index];
		}
		

		public function setCollection(collection : Object) : void {
			this.collection = collection as Array;
		}
		
		public function getCollection() : Object {
			return this.collection.concat();
		}

		public function get iterator() : IIterator {
			return new ArrayIterator(collection);
		}
		
		public function get length() : int {
			return collection.length;
		}
	}
}
