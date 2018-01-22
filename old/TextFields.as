package 
{
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import com.greensock.*;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import com.greensock.plugins.*;
	import com.greensock.easing.*;
	import flash.events.*;
	/**
	 * ...
	 * @author ziplex
	 */
	public class TextFields extends Sprite 
	{
		public function TextFields():void
		{
			animator();
		} //end public function TextFields
		
		public function animator():void
		{
			var rootLine:MovieClip = new MovieClip();
			rootLine.graphics.lineStyle(0.5, 0xFFFFFF);
			rootLine.graphics.moveTo(600, 0);
			addChild(rootLine);
			addEventListener(Event.ENTER_FRAME, drawLine)
			
			function drawLine():void
			{
				rootLine.graphics.lineTo(0, 0);
			}
			
			
		}//end function animator
		
	} // end class
	
	} // end package