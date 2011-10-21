package com.rokunana.dev.views {
	import com.rokunana.dev.model.RemoteData;

	import flash.media.Video;
	import flash.net.NetStream;
	
	/**
	 * @author kaede
	 */
	public class RemoteVideoView extends RemoteView {
		
		private var video : Video;
		private var ns : NetStream;
		
		public function RemoteVideoView(model :RemoteData) {
			super(model);
		}
		
		override protected function update() : void {
			video = new Video();
			ns = _model.loader.getNetStream(_model.url) as NetStream;
			trace(ns)
//			video.attachNetStream(ns);
//			_display = video;
//			addChild(_display)
			//ns.play(_model.url);
		}
		
	}
}
