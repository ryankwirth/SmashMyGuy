package com.helladank.smashmyguy.game 
{
	import com.helladank.smashmyguy.game.enemies.Enemy;
	import com.helladank.smashmyguy.game.traps.Trap;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.events.EnterFrameEvent;
	/**
	 * ...
	 * @author ...
	 */
	public class Window extends Sprite
	{
		private var _width:int, _height:int;
		
		private var _traps:Vector.<Trap>;
		private var _enemies:Vector.<Enemy>;
		
		public function Window(width:int, height:int) 
		{
			_width = width; _height = height;
			
			_traps = new Vector.<Trap>();
			_enemies = new Vector.<Enemy>();
			
			addEventListener(EnterFrameEvent.ENTER_FRAME, tick);
		}
		
		public function tick(e:EnterFrameEvent):void
		{
			var i;
			for (i = 0; i < _traps.length; i++) _traps[i].tick();
			for (i = 0; i < _enemies.length; i++) _enemies[i].tick();
		}
		
		public function addEnemy():void
		{
			var enemy:Enemy = new Enemy( -64);
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
			
			var i;
			for (i = 0; i < _enemies.length; i++) _enemies[i].destroy();
			for (i = 0; i < _traps.length; i++) _traps[i].destroy();
			
			_enemies = null;
			_traps = null;
		}
		
	}

}