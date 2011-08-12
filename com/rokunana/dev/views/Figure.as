package com.rokunana.dev.views {
	import flash.display.BitmapData;
	import flash.display.Bitmap;
	
	/**
	 * 様々なBitmapを提供する
	 * @author kaede
	 */
	public class Figure extends Bitmap {
		
		public function circle(radius : Number, color : uint = 0xFF0000,background:uint=0x00FFFFFF):BitmapData{
			dispose();
			return bitmapData = new Circle(radius, color,background);
		}
		
		public function doughnut(radius : Number,insideRatio:Number=.5, color : uint = 0xFF0000,background:uint=0x00FFFFFF):BitmapData{
			dispose();
			return bitmapData = new Doughnut(radius, insideRatio,color,background);
		}
		
		public function dispose() : void {
			if(!bitmapData)return;
			bitmapData.dispose();
			bitmapData = null;
		}
		
		
	}
}
import flash.display.BitmapData;
import flash.display.BitmapDataChannel;
import flash.display.DisplayObject;
import flash.display.Shape;
import flash.geom.Point;
class GraphicData extends BitmapData{
	
	protected var _background : uint;
	
	public function GraphicData(target:DisplayObject,background:uint=0x00FFFFFF) {
		super(target.width,target.height,true,background);
		draw(target);
	}

	public function get background() : uint {
		return _background;
	}
	
}

/**
 * 正円
 */
class Circle extends GraphicData{
	
	private var _radius : Number;
	private var _color : uint;
	
	
	public function Circle(radius : Number, color : uint = 0xFF0000,background:uint=0x00FFFFFF) {
		super(drawCircle(radius,radius,radius,color),background)
	}

	protected function drawCircle(x:Number,y:Number,radius:Number,color:uint,alpha:Number=1) : Shape {
		var shape:Shape = new Shape();
		_color = color;
		_radius = radius;
		shape.graphics.beginFill(color,alpha);
		shape.graphics.drawCircle(x, y, radius);
		shape.graphics.endFill();
		return shape;
	}
	
	public function get radius() : Number {
		return _radius;
	}
	
	public function get color() : uint {
		return _color;
	}

	
}
/**
 * ドーナツ
 */
class Doughnut extends Circle {
	
	private var _insideRatio : Number = .5;

	public function Doughnut(radius : Number,insideRatio:Number=.5, color : uint = 0xFF0000,background:uint=0x00FFFFFF) {
		_insideRatio = insideRatio;
		super(radius,color,background);
		drawInside();
	}

	/**
	 * 内径を描画
	 * http://d.hatena.ne.jp/nitoyon/20070911/mask_letter
	 */
	private function drawInside() : void {
		var r:int = radius*insideRatio;
		var inside:BitmapData = new GraphicData(drawCircle(r, r, r, 0,1),0xFFFFFFFF);
		copyChannel(inside, inside.rect, new Point(int((width/2)-(inside.width/2)),int((height/2)-(inside.height/2))), BitmapDataChannel.RED, BitmapDataChannel.ALPHA);
	}

	/**
	 * radiusに対する内径の比
	 */
	public function get insideRatio() : Number {
		return _insideRatio;
	}
	
}