package com.rokunana.dev.model {
	/**
	 * @author kaede
	 */
	public interface IRemoteData extends IRequest {
		
		function get data():*;
		function set data(data:*):void;
		
	}
}
