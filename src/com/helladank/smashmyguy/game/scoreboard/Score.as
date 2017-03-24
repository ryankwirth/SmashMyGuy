package com.helladank.smashmyguy.game.scoreboard 
{
	/**
	 * ...
	 * @author Ryan Wirth
	 */
	public class Score 
	{
		private var _name:String;
		private var _kills:int;
		private var _timePlayed:int;
		private var _level:int;
		
		public function Score(name:String, kills:int, timePlayed:int, level:int) 
		{
			_name = name;
			_kills = kills;
			_timePlayed = timePlayed;
			_level = level;
			
			cleanData();
		}
		
		private function cleanData():void
		{
			_name = _name.replace(/[^\w|\d|_]/g, '');
		}
		
		public function get name():String
		{
			return _name;
		}
		
		public function get kills():int
		{
			return _kills;
		}
		
		public function get timePlayed():int
		{
			return _timePlayed;
		}
		
		public function get level():int
		{
			return _level;
		}
		
		public function encode():String
		{
			return "name=" + name +
				   "&kills=" + kills +
				   "&timePlayed=" + timePlayed +
				   "&level=" + level;
		}
		
		public function decode(encodedData:String):void
		{
			var data:Array = encodedData.split("&");
			for (var i:int = 0; i < data.length; i++)
			{
				var pairData:Array = String(data[i]).split("=");
				var key:String = pairData[0];
				var value:String = pairData[1];
				decodeKeyValue(key, value);
			}
			
			cleanData();
		}
		
		private function decodeKeyValue(key:String, value:String):void
		{
			switch(key)
			{
				case "name":
					_name = value;
					break;
				case "kills":
					_kills = int(value);
					break;
				case "timePlayed":
					_timePlayed = int(value);
					break;
				case "level":
					_level = int(value);
					break;
			}
		}
		
	}

}