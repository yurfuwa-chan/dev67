package com.rokunana.dev.views.selection {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	/**
	 * 選択状態のグループ化を行う
	 * @author kaede
	 * 	
	 	assemble = new SelectionAssemble(2);
		assemble.selection(0).add(sprite, 0);
		assemble.selection(0).add(sprite1, 1);
		assemble.selection(1).add(sprite2, 2);
		assemble.selection(1).add(sprite3, 3);
		assemble.addEventListener(Event.COMPLETE, completeHandler)

		function completeHandler(event : Event) : void {
			trace(assemble.hasAllValue,assemble.values)
		}
	 * 
	 * 
	 * 
	 */
	 [Event(name="complete", type="flash.events.Event")]
	public class SelectionAssemble extends EventDispatcher {
		
		private var arr:Array;
		
		public function SelectionAssemble(n:int=0) {
			arr = [];
			for (var i : int = 0; i < n; i++) {
				add(new Selection());
			}
		}
		
		public function add(selection:Selection):void{
			selection.addEventListener(Event.CHANGE, changeHandler)
			arr.push(selection)
		}

		private function changeHandler(event : Event) : void {
			if(hasAllValue){
				dispatchEvent(new Event(Event.COMPLETE));
			}
		}
		
		public function clear():void{
			arr.forEach(function(item:Selection,i:int,_arr:Array):void{
				item.clear();
			})
		}

		/**
		 * 全てのSelectionが選択状態か判定する
		 */
		public function get hasAllValue() : Boolean {
			return arr.every(function(item:Selection,i:int,_arr:Array):Boolean{
				return item.value != null && !isNaN(item.value)
			})
		}
		
		/**
		 * 全てのSelectionのバリューを一括して返す。
		 */
		public function get values():Array{
			return arr.map(function(item:Selection,i:int,_arr:Array):*{
				return item.value;
			})
		}
		
		public function remove(selection:Selection):void{
			selection.removeEventListener(Event.CHANGE, changeHandler)
			arr = arr.slice(arr.indexOf(selection),-1);
		}
		
		public function dissolve():void{
			arr.forEach(function(item:Selection,i:int,_arr:Array):void{
				remove(item);
			})
		}
		
		public function selection(index:int):Selection{
			return arr[index]
		}
		
		public function get selections():Array{
			return arr.concat();
		}
		
		public function indexOf(item:Selection):int{
			return arr.indexOf(item)
		}
	}
}
