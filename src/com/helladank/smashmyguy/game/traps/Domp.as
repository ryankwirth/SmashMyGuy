package com.helladank.smashmyguy.game.traps 
{
	import com.helladank.smashmyguy.IDestructible;
	import flash.display.Bitmap;
	import starling.display.Image;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author Ryan Wirth
	 */
	public class Domp extends Image implements Trap, IDestructible
	{
		// Embedding image for Domp
		[Embed(source = "/domp.png")]
		public static const Domp:Class;
		
		var texture:Texture = Texture.fromEmbeddedAsset(Domp);
		
		private var _status:DompStatus;
		private var _currentY:Number;
		private var _maxY:Number;
		private var _counter:Number;
		
		private const CHARGE_TIME:Number;
		private const WAIT_TIME:Number;
		private const FALL_SPEED:Number;
		private const WAIT_SPEED:Number;
		private const CHARGE_SPEED:Number;
		
		public function Domp(maxY:int) 
		{
			super(texture);
			_maxY = maxY;
			_status = DompStatus.DOMP_READY;
			_counter = WAIT_TIME;
		}
		
		public function activate():void
		{
			if (_status = DompStatus.DOMP_READY) 
			_status = DompStatus.DOMP_FALLING;
		}
		
		public function tick():void
		{
			switch(_status) { 
				case DompStatus.DOMP_READY:
					break;
				case DompStatus.DOMP_FALLING:
					_currentY += FALL_SPEED;
					break;
				case DompStatus.DOMP_CHARGING:
					_currentY -= CHARGE_SPEED;
					break;
				case DompStatus.DOMP_WAITING:
					if (_counter > 0) {
					_counter -= WAIT_SPEED;
					} else {
						_status = DompStatus.DOMP_CHARGING;
					}
					
					break;
				
			}
		}
		
		public function get IS_READY():Boolean
		{
			return _status == DompStatus.DOMP_READY;
		}
		
		public function destroy():void
		{
			removeFromParent(true);
		}
		
	}

}