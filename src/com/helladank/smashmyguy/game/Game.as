package com.helladank.smashmyguy.game 
{
	import com.helladank.smashmyguy.game.headupdisplay.HeadUpDisplay;
	import starling.animation.Juggler;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	import starling.text.TextField;
	import starling.events.TouchEvent;
	/**
	 * ...
	 * @author Ryan Wirth
	 */
	public class Game extends Sprite
	{
		private var _hud:HeadUpDisplay;
		
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
			
			_hud = new HeadUpDisplay(this, _stageWidth, _stageHeight);
			addChild(_hud);
			addEventListener(EnterFrameEvent.ENTER_FRAME, tick);
		}
		
		private function addWindow(xPos:int, yPos:int, width:int, height:int):void
		{
			var window:Window = new Window(width, height);
			window.x = xPos; window.y = yPos;
			addChild(window);
			
			_windows.push(window);
		}
		
		private function tick(e:EnterFrameEvent):void
		{
			_hud.tick();
		}
		
		public function destry():void
		{
			removeEventListener(EnterFrameEvent.ENTER_FRAME, tick);
		}
	}

}