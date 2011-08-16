package com.rokunana.dev.model {
	import flash.events.ProgressEvent;
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.EventDispatcher;

	/**
	 * @author kaede
	 */
	 [Event(name="change", type="flash.events.Event")]
	 [Event(name="open", type="flash.events.Event")]
	dynamic public class RemoteData extends EventDispatcher implements IRemoteData , IModel {
		
		private var _data : *;
		private var _url : String;
		private var _bytesLoaded:int;
		private var _bytesTotal:int;
		
		public function RemoteData(url:String="") {
			this._url = url;
		}

		public function get data() : * {
			return _data
		}
		
		public function getBitmap() :Bitmap {
			return _data as Bitmap
		}
		
		public function getSprite() :Sprite {
			return _data as Sprite
		}
		
		public function getDisplay() :DisplayObject {
			return _data as DisplayObject
		}
		
		public function getXML() :XML {
			return XML(_data)
		}
		
		public function getString() :String {
			return String(_data)
		}

		public function set data(data : *) : void {
			_data = data;
			dispatchEvent(new Event(Event.CHANGE));
		}

		public function get url() : String {
			return _url;
		}

		public function set url(url : String) : void {
			_url = url;
		}
		
		public function get bytesPercent() : Number {
			return _bytesLoaded / _bytesTotal || 0;
		}

		public function get bytesLoaded() : int {
			return _bytesLoaded;
		}

		public function set bytesLoaded(bytesLoaded : int) : void {
			_bytesLoaded = bytesLoaded;
			dispatchEvent(new ProgressEvent(ProgressEvent.PROGRESS));
		}

		public function get bytesTotal() : int {
			return _bytesTotal;
		}

		public function set bytesTotal(bytesTotal : int) : void {
			_bytesTotal = bytesTotal;
		}
	}
}
