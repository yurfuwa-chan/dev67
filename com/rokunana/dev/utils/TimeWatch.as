package com.rokunana.dev.utils {
	import flash.utils.getTimer;
	/**
	 * @author kaede
	 */
	public class TimeWatch {
		
		private var _time : uint;
		private var _isRunning : Boolean;
		
		public function TimeWatch(auto:Boolean = false) {
			if(auto){
				start();
			}
		}

		public function start() : Number {
			_isRunning = true;
			_time = getTimer();
			return time
		}

		public function stop() : Number {
			_isRunning = false;
			_time = getTimer() - _time;
			return time;
		}

		public function get time() : Number {
			return _time / 1000;
		}

		public function get isRunning() : Boolean {
			return _isRunning;
		}
		
	}
}
