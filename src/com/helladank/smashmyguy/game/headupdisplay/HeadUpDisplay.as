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
		
		private var _format:TextFormat;
		private var _textField:TextField;
		
		public function HeadUpDisplay(game:Game)
		{
			_game = game;
			trace('game hud initialized');
			_format = new TextFormat(BitmapFont.MINI, BitmapFont.NATIVE_SIZE, 0xFFFFFF, "left", "top");
			_textField = new TextField(200, 48, "HEllo!", _format);
			_textField.x = 10; _textField.y = 10;
			addChild(_textField);
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