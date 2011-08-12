package com.rokunana.dev.utils {
	/**
	 * @author kaede
	 */
	public class StringUtil {
		
		/**
		 * タブを脱がす
		 */
		static public function strip(value:Object):String{
			return value.toString().replace(/\t/g,"")
		}
		
		
		/**
		 * 空白を改行に付与
		 */
		static public function breaks(value:Object):String{
			return value.toString().replace(/\s/g,"\n")
		}
		
		/**
		 * 文字列をBoolに変換
		 */
		static public function toBoolean(value:Object):Boolean{
			var str:String = value.toString();
			var n:Number = parseFloat(str);
			return (isNaN(n)) ? Boolean(str == ("true")) : Boolean(n);
		}
		
	}
}
