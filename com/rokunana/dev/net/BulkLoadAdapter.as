package com.rokunana.dev.net {
	import br.com.stimuli.loading.loadingtypes.LoadingItem;
	import flash.events.EventDispatcher;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import br.com.stimuli.loading.BulkLoader;
	import br.com.stimuli.loading.BulkProgressEvent;

	import com.rokunana.dev.model.RemoteData;

	import flash.utils.Proxy;


	/**
	 * @author kaede
	 */
	 [Event(name="complete", type="flash.events.Event")];
	public class BulkLoadAdapter extends Proxy implements IEventDispatcher {
		
		private var loader:BulkLoader;
		private var dispatcher:EventDispatcher;
		private var dic:Object;

		public function BulkLoadAdapter(name:String) {
			dispatcher = new EventDispatcher();
			loader = BulkLoader.getLoader(name) || new BulkLoader(name);
			loader.addEventListener(BulkProgressEvent.PROGRESS, progressHandler);
			loader.addEventListener(BulkProgressEvent.COMPLETE, complteHandler);
			dic = {};
		}

		private function complteHandler(event : BulkProgressEvent) : void {
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
		public function start() : void {
			loader.start();
		}

		public function add(request:RemoteData,type:String="image") : void {
			dic[request.url] = request;
			if(!request.data){
				loader.add(request.url,{type:type});
				
			}
		}
		
		public function remove(request : RemoteData) : void {
			dic[request.url] = null;
		}

		public function has(request : RemoteData) : Boolean {
			return Boolean(dic[request.url]);
		}
		
		public function get(request:RemoteData):RemoteData{
			return dic[request.url]
		}

		private function progressHandler(event : BulkProgressEvent) : void {
			for each( var request:RemoteData in dic){
				if(!request)continue;
				var item:LoadingItem = loader.get(request.url);
				if(!item)continue;
				if(item.isLoaded){
					request.data = loader.getContent(request.url,true);					
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
