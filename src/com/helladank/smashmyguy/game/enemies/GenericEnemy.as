package com.helladank.smashmyguy.game.enemies 
{
	import com.helladank.smashmyguy.game.Window;
	import starling.display.MovieClip;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	/**
	 * ...
	 * @author Ryan Wirth
	 */
	public class GenericEnemy extends Enemy
	{
		[Embed(source = "GenericEnemy.png")]
		public static const Spriteset:Class;
		[Embed(source = "GenericEnemy.xml", mimeType="application/octet-stream")]
		public static const SpritesetXML:Class;
		private static var _spritesetTexture:Texture = Texture.fromEmbeddedAsset(Spriteset);
		private static var _spritesetXML:XML = XML(new SpritesetXML());
		
		private static var _textureAtlas:TextureAtlas = new TextureAtlas(_spritesetTexture, _spritesetXML);
		
		public function GenericEnemy(window:Window, initialX:int, finalX:int) 
		{
			super(_textureAtlas.getTextures(), window, initialX, finalX);
		}
		
	}

}