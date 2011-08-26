package com.rokunana.dev.utils {
	import flash.utils.getTimer;
	/**
	 * @author kaede
	 */
	public class FPS {
		
		private var time : uint;
		private var _draw_count : uint;
		private var _update_time : uint = 60;
		private var _current:uint;
		
		public function FPS(update_time:uint=60) {
			this.update_time = update_time;
		}
		

		public function update() : uint {
			_draw_count += 1
    		if (getTimer()-time >= update_time) {
				_current = uint(_draw_count * 1000 / (getTimer() - time));
				time = getTimer();
				_draw_count = 0;
			}
			return _current;
		}

		public function get current() : uint {
			return _current;
		}

		public function get update_time() : uint {
			return _update_time;
		}

		public function set update_time(update_time : uint) : void {
			_update_time = update_time;
		}

		
		
		
	}
}
