package com.helladank.smashmyguy
{
	import com.helladank.smashmyguy.game.Game;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.geom.Rectangle;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import starling.core.Starling;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Ryan Wirth
	 */
	public class Main extends Sprite 
	{
		private var _starling:Starling;
		
		public function Main() 
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			// touch or gesture?
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			// Begin Starling
			var viewPort:Rectangle = new Rectangle(0, 0, stage.fullScreenWidth, stage.fullScreenHeight);
			
			_starling = new Starling(Game, stage, viewPort);
			_starling.addEventListener(Event.ROOT_CREATED, onRootCreated);
			_starling.start();
		}
		
		private function onRootCreated(e:Event, g:Game):void
		{
			_starling.stage.stageWidth = stage.fullScreenWidth / 1;
			_starling.stage.stageHeight = stage.fullScreenHeight / 1;
			
			g.start(_starling.stage.stageWidth, _starling.stage.stageHeight);
		}
		
	}
	
}