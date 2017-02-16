package com.helladank.smashmyguy.game.enemies 
{
	import com.helladank.smashmyguy.game.Window;
	import starling.display.MovieClip;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author Ryan Wirth
	 */
	public class Enemy extends MovieClip
	{
		private var _finalX:int;
		private var _window:Window;
		
		public function Enemy(window:Window, initialX:int, finalX:int) 
		{
			var texture:Vector.<Texture> = new <Texture>[Texture.fromColor(24, 16, 0xFF6600)];
			super(texture);
			
			_window = window;
			_finalX = finalX;
			x = initialX;
		}
		
		public function tick():void
		{
			x++;
			
			if (x >= _finalX + width) _window.removeEnemy(this);
		}
		
		public function kill():void
		{
			
		}
		
		public function destroy():void
		{
			_window = null;
			removeFromParent(true);
		}
	}
	
}