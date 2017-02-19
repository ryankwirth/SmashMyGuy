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
		private var _lives:TextField;
		
		public function HeadUpDisplay(game:Game, width:int, height:int)
		{
			_game = game;
			_width = width; _height = height;
			trace('game hud initialized');
			_format = new TextFormat(BitmapFont.MINI, BitmapFont.NATIVE_SIZE*2, 0xFFFFFF, "left", "top");
			
			_textField = new TextField(200, 48, "HEllo!", _format);
			_textField.x = 10;
			_textField.y = 10;
			addChild(_textField);
			
			_lives = new TextField(200, 48, "Lives: 3", _format);
			_lives.x = _width - 100;
			_lives.y = 10;
			addChild(_lives);
		}
		
		public function tick():void
		{
			// TODO
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