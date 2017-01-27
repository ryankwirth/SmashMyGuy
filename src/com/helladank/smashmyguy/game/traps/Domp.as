package com.helladank.smashmyguy.game.traps 
{
	import com.helladank.smashmyguy.IDestructible;
	import starling.display.Image;
	/**
	 * ...
	 * @author Ryan Wirth
	 */
	public class Domp extends Image implements Trap implements IDestructible
	{
		private var _status:DompStatus;
		private var _currentY:Number;
		private var _maxY:Number;
		private var _counter:Number;
		private const CHARGE_TIME:Number;
		private const WAIT_TIME:Number;
		private const FALL_SPEED:Number;
		private const WAIT_SPEED:Number;
		private const CHARGE_SPEED:Number;
		
		public function Domp(maxY:int) 
		{
			_maxY = maxY;
			_status = DompStatus.DOMP_READY;
			_counter = WAIT_TIME;
		}
		
		private function activate():void;
		{
			if (_status = DompStatus.DOMP_READY) 
			_status = DompStatus.DOMP_FALLING;
		}
		
		private function tick():void
		{
			switch(_status) { 
				DompStatus.DOMP_READY:
					break;
				DompStatus.DOMP_FALLING:
					_currentY -= FALL_SPEED;
					break;
				DompStatus.DOMP_CHARGING:
					_currentY += CHARGE_SPEED;
					break;
				DompStatus.DOMP_WAITING:
					if (_counter > 0) {
					_counter -= WAIT_SPEED;
					} else {
						_status = DompStatus.DOMP_CHARGING;
					}
					
					break;
				
			}
		}
		
		private function get IS_READY():Boolean
		{
			if (_status = DompStatus.DOMP_READY) 
			return true;
		}
		
		private function destroy():void;
		{
			
		}
		
	}

}