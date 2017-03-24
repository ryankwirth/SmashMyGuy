package com.helladank.smashmyguy.game.headupdisplay 
{
	import com.helladank.smashmyguy.IDestructible;
	import com.helladank.smashmyguy.game.Game;
	import starling.display.Sprite;

	
	/**
	 * ...
	 * @author Trevin Wong
	 */
	public class LivesDisplay extends Sprite implements IDestructible
	{
		private var _hud:HeadUpDisplay;
		private var _hearts:Vector.<Heart>;
		private var _game:Game;
		
		public function LivesDisplay(hud:HeadUpDisplay, game:Game) 
		{
			_hud = hud;
			_game = game;
			_hearts = new Vector.<Heart>();

			for (var i : int = 0; i < _game.getLives(); i++) {
				var heart:Heart = new Heart();
				_hearts.push(heart);
				heart.x = (25 * i);
				heart.y = _game.getHeight() - 33;
				addChild(heart);
			}
		}
		
		public function tick():void {
			for (var i : int = 0; i < _hearts.length; i++) {
				if (i < _game.getLives()) {
					_hearts[i].visible = true;
				} else {
					_hearts[i].visible = false;
				}
			}
		}
		
		public function destroy():void
		{
			_hearts = null;
			_hud = null;
			this.removeFromParent(true);
		}
		
	}

}