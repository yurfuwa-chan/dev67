package com.rokunana.dev.views {
	import com.rokunana.dev.model.IModel;
	/**
	 * @author kaede
	 */
	public interface IView {
		
		function get model() : IModel;
		function set model(model : IModel) : void;
	}
}
