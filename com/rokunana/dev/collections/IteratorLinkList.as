package com.rokunana.dev.collections {
	/**
	 * コンポジションリンクリスト
	 * @author kaede
	 */
	public class IteratorLinkList implements IIterator {
		
		private var _iterator : IIterator;
		private var head:Link;
		private var _current:Link;
		
		public function IteratorLinkList(iterator : IIterator):void {
			this.iterator = iterator;
		}

		private function init() : void {
			_current = null;
			while(_iterator.hasNext()) {
				var link : Link = new Link(_iterator.next(), link);
				if(!_current)head = _current = link;
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
			_current = head;
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
