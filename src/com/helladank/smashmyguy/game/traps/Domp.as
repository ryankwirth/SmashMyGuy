package com.helladank.smashmyguy.game.traps 
{
	import com.helladank.smashmyguy.IDestructible;
	import com.helladank.smashmyguy.game.enemies.Enemy;
	import flash.display.Bitmap;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import starling.display.Image;
	import starling.textures.Texture;
	import starling.textures.TextureSmoothing;
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
		
		private var _feathering:int = 10;
		
		public function Domp(maxY:int) 
		{
			super(_texture);
			
			textureSmoothing = TextureSmoothing.NONE;
			
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
		
		public function checkCollision(enemy:Enemy):void
		{
			// Only check collisions when we're falling
			if (!_status == DompStatus.DOMP_FALLING) return;
			
			var distX:int = Math.abs(enemy.x + enemy.width / 2 - (this.x + this.width / 2));
			
			// If the enemy and this trap are far away, don't bother checking further
			if (distX > this.width + enemy.width) return;
			
			// Check the bounding boxes (minus feathering)
			var bounds:Rectangle = this.bounds.clone();
			bounds.width -= _feathering * 2;
			bounds.x += _feathering;
			if (!enemy.bounds.intersects(bounds)) return;
			
			// The bounding boxes are intersecting, check by the amount of overlapping top edges
			var distY:int = (this.y + this.height) - enemy.y;
			
			if (distY <= 1 || distY >= 0) enemy.kill();
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