package com.rokunana.dev.views {
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;

	/**
	 * @author kaede
	 */
	public class Confirm extends Sprite {
		
		private var _isMove : Boolean;

		/**
		 * @param target ターゲット
		 * @param posx デフォルト位置
		 * @param posy デフォルト位置
		 * @param isMove ドラッグさせるか
		 */
		public function Confirm(_target : DisplayObject, posx : Number = 0, posy : Number = 0, isMove : Boolean = false) {
			this.x = posx;
			this.y = posy;
			addChild(_target);
			this.isMove = isMove;
		}

		private function mouseActionHandler(event : MouseEvent) : void {
			if(event.type == MouseEvent.MOUSE_DOWN){
				addEventListener(MouseEvent.MOUSE_UP, mouseActionHandler)
				startDrag(false,new Rectangle(0,0,stage.stageWidth-this.width,stage.stageHeight-this.height));
			}else if(event.type == MouseEvent.MOUSE_UP){
				removeEventListener(MouseEvent.MOUSE_UP, mouseActionHandler)
				stopDrag();
			}
		}

		override public function addChild(child : DisplayObject) : DisplayObject {
			child.addEventListener(Event.CLOSE, closeHandler);
			return super.addChild(child);
		}
		
		override public function removeChild(child : DisplayObject) : DisplayObject {
			child.addEventListener(Event.CLOSE, closeHandler)
			return super.removeChild(child);
		}

		private function closeHandler(event : Event) : void {
			event.stopPropagation();
			close();
		}
		
		public function dispose():void{
			while(numChildren){
				removeChild(getChildAt(0)).removeEventListener(Event.CLOSE, closeHandler)
			}
			removeEventListener(MouseEvent.MOUSE_DOWN, mouseActionHandler)
		}

		/**
		 * confirmを閉じる
		 */
		public function close() : void {
			if(parent){
				parent.removeChild(this);
			}
		}

		public function get isMove() : Boolean {
			return _isMove;
		}

		public function set isMove(isMove : Boolean) : void {
			_isMove = isMove;
			if(_isMove){
				addEventListener(MouseEvent.MOUSE_DOWN, mouseActionHandler)
			}
		}

		
	}
}
