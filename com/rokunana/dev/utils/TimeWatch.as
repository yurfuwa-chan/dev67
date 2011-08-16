package com.rokunana.dev.utils {
	import flash.utils.getTimer;
	/**
	 * @author kaede
	 */
	public class TimeWatch {
		
		private var _time:uint;
		
		public function TimeWatch(auto:Boolean = false) {
			if(auto){
				start();
			}
		}

		public function start() : Number {
			_time = getTimer();
			return time
		}

		public function stop() : Number {
			_time = getTimer() - _time;
			return time;
		}

		public function get time() : Number {
			return _time/1000;
		}
		
		
	}
}
