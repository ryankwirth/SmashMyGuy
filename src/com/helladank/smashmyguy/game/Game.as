package com.helladank.smashmyguy.game 
{
	import starling.animation.Juggler;
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.events.TouchEvent;
	/**
	 * ...
	 * @author Ryan Wirth
	 */
	public class Game extends Sprite
	{
		public static var JUGGLER:Juggler;
		
		private var _windows:Vector.<Window> = new Vector.<Window>();
		
		private var _stageWidth:int;
		private var _stageHeight:int;
		
		public function Game() 
		{
			
		}
		
		public function start(stageWidth:int, stageHeight:int):void
		{
			
			_stageWidth = stageWidth; _stageHeight = stageHeight;
			var wX:int = _stageWidth / 2;
			var wY:int = _stageHeight / 2;
			
			addWindow(0, 0, wX, wY);
			addWindow(wX, 0, wX, wY);
			addWindow(0, wY, wX, wY);
			addWindow(wX, wY, wX, wY);
		}
		
		private function addWindow(xPos:int, yPos:int, width:int, height:int):void
		{
			var window:Window = new Window(width, height);
			window.x = xPos; window.y = yPos;
			addChild(window);
			
			_windows.push(window);
		}
		
	}

}