package com.rokunana.dev.utils {
	/**
	 * @author kaede
	 */
	public class DateUtil {
		
		public static function before(day:Number,base:Number=0):Number{
			return (new Date((base||time) - (mday*day))).getTime();
		}
		
		public static function after(day:Number,base:Number=0):Number{
			return (new Date((base||time) + (mday*day))).getTime();
		}
		
		public static function get time():Number{
			return new Date().getTime();
		}
		
		public static function get mday():Number{
			return 1000 * 60 * 60 * 24;
		}
		
	}
}
