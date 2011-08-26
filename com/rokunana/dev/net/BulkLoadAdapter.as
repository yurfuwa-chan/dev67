package com.rokunana.dev.net {
	import br.com.stimuli.loading.BulkLoader;
	import br.com.stimuli.loading.BulkProgressEvent;
	import br.com.stimuli.loading.loadingtypes.LoadingItem;

	import com.rokunana.dev.collections.ArrayIterator;
	import com.rokunana.dev.collections.IIterator;
	import com.rokunana.dev.model.RemoteData;

	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;


	/**
	 * @author kaede
	 */
	 [Event(name="complete", type="flash.events.Event")];
	public class BulkLoadAdapter implements IEventDispatcher {
		
		private var loader:BulkLoader;
		private var dispatcher:EventDispatcher;
		private var dic:Array;
		private var i:IIterator;

		public function BulkLoadAdapter(name:String) {
			dispatcher = new EventDispatcher();
			loader = BulkLoader.getLoader(name) || new BulkLoader(name);
			loader.addEventListener(BulkProgressEvent.PROGRESS, progressHandler);
			loader.addEventListener(BulkProgressEvent.COMPLETE, complteHandler);
			dic = [];
			i = new ArrayIterator(dic);
		}

		private function complteHandler(event : BulkProgressEvent) : void {
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
		public function start() : void {
			loader.start();
		}

		public function add(request:RemoteData,type:String="image") : void {
			dic.push(request);
			if(!request.data){
				loader.add(request.url,{type:type});
			}
		}
		
		public function remove(request : RemoteData) : void {
			dic.splice(dic.indexOf(request), 1);
		}

		public function has(request : RemoteData) : Boolean {
			return dic.indexOf(request) >= 0
		}
		
		public function get(request:RemoteData):RemoteData{
			return dic[dic.indexOf(request)]
		}

		private function progressHandler(event : BulkProgressEvent) : void {
			i.reset();
			while(i.hasNext()){
				var request:RemoteData = i.next() as RemoteData;
				var item:LoadingItem = loader.get(request.url);
				if(!item)continue;
				if(item.isLoaded){
					request.data = loader.getContent(request.url,true);
					loader.remove(request.url)		
					remove(request);
				}else{
					request.bytesLoaded = loader.get(request.url).bytesLoaded;
					request.bytesTotal = loader.get(request.url).bytesTotal;
				}
			}
		}
		

		
		public function toString() : String {
			return "[object BulkLoaderAdapter]";
		}

		public function addEventListener(type : String, listener : Function, useCapture : Boolean = false, priority : int = 0, useWeakReference : Boolean = false) : void {
			dispatcher.addEventListener(type, listener,useCapture,priority,useWeakReference)
		}

		public function dispatchEvent(event : Event) : Boolean {
			return dispatcher.dispatchEvent(event);
		}

		public function hasEventListener(type : String) : Boolean {
			return dispatcher.hasEventListener(type);
		}

		public function removeEventListener(type : String, listener : Function, useCapture : Boolean = false) : void {
			dispatcher.removeEventListener(type, listener,useCapture)
		}

		public function willTrigger(type : String) : Boolean {
			return dispatcher.willTrigger(type);
		}
		
		
	}
}
