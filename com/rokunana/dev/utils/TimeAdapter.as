package com.rokunana.dev.utils {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	/**
	 * @author kaede
	 */
	public class TimeAdapter extends EventDispatcher {
		
		private var timer:Timer;
		
		public function TimeAdapter(delay:int,auto:Boolean=true) {
			timer = new Timer(delay);
			timer.addEventListener(TimerEvent.TIMER, timerHandler)
			if(auto)start();
		}
		
		public function start():void{
			timer.start();
		}
		
		public function stop():void{
			timer.stop();
		}
		
		public function set delay(value:int):void{
			timer.delay = value;
		}

		private function timerHandler(event : TimerEvent) : void {
			dispatchEvent(new Event(Event.COMPLETE));
		}
	}
}
