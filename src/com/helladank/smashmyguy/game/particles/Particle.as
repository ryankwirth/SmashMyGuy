package com.helladank.smashmyguy.game.particles 
{
	import com.helladank.smashmyguy.IDestructible;
	import starling.display.Image;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author Ryan Wirth
	 */
	public class Particle extends Image implements IDestructible
	{
		private static const TEXTURE:Texture = Texture.fromColor(1, 1, 0xFF0000, 1);
		
		private var _originalLifespan:int;
		private var _originalY:int;
		
		private var _xVel:Number;
		private var _yVel:Number;
		private var _lifespan:int;
		private var _gravity:Boolean;
		
		public function Particle(xPos:int, yPos:int, xVel:Number, yVel:Number, gravity:Boolean, lifespan:int) 
		{
			super(TEXTURE);
			
			_gravity = gravity;
			_lifespan = lifespan;
			_xVel = xVel;
			_yVel = yVel;
			
			_originalY = yPos;
			_originalLifespan = lifespan;
			
			this.x = xPos;
			this.y = yPos;
		}
		
		public function tick():Boolean
		{
			this.x += _xVel;
			this.y += _yVel;
			
			_xVel *= 0.95;
			_yVel *= 0.95;
			
			if (_gravity) 
			{	
				if (this.y > _originalY)
				{
					this.y = _originalY;
					_yVel = _yVel > 0 ? _yVel * -1 : _yVel; // Make sure _yVel is negative
				} else _yVel += 0.2 * (_lifespan / _originalLifespan);
			}
			
			_lifespan--;
			
			if (_lifespan <= 0) return false;
			else return true;
		}
		
		public function destroy():void
		{
			this.removeFromParent(true);
		}
		
	}

}