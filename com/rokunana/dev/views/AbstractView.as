package com.rokunana.dev.views {
	import flash.events.Event;
	import com.rokunana.dev.model.IModel;
	import flash.display.Sprite;

	/**
	 * Modelの変更に即応するView
	 * @author kaede
	 */
	public class AbstractView extends Sprite implements IView {
		
		private var _model : IModel;
		
		public function AbstractView(model:IModel) {
			this.model = model;
		}

		public function get model() : IModel {
			return _model;
		}

		public function set model(model : IModel) : void {
			dispose();
			_model = model;
			init();
		}

		protected function dispose() : void {
			if(_model){
				_model.removeEventListener(Event.CHANGE, changeHandler);
				_model = null;
			}
		}

		protected function init() : void {
			if(_model != null){
				_model.addEventListener(Event.CHANGE, changeHandler)
			}
			dispatchEvent(new Event(Event.INIT));
		}

		private function changeHandler(event : Event) : void {
			update();
		}

		protected function update() : void {
			
		}
		
	}
}
