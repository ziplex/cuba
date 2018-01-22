package 
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author ziplex
	 */
	public class test extends Sprite
	{
		function test():void
		{
			var xn:Array=[282,341,403,463,522,583,636,703,758,819,
						  275,336,400,470,530,593,650,713,769,830,
						  281,341,404,470,530,589,646,710,763,823,
						  288,347,410,476,536,597,653,719,773,833,
						  282, 342, 405, 473, 531, 597, 649, 713, 770, 830];
						
						  
				var tmp:Number;
				
			for (var i:int = 0; i < 8; i++ )
			{
				tmp = xn[i];
				xn[i] = xn[i + 1];
				xn[i + 1] = tmp;
				
				trace(xn[i]);
			}
						  
		}//end function
	}//end public
	
	}//end package