package com.rokunana.dev.collections {
	/**
	 * コンポジションリンクリスト
	 * @author kaede
	 */
	public class IteratorLinkList implements IIterator {
		
		private var _iterator : IIterator;
		private var _head:Link;
		private var _current : Link;
		private var _loop : Boolean;
		
		public function IteratorLinkList(iterator : IIterator,loop:Boolean=false):void {
			this._loop = loop;
			this.iterator = iterator;
		}

		private function init() : void {
			_current = null;
			while(_iterator.hasNext()) {
				var link : Link = new Link(_iterator.next(), link);
				if(!_current)_head = _current = link;
			}
			if(loop){
				_head.prev = link;
				link.next = _head; 
			}
		}
		
		public function next():Object {
			_current = _current.next
			return _current.receiver;
		}
		
		public function prev():Object {
			_current = _current.prev
			return _current.receiver;
		}
		
		public function current():Object {
			return _current.receiver;
		}

		public function reset() : void {
			_current = _head;
		}

		public function hasNext() : Boolean {
			return Boolean(_current && _current.next);
		}

		public function hasPrev() : Boolean {
			return Boolean(_current && _current.prev);
		}

		public function get iterator() : IIterator {
			return _iterator;
		}

		public function set iterator(iterator : IIterator) : void {
			_iterator = iterator;
			if(_iterator){
				init();
			}
		}

		public function get loop() : Boolean {
			return _loop;
		}

		public function get head() : Link {
			return _head;
		}
		
		
		
		
		
	}
}
class Link{
	
	public var next:Link;
	public var prev : Link;
	public var receiver : Object;
	
	public function Link(receiver : Object,prev:Link=null):void {
		this.receiver = receiver;
		this.prev = prev;
		if(prev)prev.next = this;
	}
	
}
