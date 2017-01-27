package com.helladank.smashmyguy.game 
{
	import com.helladank.smashmyguy.game.enemies.Enemy;
	import com.helladank.smashmyguy.game.enemies.GenericEnemy;
	import com.helladank.smashmyguy.game.traps.Domp;
	import com.helladank.smashmyguy.game.traps.Trap;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.events.EnterFrameEvent;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	/**
	 * ...
	 * @author ...
	 */
	public class Window extends Sprite
	{
		private var _width:int, _height:int, _baselineY:int;
		private var _timeToNewEnemy:int;
		
		private var _traps:Vector.<Trap>;
		private var _enemies:Vector.<Enemy>;
		
		public function Window(width:int, height:int) 
		{
			_width = width; _height = _baselineY = height;
			_timeToNewEnemy = 0;
			
			_traps = new Vector.<Trap>();
			_enemies = new Vector.<Enemy>();
			
			addEventListener(EnterFrameEvent.ENTER_FRAME, tick);
			addEventListener(TouchEvent.TOUCH, tap);
			
			var domp:Domp = new Domp(height - 96);
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
		}
		
		public function addEnemy():void
		{
			var enemy:Enemy = new GenericEnemy(this, -64, _width);
			enemy.y = _baselineY - enemy.height;
			_enemies.push(enemy);
			addChild(enemy);
		}
		
		public function removeEnemy(enemy:Enemy):void
		{
			for (var i:int = 0; i < _enemies.length; i++) if (_enemies[i] == enemy) { _enemies.splice(i, 1); break; }
			enemy.destroy();
		}
		
		public function destroy():void
		{
			removeEventListener(EnterFrameEvent.ENTER_FRAME, tick);
			
			var i:int;
			for (i = 0; i < _enemies.length; i++) _enemies[i].destroy();
			for (i = 0; i < _traps.length; i++) _traps[i].destroy();
			
			_enemies = null;
			_traps = null;
		}
		
	}

}