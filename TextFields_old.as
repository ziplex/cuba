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
	/**
	 * ...
	 * @author ziplex
	 */
	public class TextFields extends Sprite 
	{
		public function TextFields():void
		{
			
		} //end public function TextFields
		
		public function animator():void
		{
			var p0:Point;
			var p1:Point;
			var p2:Point;
			var p3:Point;
			var p4:Point;
			
			p0.x = 110;	p0.y = 0;
			p1.x = -500;p1.y = 0;
			p2.x = 0;	p2.y = 0;
			p3.x = 0;	p3.y = 644;
			p4.x = -500; p4.y = 644;
			
			var shadow_offset:int = 5;
			var grad_height:int = 30;
			var s1:int = 6;
			var s2:int = 2;
			var d_txt:int = 10;
			var d_shadow:int = 3;
			
			var pics_x:Array = [30,270,270,30,30,270,270,30,30,270,270,30];
			var pics_y:Array = [174,174,324,324,334,334,484,484,494,494,644,644];
			
			var text_container:MovieClip = new MovieClip();
			text_container.x = 627;
			text_container.y = 70;
			
			var txt_point0:MovieClip = new MovieClip();
			var txt_point1:MovieClip = new MovieClip();
			var txt_point2:MovieClip = new MovieClip();
			var txt_point3:MovieClip = new MovieClip();
			var txt_point4:MovieClip = new MovieClip();
			var text_canvas:MovieClip = new MovieClip();
			var text_fields:MovieClip = new MovieClip();
			var text_mask:MovieClip = new MovieClip();
			
			text_container.addChild(txt_point0);
			text_container.addChild(txt_point1);
			text_container.addChild(txt_point2);
			text_container.addChild(txt_point3);
			text_container.addChild(txt_point4);
			text_container.addChild(text_canvas);
			text_container.addChild(text_fields);
			text_container.addChild(txt_point0);
			addChild(text_mask);
			text_container.mask = text_mask;
			
			var text_content_1:TextField = new TextField();
			
			//текстовые поля
			text_content_1.x = (p1.x+d_txt);
			text_content_1.y = (p1.y+d_txt);
			text_content_1.width = (-3*d_txt-p1.x);
			text_content_1.height = (p3.y-2*d_txt);
	
			var text_content_2:TextField = new TextField();
			text_content_2.x = (d_txt);
			text_content_2.y = (p1.y+d_txt);
			text_content_2.width = (-3*d_txt-p1.x);
			text_content_2.height = (p3.y-2*d_txt);
	
	
	
	
	
			
			
		}//end function animator
		
	} // end class
	
	} // end package