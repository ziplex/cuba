package 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author ziplex
	 */
	public class FiltrArray extends Sprite 
	{
		public function FiltrArray ():void 
		{
			var a:Array = [];
			
			var btn:Sprite = new Sprite();
			btn.graphics.beginFill(0xFFFFFF, 1);
			btn.graphics.drawRect(20, 20, 50, 50);
			btn.graphics.endFill();
			addChild(btn);
			btn.buttonMode = true;
			btn.addEventListener(MouseEvent.MOUSE_DOWN, onClick);
			btn.addEventListener(MouseEvent.MOUSE_UP,onMouseUp)
			
			
			
			function onMouseUp(event:MouseEvent):void 
			{
				btn.stopDrag();
			}
			function onClick(event:MouseEvent):void 
			{
			     btn.startDrag();   
				for (var i:int = 0; i < 100; i++) 
				{
				  trace("sfdfdf");
				}	
			}
			
		}
	}// End public class FiltrArray
	
	} // End Package 