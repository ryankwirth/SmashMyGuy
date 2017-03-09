package com.helladank.smashmyguy.game.headupdisplay 
{
	import flash.display.Sprite;
	import flash.display.BitmapData;
	import starling.display.Image;
	import starling.textures.Texture;
	import starling.textures.TextureSmoothing;

	/**
	 * ...
	 * @author Trevin Wong
	 */
	public class Heart extends Image
	{
		[Embed(source = "Heart.png")]
		private static var heart:Class;
		
		private var _texture:Texture = Texture.fromEmbeddedAsset(heart);
		
		public function Heart() 
		{
			super(_texture);
			textureSmoothing = TextureSmoothing.NONE;
		}
		
	}

}