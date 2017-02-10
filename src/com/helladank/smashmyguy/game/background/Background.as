package com.helladank.smashmyguy.game.background 
{
	import com.helladank.smashmyguy.IDestructible;
	import flash.geom.Rectangle;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.RenderTexture;
	import starling.textures.SubTexture;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.textures.TextureSmoothing;
	/**
	 * ...
	 * @author Ryan Wirth
	 */
	public class Background extends Sprite implements IDestructible
	{
		// Embedding image for the backdrop
		[Embed(source = "backdrop.png")]
		public static const Backdrop:Class;
		private var _backdropTexture:Texture = Texture.fromEmbeddedAsset(Backdrop);
		
		// Embedding image for the tileset
		[Embed(source = "tileset.png")]
		public static const Tileset:Class;
		[Embed(source = "tileset.xml", mimeType="application/octet-stream")]
		public static const TilesetXML:Class;
		private var _tilesetTexture:Texture = Texture.fromEmbeddedAsset(Tileset);
		private var _tilesetXML:XML = XML(new TilesetXML());
		
		private var _textureAtlas:TextureAtlas = new TextureAtlas(_tilesetTexture, _tilesetXML);
		private var _tiles:Vector.<Image>;
		
		private var _backdropFullTexture:RenderTexture;
		private var _backdropFullImage:Image;
		
		private var _tilesFullTexture:RenderTexture;
		private var _tilesFullImage:Image;
		
		private var _width:int, _height:int, _baselineY:int;
		
		public function Background(width:int, height:int, baselineY:int) 
		{
			_width = width; _height = height; _baselineY = baselineY;
			
			fillBackdrop();
			layoutTiles();
		}
		
		public function layoutTiles():void
		{
			_tilesFullTexture = new RenderTexture(_width, _height);
			
			// Fill everything below baselineY with tiles
			var numWidth:int = Math.ceil(_width / 16);
			var numHeight:int = Math.ceil((_height - _baselineY) / 16);
			var i:int, j:int;
			var tile:Image;
			
			for (i = 0; i < numHeight; i++)
			{
				for (j = 0; j < numWidth; j++)
				{
					tile = new Image(_textureAtlas.getTexture(i == 0 ? "ground_top" : "ground_middle"));
					tile.textureSmoothing = TextureSmoothing.NONE;
					tile.x = j * 16;
					tile.y = _baselineY + i * 16;
					
					_tilesFullTexture.draw(tile);
				}
			}
			
			// Generate random pillars
			var lastPillarI:int = -5;
			for (i = 0; i < numWidth; i++)
			{
				if (Math.random() * 100 < 25)
				{
					lastPillarI = i;
					
					// Pillar height is  [3, 6]
					var pillarHeight:int = Math.floor(Math.random() * 4) + 3;
					
					for (j = 0; j < pillarHeight; j++)
					{
						tile = new Image(_textureAtlas.getTexture(j == 0 ? "pillar_bottom" : (j == pillarHeight - 1 ? "pillar_top" : "pillar_middle")));
						tile.textureSmoothing = TextureSmoothing.NONE;
						tile.x = i * 16;
						tile.y = _baselineY - (j + 1) * 16;
						
						_tilesFullTexture.draw(tile);
					}
				}
			}
			
			// Generate random chains
			for (i = 0; i < numWidth; i++)
			{
				if (Math.random() * 100 < 25)
				{
					var chainHeight:int = Math.floor(Math.random() * 5) + 3;
					
					for (j = 0; j < chainHeight; j++)
					{
						tile = new Image(_textureAtlas.getTexture(j == chainHeight - 1 ? "chain_bottom" : "chain_middle"));
						tile.textureSmoothing = TextureSmoothing.NONE;
						tile.x = i * 16;
						tile.y = j * 16;
						
						_tilesFullTexture.draw(tile);
					}
				}
			}
			
			_tilesFullImage = new Image(_tilesFullTexture);
			_tilesFullImage.textureSmoothing = TextureSmoothing.NONE;
			addChild(_tilesFullImage);
		}
		
		public function fillBackdrop():void
		{
			_backdropFullTexture = new RenderTexture(_width, _height);
			
			var backdropImage:Image = new Image(_backdropTexture);
			backdropImage.textureSmoothing = TextureSmoothing.NONE;
			
			var numWidth:int = Math.ceil(_width / backdropImage.width);
			var numHeight:int = Math.ceil(_height / backdropImage.height);
			
			for (var i:int = 0; i < numWidth; i++)
			{
				for (var j:int = 0; j < numHeight; j++)
				{
					backdropImage.x = i * backdropImage.width;
					backdropImage.y = j * backdropImage.height;
					
					_backdropFullTexture.draw(backdropImage);
				}
			}
			
			_backdropFullImage = new Image(_backdropFullTexture);
			_backdropFullImage.textureSmoothing = TextureSmoothing.NONE;
			addChild(_backdropFullImage);
		}
		
		public function destroy():void
		{
			
		}
		
	}

}