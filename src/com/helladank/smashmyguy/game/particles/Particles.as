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
		private var _particlePool:Vector.<Particle>;
		
		public function Particles() 
		{
			_particles = new Vector.<Particle>();
			_particlePool = new Vector.<Particle>();
			
			preloadPool(250);
		}
		
		public function addExplosion(xPos:int, yPos:int, numberOfParticles:int = 10, xMinVelocity:Number = -1, xMaxVelocity:Number = 1, yMinVelocity:Number = -1, yMaxVelocity:Number = 1, gravity:Boolean = false):void
		{
			var particle:Particle;
			var xVel:Number, yVel:Number;
			
			for (var i:int = 0; i < numberOfParticles; i++)
			{
				xVel = Math.random() * (xMaxVelocity - xMinVelocity) + xMinVelocity;
				yVel = Math.random() * (yMaxVelocity - yMinVelocity) + yMinVelocity;
				
				xVel *= Math.random() + 1;
				yVel *= Math.random() + 1;
				
				particle = getParticleFromPool();
				particle.configure(xPos, yPos, xVel, yVel, gravity, Math.random() * 60 + 90);
				
				_particles.push(particle);
				addChild(particle);
			}
		}
		
		public function tick():void
		{
			var particle:Particle;
			for (var i:int = 0; i < _particles.length; i++) 
			{
				particle = _particles[i];
				
				if (particle.tick() == false)
				{
					// This particle is dead.
					_particles.splice(i, 1);
					i--;
					
					addParticleToPool(particle);
				}
			}
		}
		
		public function addParticleToPool(particle:Particle):void
		{
			removeChild(particle);
			
			_particlePool.push(particle);
		}
		
		public function getParticleFromPool():Particle {
			var particle:Particle;
			if (_particlePool.length > 0) {
				particle = _particlePool.pop();
			} else 
			{
				particle = new Particle();
			}
			
			return particle;
		}
		
		public function preloadPool(numOfParticles:int):void
		{
			while (_particlePool.length < numOfParticles) _particlePool.push(new Particle());
		}
		
		public function destroy():void
		{
			var i:int;
			for (i = 0; i < _particles.length; i++) _particles[i].destroy();
			for (i = 0; i < _particlePool.length; i++) _particlePool[i].destroy();
			_particles = null;
			_particlePool = null;
		}
		
	}

}