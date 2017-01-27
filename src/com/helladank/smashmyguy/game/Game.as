package com.helladank.smashmyguy.game 
{
	import starling.display.Sprite;
	import starling.text.TextField;
	/**
	 * ...
	 * @author Ryan Wirth
	 */
	public class Game extends Sprite
	{
		private var _windows:Vector.<Window> = new Vector.<Window>();
		
		private var _stageWidth:int;
		private var _stageHeight:int;
		
		public function Game() 
		{
			
		}
		
		public function start(stageWidth:int, stageHeight:int):void
		{
			_stageWidth = stageWidth; _stageHeight = stageHeight;
			
			var window:Window = new Window(_stageWidth, _stageHeight);
			addChild(window);
		}
		
	}

}