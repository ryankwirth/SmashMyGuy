package com.helladank.smashmyguy.game.headupdisplay 
{
	import com.helladank.smashmyguy.IDestructible;
	import com.helladank.smashmyguy.game.Game;
	import com.helladank.smashmyguy.game.headupdisplay.LivesDisplay;
	import com.helladank.smashmyguy.game.headupdisplay.LevelUpDisplay;
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author Alison
	 */
	public class HeadUpDisplay extends Sprite implements IDestructible
	{
		private var _livesDisplay:LivesDisplay;
		private var _levelUpDisplay:LevelUpDisplay;
		//private var _settingsDisplay:settingsDisplay;
	
				
		public function HeadUpDisplay(game:Game, width:int, height:int)
		{
			trace('game hud initialized');
			
			// Initialize lives display here
			_livesDisplay = new LivesDisplay(this, game);
			addChild(_livesDisplay);
			
			// Initialize level up display here
			_levelUpDisplay = new LevelUpDisplay(this, game);
			addChild(_levelUpDisplay);
			
			// Initialize settings and other display here
			//_settingsDisplay = new settingsDisplay(this);
			
		}
		
		public function tick():void
		{
			// tick for lives display
			_livesDisplay.tick();
			
			// tick for levels display
			_levelUpDisplay.tick();
			
			// tick for settings and other display
			//_settingsDisplay.tick();
			
		}
		
		public function destroy():void
		{
			_livesDisplay.destroy();
			_levelUpDisplay.destroy();
			//_settingsDisplay.destroy();
			
			this.removeFromParent(true);
		}
		
	}

}