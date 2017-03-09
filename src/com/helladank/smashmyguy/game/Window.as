package com.helladank.smashmyguy.game 
{
	import com.helladank.smashmyguy.game.background.Background;
	import com.helladank.smashmyguy.game.enemies.Enemy;
	import com.helladank.smashmyguy.game.enemies.GenericEnemy;
	import com.helladank.smashmyguy.game.particles.Particles;
	import com.helladank.smashmyguy.game.traps.Domp;
	import com.helladank.smashmyguy.game.traps.Trap;
	import flash.events.MouseEvent;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import com.helladank.smashmyguy.Main;
	/**
	 * ...
	 * @author ...
	 */
	public class Window extends Sprite
	{
		private var _width:int, _height:int, _baselineY:int;
		private var _timeToNewEnemy:int;
		
		private var _particles:Particles;
		
		private var _traps:Vector.<Trap>;
		private var _enemies:Vector.<Enemy>;
		
		private var _background:Background;
		
		public function Window(width:int, height:int) 
		{
			_width = width; _height = height; _baselineY = Math.ceil((height * 0.75) / 16) * 16;
			_timeToNewEnemy = Math.random() * 60;
			
			_traps = new Vector.<Trap>();
			_enemies = new Vector.<Enemy>();
			
			addEventListener(EnterFrameEvent.ENTER_FRAME, tick);
			addEventListener(TouchEvent.TOUCH, tap);
			
			_background = new Background(_width, _height, _baselineY);
			addChild(_background);
			
			_particles = new Particles();
			addChild(_particles);
			
			createDomp();
		}
		
		/**
		 * Rearranges the layers to keep the particles object on top of everything else.
		 */
		public function fixLayers():void
		{
			this.setChildIndex(_particles, this.numChildren - 1);
		}
		
		public function createDomp():void
		{
			var domp:Domp = new Domp(_baselineY - 79);
			domp.x = width / 2 - domp.width / 2;
			_traps.push(domp);
			addChild(domp);
		}
		
		public function tap(e:TouchEvent):void
		{
			if (e.getTouches(this, TouchPhase.BEGAN).length == 0) return;
			for (var i:int = 0; i < _traps.length; i++) _traps[i].activate();
		}
		
		public function tick(e:EnterFrameEvent):void
		{
			if (_timeToNewEnemy <= 0)
			{
				_timeToNewEnemy = Math.floor(Math.random() * 300) + 60;
				addEnemy();
			} else _timeToNewEnemy--;
			
			var i:int;
			for (i = 0; i < _traps.length; i++) _traps[i].tick();
			for (i = 0; i < _enemies.length; i++) _enemies[i].tick();
			
			_particles.tick();
			
			checkCollisions();
		}
		
		public function checkCollisions():void
		{
			var trap:Trap;
			var enemy:Enemy;
			for (var i:int = 0; i < _traps.length; i++)
			{
				trap = _traps[i];
				for (var j:int = 0; j < _enemies.length; j++)
				{
					enemy = _enemies[j];
					
					_traps[i].checkCollision(_enemies[j]);
				}
			}
		}
		
		public function addEnemy():void
		{
			var enemy:Enemy = new GenericEnemy(this, -64, _width);
			enemy.y = _baselineY - enemy.height;
			_enemies.push(enemy);
			addChild(enemy);
			
			Main.JUGGLER.add(enemy);
			
			fixLayers();
		}
		
		public function removeEnemy(enemy:Enemy):void
		{
			for (var i:int = 0; i < _enemies.length; i++) if (_enemies[i] == enemy) { _enemies.splice(i, 1); break; }
		
			Main.JUGGLER.remove(enemy);
			
			//decrement lives here?
		}
		
		public function destroy():void
		{
			removeEventListener(EnterFrameEvent.ENTER_FRAME, tick);
			
			var i:int;
			for (i = 0; i < _enemies.length; i++) _enemies[i].destroy();
			for (i = 0; i < _traps.length; i++) _traps[i].destroy();
			
			_enemies = null;
			_traps = null;
			
			removeChild(_background);
			removeChild(_particles);
			
			_background.destroy();
			_particles.destroy();
			
			_background = null;
			_particles = null;
		}
		
		public function get PARTICLES():Particles
		{
			return _particles;
		}
		
	}

}