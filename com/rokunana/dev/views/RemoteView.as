package com.rokunana.dev.views {
	import com.rokunana.dev.model.IModel;
	import flash.display.DisplayObject;
	import com.rokunana.dev.model.RemoteData;

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
			addChild(_display = _model.getDisplay())
		}
		
		override public function set model(model : IModel) : void {
			_model = model as RemoteData;
			super.model = model;
		}
		
		
	}
}
