package com.rokunana.dev.collections {
	import com.rokunana.dev.collections.ArrayCollection;

	/**
	 * @author kaede
	 */
	public class NumberCollection extends ArrayCollection {
		
		public function NumberCollection(collection : Array = null) {
			super(collection);
		}
		
		public function sum(s:int=0,e:int=0):Number{
			return whileNum(slice(s,e),function(n:Number,r:Number):Number{
				return r += n;
			});
		}
		
		public function average(s:int=0,e:int=0):Number{
			e = e > 0 ? e:length;
			return sum(s,e)/(e-s);
		}
		
		private function whileNum(array:Array,func:Function):Number{
			var i:IIterator = new ArrayIterator(array);
			var result:Number = 0;
			while(i.hasNext()){
				var n:Number = i.next() as Number;
				result = func(n,result);
			};
			return result; 
		}
		
		
	}
}
