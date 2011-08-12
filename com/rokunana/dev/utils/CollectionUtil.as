package com.rokunana.dev.utils {
	import com.rokunana.dev.collections.ArrayCollection;
	/**
	 * @author kaede
	 */
	public class CollectionUtil {
		
		/**
		 * XMLか配列をシャッフルして返す
		 */
		public static function shuffle(obj:Object):Object{
			if(!(obj is Array || obj is XML))throw new Error("Array or XML")
			var l:int = (obj is Array) ? obj.length : obj.*.length();
			var newObj:Object = (obj is Array) ? obj.concat():obj.*.copy();
			while(l){
				var m:int = Math.floor(Math.random()*l);
				var n:* = newObj[--l];
				newObj[l] = newObj[m];
				newObj[m] = n;
			}
			if(newObj is XMLList){
				var str:String = newObj.toXMLString();
				var ln:String = obj.*.parent().localName();
				newObj = <{ln}>{XMLList(str)}</{ln}>
			}
			return newObj;
		}
		
		/**
		 * 配列内のアイテムを指定した個数のにわけて配列を格納する
		 * 
		 */
		public static function eachSplice(collection:Array,limit:int=1,useCollection:Boolean=false) : Array {
			if(!collection)return null;
			var result:Array = [];
			for (var i : int = 0; i < collection.length; i+=limit) {
				var arr:Array = [];
				for (var j : int = 0; j < limit; j++) {
					var obj:Object = collection[i+j];
					if(obj){
						arr[j] = collection[i+j]; 
					}
				}
				result.push(useCollection ? new ArrayCollection(arr) : arr);
			}
			return result;
		}
		
	}
}
