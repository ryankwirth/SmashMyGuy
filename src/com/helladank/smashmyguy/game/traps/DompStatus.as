package com.helladank.smashmyguy.game.traps 
{
	/**
	 * ...
	 * @author Ryan Wirth
	 */
	public class DompStatus 
	{
		public static const DOMP_READY:DompStatus = new DompStatus("READY");
		public static const DOMP_FALLING:DompStatus = new DompStatus("FALLING");
		public static const DOMP_WAITING:DompStatus = new DompStatus("WAITING");
		public static const DOMP_CHARGING:DompStatus = new DompStatus("DOMP_CHARGING");
		
		private var _type:String;
		public function DompStatus(type:String) 
		{
			_type = type;
		}
		
	}

}