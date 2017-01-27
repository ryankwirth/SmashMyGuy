package com.helladank.smashmyguy.game.enemies 
{
	
	/**
	 * ...
	 * @author Ryan Wirth
	 */
	public interface Enemy 
	{
		function tick():void;
		function kill():void;
		function destroy():void;
	}
	
}