package com.helladank.smashmyguy.game.headupdisplay 
{
	import com.helladank.smashmyguy.IDestructible;
	import com.helladank.smashmyguy.game.Game;
	import starling.display.Sprite;
	import starling.text.BitmapFont;
	import starling.text.TextField;
	import starling.text.TextFormat;
	/**
	 * ...
	 * @author Alison
	 */
	public class HeadUpDisplay extends Sprite implements IDestructible
	{
		private var _game:Game;
		private var _width:int, _height:int;
		
		private var _format:TextFormat;
		private var _textField:TextField;
		private var _livesText:TextField;
				
		public function HeadUpDisplay(game:Game, width:int, height:int)
		{
			_game = game;
			_width = width; _height = height;
			trace('game hud initialized');
			_format = new TextFormat(BitmapFont.MINI, BitmapFont.NATIVE_SIZE*2, 0xFFFFFF, "left", "top");
			
			_livesText = new TextField(200, 48, "Lives: ", _format);
			_livesText.x = 20;
			_livesText.y = _height - 30;
			addChild(_livesText);
			
			for (var i : int = 0; i < _game.getLives(); i++) {
				var heart:Heart = new Heart();
				heart.x = 80 + (25 * i);
				heart.y = height - 33;
				addChild(heart);
			}
		}
		
		public function tick():void
		{
			
		}
		
		public function destroy():void
		{
			_game = null;
			
			removeChild(_textField);
			_format = null;
			
			this.removeFromParent(true);
		}
		
	}

}