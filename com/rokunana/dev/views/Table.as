package com.rokunana.dev.views {
	import flash.display.DisplayObject;
	import com.rokunana.dev.model.IModel;
	import com.rokunana.dev.collections.ArrayCollection;
	import com.rokunana.dev.model.CollectionModel;
	import com.rokunana.dev.model.ObjectModel;

	/**
	 * @author kaede
	 * 表組み
	 */
	public class Table extends AbstractView {
		
		private var col : int;
		private var _datas:Array;
		private var _cols:Array;
		private var _model:CollectionModel;

		/**
		 * @param col カラム数
		 */
		public function Table(col:int=1) {
			this.col = col;
			_model = new CollectionModel();
			_cols = [];
			super(_model);
		}

		public function get datas() : Array {
			return _datas;
		}

		public function set datas(datas : Array) : void {
			_datas = datas;
			_model.setCollection(new ArrayCollection(_datas));
		}
		
		/**
		 * カラム用のViewクラスを生成する。
		 * Templete method pattern
		 */
		protected function createColumnView(colmun_model:IModel):IView{
			return new TableColumn(colmun_model);
		}
		
		override protected function update() : void {
			super.update();
			var l:int = datas.length;
			if(l < _cols.length){
				var removes:Array  = _cols.slice(l,_cols.length);
				while(removes.length){
					removeChild(removes.shift());
				}
				_cols = _cols.slice(0,l);
			}
			for (var i : int = 0; i < l; i++) {
				var column:IView = _cols[i] || createColumnView(new ObjectModel({}));
				if(!_cols[i]){
					_cols.push(column);
				}
				//modelの更新
				ObjectModel(column.model).obj = _datas[i];
				var display:DisplayObject = DisplayObject(column); 
				display.x = display.width*Math.floor(i%col);
				display.y = display.height*Math.floor(i/col);
				addChild(display)
			}
		}
		
		
	}
}
import flash.text.TextFieldAutoSize;
import flash.text.TextField;
import com.rokunana.dev.model.ObjectModel;
import com.rokunana.dev.model.IModel;
import com.rokunana.dev.views.AbstractView;
/**
 * Example Classe
 * カスタムカラムは、Tableを継承して自分で作る。
 */
class TableColumn extends AbstractView{
	
	private var tf:TextField;
	
	public function TableColumn(model:IModel) {
		super(model)
		tf = new TextField();
		tf.autoSize = TextFieldAutoSize.LEFT;
		addChild(tf);
		graphics.beginFill(0xCCCCCC);
		graphics.drawRect(0, 0, 100, 50);
	}

	override protected function update() : void {
		super.update();
		tf.text = ObjectModel(model).value
	}
	
}
