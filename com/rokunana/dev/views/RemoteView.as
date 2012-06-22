package com.rokunana.dev.views {
	import com.rokunana.dev.model.IModel;
	import com.rokunana.dev.model.RemoteData;

	import flash.display.DisplayObject;

	/**
	 * @author kaede
	 */
	public class RemoteView extends AbstractView {
		
		protected var _model:RemoteData;
		protected var _display:DisplayObject;
		
		public function RemoteView(model :RemoteData) {
			super(model);
		}
		
		override protected function init() : void {
			super.init();
			_display && contains(_display) && removeChild(_display);
		}

		override protected function update() : void {
			super.update();
			_display = _model.getDisplay();
			addChild(_display)
		}
		
		override public function set model(model : IModel) : void {
			_model = model as RemoteData;
			super.model = model;
		}
		
		public function destory():void{
			model = null;
			destory();
		}

		public function get view() : DisplayObject {
			return _display;
		}
		
		
	}
}
