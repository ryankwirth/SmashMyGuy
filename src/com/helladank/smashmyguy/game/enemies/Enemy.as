package com.helladank.smashmyguy.game.enemies 
{
	import starling.display.MovieClip;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author Ryan Wirth
	 */
	public class Enemy extends MovieClip
	{
		
		public function Enemy(initialX:int) 
		{
			var texture:Vector.<Texture> = new Vector.<Texture>([Texture.fromColor(24, 16, 0xFF6600)]);
			super(texture);
			
			x = initialX;
		}
		
		public function tick():void
		{
			x++;
		}
		
		public function kill():void
		{
			
		}
		
		public function destroy():void
		{
			removeFromParent(true);
		}
	}
	
}