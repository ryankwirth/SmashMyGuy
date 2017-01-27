package com.helladank.smashmyguy.game.enemies 
{
	import starling.display.MovieClip;
	/**
	 * ...
	 * @author Ryan Wirth
	 */
	public class GenericEnemy extends MovieClip implements Enemy
	{
		
		public function GenericEnemy() 
		{
			
		}
		
		public function destroy():void
		{
			removeFromParent(true);
		}
		
	}

}