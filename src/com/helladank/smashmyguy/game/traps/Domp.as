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
		[Embed(source = "Domp.png")]
		public static const Domp:Class;
		
		private var _texture:Texture = Texture.fromEmbeddedAsset(Domp);
		
		private var _status:DompStatus;
		private var _maxY:Number;
		private var _counter:Number;
		private const CHARGE_TIME:Number = 5;
		private const WAIT_TIME:Number = 5;
		private const FALL_SPEED:Number = 20;
		private const WAIT_SPEED:Number = 1;
		private const CHARGE_SPEED:Number = 7;
		
		public function Domp(maxY:int) 
		{
			super(_texture);
			
			_maxY = maxY;
			_status = DompStatus.DOMP_READY;
			_counter = WAIT_TIME;
		}
		
		public function activate():void
		{
			if (_status == DompStatus.DOMP_READY) _status = DompStatus.DOMP_FALLING;
		}
		
		public function tick():void
		{
			switch(_status) { 
				case DompStatus.DOMP_READY:
					break;
				case DompStatus.DOMP_FALLING:
					y += FALL_SPEED;
					if (y >= _maxY)
					{
						y = _maxY;
						_counter = WAIT_TIME;
						_status = DompStatus.DOMP_WAITING;
					}
					break;
				case DompStatus.DOMP_CHARGING:
					y -= CHARGE_SPEED;
					if (y <= 0)
					{
						y = 0;
						_status = DompStatus.DOMP_READY;
					}
					break;
				case DompStatus.DOMP_CHARGING:
					y -= CHARGE_SPEED;
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