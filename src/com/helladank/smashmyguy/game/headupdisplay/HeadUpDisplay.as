package com.helladank.smashmyguy.game.headupdisplay 
{
	import com.helladank.smashmyguy.IDestructible;
	import starling.display.Sprite;
	import starling.text.TextField;
	/**
	 * ...
	 * @author Alison
	 */
	public class HeadUpDisplay extends Sprite implements IDestructible
	{
		private var textField:TextField;
		
		private var _width:int, _height:int;// , _baselineY:int;
		
		public function HeadUpDisplay(width:int, height:int)//, baselineY:int) 
		{
			_width = width; _height = height; //_baselineY = baselineY;
			
			textField = new TextField(100, 100, "HEllo!");
			
			addChild(textField);
		}
		
		public function destroy():void
		{
			
		}
		
	}

}