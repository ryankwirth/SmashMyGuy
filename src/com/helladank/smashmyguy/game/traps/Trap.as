package com.helladank.smashmyguy.game.traps 
{
	
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
	}
	
}