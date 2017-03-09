package com.helladank.smashmyguy.game.particles 
{
	import com.helladank.smashmyguy.IDestructible;
	import starling.display.Sprite;
	/**
	 * ...
	 * @author Ryan Wirth
	 */
	public class Particles extends Sprite implements IDestructible
	{
		private var _particles:Vector.<Particle>;
		
		public function Particles() 
		{
			_particles = new Vector.<Particle>();
		}
		
		public function addExplosion(xPos:int, yPos:int, numberOfParticles:int = 10, xMinVelocity:Number = -1, xMaxVelocity:Number = 1, yMinVelocity:Number = -1, yMaxVelocity:Number = 1, gravity:Boolean = false):void
		{
			var particle:Particle;
			var xVel:Number, yVel:Number;
			
			for (var i:int = 0; i < numberOfParticles; i++)
			{
				xVel = Math.random() * (xMaxVelocity - xMinVelocity) + xMinVelocity;
				yVel = Math.random() * (yMaxVelocity - yMinVelocity) + yMinVelocity;
				
				particle = new Particle(xPos, yPos, xVel, yVel, gravity, Math.random() * 60 + 90);
				
				_particles.push(particle);
				addChild(particle);
			}
		}
		
		public function tick():void
		{
			for (var i:int = 0; i < _particles.length; i++) 
			{
				if (_particles[i].tick() == false)
				{
					// This particle is dead.
					_particles[i].destroy();
					_particles.splice(i, 1);
					i--;
				}
			}
		}
		
		public function destroy():void
		{
			for (var i:int = 0; i < _particles.length; i++) _particles[i].destroy();
			_particles = null;
		}
		
	}

}