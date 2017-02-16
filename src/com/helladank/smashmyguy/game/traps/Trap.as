package com.helladank.smashmyguy.game.traps 
{
	import com.helladank.smashmyguy.game.enemies.Enemy;
	
	/**
	 * ...
	 * @author Ryan Wirth
	 */
	public interface Trap 
	{
		function activate():void;
		function tick():void;
		
		function get IS_READY():Boolean;
		
		function destroy():void;
		
		function checkCollision(enemy:Enemy):void;
	}
	
}