package com.helladank.smashmyguy.game.headupdisplay 
{
	import com.helladank.smashmyguy.IDestructible;
	import com.helladank.smashmyguy.game.Game;
	import starling.text.TextFormat;
	import starling.text.TextField;
	import starling.text.BitmapFont;
	import starling.display.Sprite;

	
	/**
	 * ...
	 * @author Trevin Wong
	 */
	public class LevelUpDisplay extends Sprite implements IDestructible
	{
		private var _hud:HeadUpDisplay;
		private var _format:TextFormat;
		private var _levelText:TextField;
		private var _nextLevelText:TextField;
		private var _currentKillText:TextField;		
		private var _game:Game;
		
		public function LevelUpDisplay(hud:HeadUpDisplay, game:Game) 
		{
			_hud = hud;
			_game = game;

			_format = new TextFormat(BitmapFont.MINI, BitmapFont.NATIVE_SIZE*2, 0xFFFFFF, "left", "top");
			
			_levelText = new TextField(200, 20, "Level: " + _game.getLevel().toString(), _format);
			_levelText.x = 0;
			_levelText.y = 0;
			addChild(_levelText);
			
			_nextLevelText = new TextField(200, 20, "Next Level: " + _game.getKillsToNextLevel().toString(), _format);
			_nextLevelText.x = 0;
			_nextLevelText.y = _levelText.height;
			addChild(_nextLevelText);
			
			_currentKillText = new TextField(200, 20, "Current Kills: " + _game.getCurrentKills.toString(), _format);
			_currentKillText.x = 0;
			_currentKillText.y = _levelText.height + _nextLevelText.height;
			addChild(_currentKillText)
		}
		
		public function tick():void {
			_levelText.text = "Level: " + _game.getLevel().toString();
			_nextLevelText.text = "Next Level: " + _game.getKillsToNextLevel().toString();
			_currentKillText.text = "Current Kills: " + _game.getCurrentKills().toString();

		}
		
		public function destroy():void
		{
			_format = null;
			_hud = null;
			removeChild(_levelText);
			this.removeFromParent(true);
		}
		
	}

}