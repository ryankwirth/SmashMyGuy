package com.helladank.smashmyguy.game.enemies 
{
	import com.helladank.smashmyguy.game.Game;
	import com.helladank.smashmyguy.game.Window;
	import starling.display.MovieClip;
	import starling.textures.Texture;
	import starling.textures.TextureSmoothing;
	
	/**
	 * ...
	 * @author Ryan Wirth
	 */
	public class Enemy extends MovieClip
	{
		public static const DEATH_TIME_LEFT:int = 60;
		
		private var _finalX:int;
		private var _window:Window;
		private var _alive:Boolean;
		private var _deathTimeLeft:int = 0;
		
		public function Enemy(textures:Vector.<Texture>, window:Window, initialX:int, finalX:int) 
		{
			super(textures, 4);
			
			play();
			textureSmoothing = TextureSmoothing.NONE;
			
			_window = window;
			_finalX = finalX;
			x = initialX;
		}
		
		public function tick():void
		{
			x++;
			
			if (x >= _finalX) {
				
				_window.GAME.decrementLives();
				destroy();
			}
		}
		
		public function kill():void
		{
			_window.PARTICLES.addExplosion(x + width * 0.5, y + height * 1, 100, -4, 4, -4, 0, true);
			destroy();
		}
		
		public function destroy():void
		{
			_window.removeEnemy(this);
			_window = null;
			removeFromParent(true);
		}
	}
	
}