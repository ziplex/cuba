package 
{
	
	import flash.display.*;
	import fl.transitions.Tween;
	import fl.transitions.easing.*;
	import fl.transitions.TweenEvent;
	import fl.transitions.Tween;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.events.*;
	
	/**
	 * ...
	 * @author ziplex
	 */
	public class Cube extends Sprite  
	{
		public function Cube():void
		{
			var xc:Array =[
                               0,0,56.55,56.55,0,-56.55,-56.55,0,
                               -5,-9,69,49,-2,-32,-64,-1,
                               -9,-18,70,53,1,-33,-57,-2,
                               -4,-12,56,69,-2,-41,-50,8,
                               2,13,52,66,-1,-61,-48,-7,
                               -5,2,47,55,-2,-74,-52,3,
                               5,4,52,53,9,-49,-67,6
                               ];
							var yc:Array = [
                               0,65.3,32.65,-32.65,-65.3,-32.65,32.65,0,
                               6,92,16,-34,-54,-37,34,-3,
                               -5,67,37,-40,-57,-39,12,3,
                               4,52,40,-46,-64,-35,21,-8,
                               7,73,37,-29,-69,-16,48,2,
                               6,58,28,-42,-69,-40,43,-8,
                               -15,61,22,-40,-63,-48,32,-5
                               ];
							
							var menu1:MovieClip = new MovieClip();
							var menu2:MovieClip = new MovieClip(); // элемент меню2   
							var menu3:MovieClip = new MovieClip();	   
							var menu4:MovieClip = new MovieClip();	   
							var menu5:MovieClip = new MovieClip();
							var menu6:MovieClip = new MovieClip(); // элемент меню6	   
							var cubic:MovieClip = new MovieClip(); // кубик	   
							var tweensCube:Array = []; // храним твины	
							var  p:Array = []; //массив точек	   
							var con:int; // счетчик	
							var tweenMenu:Array = [];
						   
							// заполняем массив точек
							for (con = 0; con < xc.length; con++ )
						   {
							  p[con] = new Point(xc[con], yc[con]); 
						   }
							cubic.x = 200;
							cubic.y = 300;
							
													
							menu1.scaleX = 0.8;	menu1.scaleY = 0.8;
							menu1.x -= 2; menu1.y -= 7;
							menu2.scaleX = 0.8;	menu2.scaleY = 0.8;
							menu2.x += 4; menu2.y -= 5;
							menu3.scaleX = 0.8;	menu3.scaleY = 0.8;
							menu3.x += 5; menu3.y += 5;
							
							
							
							DrawCubePoint(cubic, p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7], menu1, menu2, menu3, menu4, menu5, menu6);
							
							
							function tweenCube (shft:int,shftR:int):void
							{
							  var time_tween:Number = 0.5;
							 removeEventListenerMenuButton();	
							  var px0:Tween = new Tween(p[0+shft], "x", Regular.easeOut,p[0+shft].x, p[0+shftR].x, time_tween, true);
							  var py0:Tween = new Tween(p[0+shft], "y", Regular.easeOut,p[0+shft].y, p[0+shftR].y, time_tween, true);
							  var px1:Tween = new Tween(p[1+shft], "x", Regular.easeOut,p[1+shft].x, p[1+shftR].x, time_tween, true);
							  var py1:Tween = new Tween(p[1+shft], "y", Regular.easeOut, p[1+shft].y, p[1+shftR].y, time_tween, true);
							  var px2:Tween = new Tween(p[2+shft], "x", Regular.easeOut,p[2+shft].x, p[2+shftR].x, time_tween, true);
							  var py2:Tween = new Tween(p[2+shft], "y", Regular.easeOut, p[2+shft].y, p[2+shftR].y, time_tween, true);
							  var px3:Tween = new Tween(p[3+shft], "x", Regular.easeOut,p[3+shft].x, p[3+shftR].x, time_tween, true);
							  var py3:Tween = new Tween(p[3+shft], "y", Regular.easeOut, p[3+shft].y, p[3+shftR].y, time_tween, true);
							  var px4:Tween = new Tween(p[4+shft], "x", Regular.easeOut,p[4+shft].x, p[4+shftR].x, time_tween, true);
							  var py4:Tween = new Tween(p[4+shft], "y", Regular.easeOut, p[4+shft].y, p[4+shftR].y, time_tween, true);
							  var px5:Tween = new Tween(p[5+shft], "x", Regular.easeOut,p[5+shft].x, p[5+shftR].x, time_tween, true);
							  var py5:Tween = new Tween(p[5+shft], "y", Regular.easeOut, p[5+shft].y, p[5+shftR].y, time_tween, true);
							  var px6:Tween = new Tween(p[6+shft], "x", Regular.easeOut,p[6+shft].x, p[6+shftR].x, time_tween, true);
							  var py6:Tween = new Tween(p[6+shft], "y", Regular.easeOut, p[6+shft].y, p[6+shftR].y, time_tween, true);
							  var px7:Tween = new Tween(p[7+shft], "x", Regular.easeOut,p[7+shft].x, p[7+shftR].x, time_tween, true);
							  var py7:Tween = new Tween(p[7+shft], "y", Regular.easeOut, p[7+shft].y, p[7+shftR].y, time_tween, true);
								
								tweensCube.push(px0); tweensCube.push(py0);
								tweensCube.push(px1); tweensCube.push(py1);
								tweensCube.push(px2); tweensCube.push(py2);
								tweensCube.push(px3); tweensCube.push(py3);
								tweensCube.push(px4); tweensCube.push(py4);
								tweensCube.push(px5); tweensCube.push(py5);
								tweensCube.push(px6); tweensCube.push(py6);
								tweensCube.push(px7); tweensCube.push(py7);
								
								py7.addEventListener(TweenEvent.MOTION_FINISH, removeOn);
							}
							
							// удаляем слушателя на энтерфрейм
							function removeOn(event:Event):void
							{
								removeEventListener(Event.ENTER_FRAME, onEnterFrame);
								addEventListenerMenuButton();
							}
							// в каждом кадре отрисовываем твин движение всех точек
							function onEnterFrame(event:Event):void
							{
								cubic.graphics.clear();
								menu1.graphics.clear();
								menu2.graphics.clear();
								menu3.graphics.clear();
								menu4.graphics.clear();
								menu5.graphics.clear();
								menu6.graphics.clear();
								DrawCubePoint(cubic, p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7], menu1, menu2, menu3, menu4, menu5, menu6);
								//DrawCubePoint(ddd, p[0+ct], p[1+ct], p[2+ct], p[3+ct], p[4+ct], p[5+ct], p[6+ct], p[7+ct], b1, b2, b3, b4, b5, b6);
							}
							
							function DrawCubePoint(obj:MovieClip, cf:Point, p1:Point, p2:Point, p3:Point,
												   p4:Point, p5:Point, p6:Point, cb:Point,
												   btn1:MovieClip, btn2:MovieClip, btn3:MovieClip, btn4:MovieClip, btn5:MovieClip,
												   btn6:MovieClip
												):void
							{
								// кнопка 1
								btn1.graphics.beginFill(0x50AFDC,0.5);
								btn1.graphics.lineStyle(0.5,0x000000);
								btn1.graphics.moveTo(cf.x, -cf.y);
								btn1.graphics.lineTo(cf.x, -cf.y);
								btn1.graphics.lineTo(p6.x, -p6.y);
								btn1.graphics.lineTo(p1.x, -p1.y);
								btn1.graphics.lineTo(p2.x, -p2.y);
								btn1.graphics.lineTo(cf.x, -cf.y);
								btn1.graphics.endFill();
								btn1.buttonMode = true; 
								
								
								
								// кнопка 3
								btn3.graphics.beginFill(0xDCAAB4,0.5);
								btn3.graphics.lineStyle(0.5,0x000000,100,false,"none","none","miter",3);
								btn3.graphics.moveTo(cf.x, -cf.y);
								btn3.graphics.lineTo(cf.x, -cf.y);
								btn3.graphics.lineTo(p2.x, -p2.y);
								btn3.graphics.lineTo(p3.x, -p3.y);
								btn3.graphics.lineTo(p4.x, -p4.y);
								btn3.graphics.lineTo(cf.x, -cf.y);
								btn3.graphics.endFill();
								btn3.buttonMode = true; 
								// кнопка 5
								btn5.graphics.beginFill(0xF09B7D,0.5);
								btn5.graphics.lineStyle(0.5,0x000000,100,false,"none","none","miter",3);
								btn5.graphics.moveTo(cf.x, -cf.y);
								btn5.graphics.lineTo(cf.x, -cf.y);
								btn5.graphics.lineTo(p4.x, -p4.y);
								btn5.graphics.lineTo(p5.x, -p5.y);
								btn5.graphics.lineTo(p6.x, -p6.y);
								btn5.graphics.lineTo(cf.x, -cf.y);
								btn5.graphics.endFill();
								btn5.buttonMode = true; 
								// кнопка 2
								btn2.graphics.beginFill(0xA591AF,0.5);
								btn2.graphics.lineStyle(0.5,0x000000,100,false,"none","none","miter",3);
								btn2.graphics.moveTo(cb.x, -cb.y);
								btn2.graphics.lineTo(cb.x, -cb.y);
								btn2.graphics.lineTo(p1.x, -p1.y);
								btn2.graphics.lineTo(p2.x, -p2.y);
								btn2.graphics.lineTo(p3.x, -p3.y);
								btn2.graphics.lineTo(cb.x, -cb.y);
								btn2.graphics.endFill();
     							btn2.buttonMode = true; 
								// кнопка 4
								btn4.graphics.beginFill(0xEEEF8A,0.5);
								btn4.graphics.lineStyle(0.5,0x000000,100,false,"none","none","miter",3);
								btn4.graphics.moveTo(cb.x, -cb.y);
								btn4.graphics.lineTo(cb.x, -cb.y);
								btn4.graphics.lineTo(p3.x, -p3.y);
								btn4.graphics.lineTo(p4.x, -p4.y);
								btn4.graphics.lineTo(p5.x, -p5.y);
								btn4.graphics.lineTo(cb.x, -cb.y);
								btn4.graphics.endFill();
								btn4.buttonMode = true; 
								// кнопка 6
								btn6.graphics.beginFill(0xAED693,0.5);
								btn6.graphics.lineStyle(0.5,0x000000,100,false,"none","none","miter",3);
								btn6.graphics.moveTo(cb.x, -cb.y);
								btn6.graphics.lineTo(cb.x, -cb.y);
								btn6.graphics.lineTo(p5.x, -p5.y);
								btn6.graphics.lineTo(p6.x, -p6.y);
								btn6.graphics.lineTo(p1.x, -p1.y);
								btn6.graphics.lineTo(cb.x, -cb.y);
								btn6.graphics.endFill();
								btn6.buttonMode = true; 
								
								// весь объект
								obj.graphics.lineStyle(0.5,0x777777,100,false,"none","none","miter",3);
								obj.graphics.moveTo(p1.x,-p1.y);
     							obj.graphics.lineTo(cb.x,-cb.y);
								obj.graphics.moveTo(p3.x,-p3.y);
								obj.graphics.lineTo(cb.x,-cb.y);
								obj.graphics.moveTo(p5.x,-p5.y);
								obj.graphics.lineTo(cb.x,-cb.y);
     
								obj.graphics.lineStyle(4,0x333333,100,false,"none","none","miter",3);
								obj.graphics.moveTo(p1.x,-p1.y);
								obj.graphics.lineTo(p2.x,-p2.y);
								obj.graphics.lineTo(p3.x,-p3.y);
								obj.graphics.lineTo(p4.x,-p4.y);
								obj.graphics.lineTo(p5.x,-p5.y);
								obj.graphics.lineTo(p6.x,-p6.y);
								obj.graphics.lineTo(p1.x,-p1.y);
     
								obj.graphics.lineStyle(1,0x000000,100,false,"none","none","miter",3);
								obj.graphics.moveTo(p2.x,-p2.y);
								obj.graphics.lineTo(cf.x,-cf.y);
								obj.graphics.moveTo(p4.x,-p4.y);
								obj.graphics.lineTo(cf.x,-cf.y);
								obj.graphics.moveTo(p6.x,-p6.y);
								obj.graphics.lineTo(cf.x,-cf.y);
								
								if (!btn1.stage)
								{
								 obj.addChild(btn1);
								}
								if (!btn2.stage)
								{
								 obj.addChild(btn2);
								}
								if (!btn3.stage)
								{
								 obj.addChild(btn3);
								}
								if (!btn4.stage)
								{
								 obj.addChild(btn4);
								}
								if (!btn5.stage)
								{
								 obj.addChild(btn5);
								}
								if (!btn6.stage)
								{
								 obj.addChild(btn6);
								}
								if (!obj.stage)
								{
								 addChild(obj);
								}
							}
								
							function addEventListenerMenuButton():void
							{
				
								menu1.addEventListener(MouseEvent.CLICK, menu1Click);
								menu1.addEventListener(MouseEvent.MOUSE_OUT, menu1Out);
								menu1.addEventListener(MouseEvent.MOUSE_OVER, menu1Over);
				
								menu2.addEventListener(MouseEvent.CLICK, menu2Click);
								menu2.addEventListener(MouseEvent.MOUSE_OUT, menu2Out);
								menu2.addEventListener(MouseEvent.MOUSE_OVER, menu2Over);
				
								menu3.addEventListener(MouseEvent.CLICK, menu3Click);
								menu3.addEventListener(MouseEvent.MOUSE_OUT, menu3Out);
								menu3.addEventListener(MouseEvent.MOUSE_OVER, menu3Over);
				
								menu4.addEventListener(MouseEvent.CLICK, menu4Click);
								menu4.addEventListener(MouseEvent.MOUSE_OUT, menu4Out);
								menu4.addEventListener(MouseEvent.MOUSE_OVER, menu4Over);
				
								menu5.addEventListener(MouseEvent.CLICK, menu5Click);
								menu5.addEventListener(MouseEvent.MOUSE_OUT, menu5Out);
								menu5.addEventListener(MouseEvent.MOUSE_OVER, menu5Over);
				
								menu6.addEventListener(MouseEvent.CLICK, menu6Click);
								menu6.addEventListener(MouseEvent.MOUSE_OUT, menu6Out);
								menu6.addEventListener(MouseEvent.MOUSE_OVER, menu6Over);
							}
							function removeEventListenerMenuButton():void
							{
				
								menu1.removeEventListener(MouseEvent.CLICK, menu1Click);
								menu1.removeEventListener(MouseEvent.MOUSE_OUT, menu1Out);
								menu1.removeEventListener(MouseEvent.MOUSE_OVER, menu1Over);
				
								menu2.removeEventListener(MouseEvent.CLICK, menu2Click);
								menu2.removeEventListener(MouseEvent.MOUSE_OUT, menu2Out);
								menu2.removeEventListener(MouseEvent.MOUSE_OVER, menu2Over);
				
								menu3.removeEventListener(MouseEvent.CLICK, menu3Click);
								menu3.removeEventListener(MouseEvent.MOUSE_OUT, menu3Out);
								menu3.removeEventListener(MouseEvent.MOUSE_OVER, menu3Over);
				
								menu4.removeEventListener(MouseEvent.CLICK, menu4Click);
								menu4.removeEventListener(MouseEvent.MOUSE_OUT, menu4Out);
								menu4.removeEventListener(MouseEvent.MOUSE_OVER, menu4Over);
				
								menu5.removeEventListener(MouseEvent.CLICK, menu5Click);
								menu5.removeEventListener(MouseEvent.MOUSE_OUT, menu5Out);
								menu5.removeEventListener(MouseEvent.MOUSE_OVER, menu5Over);
				
								menu6.removeEventListener(MouseEvent.CLICK, menu6Click);
								menu6.removeEventListener(MouseEvent.MOUSE_OUT, menu6Out);
								menu6.removeEventListener(MouseEvent.MOUSE_OVER, menu6Over);
							}
							
								
			//отслеживаем кнопку1 
			function menu1Out():void
			{
				trace("menu1 is OUT")
			}
			
			function menu1Over():void
			{
				menu1.alpha = 1;
				menu2.alpha = 0;
				menu3.alpha = 0;
				menu4.alpha = 0;
				menu5.alpha = 0;
				menu6.alpha = 0;
				//addEventListener(Event.ENTER_FRAME, onEnterFrame);
				//tweenCube(0,8);
				trace("menu1 is Over")
			}
			
			
			function menu1Click(event:MouseEvent):void
			{
			    addEventListener(Event.ENTER_FRAME, onEnterFrame);
				tweenCube(0,8);
				trace("menu1 is Click")
				
			}					
			//отслеживаем кнопку2					
			function menu2Out():void
			{
				trace("menu2 is OUT")
			}
			
			function menu2Over():void
			{
				
				menu1.alpha = 0;
				menu2.alpha = 1;
				menu3.alpha = 0;
				menu4.alpha = 0;
				menu5.alpha = 0;
				menu6.alpha = 0;
				//addEventListener(Event.ENTER_FRAME, onEnterFrame);
				//tweenCube(0, 16);
				trace("menu2 is Over")
			}
			
			
			function menu2Click(event:MouseEvent):void
			{
			    addEventListener(Event.ENTER_FRAME, onEnterFrame);
				tweenCube(0, 16);
				trace("menu2 is Click")
			}				   
				
			//отслеживаем кнопку3
			function menu3Out():void
			{
				trace("menu3 is OUT")
			}
			
			function menu3Over():void
			{
				menu1.alpha = 0;
				menu2.alpha = 0;
				menu3.alpha = 1;
				menu4.alpha = 0;
				menu5.alpha = 0;
				menu6.alpha = 0;
				//addEventListener(Event.ENTER_FRAME, onEnterFrame);
				//tweenCube(0,24);
				trace("menu3 is Over")
			}
			
			
			function menu3Click(event:MouseEvent):void
			{
			    addEventListener(Event.ENTER_FRAME, onEnterFrame);
				tweenCube(0,24);
				trace("menu3 is Click")
			}
			
			//отслеживаем кнопку4
			function menu4Out():void
			{
				trace("menu4 is OUT")
			}
			
			function menu4Over():void
			{
				menu1.alpha = 0;
				menu2.alpha = 0;
				menu3.alpha = 0;
				menu4.alpha = 1;
				menu5.alpha = 0;
				menu6.alpha = 0;
				//addEventListener(Event.ENTER_FRAME, onEnterFrame);
				//tweenCube(0,32);
				trace("menu4 is Over")
			}
			
			
			function menu4Click(event:MouseEvent):void
			{
				addEventListener(Event.ENTER_FRAME, onEnterFrame);
				tweenCube(0,32);
				trace("menu4 is Click")
			}
			
			//отслеживаем кнопку5
			function menu5Out():void
			{
				trace("menu5 is OUT")
			}
			
			function menu5Over():void
			{
				menu1.alpha = 0;
				menu2.alpha = 0;
				menu3.alpha = 0;
				menu4.alpha = 0;
				menu5.alpha = 1;
				menu6.alpha = 0;
				//addEventListener(Event.ENTER_FRAME, onEnterFrame);
				//tweenCube(0,40);
				trace("menu5 is Over")
			}
			
			
			function menu5Click(event:MouseEvent):void
			{
			    addEventListener(Event.ENTER_FRAME, onEnterFrame);
				tweenCube(0,40);
				trace("menu5 is Click")
			}
			//отслеживаем кнопку6
			function menu6Out():void
			{
				trace("menu6 is OUT")
			}
			
			function menu6Over():void
			{
				menu1.alpha = 0;
				menu2.alpha = 0;
				menu3.alpha = 0;
				menu4.alpha = 0;
				menu5.alpha = 0;
				menu6.alpha = 1;
				
				//addEventListener(Event.ENTER_FRAME, onEnterFrame);
				//tweenCube(0,48);
				trace("menu6 is Over")
			}
			
			
			function menu6Click(event:MouseEvent):void
			{
			    addEventListener(Event.ENTER_FRAME, onEnterFrame);
				tweenCube(0,48);
				trace("menu6 is Click")
			}
			
			
			addEventListenerMenuButton();
		}
	}
	
}