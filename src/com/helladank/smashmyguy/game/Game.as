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
		private var _lives:int;
		private var _currentKills:int;
		private var _killsToNextLevel:int;
		private var _level:int;
		
		public static var JUGGLER:Juggler;
		
		private var _windows:Vector.<Window> = new Vector.<Window>();
		
		private var _stageWidth:int;
		private var _stageHeight:int;
		
		public function Game() 
		{
			_lives = 5;
			_currentKills = 0;
			_killsToNextLevel = 2;
			_level = 1;
		}
		
		public function start(stageWidth:int, stageHeight:int):void
		{
			//lives = 5;
			_stageWidth = stageWidth; _stageHeight = stageHeight;
			var wX:int = _stageWidth;// / 2;
			var wY:int = _stageHeight;// / 2;
			
			addWindow(0, 0, wX, wY);
			//addWindow(wX, 0, wX, wY);
			//addWindow(0, wY, wX, wY);
			//addWindow(wX, wY, wX, wY);
			
			_hud = new HeadUpDisplay(this, _stageWidth, _stageHeight);
			addChild(_hud);
			addEventListener(EnterFrameEvent.ENTER_FRAME, tick);
		}
		
		private function addWindow(xPos:int, yPos:int, width:int, height:int):void
		{
			var window:Window = new Window(xPos, yPos, width, height, this);
			addChild(window);
			
			_windows.push(window);
		}
		
		private function tick(e:EnterFrameEvent):void
		{
			_hud.tick();
		}
		
		public function destroy():void
		{
			removeEventListener(EnterFrameEvent.ENTER_FRAME, tick);
		}
		
		public function getLives():int
		{
			return this._lives;
		}
		
		public function decrementLives():void
		{
			this._lives--;
		}
		
		public function getLevel():int
		{
			return this._level;
		}
		
		public function incrementLevel():void
		{
			this._level++;
		}
		
		public function getCurrentKills():int
		{
			return this._currentKills;
		}
		
		public function incrementCurrentKills():void
		{
			this._currentKills++;
		}
		
		public function getKillsToNextLevel():int
		{
			return _killsToNextLevel;
		}
		
		public function setKillsToNextLevel(i:int):void
		{
			this._killsToNextLevel = i;
		}
		
		public function getHeight():int
		{
			return _stageHeight;
		}
		
		public function getWidth():int
		{
			return _stageWidth;
		}
	}

}