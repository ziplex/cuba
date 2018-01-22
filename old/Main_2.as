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
import flash.text.*;
import flash.events.*;
import flash.geom.Matrix;
import flash.filters.*;
import flash.display.StageScaleMode;
import flash.net.* 
import flash.display.Loader;
import flash.display.LoaderInfo;
import fl.controls.ProgressBar;
import silin.bitmap.DistortImage;
import RootClass;
	
	/**
	 * ...
	 * @author ziplex
	 */
	public class Main extends Sprite 
	{
		
		
		public function Main():void 
		{
		 	
			//координаты для куба
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
							   
			var  p:Array = []; //массив точек	   
			var con:int; // счетчик				   
							   
							
			var contur:Sprite = new Sprite(); // общий контур
			var tweenMenu:Array = [];
			var menu1:MovieClip = new MovieClip();
			var menu2:MovieClip = new MovieClip(); // элемент меню2   
			var menu3:MovieClip = new MovieClip();	   
			var menu4:MovieClip = new MovieClip();	   
			var menu5:MovieClip = new MovieClip();
			var menu6:MovieClip = new MovieClip(); // элемент меню6	   
			var cubic:MovieClip = new MovieClip(); // кубик	   
			var tweensCube:Array = []; // храним твины		
					
							//======конец описания переменных
							
							stage.scaleMode = StageScaleMode.SHOW_ALL;
							contur.graphics.beginFill(0xFFFFFF, 0.3);
							contur.graphics.lineStyle(0.5,0xFFFFFF);
							contur.graphics.drawRect(0, 0, 1024, 768);
							contur.graphics.endFill();
							addChild(contur);
							
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
							
							/*menu1.alpha = 0;
							menu2.alpha = 0;
							menu3.alpha = 0;
							menu4.alpha = 0;
							menu5.alpha = 0;
							menu6.alpha = 0;*/
							
							
							
							
							/*var ddd:MovieClip = new MovieClip();
							var b1:MovieClip = new MovieClip();
							var b2:MovieClip = new MovieClip();
							var b3:MovieClip = new MovieClip();
							var b4:MovieClip = new MovieClip();
							var b5:MovieClip = new MovieClip();
							var b6:MovieClip = new MovieClip();
							
							ddd.x = 300;
							ddd.y = 100;*/
							//DrawCubePoint(ddd, p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7], b1, b2, b3, b4, b5, b6);
							//addEventListener(Event.ENTER_FRAME, onEnterFrame);
							
							//var ct:int =0;
							//var cz:int;
							
							//ct = 40;
							//tweenCube(ct);
							//tweenCube(8,32)
							
							DrawCubePoint(cubic, p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7], menu1, menu2, menu3, menu4, menu5, menu6);
							
							
							function tweenCube (shft:int,shftR:int):void
							{
							  var time_tween:Number = 0.5;
								
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
							
							function removeOn(event:Event):void
							{
								removeEventListener(Event.ENTER_FRAME, onEnterFrame);
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
								
								
								
								// кнопка 2
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
								// кнопка 3
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
								// кнопка 4
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
								// кнопка 5
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
							
							
							
							
							/*var menu1:MovieClip = new MovieClip(); // элемент меню1	   
							var menu2:MovieClip = new MovieClip(); // элемент меню2   
							var menu3:MovieClip = new MovieClip();	   
							var menu4:MovieClip = new MovieClip();	   
							var menu5:MovieClip = new MovieClip();
							var menu6:MovieClip = new MovieClip(); // элемент меню6	   
							var cubic:MovieClip = new MovieClip(); // кубик	   
							cubic.x = 200;
							cubic.y = 300;*/
							
							//menu1.scaleX = 0.9;	menu1.scaleY = 0.9;
							//menu2.scaleX = 0.9;	menu2.scaleY = 0.9;
							//menu3.scaleX = 0.9;	menu3.scaleY = 0.9;
							
							//menu1.visible = false;
							//menu2.visible = false;
							//menu3.visible = false;
							
							/*menu4.scaleX = 0.8;	menu4.scaleY = 0.8;
							menu4.x += 5; menu4.y -= 5;
							menu5.scaleX = 0.8;	menu5.scaleY = 0.8;
							menu5.x += 3; menu5.y += 3;
							menu6.scaleX = 0.8;	menu6.scaleY = 0.8;
							menu6.x -= 5; menu6.y -= 5;*/
							
							/*menu1.alpha = 0;
							menu2.alpha = 0;
							menu3.alpha = 0;
							menu4.alpha = 0;
							menu5.alpha = 0;
							menu6.alpha = 0;*/
							
							/*renderCube(0);
							
							
								 
							function reRenderCube(shift:int):void
							{
								
								cubic.graphics.clear();
								menu1.graphics.clear();
								menu2.graphics.clear();
								menu3.graphics.clear();
								menu4.graphics.clear();
								menu5.graphics.clear();
								menu6.graphics.clear();
								renderCube(shift);
							}
							
							function renderCube(shift:int):void
							{
								DrawCube(cubic, xc[0+shift], yc[0+shift], xc[1+shift], yc[1+shift], xc[2+shift], yc[2+shift],
								 xc[3 + shift], yc[3 + shift], xc[4 + shift], yc[4 + shift], xc[5 + shift], yc[5 + shift], 
								 xc[6+shift], yc[6+shift], xc[7+shift], yc[7+shift], 
								 menu1,menu2,menu3,menu4,menu5,menu6
								 );	
							}
							
							function DrawCube(obj:MovieClip, cfx:Number, cfy:Number, x1:Number, y1:Number,
								  x2:Number,y2:Number,x3:Number,y3:Number,x4:Number,y4:Number,
								  x5:Number, y5:Number, x6:Number, y6:Number, cbx:Number, cby:Number,
								  btn1:MovieClip, btn2:MovieClip, btn3:MovieClip, btn4:MovieClip, btn5:MovieClip,
								  btn6:MovieClip
								 ):void			   
							{
								
								
								// кнопка 1
								btn1.graphics.beginFill(0xFF0000,0.5);
								btn1.graphics.lineStyle(0.5,0x000000);
								btn1.graphics.moveTo(cfx, -cfy);
								btn1.graphics.lineTo(cfx, -cfy);
								btn1.graphics.lineTo(x6, -y6);
								btn1.graphics.lineTo(x1, -y1);
								btn1.graphics.lineTo(x2, -y2);
								btn1.graphics.lineTo(cfx, -cfy);
								btn1.graphics.endFill();
								btn1.buttonMode = true; 
								
								// кнопка 2
								btn2.graphics.beginFill(0x808000,0.5);
								btn2.graphics.lineStyle(0.5,0x000000,100,false,"none","none","miter",3);
								btn2.graphics.moveTo(cfx, -cfy);
								btn2.graphics.lineTo(cfx, -cfy);
								btn2.graphics.lineTo(x2, -y2);
								btn2.graphics.lineTo(x3, -y3);
								btn2.graphics.lineTo(x4, -y4);
								btn2.graphics.lineTo(cfx, -cfy);
								btn2.graphics.endFill();
								btn2.buttonMode = true; 
								// кнопка 3
								btn3.graphics.beginFill(0xFACD1D,0.5);
								btn3.graphics.lineStyle(0.5,0x000000,100,false,"none","none","miter",3);
								btn3.graphics.moveTo(cfx, -cfy);
								btn3.graphics.lineTo(cfx, -cfy);
								btn3.graphics.lineTo(x4, -y4);
								btn3.graphics.lineTo(x5, -y5);
								btn3.graphics.lineTo(x6, -y6);
								btn3.graphics.lineTo(cfx, -cfy);
								btn3.graphics.endFill();
								btn3.buttonMode = true; 
								// кнопка 4
								btn4.graphics.beginFill(0xD61AFD,0.5);
								btn4.graphics.lineStyle(0.5,0x000000,100,false,"none","none","miter",3);
								btn4.graphics.moveTo(cbx, -cby);
								btn4.graphics.lineTo(cbx, -cby);
								btn4.graphics.lineTo(x1, -y1);
								btn4.graphics.lineTo(x2, -y2);
								btn4.graphics.lineTo(x3, -y3);
								btn4.graphics.lineTo(cbx, -cby);
								btn4.graphics.endFill();
     							btn4.buttonMode = true; 
								// кнопка 5
								btn5.graphics.beginFill(0x445520,0.5);
								btn5.graphics.lineStyle(0.5,0x000000,100,false,"none","none","miter",3);
								btn5.graphics.moveTo(cbx, -cby);
								btn5.graphics.lineTo(cbx, -cby);
								btn5.graphics.lineTo(x3, -y3);
								btn5.graphics.lineTo(x4, -y4);
								btn5.graphics.lineTo(x5, -y5);
								btn5.graphics.lineTo(cbx, -cby);
								btn5.graphics.endFill();
								btn5.buttonMode = true; 
								// кнопка 6
								btn6.graphics.beginFill(0xFF0080,0.5);
								btn6.graphics.lineStyle(0.5,0x000000,100,false,"none","none","miter",3);
								btn6.graphics.moveTo(cbx, -cby);
								btn6.graphics.lineTo(cbx, -cby);
								btn6.graphics.lineTo(x5, -y5);
								btn6.graphics.lineTo(x6, -y6);
								btn6.graphics.lineTo(x1, -y1);
								btn6.graphics.lineTo(cbx, -cby);
								btn6.graphics.endFill();
								btn6.buttonMode = true; 
								
								// весь объект
								obj.graphics.lineStyle(0.5,0x777777,100,false,"none","none","miter",3);
								obj.graphics.moveTo(x1,-y1);
     							obj.graphics.lineTo(cbx,-cby);
								obj.graphics.moveTo(x3,-y3);
								obj.graphics.lineTo(cbx,-cby);
								obj.graphics.moveTo(x5,-y5);
								obj.graphics.lineTo(cbx,-cby);
     
								obj.graphics.lineStyle(4,0x333333,100,false,"none","none","miter",3);
								obj.graphics.moveTo(x1,-y1);
								obj.graphics.lineTo(x2,-y2);
								obj.graphics.lineTo(x3,-y3);
								obj.graphics.lineTo(x4,-y4);
								obj.graphics.lineTo(x5,-y5);
								obj.graphics.lineTo(x6,-y6);
								obj.graphics.lineTo(x1,-y1);
     
								obj.graphics.lineStyle(1,0x000000,100,false,"none","none","miter",3);
								obj.graphics.moveTo(x2,-y2);
								obj.graphics.lineTo(cfx,-cfy);
								obj.graphics.moveTo(x4,-y4);
								obj.graphics.lineTo(cfx,-cfy);
								obj.graphics.moveTo(x6,-y6);
								obj.graphics.lineTo(cfx,-cfy);
								
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
								
								//var ddd:Tween = new Tween(btn1, "alpha", Regular.easeOut,1, 0, 1, true);
								
								
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
				reRenderCube(8);
				
				
				//var tweenmenu:Tween = new Tween(menu1, "alpha", Regular.easeOut,0, 1, 1, true);
				//tweenMenu.push(tweenmenu);
				trace("menu1 is Over")
			}
			
			
			function menu1Click(event:MouseEvent):void
			{
			    addEventListener(Event.ENTER_FRAME, onEnterFrame);
				
				
				tweenCube(0,8);
				trace("menu1 is Click")
				//ct = 8;
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
				reRenderCube(16);
				
				
				
				//var tweenmenu:Tween = new Tween(menu2, "alpha", Regular.easeOut,0, 1, 1, true);
				//tweenMenu.push(tweenmenu);
				trace("menu2 is Over")
			}
			
			
			function menu2Click(event:MouseEvent):void
			{
			    addEventListener(Event.ENTER_FRAME, onEnterFrame);
				
				tweenCube(0, 16);
				//ct = 16;
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
				reRenderCube(24);
				
				
				//var tweenmenu:Tween = new Tween(menu3, "alpha", Regular.easeOut,0, 1, 1, true);
				//tweenMenu.push(tweenmenu);
				trace("menu3 is Over")
			}
			
			
			function menu3Click(event:MouseEvent):void
			{
			    addEventListener(Event.ENTER_FRAME, onEnterFrame);
				
				tweenCube(0,24);
				//ct = 24;
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
				reRenderCube(32);
				
				
				
				//var tweenmenu:Tween = new Tween(menu4, "alpha", Regular.easeOut,0, 1, 1, true);
				//tweenMenu.push(tweenmenu);
				trace("menu4 is Over")
			}
			
			
			function menu4Click(event:MouseEvent):void
			{
				addEventListener(Event.ENTER_FRAME, onEnterFrame);
				
				tweenCube(0,32);
				//ct = 32;
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
				reRenderCube(40);
				
				
				//var tweenmenu:Tween = new Tween(menu5, "alpha", Regular.easeOut,0, 1, 1, true);
				//tweenMenu.push(tweenmenu);
				trace("menu5 is Over")
			}
			
			
			function menu5Click(event:MouseEvent):void
			{
			    addEventListener(Event.ENTER_FRAME, onEnterFrame);
				
				tweenCube(0,40);
				//ct = 40;
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
				reRenderCube(48);
				
				
				//var tweenmenu:Tween = new Tween(menu6, "alpha", Regular.easeOut,0, 1, 1, true);
				//tweenMenu.push(tweenmenu);
				trace("menu6 is Over")
			}
			
			
			function menu6Click(event:MouseEvent):void
			{
			    addEventListener(Event.ENTER_FRAME, onEnterFrame);
				
				tweenCube(0,48);
				//ct = 48;
				trace("menu6 is Click")
			}
			
			
			addEventListenerMenuButton();*/
			
			
			
			
			
			//==================================================
			var startButton:Sprite = new Sprite();
			var startButton2:Sprite = new Sprite();
			var startX:uint = 768 / 2-300;
			var startY:uint = 768 / 2;
			
			var designerContainer:MovieClip = new MovieClip();
			var withDesignerContainer:MovieClip = new MovieClip();
			var withCompanyContainer:MovieClip = new MovieClip();
			var ix:int = 1;
			var press:Boolean = false;
			
			
			

			function DrawStartButton(colour:uint,alpha:uint):void
			{
				/*var startText : TextField;
				startText = new TextField();

				startText.text = "PRESS ME";
				startText.setTextFormat(new TextFormat("Courier New", 10, 0x000000, false, false, false));
				startText.width = startText.textWidth;
				startText.x = startX-startButton.width/2;
				startButton.addChild(startText);
				startText.y = startY-startButton.height/2;*/
				
				startButton.graphics.beginFill(colour, alpha);
				startButton.graphics.lineStyle(1, 0x000000);
				startButton.graphics.drawRect(startX, startY, 50, 50);
				startButton.graphics.endFill();
				startButton.buttonMode = true;
				
				addChild(startButton);	
				
			}
			function DrawStartButton2(colour:uint,alpha:Number):void
			{
				
				
				startButton2.graphics.beginFill(colour, alpha);
				startButton2.graphics.lineStyle(1, 0x000000);
				startButton2.graphics.drawRect(startX+50, startY, 50, 50);
				startButton2.graphics.endFill();
				startButton2.buttonMode = true;
				
				addChild(startButton2);	
				
				
			}
			
			DrawStartButton(0xBB5E00, 1);
			DrawStartButton2(0xBB5E00, 1);
			addEventListenerStartButton();
			
			function addEventListenerStartButton():void
			{
				startButton.addEventListener(MouseEvent.CLICK, startPlay);
				startButton.addEventListener(MouseEvent.MOUSE_OUT, startOut);
				startButton.addEventListener(MouseEvent.MOUSE_OVER, startOver);
				startButton2.addEventListener(MouseEvent.CLICK, startPlay2);
				startButton2.addEventListener(MouseEvent.MOUSE_OUT, startOut2);
				startButton2.addEventListener(MouseEvent.MOUSE_OVER, startOver2);
			}
			
			function startOut():void
			{
				removeChild(startButton);
				DrawStartButton(0xBB5E00, 1);
			}
			
			function startOver():void
			{
				removeChild(startButton);
				DrawStartButton(0xFF0000, 1);
			}
			
			
			function startPlay(event:MouseEvent):void
			{
			    designerContainer.x = 0;
				startButton.removeEventListener(MouseEvent.CLICK,startPlay);
				DesignerDraw(designerContainer); 
				WithDesigner(withDesignerContainer);
				WithCompany(withCompanyContainer);
			}
			
			//*************
			function startOut2():void
			{
				removeChild(startButton2);
				DrawStartButton2(0xBB5E00, 1);
			}
			
			function startOver2():void
			{
				removeChild(startButton2);
				DrawStartButton2(0xFF0000, 1);
			}
			
			
			function startPlay2(event:MouseEvent):void
			{
			    
				if (!press){
				var tweenDesign:Tween = new Tween(designerContainer, "x", Regular.easeOut,1, 100, 1, true);
				
				//designerContainer.x += 10;
				trace("2222222222222222")
				tweenDesign = null;
				press = true;
				}
				else if (press)
				{
					var tweenDesign2:Tween = new Tween(designerContainer, "x", Regular.easeOut,100, 1, 1, true);
				
				//designerContainer.x += 10;
				trace("2222222222222222")
				tweenDesign2 = null;
				press = false;
					}
			}
				
			
		} // End Public function Main 
		
		
		public function DesignerDraw(container:MovieClip):void
		{
			//==Описание Переменных=======================================================================================
		
			var tweens:Array = []; //храним все твины
			var mySprite:Array = [];//храним спрайты

			//var container:MovieClip=new MovieClip(); // содержит все мувики
			var globalScene:MovieClip=new MovieClip(); //содержит все что на сцене

			var Mybackground:MovieClip = new MovieClip();//background
			var frame:MovieClip = new MovieClip();
			var widget : TextField; // прелоадер текст
			var i:int=0;//счетчик
			var xc:Number;
			var yc:Number;
			
		
			//координаты криволинейного объекта 
			//var xn:Array=[299,347.9,398.9,448.3,497.4,547.8,591.5,647,692.8,293.5,343.5,395.5,454.4,503.9,560.4,603.1,656.6,702.4,753,298,348,399.5,454.4,503.9,552.7,600.1,652.6,703.4,755.2,304,352.5,404.5,459.9,509.3,559.5,605.5,660,704.9,299,349,401,457.3,505,559.5,602.3,655.7,702.5];
			//var yn:Array=[102,92,99.3,89,110.1,110.6,96.3,100.8,109.9,162.8,153.8,159.1,149.9,166.3,168.4,151.1,155.6,163.7,170,226,214.5,218.7,210.1,223.8,225.5,212.1,214.6,223.2,227.5,288,277.1,278.7,274.3,279.1,285.6,273.7,276.3,283.9,350,340.2,342.3,333.7,339.5,343.5,332,336.6,344.2];

			var xn:Array=[282,341,403,463,522,583,636,703,758,819,
						  275,336,400,470,530,593,650,713,769,830,
						  281,341,404,470,530,589,646,710,763,823,
						  288,347,410,476,536,597,653,719,773,833,
						  282,342,405,473,531,597,649,713,770,830];
			
			var yn:Array = [68, 56, 65, 52, 78, 79, 61, 67, 78, 83,
						   142, 131, 137, 126, 146, 148, 127, 133, 143, 148,
						   218, 204, 209, 199, 215, 217, 201, 204, 215, 218,
						   293, 280, 282, 277, 282, 290, 276, 279, 288, 289,
						   368, 356, 359, 348, 355, 360, 346, 352, 361, 359];

			
			//координаты прямолинейного объекта
		
			var xm:Array = [299,361,423,485,547,609,671,733,795,299,361,423,485,547,609,671,733,795,857,299,361,423,485,547,609,671,733,795,857,299,361,423,485,547,609,671,733,795,299,361,423,485,547,609,671,733,795];
            var ym:Array = [102,102,102,102,102,102,102,102,102,164,164,164,164,164,164,164,164,164,164,226,226,226,226,226,226,226,226,226,226,288,288,288,288,288,288,288,288,288,350,350,350,350,350,350,350,350,350];

			
			//var xm:Array=new Array(167,217,267,317,367,417,467,517,167,217,267,317,367,417,467,517,567,617,167,217,267,317,367,417,467,517,567,617,167,217,267,317,367,417,467,517,567,167,217,267,317,367,417,467,517,167,217,267,317,367,417,467,517,567);
			//var ym:Array=new Array(29,29,29,29,29,29,29,29,79,79,79,79,79,79,79,79,79,79,129,129,129,129,129,129,129,129,129,129,179,179,179,179,179,179,179,179,179,229,229,229,229,229,229,229,229,279,279,279,279,279,279,279,279,279);

			var xOrig:Array=[];
			var yOrig:Array=[];
            var xn_:Array = [];// пересылочные координаты по X
			var yn_:Array = [];// пересылочные координаты по Y
			var clickON:Boolean=false;
			// массив прозрачностей
			var cubeAlpha:Array=[0.6, 0.2, 0.6, 0.2, 0.3, 0.5, 0.4, 0.2,0.5,
								 0.4, 0.1, 0.4, 0.1, 0.2, 0.6, 0.3, 0.1, 0.3,
								 0.3, 0.2, 0.5, 0.2, 0.3, 0.4, 0.2,0.7,0.3,
							 	 0.4, 0.1, 0.3, 0.1, 0.2, 0.5, 0.3, 0.7,0.6]; 
			
			
			var clicks:Array = [];
								 
			var Shadow:DropShadowFilter = new DropShadowFilter(); // фильтр для тени
			var blur:BlurFilter=new BlurFilter();// фильтр размытия

			var Mymatrix:Matrix;// матрица наложения битмапа
			var ArrBitmap:Array = [];//массив битмапов
			var BmpUrl:Array = [];//массив содержит URL больших картинок;
			var currentBmp:int; //при клике на изображение присваиваем номер.
			var thmb:Array=[]; //массив загрузок миниатюр
            var BmpLoader:RootClass;
			//============Переменные для работы с XML
			var my_x:Number;
			var my_y:Number;
			var my_thumb_width:Number;
			var my_thumb_height:Number;
			var my_images:XMLList;
			var my_total:Number;
			var myXMLLoader:URLLoader = new URLLoader();
			
			var _distortImage : DistortImage;//distorsion Image;
			var preloaders_mc:MovieClip;
			var _text:String;
			
			//Переменные для смещения координат от центра
			var xcentr:uint; //Центр X
			var ycentr:uint; //Центр Y
			var shiftX:Array = [];//смещение по X
			var shiftY:Array = [];//смещение по Y
			
			//массив для заливки цветом фигур
			var color_cube:Array = []; //
			var feel_color:uint = 0x00FF00; //цвет заливки
			var outMouse_color:uint = 0xFFFF0D; // цвет при наведении
			var onClick_color:uint = 0xFF0000; // цвет при нажатии
			var lineStyle:Number = 1; //толщина линии
			var lineColor:uint=0x000000; //цвет линии
			
			//==Конец Описания Переменных=======================================================================================
			
			
			
		 	//stage.scaleMode=StageScaleMode.SHOW_ALL;
			//blur.blurX=100;
			//blur.blurY=100;
			//Shadow.alpha=0.5;
			//Shadow.distance=10;
			//Shadow.angle=80; 
			
			
			
			//создаем фрейм для загрузки полноформатного изображения
			frame.graphics.beginFill(0x009966, 0.5);
			frame.graphics.lineStyle(0.5,0x000000);
			frame.graphics.drawRect(0, 0, 1024, 768);
			frame.graphics.endFill();
			
			//BmpLoader.width = frame.width;
			//BmpLoader.height = frame.height;
			
		    // создаем муви клипы
			for (i=0; i<37; i++) 
			{
				clicks[i] = -1;
				color_cube[i]=feel_color;
				mySprite[i]=new MovieClip();
				mySprite[i].value=i;
				mySprite[i].pressed=true;
			}
		 	//заполняем массив оригинальных координат
			for (i=0; i<xn.length; i++) 
			{
				xOrig[i]=xn[i];
				yOrig[i]=yn[i];
			}

			
			myXMLLoader.load(new URLRequest("gallery.xml"));
			myXMLLoader.addEventListener(Event.COMPLETE, processXML);
			

			function waitLoad(txt:String):void
			{
				//var circle_pb:preload_circle = new preload_circle;
				widget = new TextField();
				widget.text = "Loading please wait... "+txt+"%" ;
				widget.setTextFormat(new TextFormat("Courier New", 14, 0xB4DCF3, false, false, false));
				widget.width = widget.textWidth;
				widget.x = 295;
				widget.y = 201;
				//circle_pb.x = 275;
				//circle_pb.y = 201;
				widget.filters=[Shadow];
				addChild(Mybackground);
				addChild(widget);
				//addChild(circle_pb);
				
				
			}
			function processXML(e:Event):void 
			{
				
			

				var myXML:XML = new XML(e.target.data);

				my_x = myXML.@XPOSITION;
				my_y = myXML.@YPOSITION;
				my_thumb_width = myXML.@WIDTH;
				my_thumb_height = myXML.@HEIGHT;
				my_images = myXML.IMAGE;
				my_total = my_images.length();
				myXMLLoader.removeEventListener(Event.COMPLETE, processXML);
				myXMLLoader = null;
				////trace("XML is load",my_images);
				//CreateContainer();
				
				loadImage();
				
			}


//======================================================

			function loadImage():void
			{  
				waitLoad(_text);
				for(i= 0; i < my_total; i++)
				{
					BmpUrl[i] = my_images[i].@FULL;
					var thumb_url:String = my_images[i].@THUMB;
					thmb[i]= new Loader();
					thmb[i].load(new URLRequest(thumb_url));
					thmb[i].contentLoaderInfo.addEventListener(Event.COMPLETE, onImageLoad);
					
					
					
					/*var preloader_pb:ProgressBar = new ProgressBar();
					preloader_pb.source = thmb[i].contentLoaderInfo;
					
					if((i!=8)&&(i!=18)&&(i!=26)&&(i!=27)&&(i!=28)&&(i!=37))
					{
						preloader_pb.x = xn[i]+10;
						preloader_pb.y = ym[i]+10;
					}
					
					preloader_pb.width = 40;
					preloader_pb.height = 40;
					preloaders_mc.addChild(preloader_pb);
					preloader_pb.addEventListener(Event.COMPLETE, donePb);*/
	
				}
				
			}
			
			
			function donePb(e:Event):void 
			{
				var my_pb:ProgressBar = ProgressBar(e.target);
				preloaders_mc.removeChild(my_pb);
				my_pb.removeEventListener(Event.COMPLETE, donePb);
			}
			
			

			
				// вызываем когда все изображения загружены
			function onImageLoad(e:Event):void
			{
				
				
				for(i= 0; i < my_total; i++)
				{
					
					ArrBitmap[i] = new BitmapData(thmb[i].width,thmb[i].height);
					ArrBitmap[i].draw(thmb[i],new Matrix());
					Mymatrix=new Matrix();
					Mymatrix.scale(1.5, 1.5);
															
				}
					
				    
					
					if (widget.stage)
					{ 
						removeChild(widget); 
						addEventListeners();
						DriwingCurve();
					}
					
			}
			
			// функция создания контейнера			
			function CreateContainer():void 
			{   
				
				//Первый ряд
				linearsNull(mySprite[0],xn[0],yn[0],xn[1],yn[1],xn[9],yn[9],xn[10],yn[10]);
				linearsNull(mySprite[1],xn[1],yn[1],xn[2],yn[2],xn[10],yn[10],xn[11],yn[11]);
			 	linearsNull(mySprite[2],xn[2],yn[2],xn[3],yn[3],xn[11],yn[11],xn[12],yn[12]);
				linearsNull(mySprite[3],xn[3],yn[3],xn[4],yn[4],xn[12],yn[12],xn[13],yn[13]);
				linearsNull(mySprite[4],xn[4],yn[4],xn[5],yn[5],xn[13],yn[13],xn[14],yn[14]);
				linearsNull(mySprite[5],xn[5],yn[5],xn[6],yn[6],xn[14],yn[14],xn[15],yn[15]);
				linearsNull(mySprite[6],xn[6],yn[6],xn[7],yn[7],xn[15],yn[15],xn[16],yn[16]);
				linearsNull(mySprite[7],xn[7],yn[7],xn[8],yn[8],xn[16],yn[16],xn[17],yn[17]);
				//Второй ряд
				linearsNull(mySprite[8],xn[9],yn[9],xn[10],yn[10],xn[19],yn[19],xn[20],yn[20]);
				linearsNull(mySprite[9],xn[10],yn[10],xn[11],yn[11],xn[20],yn[20],xn[21],yn[21]);
				linearsNull(mySprite[10],xn[11],yn[11],xn[12],yn[12],xn[21],yn[21],xn[22],yn[22]);
				linearsNull(mySprite[11],xn[12],yn[12],xn[13],yn[13],xn[22],yn[22],xn[23],yn[23]);
				linearsNull(mySprite[12],xn[13],yn[13],xn[14],yn[14],xn[23],yn[23],xn[24],yn[24]);
				linearsNull(mySprite[13],xn[14],yn[14],xn[15],yn[15],xn[24],yn[24],xn[25],yn[25]);
				linearsNull(mySprite[14],xn[15],yn[15],xn[16],yn[16],xn[25],yn[25],xn[26],yn[26]);
				linearsNull(mySprite[15],xn[16],yn[16],xn[17],yn[17],xn[26],yn[26],xn[27],yn[27]);
				linearsNull(mySprite[16],xn[17],yn[17],xn[18],yn[18],xn[27],yn[27],xn[28],yn[28]);
				//Третий ряд
				linearsNull(mySprite[17],xn[19],yn[19],xn[20],yn[20],xn[29],yn[29],xn[30],yn[30]);
				linearsNull(mySprite[18],xn[20],yn[20],xn[21],yn[21],xn[30],yn[30],xn[31],yn[31]);
				linearsNull(mySprite[19],xn[21],yn[21],xn[22],yn[22],xn[31],yn[31],xn[32],yn[32]);
				linearsNull(mySprite[20],xn[22],yn[22],xn[23],yn[23],xn[32],yn[32],xn[33],yn[33]);
				linearsNull(mySprite[21],xn[23],yn[23],xn[24],yn[24],xn[33],yn[33],xn[34],yn[34]);
				linearsNull(mySprite[22],xn[24],yn[24],xn[25],yn[25],xn[34],yn[34],xn[35],yn[35]);
				linearsNull(mySprite[23],xn[25],yn[25],xn[26],yn[26],xn[35],yn[35],xn[36],yn[36]);
				//Четвертый ряд
				linearsNull(mySprite[24],xn[29],yn[29],xn[30],yn[30],xn[38],yn[38],xn[39],yn[39]);
				linearsNull(mySprite[25],xn[30],yn[30],xn[31],yn[31],xn[39],yn[39],xn[40],yn[40]);
				linearsNull(mySprite[26],xn[31],yn[31],xn[32],yn[32],xn[40],yn[40],xn[41],yn[41]);
				linearsNull(mySprite[27],xn[32],yn[32],xn[33],yn[33],xn[41],yn[41],xn[42],yn[42]);
				linearsNull(mySprite[28],xn[33],yn[33],xn[34],yn[34],xn[42],yn[42],xn[43],yn[43]);
				linearsNull(mySprite[29],xn[34],yn[34],xn[35],yn[35],xn[43],yn[43],xn[44],yn[44]);
				linearsNull(mySprite[30],xn[35],yn[35],xn[36],yn[36],xn[44],yn[44],xn[45],yn[45]);
				linearsNull(mySprite[31],xn[36],yn[36],xn[37],yn[37],xn[45],yn[45],xn[46],yn[46]);
				
				
			}
			  // рисуем основной объект
			function DriwingCurve():void 
			{   
				//Первый ряд
				linears(mySprite[0],xn[0],yn[0],xn[1],yn[1],xn[10],yn[10],xn[11],yn[11],ArrBitmap[0],Mymatrix,color_cube[0],cubeAlpha[0],lineStyle,lineColor);
				linears(mySprite[1],xn[1],yn[1],xn[2],yn[2],xn[11],yn[11],xn[12],yn[12],ArrBitmap[1],Mymatrix,color_cube[1],cubeAlpha[1],lineStyle,lineColor);
			 	linears(mySprite[2],xn[2],yn[2],xn[3],yn[3],xn[12],yn[12],xn[13],yn[13],ArrBitmap[2],Mymatrix,color_cube[2],cubeAlpha[2],lineStyle,lineColor);
				linears(mySprite[3],xn[3],yn[3],xn[4],yn[4],xn[13],yn[13],xn[14],yn[14],ArrBitmap[3],Mymatrix,color_cube[3],cubeAlpha[3],lineStyle,lineColor);
				linears(mySprite[4],xn[4],yn[4],xn[5],yn[5],xn[14],yn[14],xn[15],yn[15],ArrBitmap[4],Mymatrix,color_cube[4],cubeAlpha[4],lineStyle,lineColor);
				linears(mySprite[5],xn[5],yn[5],xn[6],yn[6],xn[15],yn[15],xn[16],yn[16],ArrBitmap[5],Mymatrix,color_cube[5],cubeAlpha[5],lineStyle,lineColor);
				linears(mySprite[6],xn[6],yn[6],xn[7],yn[7],xn[16],yn[16],xn[17],yn[17],ArrBitmap[6],Mymatrix,color_cube[6],cubeAlpha[6],lineStyle,lineColor);
				linears(mySprite[7],xn[7],yn[7],xn[8],yn[8],xn[17],yn[17],xn[18],yn[18],ArrBitmap[7],Mymatrix,color_cube[7],cubeAlpha[7],lineStyle,lineColor);
				//linears(mySprite[8],xn[8],yn[8],xn[9],yn[9],xn[18],yn[18],xn[19],yn[19],ArrBitmap[8],Mymatrix,color_cube[8],cubeAlpha[8],lineStyle,lineColor);
				//Второй ряд
				linears(mySprite[9],xn[10],yn[10],xn[11],yn[11],xn[20],yn[20],xn[21],yn[21],ArrBitmap[9],Mymatrix,color_cube[9],cubeAlpha[9],lineStyle,lineColor);
				linears(mySprite[10],xn[11],yn[11],xn[12],yn[12],xn[21],yn[21],xn[22],yn[22],ArrBitmap[10],Mymatrix,color_cube[10],cubeAlpha[10],lineStyle,lineColor);
				linears(mySprite[11],xn[12],yn[12],xn[13],yn[13],xn[22],yn[22],xn[23],yn[23],ArrBitmap[11],Mymatrix,color_cube[11],cubeAlpha[11],lineStyle,lineColor);
				linears(mySprite[12],xn[13],yn[13],xn[14],yn[14],xn[23],yn[23],xn[24],yn[24],ArrBitmap[12],Mymatrix,color_cube[12],cubeAlpha[12],lineStyle,lineColor);
				linears(mySprite[13],xn[14],yn[14],xn[15],yn[15],xn[24],yn[24],xn[25],yn[25],ArrBitmap[13],Mymatrix,color_cube[13],cubeAlpha[13],lineStyle,lineColor);
				linears(mySprite[14],xn[15],yn[15],xn[16],yn[16],xn[25],yn[25],xn[26],yn[26],ArrBitmap[14],Mymatrix,color_cube[14],cubeAlpha[14],lineStyle,lineColor);
				linears(mySprite[15],xn[16],yn[16],xn[17],yn[17],xn[26],yn[26],xn[27],yn[27],ArrBitmap[15],Mymatrix,color_cube[15],cubeAlpha[15],lineStyle,lineColor);
				linears(mySprite[16],xn[17],yn[17],xn[18],yn[18],xn[27],yn[27],xn[28],yn[28],ArrBitmap[16],Mymatrix,color_cube[16],cubeAlpha[16],lineStyle,lineColor);
				linears(mySprite[17],xn[18],yn[18],xn[19],yn[19],xn[28],yn[28],xn[29],yn[29],ArrBitmap[17],Mymatrix,color_cube[17],cubeAlpha[17],lineStyle,lineColor);
				
				//Третий ряд
				linears(mySprite[18],xn[20],yn[20],xn[21],yn[21],xn[30],yn[30],xn[31],yn[31],ArrBitmap[18],Mymatrix,color_cube[18],cubeAlpha[18],lineStyle,lineColor);
				linears(mySprite[19],xn[21],yn[21],xn[22],yn[22],xn[31],yn[31],xn[32],yn[32],ArrBitmap[19],Mymatrix,color_cube[19],cubeAlpha[19],lineStyle,lineColor);
				linears(mySprite[20],xn[22],yn[22],xn[23],yn[23],xn[32],yn[32],xn[33],yn[33],ArrBitmap[20],Mymatrix,color_cube[20],cubeAlpha[20],lineStyle,lineColor);
				linears(mySprite[21],xn[23],yn[23],xn[24],yn[24],xn[33],yn[33],xn[34],yn[34],ArrBitmap[21],Mymatrix,color_cube[21],cubeAlpha[21],lineStyle,lineColor);
				linears(mySprite[22],xn[24],yn[24],xn[25],yn[25],xn[34],yn[34],xn[35],yn[35],ArrBitmap[22],Mymatrix,color_cube[22],cubeAlpha[22],lineStyle,lineColor);
				linears(mySprite[23],xn[25],yn[25],xn[26],yn[26],xn[35],yn[35],xn[36],yn[36],ArrBitmap[23],Mymatrix,color_cube[23],cubeAlpha[23],lineStyle,lineColor);
				linears(mySprite[24],xn[26],yn[26],xn[27],yn[27],xn[36],yn[36],xn[37],yn[37],ArrBitmap[24],Mymatrix,color_cube[24],cubeAlpha[24],lineStyle,lineColor);
				//linears(mySprite[25],xn[27],yn[27],xn[28],yn[28],xn[37],yn[37],xn[38],yn[38],ArrBitmap[25],Mymatrix,color_cube[25],cubeAlpha[25],lineStyle,lineColor);
				//linears(mySprite[26],xn[28],yn[28],xn[29],yn[29],xn[38],yn[38],xn[39],yn[39],ArrBitmap[26],Mymatrix,color_cube[26],cubeAlpha[26],lineStyle,lineColor);
				//Четвертый ряд
				linears(mySprite[27],xn[30],yn[30],xn[31],yn[31],xn[40],yn[40],xn[41],yn[41],ArrBitmap[27],Mymatrix,color_cube[27],cubeAlpha[27],lineStyle,lineColor);
				linears(mySprite[28],xn[31],yn[31],xn[32],yn[32],xn[41],yn[41],xn[42],yn[42],ArrBitmap[28],Mymatrix,color_cube[28],cubeAlpha[28],lineStyle,lineColor);
				linears(mySprite[29],xn[32],yn[32],xn[33],yn[33],xn[42],yn[42],xn[43],yn[43],ArrBitmap[29],Mymatrix,color_cube[29],cubeAlpha[29],lineStyle,lineColor);
				linears(mySprite[30],xn[33],yn[33],xn[34],yn[34],xn[43],yn[43],xn[44],yn[44],ArrBitmap[30],Mymatrix,color_cube[30],cubeAlpha[30],lineStyle,lineColor);
				linears(mySprite[31],xn[34],yn[34],xn[35],yn[35],xn[44],yn[44],xn[45],yn[45],ArrBitmap[31],Mymatrix,color_cube[31],cubeAlpha[31],lineStyle,lineColor);
				linears(mySprite[32],xn[35],yn[35],xn[36],yn[36],xn[45],yn[45],xn[46],yn[46],ArrBitmap[32],Mymatrix,color_cube[32],cubeAlpha[32],lineStyle,lineColor);
				linears(mySprite[33],xn[36],yn[36],xn[37],yn[37],xn[46],yn[46],xn[47],yn[47],ArrBitmap[33],Mymatrix,color_cube[33],cubeAlpha[33],lineStyle,lineColor);
				linears(mySprite[34],xn[37],yn[37],xn[38],yn[38],xn[47],yn[47],xn[48],yn[48],ArrBitmap[34],Mymatrix,color_cube[34],cubeAlpha[34],lineStyle,lineColor);
				//linears(mySprite[35],xn[38],yn[38],xn[39],yn[39],xn[48],yn[48],xn[49],yn[49],ArrBitmap[35],Mymatrix,color_cube[35],cubeAlpha[35],lineStyle,lineColor);
				
				
			} // конец функции DriwingCurve
			
			
			
			// рисуем по точкам каждый объект
			function linears(obj:MovieClip,x1:Number,y1:Number,x2:Number,y2:Number,
							x3:Number, y3:Number, x4:Number, y4:Number, bmp:BitmapData,
							mtrx:Matrix, obj_color:uint,
							obj_alpha:Number,obj_lineStyle:Number,obj_lineColor:uint):void 
				{
				   	
			      
			
					//_distortImage = new DistortImage(bmp);
					//_distortImage.setTransform(x1, y1, x2, y2, x4, y4,x3,y3);
					//_distortImage.buttonMode = true;
					//addChild(_distortImage);
					
					/*var w:TextField = new TextField();
					w.text = String(x1) ;
					w.setTextFormat(new TextFormat("Courier New", 10, 0x000000, false, false, false));
					w.background = true;
					w.width = w.textWidth;
					w.height = w.textHeight;
					w.x = x1;
					w.y = y1;*/
					
					
					//заливаем битмапом
					
					obj.graphics.beginBitmapFill(bmp,mtrx);
					obj.graphics.lineStyle(obj_lineStyle,obj_lineColor);
					obj.graphics.moveTo(x1,y1);
					obj.graphics.lineTo(x1,y1);
					obj.graphics.lineTo(x2,y2);
					obj.graphics.lineTo(x4,y4);
					obj.graphics.lineTo(x3,y3);
					obj.graphics.lineTo(x1,y1);
					obj.graphics.endFill();
					obj.buttonMode=true;
					
			        
					//===========Затеняем
					obj.graphics.beginFill(obj_color,obj_alpha);
					obj.graphics.lineStyle(obj_lineStyle,obj_lineColor);
					obj.graphics.moveTo(x1,y1);
					//obj.graphics.moveTo(x4,y4);//пересечение
					obj.graphics.lineTo(x1,y1);
					obj.graphics.lineTo(x2,y2);
					//obj.graphics.lineTo(x3,y3);//пересечение
					obj.graphics.lineTo(x4,y4);
					obj.graphics.lineTo(x3,y3);
					obj.graphics.lineTo(x1,y1);
					obj.graphics.endFill();
					obj.buttonMode=true;
	                obj.cacheAsBitmap;
					
					
					//Mybackground.graphics.beginFill(0x3399CC, 1);
					//Mybackground.graphics.drawRect(0, 0, 768, 768);
					//Mybackground.graphics.endFill();
					//globalScene.addChild(Mybackground);
					//container.filters = [Shadow];
					//container.x=-100;
					//container.y=-10;
					//container.scaleX=1;
					//container.scaleY=1;
					//container.addChild(_distortImage);
					//container.addChild(_distortImage);
					
					//if (!_distortImage.stage)
					//{
					// container.addChild(_distortImage);
					//}
					
				/*	if (!w.stage)
					{
						
						container.addChild(w);
						
					}*/
					
					
					if (!obj.stage)
					{
						
						container.addChild(obj);
						//trace("проверка Obj",obj.name);
					}
					if (!container.stage)
					{
						//trace("проверка Container");
						globalScene.addChild(container);
					}
					if (!globalScene.stage)
					{
						//trace("проверка Global");
						addChild(globalScene);
					}
						
					if (clickON)
					{
					    
						//addFrame();
					}
					
				}
			
				function linearsNull(obj:MovieClip,x1:Number,y1:Number,x2:Number,y2:Number,
							x3:Number, y3:Number, x4:Number, y4:Number):void 
				{
					
			
			         //===========Затеняем
					obj.graphics.beginFill(0x89b462,0.2);
					obj.graphics.lineStyle(2,0xFFFFFF);
					obj.graphics.moveTo(x1,y1);
					obj.graphics.lineTo(x1,y1);
					obj.graphics.lineTo(x2,y2);
					obj.graphics.lineTo(x4,y4);
					obj.graphics.lineTo(x3,y3);
					obj.graphics.lineTo(x1,y1);
					obj.graphics.endFill();
					
	                										
					container.addChild(obj);
					globalScene.addChild(container);
					if (!globalScene.stage)
					{
						
						addChild(globalScene);
					}
					preloaders_mc = new MovieClip();
					preloaders_mc.x = obj.x;
					preloaders_mc.y = obj.y;
					addChild(preloaders_mc);
	
					
				}
			
				function addFrame():void
				{
					
					removeEventListeners();
					container.filters=null;
					xc=globalScene.x-mouseX*24-mouseX/300+container.width/2;
					yc=globalScene.y-mouseY*24-mouseY/300+container.height/2;
			
					/*var tweenX:Tween = new Tween(globalScene, "scaleX", Regular.easeOut,1, 25, 1, true);
	
					var tweenY :Tween = new Tween(globalScene, "scaleY", Regular.easeOut, 1, 25, 1, true);

					var tweenXc:Tween = new Tween(globalScene, "x", Regular.easeOut, 1, xc, 1, true);
					
					var tweenYc :Tween = new Tween(globalScene, "y", Regular.easeOut, 1, yc, 1, true);
	
					var tweenA :Tween = new Tween(container, "alpha", Regular.easeOut, 1, 0.1, 1, true);
					
		  			//Добавляем твины в массив
					tweens.push(tweenXc);
					tweens.push(tweenYc);
					tweens.push(tweenX);
					tweens.push(tweenY);
					tweens.push(tweenA);
					tweenXc.addEventListener(TweenEvent.MOTION_FINISH, scaleUpFinished);*/
					//trace("FRAME_X_Y= ",frame.x,frame.y)					
					frame.buttonMode=true;
					frame.addChild(BmpLoader);
					addChild(frame);
					//Добавляем обработчики mouse click  
					frame.addEventListener(MouseEvent.CLICK, mouseClickFrame); 
					
				}
	
	
				function scaleUpFinished(e:Event):void 
				{
					//trace("FRAME_X_Y= ",frame.x,frame.y)					
					frame.buttonMode=true;
					frame.addChild(BmpLoader);
					addChild(frame);
										
					//Добавляем обработчики mouse click  
					frame.addEventListener(MouseEvent.CLICK, mouseClickFrame); 
				}
	
				function mouseClickFrame(e:MouseEvent):void 
				{
					
					//trace("Bmpurl= ",BmpUrl[currentBmp]);
					removeChild(frame);
					frame.removeChild(BmpLoader);
					container.filters =null;
					var tweenX:Tween = new Tween(globalScene, "scaleX", Regular.easeOut,25, 1, 1, true);
					var tweenY :Tween = new Tween(globalScene, "scaleY", Regular.easeOut, 25, 1, 1, true);
					var tweenXc:Tween = new Tween(globalScene, "x", Regular.easeOut, xc, 0, 1, true);
					var tweenYc :Tween = new Tween(globalScene, "y", Regular.easeOut, yc, 0, 1, true);
					var tweenA :Tween = new Tween(container, "alpha", Regular.easeOut, 0.1, 1, 1, true);

					//Добавляем твины в массив
					tweens.push(tweenXc);
					tweens.push(tweenYc);
					tweens.push(tweenX);
					tweens.push(tweenY);
					tweens.push(tweenA);
					tweenXc.addEventListener(TweenEvent.MOTION_FINISH, scaleDownFinished);
				}
				function scaleDownFinished(e:Event):void 
				{
					addEventListeners();
					clickON=false;
					Redriwing();
				}
				
				// возвращаем оригинальные координаты
				function getOrigCoord():void 
				{
					for (var i:int=0; i<xn.length; i++) 
					{
						xn[i]=xOrig[i];
						yn[i]=yOrig[i];
					}
				}
			
				 // очищаем экран
				function ClearingAll():void 
				{
					for (i = 0; i < 37; i++) 
					{
						mySprite[i].graphics.clear();
						
					}
				}

					//добавляем обработчики событий, для каждого объекта
				function addEventListeners():void 
				{
					for(i=0;i<37;i++)
					{  
					//Добавляем обработчики mouse over  для каждой кнопки
					mySprite[i].addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
					//Добавляем обработчики mouse out  для каждой кнопки
					mySprite[i].addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
					//Добавляем обработчики mouse click   для каждой кнопки
					mySprite[i].addEventListener(MouseEvent.CLICK, mouseClickHandler); 
					}
				}

					//удаляем обработчики событий у каждого объекта
				function removeEventListeners():void 
				{
					for(i=0;i<37;i++)
					{ 
					//Добавляем обработчики mouse over   для каждой кнопки
					mySprite[i].removeEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
					//Добавляем обработчики mouse out  для каждой кнопки
					mySprite[i].removeEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
					//Добавляем обработчики mouse click   для каждой кнопки
					mySprite[i].removeEventListener(MouseEvent.CLICK, mouseClickHandler); 
					}
				}
				
				// функция смены координат
				
				function changeCoord(a:int,b:int,c:int,d:int,ncube:int):void
				{
					
					//находим центры	
					 xcentr = (xn[a] + xn[b] + xn[c] + xn[d]) / 4;
					 ycentr = (yn[a] + yn[b] + yn[c] + yn[d]) / 4;
					
					var shiftX_old:Array = [];
					var shiftY_old:Array = [];
					
					const delta1:Number = 0.66; 
					const delta2:Number = 0.25;
					var width_cub:uint = 75; 
					var A:int = 0;
					var B:int = 0;
					var C:int = 0;
					var D:int = 0;
					var shf:int = 1;
					
					
					shiftX_old[1] = xn[a];
					shiftX_old[2] = xn[b];
					shiftX_old[3] = xn[c];
					shiftX_old[4] = xn[d];
					
					shiftY_old[1] = yn[a];
					shiftY_old[2] = yn[b];
					shiftY_old[3] = yn[c];
					shiftY_old[4] = yn[d];
					
					
					
									
					//рисуем квадрат от центра				
					xn[a] = xcentr - width_cub/2; yn[a] = ycentr - width_cub/2;
					xn[b] = xcentr + width_cub/2; yn[b] = ycentr - width_cub/2;
					xn[c] = xcentr - width_cub/2; yn[c] = ycentr + width_cub/2;
					xn[d] = xcentr + width_cub/2; yn[d] = ycentr + width_cub/2;
					
					// смещение по X
					shiftX[1] = shiftX_old[1] - xn[a];
					shiftX[2] = shiftX_old[2] - xn[b];
					shiftX[3] = shiftX_old[3] - xn[c];
					shiftX[4] = shiftX_old[4] - xn[d];
					// смещение по Y
					shiftY[1] = shiftY_old[1] - yn[a];
					shiftY[2] = shiftY_old[2] - yn[b];
					shiftY[3] = shiftY_old[3] - yn[c];
					shiftY[4] = shiftY_old[4] - yn[d];
					
					
					
					//trace("xcentr= ",xcentr)
					//trace("mousex= ",mouseX)
					
					
					
					
					
					//============================GLOBAL BRAIN FUCKING ===================================
					
					//проверка по квадратам
					
					/*for (var count:int = 0; count <= 37; count++ )
					{
						if (clicks[count] == 1)
						{
							trace("click", count, "= 1");
						}
					}*/
					
					
					for (var cont:int = 0; cont <= 35; cont++ )
						{
							if ((clicks[cont] >= 0)&&(ncube+shf==clicks[cont]))
							{
								  trace(" справа нажат квадрат ", clicks[cont]);	
								shf++;
								
								/*A = clicks[cont] ;
								B = clicks[cont] +1;
								C = clicks[cont]+10;
								D = clicks[cont] + 11;*/
								//changeCoord(A, B, C, D);
							}
							
						}
					
					// проверка сверху
					if (((a>=0)&&(a<=9)))
					{
						//trace("сверху ничего нет");
					}
					else if ((a>=10)&&(a<=19))
					{
					   
						xn[a-10]-=shiftX[1]*delta1;
						yn[a-10]-=shiftY[1]*delta1;   
						xn[b-10]-=shiftX[2]*delta1;
						yn[b-10]-=shiftY[2]*delta1;
						
						
						//trace("Сверху один квадрат");	
					}
					
					else if ((a>=20)&&(a<=39))
					{
						xn[a-10]-=shiftX[1]*delta1;
						yn[a-10]-=shiftY[1]*delta1;   
						
						xn[b-10]-=shiftX[2]*delta1;
						yn[b-10]-=shiftY[2]*delta1;
						
						xn[a-20]-=shiftX[1]*delta2;
						yn[a-20]-=shiftY[1]*delta2;   
						
						xn[b-20]-=shiftX[2]*delta2;
						yn[b-20]-=shiftY[2]*delta2;
						//trace("сверху два квадрата")
					}
										
					// проверка справа
					if ((b==9)||(b==19)||(b==29)||(b==39))
					{
						//trace("справа ничего нет");
					}
					else if ((b==8)||(b==18)||(b==28)||(b==38))
					{
					    
						xn[b+1]-=shiftX[2]*delta1;
						yn[b+1]-=shiftY[2]*delta1;   
						xn[d+1]-=shiftX[4]*delta1;
						yn[d+1]-=shiftY[4]*delta1;
						//trace("справа один квадрат");	
					}
					else if ((((b>=0)&&(b<=7))) || (((b>=10)&&(b<=17))) || (((b>=20)&&(b<=27))) || (((b>=30)&&(b<=37))))
					{
						xn[b+1]-=shiftX[2]*delta1;
						yn[b+1]-=shiftY[2]*delta1;   
						xn[d+1]-=shiftX[4]*delta1;
						yn[d+1]-=shiftY[4]*delta1;
						
						xn[b+2]-=shiftX[2]*delta2;
						yn[b+2]-=shiftY[2]*delta2;   
						xn[d+2]-=shiftX[4]*delta2;
						yn[d+2]-=shiftY[4]*delta2;
						//trace("справа два квадрата")
					}
					
					
					// проверка слева
					if ((c==10)||(c==20)||(c==30)||(c==40))
					{
						//trace("слева ничего нет");
					}
					else if ((c==11)||(c==21)||(c==31)||(c==41))
					{
						xn[a-1]-=shiftX[1]*delta1;
						yn[a-1]-=shiftY[3]*delta1;   
						xn[c-1]-=shiftX[1]*delta1;
						yn[c-1]-=shiftY[3]*delta1;
						
						
						//trace("слева один квадрат");	
					}
					else if ((((c>=12)&&(c<=19))) || (((c>=22)&&(c<=29))) || (((c>=32)&&(c<=39))) || (((c>=42)&&(c<=49))))
					{
						xn[a-1]-=shiftX[1]*delta1;
						yn[a-1]-=shiftY[3]*delta1;   
						xn[c-1]-=shiftX[1]*delta1;
						yn[c-1]-=shiftY[3]*delta1;
						
						xn[a-2]-=shiftX[1]*delta2;
						yn[a-2]-=shiftY[3]*delta2;   
						xn[c-2]-=shiftX[1]*delta2;
						yn[c-2]-=shiftY[3]*delta2;
						

						//trace("слева два квадрата")
					}
					
					// проверка снизу
					if (((d>=41)&&(d<=49)))
					{
						//trace("снизу ничего нет");
					}
					else if ((d>=31)&&(d<=39))
					{
					    xn[c+10]-=shiftX[3]*delta1;
						yn[c+10]+=shiftY[4]*delta1;   
						xn[d+10]+=shiftX[3]*delta1;
						yn[d+10]-=shiftY[4]*delta1;
						
						//trace("снизу один квадрат");	
					}
					
					else if ((d>=11)&&(d<=29))
					{
						xn[c+10]-=shiftX[3]*delta1;
						yn[c+10]+=shiftY[4]*delta1;   
						xn[d+10]+=shiftX[3]*delta1;
						yn[d+10]-=shiftY[4]*delta1;
						
						xn[c+20]-=shiftX[3]*delta2;
						yn[c+20]+=shiftY[4]*delta2;   
						xn[d+20]+=shiftX[3]*delta2;
						yn[d+20]-=shiftY[4]*delta2;
						//trace("снизу два квадрата")
					}
					
					// проверка  диагоналей ==============================
					
					// проверка левой верхней диагонали
					
					
					if (!(((a>=0)&&(a<=9))||(a==10)||(a==20)||(a==30)))
					{
						
						xn[a-11]-=shiftX[1]*delta2;
						yn[a - 11] -= shiftY[1]*delta2;
						//trace("слева сверху по диагонали что-то видно");
					}
					else 
					{
					  // trace("по диагонали нет ничего");	
					}
					
					
					// проверка правой верхней диагонали
					
					if (!(((b==9)||(b==19)||(b==29)||(b==39))||(((a>=0)&&(a<=9)))))
					{
						
							xn[b-9]-=shiftX[2]*delta2;
						    yn[b-9]-=shiftY[2]*delta2;
												
						//trace("справа сверху по диагонали что-то видно");
					}
					else 
					{
					   //trace("справа сверху по диагонали нет ничего");	
					}
					
					// проверка правой нижней диагонали
					if (!((((d>=40)&&(d<=49))||(b==9)||(b==19)||(b==29)||(b==39))))
					{
							xn[d+11]-=shiftX[4]*delta2;
						    yn[d+11]-=shiftY[4]*delta2;
						
						//trace("справа снизу что-то есть");
					}
					else 
					{
					   //trace("справа снизу по диагонали нет ничего");	
					}
					// проверка левой нижней диагонали
					
					if (!(((c==10)||(c==20)||(c==30)||(c==40))||(((d>=40)&&(d<=49)))))
					{
							xn[c+9]-=shiftX[3]*delta2;
						    yn[c+9]-=shiftY[3]*delta2;
						//trace("слева снизу по диагонали что-то  есть");
					}
					else 
					{
					   //trace("слева снизу по диагонали нет ничего");	
					}
				     
					 for (var _count:int = 0; _count <= xn.length;_count++ )
					 {
						xn_[_count] = xn[_count];
						yn_[_count] = yn[_count];
					 }
					 
					
					 
					
				}// end function  ChangeCoord
				
				
				
				/*function DirectionCub(direct:String,ncube:int):void
				{
					trace("Да я работаю");
					var aUp:int=ncube-9;
					var bUp:int=ncube-8;
					var cUp:int=ncube+1;
					var dUp:int=ncube+2;
					
					var aDown:int=ncube+11;
					var bDown:int=ncube+12;
					var cDown:int=ncube+21;
					var dDown:int=ncube+22;
					
					var aLeft:int=ncube;
					var bLeft:int=ncube+1;
					var cLeft:int=ncube+10;
					var dLeft:int=ncube+11;
					
					var aRight:int=ncube+2;
					var bRight:int=ncube+3;
					var cRight:int=ncube+12;
					var dRight:int=ncube+13;
					if (direct=="up")
					{
						changeCoord(aUp, bUp, cUp, dUp);
					}
					else if (direct=="down")

					{
						changeCoord(aDown, bDown, cDown, dDown);
					}
					else if (direct=="left")

					{
						changeCoord(aLeft, bLeft, cLeft, dLeft);
					}
					else if (direct=="right")

					{
						changeCoord(aRight, bRight, cRight, dRight);
					}
																
				}*/
				
				// функция смены оригинальных координат
				function changeOrigCoord(a:int,b:int,c:int,d:int):void
				{
					/*xOrig[a]=xm[a];yOrig[a]=ym[a];
					xOrig[b]=xm[b];yOrig[b]=ym[b];
					xOrig[c]=xm[c];yOrig[c]=ym[c];
					xOrig[d]=xm[d];yOrig[d]=ym[d];*/
					for (var _count:int = 0; _count < xn.length;_count++ )
					{
						xOrig[_count] = xn_[_count];
						yOrig[_count] = yn_[_count];
					}
				}
				
				// это вызывается когда мышь наведена
				function mouseOverHandler(e:MouseEvent):void 
				{
					//Получаем кнопку из события
					var button:MovieClip = e.target as MovieClip;
					//trace(color_cube[button.value]);
					button.alpha=0.7;
					//trace("clicks= ", clicks[button.value]);
					
					
					if ((button==mySprite[0])&&(mySprite[0].pressed))
					{
						color_cube[0]=outMouse_color;
						//trace(button.value);
						//trace(button.pressed);
						getOrigCoord();
												
						changeCoord(0,1,10,11,0);
						Redriwing();
					} 
					else if ((button == mySprite[1])&&(mySprite[1].pressed))
					{
						//trace(button.value);
						//trace(button.pressed);
						getOrigCoord();
						color_cube[1]=outMouse_color;
						
						
						changeCoord(1,2,11,12,1);
						Redriwing();
					} 
					else if ((button == mySprite[2])&&(mySprite[2].pressed)) 
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[2]=outMouse_color;
						changeCoord(2,3,12,13,2);
						Redriwing();
					} 
					else if ((button == mySprite[3])&&(mySprite[3].pressed)) 
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[3]=outMouse_color;
						changeCoord(3,4,13,14,3);
						Redriwing();
					} 
					else if ((button == mySprite[4])&&(mySprite[4].pressed)) 
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[4]=outMouse_color;
						changeCoord(4,5,14,15,4);
						Redriwing();
					}			 
					else if ((button == mySprite[5]) &&(mySprite[5].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[5]=outMouse_color;
						changeCoord(5,6,15,16,5);
						Redriwing();
					} 
					else if ((button == mySprite[6]) &&(mySprite[6].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[6]=outMouse_color;
						changeCoord(6,7,16,17,6);
						Redriwing();
					}
					else if ((button == mySprite[7]) &&(mySprite[7].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[7]=outMouse_color;
						changeCoord(7,8,17,18,7);
						Redriwing();
					} 
					else if ((button == mySprite[8]) &&(mySprite[8].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[8]=outMouse_color;
						changeCoord(8,9,18,19,8);
						Redriwing();
					} 
					else if ((button == mySprite[9]) &&(mySprite[9].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[9]=outMouse_color;
						changeCoord(10,11,20,21,9);
						Redriwing();
					} 
					else if ((button == mySprite[10]) &&(mySprite[10].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[10]=outMouse_color;
						changeCoord(11,12,21,22,10);
						Redriwing();
					}
					else if ((button == mySprite[11]) &&(mySprite[11].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[11]=outMouse_color;
						changeCoord(12,13,22,23,11);
						Redriwing();
					}
					else if ((button == mySprite[12]) &&(mySprite[12].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[12]=outMouse_color;
						changeCoord(13,14,23,24,12);
						Redriwing();
					}
					else if ((button == mySprite[13]) &&(mySprite[13].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[13]=outMouse_color;
						changeCoord(14,15,24,25,13);
						Redriwing();
					}
					else if ((button == mySprite[14]) &&(mySprite[14].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[14]=outMouse_color;
						changeCoord(15,16,25,26,14);
						Redriwing();
					}
					else if ((button == mySprite[15]) &&(mySprite[15].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[15]=outMouse_color;
						changeCoord(16,17,26,27,15);
						Redriwing();
					}
					else if ((button == mySprite[16]) &&(mySprite[16].pressed))
					{	
						//trace(button.value);
						getOrigCoord();
						color_cube[16]=outMouse_color;
						changeCoord(17,18,27,28,16);
						Redriwing();
					}
					else if ((button == mySprite[17]) &&(mySprite[17].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[17]=outMouse_color;
						changeCoord(18,19,28,29,17);
						Redriwing();
					}
					else if ((button == mySprite[18]) &&(mySprite[18].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[18]=outMouse_color;
						changeCoord(20,21,30,31,18);
						Redriwing();
					}
					else if ((button == mySprite[19]) &&(mySprite[19].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[19]=outMouse_color;
						changeCoord(21,22,31,32,19);
						Redriwing();
					}
					else if ((button == mySprite[20]) &&(mySprite[20].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[20]=outMouse_color;
						changeCoord(22,23,32,33,20);
						Redriwing();
					}
					else if ((button == mySprite[21]) &&(mySprite[21].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[21]=outMouse_color;
						changeCoord(23,24,33,34,21);
						Redriwing();
					}
					else if ((button == mySprite[22]) &&(mySprite[22].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[22]=outMouse_color;
						changeCoord(24,25,34,35,22);
						Redriwing();
					}
					else if ((button == mySprite[23]) &&(mySprite[23].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[23]=outMouse_color;
						changeCoord(25,26,35,36,23);
						Redriwing();
					}
					else if ((button == mySprite[24]) &&(mySprite[24].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[24]=outMouse_color;
						changeCoord(26,27,36,37,24);
						Redriwing();
					}
					else if ((button == mySprite[25]) &&(mySprite[25].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[25]=outMouse_color;
						changeCoord(27,28,37,38,25);
						Redriwing();
					}
	
					else if ((button == mySprite[26]) &&(mySprite[26].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[26]=outMouse_color;
						changeCoord(28,29,38,39,26);
						Redriwing();
					}
					else if ((button == mySprite[27])&&(mySprite[27].pressed)) 
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[27]=outMouse_color;
						changeCoord(30,31,40,41,27);
						Redriwing();
					}
					else if ((button == mySprite[28]) &&(mySprite[28].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[28]=outMouse_color;
						changeCoord(31,32,41,42,28);
						Redriwing();
					}
					else if ((button == mySprite[29]) &&(mySprite[29].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[29]=outMouse_color;
						changeCoord(32,33,42,43,29);
						Redriwing();
					}
					else if ((button == mySprite[30]) &&(mySprite[30].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[30]=outMouse_color;
						changeCoord(33,34,43,44,30);
						Redriwing();
					}
					else if ((button == mySprite[31]) &&(mySprite[31].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[31]=outMouse_color;
						changeCoord(34,35,44,45,31);
						Redriwing();
					}
					else if ((button == mySprite[32]) &&(mySprite[32].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[32]=outMouse_color;
						changeCoord(35,36,45,46,32);
						Redriwing();
					}
					else if ((button == mySprite[33]) &&(mySprite[33].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[33]=outMouse_color;
						changeCoord(36,37,46,47,33);
						Redriwing();
					}
					else if ((button == mySprite[34]) &&(mySprite[34].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[34]=outMouse_color;
						changeCoord(37,38,47,48,34);
						Redriwing();
					}
					else if ((button == mySprite[35]) &&(mySprite[35].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[35]=outMouse_color;
						changeCoord(38,39,48,49,35);
						Redriwing();
					}
		
				} // End Function MouseOverHandler

					//Это вызывается, когда мышь выходит за границы кнопки
					function mouseOutHandler(e:MouseEvent):void 
					{
												
						getOrigCoord();
						Redriwing();
						//Получаем кнопку из события
						var button:MovieClip = e.target as MovieClip;
						//100% прозрачность
						button.alpha = 1;
						if (button.pressed)
						{
							color_cube[button.value] = feel_color;	
						}
						
					}

					//Это вызывается, когда мышкой кликнули по кнопке
					function mouseClickHandler(e:MouseEvent):void 
					{
						
						clickON=true;
						//trace("Pressed");
						var button:MovieClip = e.target as MovieClip;
						button.pressed = false;
						BmpLoader = new RootClass;
						BmpLoader.loadadres(BmpUrl[button.value]); 
						color_cube[button.value] = onClick_color;
						clicks[button.value] = button.value;
						changeOrigCoord(0, 0, 0, 0);
						Redriwing();
						
						/*if (button==mySprite[0])
						{
							
							color_cube[0] = onClick_color;
							changeOrigCoord(0,1,9,10);
							Redriwing();
						} 
						else if (button == mySprite[1]) 
						{
							
							color_cube[1] = onClick_color;
							changeOrigCoord(1,2,10,11);
							Redriwing();
						} 
						else if (button == mySprite[2]) 
						{
							
							color_cube[2] = onClick_color;
							changeOrigCoord(2,3,11,12);
							Redriwing();
						} 
						else if (button == mySprite[3]) 
						{
							
							color_cube[3] = onClick_color;
							changeOrigCoord(3,4,12,13);
							Redriwing();
						} 
						else if (button == mySprite[4]) 
						{
							
							color_cube[4] = onClick_color;
							changeOrigCoord(4,5,13,14);
							Redriwing();
						} 
						else if (button == mySprite[5]) 
						{
							
							color_cube[5] = onClick_color;
							changeOrigCoord(5,6,14,15);
							Redriwing();
						} 
						else if (button == mySprite[6]) 
						{
							
							color_cube[6] = onClick_color;
							changeOrigCoord(6,7,15,16);
							Redriwing();
						}
						else if (button == mySprite[7]) 
						{
							
							color_cube[7] = onClick_color;
							changeOrigCoord(7,8,16,17);
							Redriwing();
						} 
						else if (button == mySprite[8]) 
						{
							
							color_cube[8] = onClick_color;
							changeOrigCoord(9,10,19,20);
							Redriwing();
						} 
						else if (button == mySprite[9]) 
						{
							
							color_cube[9] = onClick_color;
							changeOrigCoord(10,11,20,21);
							Redriwing();
						} 
						else if (button == mySprite[10]) 
						{
							
							color_cube[10] = onClick_color;
							changeOrigCoord(11,12,21,22);
							Redriwing();
						}
						else if (button == mySprite[11]) 
						{
							
							color_cube[11] = onClick_color;
							changeOrigCoord(12,13,22,23);
							Redriwing();
						}
						else if (button == mySprite[12]) 
						{
							
							color_cube[12] = onClick_color;
							changeOrigCoord(13,14,23,24);
							Redriwing();
						}
						else if (button == mySprite[13]) 
						{
							
							color_cube[13] = onClick_color;
							changeOrigCoord(14,15,24,25);
							Redriwing();
						}
						else if (button == mySprite[14]) 
						{
							
							color_cube[14] = onClick_color;
							changeOrigCoord(15,16,25,26);
							Redriwing();
						}
						else if (button == mySprite[15]) 
						{
							
							color_cube[15] = onClick_color;
							changeOrigCoord(16,17,26,27);
							Redriwing();
						}
						else if (button == mySprite[16]) 
						{
							
							color_cube[16] = onClick_color;
							changeOrigCoord(17,18,27,28);
							Redriwing();
						}
						else if (button == mySprite[17]) 
						{
							
							color_cube[17] = onClick_color;
							changeOrigCoord(19,20,29,30);
							Redriwing();
						}
						else if (button == mySprite[18]) 
						{
							
							color_cube[18] = onClick_color;
							changeOrigCoord(20,21,30,31);
							Redriwing();
						}
						else if (button == mySprite[19]) 
						{
							
							color_cube[19] = onClick_color;
							changeOrigCoord(21,22,31,32);
							Redriwing();
						}
						else if (button == mySprite[20]) 
						{
							
							color_cube[20] = onClick_color;
							changeOrigCoord(22,23,32,33);
							Redriwing();
						}
						else if (button == mySprite[21]) 
						{
							
							color_cube[21] = onClick_color;
							changeOrigCoord(23,24,33,34);
							Redriwing();
						}
						else if (button == mySprite[22]) 
						{
							
							color_cube[22] = onClick_color;
							changeOrigCoord(24,25,34,35);
							Redriwing();
						}
						else if (button == mySprite[23]) 
						{
							
							color_cube[23] = onClick_color;
							changeOrigCoord(25,26,35,36);
							Redriwing();
						}
						else if (button == mySprite[24]) 
						{
							
							color_cube[24] = onClick_color;
							changeOrigCoord(29,30,38,39);
							Redriwing();
						}
						else if (button == mySprite[25]) 
						{
							
							color_cube[25] = onClick_color;
							changeOrigCoord(30,31,39,40);
							Redriwing();
						}
	
						else if (button == mySprite[26]) 
						{
							
							color_cube[26] = onClick_color;
							changeOrigCoord(31,32,40,41);
							Redriwing();
						}
						else if (button == mySprite[27]) 
						{
							
							color_cube[27] = onClick_color;
							changeOrigCoord(32,33,41,42);
							Redriwing();
						}
						else if (button == mySprite[28]) 
						{
							
							color_cube[28] = onClick_color;
							changeOrigCoord(33,34,42,43);
							Redriwing();
						}
						else if (button == mySprite[29]) 
						{
							
							color_cube[29] = onClick_color;
							changeOrigCoord(34,35,43,44);
							Redriwing();
						}
						else if (button == mySprite[30]) 
						{
							
							color_cube[30] = onClick_color;
							changeOrigCoord(35,36,44,45);
							Redriwing();
						}
						else if (button == mySprite[31]) 
						{
							
							color_cube[31] = onClick_color;
							changeOrigCoord(36,37,45,46);
							Redriwing();
						}
						/*else if (button == mySprite[32]) 
						{
							changeOrigCoord(39,40,47,48);
							Redriwing();
						}
						else if (button == mySprite[33]) 
						{
							changeOrigCoord(40,41,48,49);
							Redriwing();
						}
						else if (button == mySprite[34]) 
						{
							changeOrigCoord(41,42,49,50);
							Redriwing();
						}
						else if (button == mySprite[35]) 
						{
							changeOrigCoord(42,43,50,51);
							Redriwing();
						}
						else if (button == mySprite[36]) 
						{
							changeOrigCoord(43,44,51,52);
							Redriwing();
						}*/
					} // End function mouseClickHandler

						//функция перерисовки
						function Redriwing():void
						{
							ClearingAll();
							DriwingCurve(); 
						}
				
									
			
			
			}//End public function DesignerDraw 
		
				
		
			// WithDesigner
			
			public function WithDesigner(container:MovieClip):void
		{
			//==Описание Переменных=======================================================================================
		
			var tweens:Array = []; //храним все твины
			var mySprite:Array = [];//храним спрайты

			//var container:MovieClip=new MovieClip(); // содержит все мувики
			var globalScene:MovieClip=new MovieClip(); //содержит все что на сцене

			var Mybackground:MovieClip = new MovieClip();//background
			var frame:MovieClip = new MovieClip();
			var widget : TextField; // прелоадер текст
			var i:int=0;//счетчик
			var xc:Number;
			var yc:Number;
			
		
			//координаты криволинейного объекта 
			//var xn:Array=[299,347.9,398.9,448.3,497.4,547.8,591.5,647,692.8,293.5,343.5,395.5,454.4,503.9,560.4,603.1,656.6,702.4,753,298,348,399.5,454.4,503.9,552.7,600.1,652.6,703.4,755.2,304,352.5,404.5,459.9,509.3,559.5,605.5,660,704.9,299,349,401,457.3,505,559.5,602.3,655.7,702.5];
			//var yn:Array=[102,92,99.3,89,110.1,110.6,96.3,100.8,109.9,162.8,153.8,159.1,149.9,166.3,168.4,151.1,155.6,163.7,170,226,214.5,218.7,210.1,223.8,225.5,212.1,214.6,223.2,227.5,288,277.1,278.7,274.3,279.1,285.6,273.7,276.3,283.9,350,340.2,342.3,333.7,339.5,343.5,332,336.6,344.2];

			var xn:Array=[282,344,401,464,534,605,662,720,787,850,
						  293,354,410,467,531,600,657,719,793,859,
						  282,344,405,464,534,605,662,722,788,848
						  ];
			
			var yn:Array = [368,371,368,375,368,369,376,370,368,375,
							442,437,439,441,434,435,446,441,437,441,
							518,512,507,509,504,506,514,508,507,510
						   ];

			
			
			//координаты прямолинейного объекта
		
			//var xm:Array = [299,361,423,485,547,609,671,733,795,299,361,423,485,547,609,671,733,795,857,299,361,423,485,547,609,671,733,795,857,299,361,423,485,547,609,671,733,795,299,361,423,485,547,609,671,733,795];
            //var ym:Array = [102,102,102,102,102,102,102,102,102,164,164,164,164,164,164,164,164,164,164,226,226,226,226,226,226,226,226,226,226,288,288,288,288,288,288,288,288,288,350,350,350,350,350,350,350,350,350];

			
			//var xm:Array=new Array(167,217,267,317,367,417,467,517,167,217,267,317,367,417,467,517,567,617,167,217,267,317,367,417,467,517,567,617,167,217,267,317,367,417,467,517,567,167,217,267,317,367,417,467,517,167,217,267,317,367,417,467,517,567);
			//var ym:Array=new Array(29,29,29,29,29,29,29,29,79,79,79,79,79,79,79,79,79,79,129,129,129,129,129,129,129,129,129,129,179,179,179,179,179,179,179,179,179,229,229,229,229,229,229,229,229,279,279,279,279,279,279,279,279,279);

			var xOrig:Array=[];
			var yOrig:Array=[];
            var xn_:Array = [];// пересылочные координаты по X
			var yn_:Array = [];// пересылочные координаты по Y
			var clickON:Boolean=false;
			// массив прозрачностей
			var cubeAlpha:Array=[0.6, 0.2, 0.6, 0.2, 0.3, 0.5, 0.4, 0.2,0.5,
								 0.4, 0.1, 0.4, 0.1, 0.2, 0.6, 0.3, 0.1, 0.3,
								 0.3, 0.2, 0.5, 0.2, 0.3, 0.4, 0.2,0.7,0.3,
							 	 0.4, 0.1, 0.3, 0.1, 0.2, 0.5, 0.3, 0.7,0.6]; 
			
			
			var clicks:Array = [];
								 
			var Shadow:DropShadowFilter = new DropShadowFilter(); // фильтр для тени
			var blur:BlurFilter=new BlurFilter();// фильтр размытия

			var Mymatrix:Matrix;// матрица наложения битмапа
			var ArrBitmap:Array = [];//массив битмапов
			var BmpUrl:Array = [];//массив содержит URL больших картинок;
			var currentBmp:int; //при клике на изображение присваиваем номер.
			var thmb:Array=[]; //массив загрузок миниатюр
            var BmpLoader:RootClass;
			//============Переменные для работы с XML
			var my_x:Number;
			var my_y:Number;
			var my_thumb_width:Number;
			var my_thumb_height:Number;
			var my_images:XMLList;
			var my_total:Number;
			var myXMLLoader:URLLoader = new URLLoader();
			
			var _distortImage : DistortImage;//distorsion Image;
			var preloaders_mc:MovieClip;
			var _text:String;
			
			//Переменные для смещения координат от центра
			var xcentr:uint; //Центр X
			var ycentr:uint; //Центр Y
			var shiftX:Array = [];//смещение по X
			var shiftY:Array = [];//смещение по Y
			
			//массив для заливки цветом фигур
			var color_cube:Array = []; //
			var feel_color:uint = 0x00FF00; //цвет заливки
			var outMouse_color:uint = 0xFFFF0D; // цвет при наведении
			var onClick_color:uint = 0xFF0000; // цвет при нажатии
			var lineStyle:Number = 1; //толщина линии
			var lineColor:uint=0x000000; //цвет линии
			
			//==Конец Описания Переменных=======================================================================================
			
						
			//создаем фрейм для загрузки полноформатного изображения
			frame.graphics.beginFill(0x009966, 0.5);
			frame.graphics.lineStyle(0.5,0x000000);
			frame.graphics.drawRect(0, 0, 1024, 768);
			frame.graphics.endFill();
			
			
		    // создаем муви клипы
			for (i=0; i<37; i++) 
			{
				clicks[i] = -1;
				color_cube[i]=feel_color;
				mySprite[i]=new MovieClip();
				mySprite[i].value=i;
				mySprite[i].pressed=true;
			}
		 	//заполняем массив оригинальных координат
			for (i=0; i<xn.length; i++) 
			{
				xOrig[i]=xn[i];
				yOrig[i]=yn[i];
			}

			
			myXMLLoader.load(new URLRequest("gallery.xml"));
			myXMLLoader.addEventListener(Event.COMPLETE, processXML);
			

			function waitLoad(txt:String):void
			{
				//var circle_pb:preload_circle = new preload_circle;
				widget = new TextField();
				widget.text = "Loading please wait... "+txt+"%" ;
				widget.setTextFormat(new TextFormat("Courier New", 14, 0xB4DCF3, false, false, false));
				widget.width = widget.textWidth;
				widget.x = 295;
				widget.y = 201;
				//circle_pb.x = 275;
				//circle_pb.y = 201;
				widget.filters=[Shadow];
				addChild(Mybackground);
				addChild(widget);
				//addChild(circle_pb);
				
				
			}
			function processXML(e:Event):void 
			{
				
			

				var myXML:XML = new XML(e.target.data);

				my_x = myXML.@XPOSITION;
				my_y = myXML.@YPOSITION;
				my_thumb_width = myXML.@WIDTH;
				my_thumb_height = myXML.@HEIGHT;
				my_images = myXML.IMAGE;
				my_total = my_images.length();
				myXMLLoader.removeEventListener(Event.COMPLETE, processXML);
				myXMLLoader = null;
				////trace("XML is load",my_images);
				//CreateContainer();
				
				loadImage();
				
			}


//======================================================

			function loadImage():void
			{  
				waitLoad(_text);
				for(i= 0; i < my_total; i++)
				{
					BmpUrl[i] = my_images[i].@FULL;
					var thumb_url:String = my_images[i].@THUMB;
					thmb[i]= new Loader();
					thmb[i].load(new URLRequest(thumb_url));
					thmb[i].contentLoaderInfo.addEventListener(Event.COMPLETE, onImageLoad);
					
					
					
					/*var preloader_pb:ProgressBar = new ProgressBar();
					preloader_pb.source = thmb[i].contentLoaderInfo;
					
					if((i!=8)&&(i!=18)&&(i!=26)&&(i!=27)&&(i!=28)&&(i!=37))
					{
						preloader_pb.x = xn[i]+10;
						preloader_pb.y = ym[i]+10;
					}
					
					preloader_pb.width = 40;
					preloader_pb.height = 40;
					preloaders_mc.addChild(preloader_pb);
					preloader_pb.addEventListener(Event.COMPLETE, donePb);*/
	
				}
				
			}
			
			
			function donePb(e:Event):void 
			{
				var my_pb:ProgressBar = ProgressBar(e.target);
				preloaders_mc.removeChild(my_pb);
				my_pb.removeEventListener(Event.COMPLETE, donePb);
			}
			
			

			
				// вызываем когда все изображения загружены
			function onImageLoad(e:Event):void
			{
				
				
				for(i= 0; i < my_total; i++)
				{
					
					ArrBitmap[i] = new BitmapData(thmb[i].width,thmb[i].height);
					ArrBitmap[i].draw(thmb[i],new Matrix());
					Mymatrix=new Matrix();
					Mymatrix.scale(1.5, 1.5);
															
				}
					
				    
					
					if (widget.stage)
					{ 
						removeChild(widget); 
						addEventListeners();
						DriwingCurve();
					}
					
			}
			
			// функция создания контейнера			
			function CreateContainer():void 
			{   
				
				//Первый ряд
				linearsNull(mySprite[0],xn[0],yn[0],xn[1],yn[1],xn[9],yn[9],xn[10],yn[10]);
				linearsNull(mySprite[1],xn[1],yn[1],xn[2],yn[2],xn[10],yn[10],xn[11],yn[11]);
			 	linearsNull(mySprite[2],xn[2],yn[2],xn[3],yn[3],xn[11],yn[11],xn[12],yn[12]);
				linearsNull(mySprite[3],xn[3],yn[3],xn[4],yn[4],xn[12],yn[12],xn[13],yn[13]);
				linearsNull(mySprite[4],xn[4],yn[4],xn[5],yn[5],xn[13],yn[13],xn[14],yn[14]);
				linearsNull(mySprite[5],xn[5],yn[5],xn[6],yn[6],xn[14],yn[14],xn[15],yn[15]);
				linearsNull(mySprite[6],xn[6],yn[6],xn[7],yn[7],xn[15],yn[15],xn[16],yn[16]);
				linearsNull(mySprite[7],xn[7],yn[7],xn[8],yn[8],xn[16],yn[16],xn[17],yn[17]);
				//Второй ряд
				linearsNull(mySprite[8],xn[9],yn[9],xn[10],yn[10],xn[19],yn[19],xn[20],yn[20]);
				linearsNull(mySprite[9],xn[10],yn[10],xn[11],yn[11],xn[20],yn[20],xn[21],yn[21]);
				linearsNull(mySprite[10],xn[11],yn[11],xn[12],yn[12],xn[21],yn[21],xn[22],yn[22]);
				linearsNull(mySprite[11],xn[12],yn[12],xn[13],yn[13],xn[22],yn[22],xn[23],yn[23]);
				linearsNull(mySprite[12],xn[13],yn[13],xn[14],yn[14],xn[23],yn[23],xn[24],yn[24]);
				linearsNull(mySprite[13],xn[14],yn[14],xn[15],yn[15],xn[24],yn[24],xn[25],yn[25]);
				linearsNull(mySprite[14],xn[15],yn[15],xn[16],yn[16],xn[25],yn[25],xn[26],yn[26]);
				linearsNull(mySprite[15],xn[16],yn[16],xn[17],yn[17],xn[26],yn[26],xn[27],yn[27]);
				linearsNull(mySprite[16],xn[17],yn[17],xn[18],yn[18],xn[27],yn[27],xn[28],yn[28]);
				//Третий ряд
				linearsNull(mySprite[17],xn[19],yn[19],xn[20],yn[20],xn[29],yn[29],xn[30],yn[30]);
				linearsNull(mySprite[18],xn[20],yn[20],xn[21],yn[21],xn[30],yn[30],xn[31],yn[31]);
				linearsNull(mySprite[19],xn[21],yn[21],xn[22],yn[22],xn[31],yn[31],xn[32],yn[32]);
				linearsNull(mySprite[20],xn[22],yn[22],xn[23],yn[23],xn[32],yn[32],xn[33],yn[33]);
				linearsNull(mySprite[21],xn[23],yn[23],xn[24],yn[24],xn[33],yn[33],xn[34],yn[34]);
				linearsNull(mySprite[22],xn[24],yn[24],xn[25],yn[25],xn[34],yn[34],xn[35],yn[35]);
				linearsNull(mySprite[23],xn[25],yn[25],xn[26],yn[26],xn[35],yn[35],xn[36],yn[36]);
				//Четвертый ряд
				linearsNull(mySprite[24],xn[29],yn[29],xn[30],yn[30],xn[38],yn[38],xn[39],yn[39]);
				linearsNull(mySprite[25],xn[30],yn[30],xn[31],yn[31],xn[39],yn[39],xn[40],yn[40]);
				linearsNull(mySprite[26],xn[31],yn[31],xn[32],yn[32],xn[40],yn[40],xn[41],yn[41]);
				linearsNull(mySprite[27],xn[32],yn[32],xn[33],yn[33],xn[41],yn[41],xn[42],yn[42]);
				linearsNull(mySprite[28],xn[33],yn[33],xn[34],yn[34],xn[42],yn[42],xn[43],yn[43]);
				linearsNull(mySprite[29],xn[34],yn[34],xn[35],yn[35],xn[43],yn[43],xn[44],yn[44]);
				linearsNull(mySprite[30],xn[35],yn[35],xn[36],yn[36],xn[44],yn[44],xn[45],yn[45]);
				linearsNull(mySprite[31],xn[36],yn[36],xn[37],yn[37],xn[45],yn[45],xn[46],yn[46]);
				
				
			}
			  // рисуем основной объект
			function DriwingCurve():void 
			{   
				//Первый ряд
				linears(mySprite[0],xn[0],yn[0],xn[1],yn[1],xn[10],yn[10],xn[11],yn[11],ArrBitmap[0],Mymatrix,color_cube[0],cubeAlpha[0],lineStyle,lineColor);
				linears(mySprite[1],xn[1],yn[1],xn[2],yn[2],xn[11],yn[11],xn[12],yn[12],ArrBitmap[1],Mymatrix,color_cube[1],cubeAlpha[1],lineStyle,lineColor);
			 	linears(mySprite[2],xn[2],yn[2],xn[3],yn[3],xn[12],yn[12],xn[13],yn[13],ArrBitmap[2],Mymatrix,color_cube[2],cubeAlpha[2],lineStyle,lineColor);
				linears(mySprite[3],xn[3],yn[3],xn[4],yn[4],xn[13],yn[13],xn[14],yn[14],ArrBitmap[3],Mymatrix,color_cube[3],cubeAlpha[3],lineStyle,lineColor);
				linears(mySprite[4],xn[4],yn[4],xn[5],yn[5],xn[14],yn[14],xn[15],yn[15],ArrBitmap[4],Mymatrix,color_cube[4],cubeAlpha[4],lineStyle,lineColor);
				linears(mySprite[5],xn[5],yn[5],xn[6],yn[6],xn[15],yn[15],xn[16],yn[16],ArrBitmap[5],Mymatrix,color_cube[5],cubeAlpha[5],lineStyle,lineColor);
				linears(mySprite[6],xn[6],yn[6],xn[7],yn[7],xn[16],yn[16],xn[17],yn[17],ArrBitmap[6],Mymatrix,color_cube[6],cubeAlpha[6],lineStyle,lineColor);
				linears(mySprite[7],xn[7],yn[7],xn[8],yn[8],xn[17],yn[17],xn[18],yn[18],ArrBitmap[7],Mymatrix,color_cube[7],cubeAlpha[7],lineStyle,lineColor);
				linears(mySprite[8],xn[8],yn[8],xn[9],yn[9],xn[18],yn[18],xn[19],yn[19],ArrBitmap[8],Mymatrix,color_cube[8],cubeAlpha[8],lineStyle,lineColor);
				//Второй ряд
				linears(mySprite[9],xn[10],yn[10],xn[11],yn[11],xn[20],yn[20],xn[21],yn[21],ArrBitmap[9],Mymatrix,color_cube[9],cubeAlpha[9],lineStyle,lineColor);
				linears(mySprite[10],xn[11],yn[11],xn[12],yn[12],xn[21],yn[21],xn[22],yn[22],ArrBitmap[10],Mymatrix,color_cube[10],cubeAlpha[10],lineStyle,lineColor);
				linears(mySprite[11],xn[12],yn[12],xn[13],yn[13],xn[22],yn[22],xn[23],yn[23],ArrBitmap[11],Mymatrix,color_cube[11],cubeAlpha[11],lineStyle,lineColor);
				linears(mySprite[12],xn[13],yn[13],xn[14],yn[14],xn[23],yn[23],xn[24],yn[24],ArrBitmap[12],Mymatrix,color_cube[12],cubeAlpha[12],lineStyle,lineColor);
				linears(mySprite[13],xn[14],yn[14],xn[15],yn[15],xn[24],yn[24],xn[25],yn[25],ArrBitmap[13],Mymatrix,color_cube[13],cubeAlpha[13],lineStyle,lineColor);
				linears(mySprite[14],xn[15],yn[15],xn[16],yn[16],xn[25],yn[25],xn[26],yn[26],ArrBitmap[14],Mymatrix,color_cube[14],cubeAlpha[14],lineStyle,lineColor);
				linears(mySprite[15],xn[16],yn[16],xn[17],yn[17],xn[26],yn[26],xn[27],yn[27],ArrBitmap[15],Mymatrix,color_cube[15],cubeAlpha[15],lineStyle,lineColor);
				linears(mySprite[16],xn[17],yn[17],xn[18],yn[18],xn[27],yn[27],xn[28],yn[28],ArrBitmap[16],Mymatrix,color_cube[16],cubeAlpha[16],lineStyle,lineColor);
				//linears(mySprite[17],xn[18],yn[18],xn[19],yn[19],xn[28],yn[28],xn[29],yn[29],ArrBitmap[17],Mymatrix,color_cube[17],cubeAlpha[17],lineStyle,lineColor);
				
				//Третий ряд
				/*linears(mySprite[18],xn[20],yn[20],xn[21],yn[21],xn[30],yn[30],xn[31],yn[31],ArrBitmap[18],Mymatrix,color_cube[18],cubeAlpha[18],lineStyle,lineColor);
				linears(mySprite[19],xn[21],yn[21],xn[22],yn[22],xn[31],yn[31],xn[32],yn[32],ArrBitmap[19],Mymatrix,color_cube[19],cubeAlpha[19],lineStyle,lineColor);
				linears(mySprite[20],xn[22],yn[22],xn[23],yn[23],xn[32],yn[32],xn[33],yn[33],ArrBitmap[20],Mymatrix,color_cube[20],cubeAlpha[20],lineStyle,lineColor);
				linears(mySprite[21],xn[23],yn[23],xn[24],yn[24],xn[33],yn[33],xn[34],yn[34],ArrBitmap[21],Mymatrix,color_cube[21],cubeAlpha[21],lineStyle,lineColor);
				linears(mySprite[22],xn[24],yn[24],xn[25],yn[25],xn[34],yn[34],xn[35],yn[35],ArrBitmap[22],Mymatrix,color_cube[22],cubeAlpha[22],lineStyle,lineColor);
				linears(mySprite[23],xn[25],yn[25],xn[26],yn[26],xn[35],yn[35],xn[36],yn[36],ArrBitmap[23],Mymatrix,color_cube[23],cubeAlpha[23],lineStyle,lineColor);
				linears(mySprite[24],xn[26],yn[26],xn[27],yn[27],xn[36],yn[36],xn[37],yn[37],ArrBitmap[24],Mymatrix,color_cube[24],cubeAlpha[24],lineStyle,lineColor);
				//linears(mySprite[25],xn[27],yn[27],xn[28],yn[28],xn[37],yn[37],xn[38],yn[38],ArrBitmap[25],Mymatrix,color_cube[25],cubeAlpha[25],lineStyle,lineColor);
				//linears(mySprite[26],xn[28],yn[28],xn[29],yn[29],xn[38],yn[38],xn[39],yn[39],ArrBitmap[26],Mymatrix,color_cube[26],cubeAlpha[26],lineStyle,lineColor);
				//Четвертый ряд
				linears(mySprite[27],xn[30],yn[30],xn[31],yn[31],xn[40],yn[40],xn[41],yn[41],ArrBitmap[27],Mymatrix,color_cube[27],cubeAlpha[27],lineStyle,lineColor);
				linears(mySprite[28],xn[31],yn[31],xn[32],yn[32],xn[41],yn[41],xn[42],yn[42],ArrBitmap[28],Mymatrix,color_cube[28],cubeAlpha[28],lineStyle,lineColor);
				linears(mySprite[29],xn[32],yn[32],xn[33],yn[33],xn[42],yn[42],xn[43],yn[43],ArrBitmap[29],Mymatrix,color_cube[29],cubeAlpha[29],lineStyle,lineColor);
				linears(mySprite[30],xn[33],yn[33],xn[34],yn[34],xn[43],yn[43],xn[44],yn[44],ArrBitmap[30],Mymatrix,color_cube[30],cubeAlpha[30],lineStyle,lineColor);
				linears(mySprite[31],xn[34],yn[34],xn[35],yn[35],xn[44],yn[44],xn[45],yn[45],ArrBitmap[31],Mymatrix,color_cube[31],cubeAlpha[31],lineStyle,lineColor);
				linears(mySprite[32],xn[35],yn[35],xn[36],yn[36],xn[45],yn[45],xn[46],yn[46],ArrBitmap[32],Mymatrix,color_cube[32],cubeAlpha[32],lineStyle,lineColor);
				linears(mySprite[33],xn[36],yn[36],xn[37],yn[37],xn[46],yn[46],xn[47],yn[47],ArrBitmap[33],Mymatrix,color_cube[33],cubeAlpha[33],lineStyle,lineColor);
				linears(mySprite[34],xn[37],yn[37],xn[38],yn[38],xn[47],yn[47],xn[48],yn[48],ArrBitmap[34],Mymatrix,color_cube[34],cubeAlpha[34],lineStyle,lineColor);
				//linears(mySprite[35],xn[38],yn[38],xn[39],yn[39],xn[48],yn[48],xn[49],yn[49],ArrBitmap[35],Mymatrix,color_cube[35],cubeAlpha[35],lineStyle,lineColor);
				*/
				
			} // конец функции DriwingCurve
			
			
			
			// рисуем по точкам каждый объект
			function linears(obj:MovieClip,x1:Number,y1:Number,x2:Number,y2:Number,
							x3:Number, y3:Number, x4:Number, y4:Number, bmp:BitmapData,
							mtrx:Matrix, obj_color:uint,
							obj_alpha:Number,obj_lineStyle:Number,obj_lineColor:uint):void 
				{
				   	
			      
			
					//_distortImage = new DistortImage(bmp);
					//_distortImage.setTransform(x1, y1, x2, y2, x4, y4,x3,y3);
					//_distortImage.buttonMode = true;
					//addChild(_distortImage);
					
					/*var w:TextField = new TextField();
					w.text = String(x1) ;
					w.setTextFormat(new TextFormat("Courier New", 10, 0x000000, false, false, false));
					w.background = true;
					w.width = w.textWidth;
					w.height = w.textHeight;
					w.x = x1;
					w.y = y1;*/
					
					
					//заливаем битмапом
					
					obj.graphics.beginBitmapFill(bmp,mtrx);
					obj.graphics.lineStyle(obj_lineStyle,obj_lineColor);
					obj.graphics.moveTo(x1,y1);
					obj.graphics.lineTo(x1,y1);
					obj.graphics.lineTo(x2,y2);
					obj.graphics.lineTo(x4,y4);
					obj.graphics.lineTo(x3,y3);
					obj.graphics.lineTo(x1,y1);
					obj.graphics.endFill();
					obj.buttonMode=true;
					
			        
					//===========Затеняем
					obj.graphics.beginFill(obj_color,obj_alpha);
					obj.graphics.lineStyle(obj_lineStyle,obj_lineColor);
					obj.graphics.moveTo(x1,y1);
					//obj.graphics.moveTo(x4,y4);//пересечение
					obj.graphics.lineTo(x1,y1);
					obj.graphics.lineTo(x2,y2);
					//obj.graphics.lineTo(x3,y3);//пересечение
					obj.graphics.lineTo(x4,y4);
					obj.graphics.lineTo(x3,y3);
					obj.graphics.lineTo(x1,y1);
					obj.graphics.endFill();
					obj.buttonMode=true;
	                obj.cacheAsBitmap;
					
					
					//Mybackground.graphics.beginFill(0x3399CC, 1);
					//Mybackground.graphics.drawRect(0, 0, 768, 768);
					//Mybackground.graphics.endFill();
					//globalScene.addChild(Mybackground);
					//container.filters = [Shadow];
					//container.x=-100;
					//container.y=-10;
					//container.scaleX=1;
					//container.scaleY=1;
					//container.addChild(_distortImage);
					//container.addChild(_distortImage);
					
					//if (!_distortImage.stage)
					//{
					// container.addChild(_distortImage);
					//}
					
				/*	if (!w.stage)
					{
						
						container.addChild(w);
						
					}*/
					
					
					if (!obj.stage)
					{
						
						container.addChild(obj);
						//trace("проверка Obj",obj.name);
					}
					if (!container.stage)
					{
						//trace("проверка Container");
						globalScene.addChild(container);
					}
					if (!globalScene.stage)
					{
						//trace("проверка Global");
						addChild(globalScene);
					}
						
					if (clickON)
					{
					    
						//addFrame();
					}
					
				}
			
				function linearsNull(obj:MovieClip,x1:Number,y1:Number,x2:Number,y2:Number,
							x3:Number, y3:Number, x4:Number, y4:Number):void 
				{
					
			
			         //===========Затеняем
					obj.graphics.beginFill(0x89b462,0.2);
					obj.graphics.lineStyle(2,0xFFFFFF);
					obj.graphics.moveTo(x1,y1);
					obj.graphics.lineTo(x1,y1);
					obj.graphics.lineTo(x2,y2);
					obj.graphics.lineTo(x4,y4);
					obj.graphics.lineTo(x3,y3);
					obj.graphics.lineTo(x1,y1);
					obj.graphics.endFill();
					
	                										
					container.addChild(obj);
					globalScene.addChild(container);
					if (!globalScene.stage)
					{
						
						addChild(globalScene);
					}
					preloaders_mc = new MovieClip();
					preloaders_mc.x = obj.x;
					preloaders_mc.y = obj.y;
					addChild(preloaders_mc);
	
					
				}
			
				function addFrame():void
				{
					
					removeEventListeners();
					container.filters=null;
					xc=globalScene.x-mouseX*24-mouseX/300+container.width/2;
					yc=globalScene.y-mouseY*24-mouseY/300+container.height/2;
			
					/*var tweenX:Tween = new Tween(globalScene, "scaleX", Regular.easeOut,1, 25, 1, true);
	
					var tweenY :Tween = new Tween(globalScene, "scaleY", Regular.easeOut, 1, 25, 1, true);

					var tweenXc:Tween = new Tween(globalScene, "x", Regular.easeOut, 1, xc, 1, true);
					
					var tweenYc :Tween = new Tween(globalScene, "y", Regular.easeOut, 1, yc, 1, true);
	
					var tweenA :Tween = new Tween(container, "alpha", Regular.easeOut, 1, 0.1, 1, true);
					
		  			//Добавляем твины в массив
					tweens.push(tweenXc);
					tweens.push(tweenYc);
					tweens.push(tweenX);
					tweens.push(tweenY);
					tweens.push(tweenA);
					tweenXc.addEventListener(TweenEvent.MOTION_FINISH, scaleUpFinished);*/
					//trace("FRAME_X_Y= ",frame.x,frame.y)					
					frame.buttonMode=true;
					frame.addChild(BmpLoader);
					addChild(frame);
					//Добавляем обработчики mouse click  
					frame.addEventListener(MouseEvent.CLICK, mouseClickFrame); 
					
				}
	
	
				function scaleUpFinished(e:Event):void 
				{
					//trace("FRAME_X_Y= ",frame.x,frame.y)					
					frame.buttonMode=true;
					frame.addChild(BmpLoader);
					addChild(frame);
										
					//Добавляем обработчики mouse click  
					frame.addEventListener(MouseEvent.CLICK, mouseClickFrame); 
				}
	
				function mouseClickFrame(e:MouseEvent):void 
				{
					
					//trace("Bmpurl= ",BmpUrl[currentBmp]);
					removeChild(frame);
					frame.removeChild(BmpLoader);
					container.filters =null;
					var tweenX:Tween = new Tween(globalScene, "scaleX", Regular.easeOut,25, 1, 1, true);
					var tweenY :Tween = new Tween(globalScene, "scaleY", Regular.easeOut, 25, 1, 1, true);
					var tweenXc:Tween = new Tween(globalScene, "x", Regular.easeOut, xc, 0, 1, true);
					var tweenYc :Tween = new Tween(globalScene, "y", Regular.easeOut, yc, 0, 1, true);
					var tweenA :Tween = new Tween(container, "alpha", Regular.easeOut, 0.1, 1, 1, true);

					//Добавляем твины в массив
					tweens.push(tweenXc);
					tweens.push(tweenYc);
					tweens.push(tweenX);
					tweens.push(tweenY);
					tweens.push(tweenA);
					tweenXc.addEventListener(TweenEvent.MOTION_FINISH, scaleDownFinished);
				}
				function scaleDownFinished(e:Event):void 
				{
					addEventListeners();
					clickON=false;
					Redriwing();
				}
				
				// возвращаем оригинальные координаты
				function getOrigCoord():void 
				{
					for (var i:int=0; i<xn.length; i++) 
					{
						xn[i]=xOrig[i];
						yn[i]=yOrig[i];
					}
				}
			
				 // очищаем экран
				function ClearingAll():void 
				{
					for (i = 0; i < 37; i++) 
					{
						mySprite[i].graphics.clear();
						
					}
				}

					//добавляем обработчики событий, для каждого объекта
				function addEventListeners():void 
				{
					for(i=0;i<37;i++)
					{  
					//Добавляем обработчики mouse over  для каждой кнопки
					mySprite[i].addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
					//Добавляем обработчики mouse out  для каждой кнопки
					mySprite[i].addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
					//Добавляем обработчики mouse click   для каждой кнопки
					mySprite[i].addEventListener(MouseEvent.CLICK, mouseClickHandler); 
					}
				}

					//удаляем обработчики событий у каждого объекта
				function removeEventListeners():void 
				{
					for(i=0;i<37;i++)
					{ 
					//Добавляем обработчики mouse over   для каждой кнопки
					mySprite[i].removeEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
					//Добавляем обработчики mouse out  для каждой кнопки
					mySprite[i].removeEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
					//Добавляем обработчики mouse click   для каждой кнопки
					mySprite[i].removeEventListener(MouseEvent.CLICK, mouseClickHandler); 
					}
				}
				
				// функция смены координат
				
				function changeCoord(a:int,b:int,c:int,d:int,ncube:int):void
				{
					
					//находим центры	
					 xcentr = (xn[a] + xn[b] + xn[c] + xn[d]) / 4;
					 ycentr = (yn[a] + yn[b] + yn[c] + yn[d]) / 4;
					
					var shiftX_old:Array = [];
					var shiftY_old:Array = [];
					
					const delta1:Number = 0.66; 
					const delta2:Number = 0.25;
					var width_cub:uint = 75; 
					var A:int = 0;
					var B:int = 0;
					var C:int = 0;
					var D:int = 0;
					var shf:int = 1;
					
					
					shiftX_old[1] = xn[a];
					shiftX_old[2] = xn[b];
					shiftX_old[3] = xn[c];
					shiftX_old[4] = xn[d];
					
					shiftY_old[1] = yn[a];
					shiftY_old[2] = yn[b];
					shiftY_old[3] = yn[c];
					shiftY_old[4] = yn[d];
					
					
					
									
					//рисуем квадрат от центра				
					xn[a] = xcentr - width_cub/2; yn[a] = ycentr - width_cub/2;
					xn[b] = xcentr + width_cub/2; yn[b] = ycentr - width_cub/2;
					xn[c] = xcentr - width_cub/2; yn[c] = ycentr + width_cub/2;
					xn[d] = xcentr + width_cub/2; yn[d] = ycentr + width_cub/2;
					
					// смещение по X
					shiftX[1] = shiftX_old[1] - xn[a];
					shiftX[2] = shiftX_old[2] - xn[b];
					shiftX[3] = shiftX_old[3] - xn[c];
					shiftX[4] = shiftX_old[4] - xn[d];
					// смещение по Y
					shiftY[1] = shiftY_old[1] - yn[a];
					shiftY[2] = shiftY_old[2] - yn[b];
					shiftY[3] = shiftY_old[3] - yn[c];
					shiftY[4] = shiftY_old[4] - yn[d];
					
					
					
					//trace("xcentr= ",xcentr)
					//trace("mousex= ",mouseX)
					
					
					
					
					
					//============================GLOBAL BRAIN FUCKING ===================================
					
					//проверка по квадратам
					
					/*for (var count:int = 0; count <= 37; count++ )
					{
						if (clicks[count] == 1)
						{
							trace("click", count, "= 1");
						}
					}*/
					
					
					for (var cont:int = 0; cont <= 35; cont++ )
						{
							if ((clicks[cont] >= 0)&&(ncube+shf==clicks[cont]))
							{
								  trace(" справа нажат квадрат ", clicks[cont]);	
								shf++;
								
								/*A = clicks[cont] ;
								B = clicks[cont] +1;
								C = clicks[cont]+10;
								D = clicks[cont] + 11;*/
								//changeCoord(A, B, C, D);
							}
							
						}
					
					// проверка сверху
					if (((a>=0)&&(a<=9)))
					{
						//trace("сверху ничего нет");
					}
					else if ((a>=10)&&(a<=19))
					{
					   
						xn[a-10]-=shiftX[1]*delta1;
						yn[a-10]-=shiftY[1]*delta1;   
						xn[b-10]-=shiftX[2]*delta1;
						yn[b-10]-=shiftY[2]*delta1;
						
						
						//trace("Сверху один квадрат");	
					}
					
					else if ((a>=20)&&(a<=39))
					{
						xn[a-10]-=shiftX[1]*delta1;
						yn[a-10]-=shiftY[1]*delta1;   
						
						xn[b-10]-=shiftX[2]*delta1;
						yn[b-10]-=shiftY[2]*delta1;
						
						xn[a-20]-=shiftX[1]*delta2;
						yn[a-20]-=shiftY[1]*delta2;   
						
						xn[b-20]-=shiftX[2]*delta2;
						yn[b-20]-=shiftY[2]*delta2;
						//trace("сверху два квадрата")
					}
										
					// проверка справа
					if ((b==9)||(b==19)||(b==29)||(b==39))
					{
						//trace("справа ничего нет");
					}
					else if ((b==8)||(b==18)||(b==28)||(b==38))
					{
					    
						xn[b+1]-=shiftX[2]*delta1;
						yn[b+1]-=shiftY[2]*delta1;   
						xn[d+1]-=shiftX[4]*delta1;
						yn[d+1]-=shiftY[4]*delta1;
						//trace("справа один квадрат");	
					}
					else if ((((b>=0)&&(b<=7))) || (((b>=10)&&(b<=17))) || (((b>=20)&&(b<=27))) || (((b>=30)&&(b<=37))))
					{
						xn[b+1]-=shiftX[2]*delta1;
						yn[b+1]-=shiftY[2]*delta1;   
						xn[d+1]-=shiftX[4]*delta1;
						yn[d+1]-=shiftY[4]*delta1;
						
						xn[b+2]-=shiftX[2]*delta2;
						yn[b+2]-=shiftY[2]*delta2;   
						xn[d+2]-=shiftX[4]*delta2;
						yn[d+2]-=shiftY[4]*delta2;
						//trace("справа два квадрата")
					}
					
					
					// проверка слева
					if ((c==10)||(c==20)||(c==30)||(c==40))
					{
						//trace("слева ничего нет");
					}
					else if ((c==11)||(c==21)||(c==31)||(c==41))
					{
						xn[a-1]-=shiftX[1]*delta1;
						yn[a-1]-=shiftY[3]*delta1;   
						xn[c-1]-=shiftX[1]*delta1;
						yn[c-1]-=shiftY[3]*delta1;
						
						
						//trace("слева один квадрат");	
					}
					else if ((((c>=12)&&(c<=19))) || (((c>=22)&&(c<=29))) || (((c>=32)&&(c<=39))) || (((c>=42)&&(c<=49))))
					{
						xn[a-1]-=shiftX[1]*delta1;
						yn[a-1]-=shiftY[3]*delta1;   
						xn[c-1]-=shiftX[1]*delta1;
						yn[c-1]-=shiftY[3]*delta1;
						
						xn[a-2]-=shiftX[1]*delta2;
						yn[a-2]-=shiftY[3]*delta2;   
						xn[c-2]-=shiftX[1]*delta2;
						yn[c-2]-=shiftY[3]*delta2;
						

						//trace("слева два квадрата")
					}
					
					// проверка снизу
					if (((d>=41)&&(d<=49)))
					{
						//trace("снизу ничего нет");
					}
					else if ((d>=31)&&(d<=39))
					{
					    xn[c+10]-=shiftX[3]*delta1;
						yn[c+10]+=shiftY[4]*delta1;   
						xn[d+10]+=shiftX[3]*delta1;
						yn[d+10]-=shiftY[4]*delta1;
						
						//trace("снизу один квадрат");	
					}
					
					else if ((d>=11)&&(d<=29))
					{
						xn[c+10]-=shiftX[3]*delta1;
						yn[c+10]+=shiftY[4]*delta1;   
						xn[d+10]+=shiftX[3]*delta1;
						yn[d+10]-=shiftY[4]*delta1;
						
						xn[c+20]-=shiftX[3]*delta2;
						yn[c+20]+=shiftY[4]*delta2;   
						xn[d+20]+=shiftX[3]*delta2;
						yn[d+20]-=shiftY[4]*delta2;
						//trace("снизу два квадрата")
					}
					
					// проверка  диагоналей ==============================
					
					// проверка левой верхней диагонали
					
					
					if (!(((a>=0)&&(a<=9))||(a==10)||(a==20)||(a==30)))
					{
						
						xn[a-11]-=shiftX[1]*delta2;
						yn[a - 11] -= shiftY[1]*delta2;
						//trace("слева сверху по диагонали что-то видно");
					}
					else 
					{
					  // trace("по диагонали нет ничего");	
					}
					
					
					// проверка правой верхней диагонали
					
					if (!(((b==9)||(b==19)||(b==29)||(b==39))||(((a>=0)&&(a<=9)))))
					{
						
							xn[b-9]-=shiftX[2]*delta2;
						    yn[b-9]-=shiftY[2]*delta2;
												
						//trace("справа сверху по диагонали что-то видно");
					}
					else 
					{
					   //trace("справа сверху по диагонали нет ничего");	
					}
					
					// проверка правой нижней диагонали
					if (!((((d>=40)&&(d<=49))||(b==9)||(b==19)||(b==29)||(b==39))))
					{
							xn[d+11]-=shiftX[4]*delta2;
						    yn[d+11]-=shiftY[4]*delta2;
						
						//trace("справа снизу что-то есть");
					}
					else 
					{
					   //trace("справа снизу по диагонали нет ничего");	
					}
					// проверка левой нижней диагонали
					
					if (!(((c==10)||(c==20)||(c==30)||(c==40))||(((d>=40)&&(d<=49)))))
					{
							xn[c+9]-=shiftX[3]*delta2;
						    yn[c+9]-=shiftY[3]*delta2;
						//trace("слева снизу по диагонали что-то  есть");
					}
					else 
					{
					   //trace("слева снизу по диагонали нет ничего");	
					}
				     
					 for (var _count:int = 0; _count <= xn.length;_count++ )
					 {
						xn_[_count] = xn[_count];
						yn_[_count] = yn[_count];
					 }
					 
					
					 
					
				}// end function  ChangeCoord
				
				
				
								
				// функция смены оригинальных координат
				function changeOrigCoord(a:int,b:int,c:int,d:int):void
				{
					
					for (var _count:int = 0; _count < xn.length;_count++ )
					{
						xOrig[_count] = xn_[_count];
						yOrig[_count] = yn_[_count];
					}
				}
				
				// это вызывается когда мышь наведена
				function mouseOverHandler(e:MouseEvent):void 
				{
					//Получаем кнопку из события
					var button:MovieClip = e.target as MovieClip;
					//trace(color_cube[button.value]);
					button.alpha=0.7;
					//trace("clicks= ", clicks[button.value]);
					
					
					if ((button==mySprite[0])&&(mySprite[0].pressed))
					{
						color_cube[0]=outMouse_color;
						//trace(button.value);
						//trace(button.pressed);
						getOrigCoord();
												
						changeCoord(0,1,10,11,0);
						Redriwing();
					} 
					else if ((button == mySprite[1])&&(mySprite[1].pressed))
					{
						//trace(button.value);
						//trace(button.pressed);
						getOrigCoord();
						color_cube[1]=outMouse_color;
						
						
						changeCoord(1,2,11,12,1);
						Redriwing();
					} 
					else if ((button == mySprite[2])&&(mySprite[2].pressed)) 
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[2]=outMouse_color;
						changeCoord(2,3,12,13,2);
						Redriwing();
					} 
					else if ((button == mySprite[3])&&(mySprite[3].pressed)) 
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[3]=outMouse_color;
						changeCoord(3,4,13,14,3);
						Redriwing();
					} 
					else if ((button == mySprite[4])&&(mySprite[4].pressed)) 
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[4]=outMouse_color;
						changeCoord(4,5,14,15,4);
						Redriwing();
					}			 
					else if ((button == mySprite[5]) &&(mySprite[5].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[5]=outMouse_color;
						changeCoord(5,6,15,16,5);
						Redriwing();
					} 
					else if ((button == mySprite[6]) &&(mySprite[6].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[6]=outMouse_color;
						changeCoord(6,7,16,17,6);
						Redriwing();
					}
					else if ((button == mySprite[7]) &&(mySprite[7].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[7]=outMouse_color;
						changeCoord(7,8,17,18,7);
						Redriwing();
					} 
					else if ((button == mySprite[8]) &&(mySprite[8].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[8]=outMouse_color;
						changeCoord(8,9,18,19,8);
						Redriwing();
					} 
					else if ((button == mySprite[9]) &&(mySprite[9].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[9]=outMouse_color;
						changeCoord(10,11,20,21,9);
						Redriwing();
					} 
					else if ((button == mySprite[10]) &&(mySprite[10].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[10]=outMouse_color;
						changeCoord(11,12,21,22,10);
						Redriwing();
					}
					else if ((button == mySprite[11]) &&(mySprite[11].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[11]=outMouse_color;
						changeCoord(12,13,22,23,11);
						Redriwing();
					}
					else if ((button == mySprite[12]) &&(mySprite[12].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[12]=outMouse_color;
						changeCoord(13,14,23,24,12);
						Redriwing();
					}
					else if ((button == mySprite[13]) &&(mySprite[13].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[13]=outMouse_color;
						changeCoord(14,15,24,25,13);
						Redriwing();
					}
					else if ((button == mySprite[14]) &&(mySprite[14].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[14]=outMouse_color;
						changeCoord(15,16,25,26,14);
						Redriwing();
					}
					else if ((button == mySprite[15]) &&(mySprite[15].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[15]=outMouse_color;
						changeCoord(16,17,26,27,15);
						Redriwing();
					}
					else if ((button == mySprite[16]) &&(mySprite[16].pressed))
					{	
						//trace(button.value);
						getOrigCoord();
						color_cube[16]=outMouse_color;
						changeCoord(17,18,27,28,16);
						Redriwing();
					}
					else if ((button == mySprite[17]) &&(mySprite[17].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[17]=outMouse_color;
						changeCoord(18,19,28,29,17);
						Redriwing();
					}
					else if ((button == mySprite[18]) &&(mySprite[18].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[18]=outMouse_color;
						changeCoord(20,21,30,31,18);
						Redriwing();
					}
					else if ((button == mySprite[19]) &&(mySprite[19].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[19]=outMouse_color;
						changeCoord(21,22,31,32,19);
						Redriwing();
					}
					else if ((button == mySprite[20]) &&(mySprite[20].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[20]=outMouse_color;
						changeCoord(22,23,32,33,20);
						Redriwing();
					}
					else if ((button == mySprite[21]) &&(mySprite[21].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[21]=outMouse_color;
						changeCoord(23,24,33,34,21);
						Redriwing();
					}
					else if ((button == mySprite[22]) &&(mySprite[22].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[22]=outMouse_color;
						changeCoord(24,25,34,35,22);
						Redriwing();
					}
					else if ((button == mySprite[23]) &&(mySprite[23].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[23]=outMouse_color;
						changeCoord(25,26,35,36,23);
						Redriwing();
					}
					else if ((button == mySprite[24]) &&(mySprite[24].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[24]=outMouse_color;
						changeCoord(26,27,36,37,24);
						Redriwing();
					}
					else if ((button == mySprite[25]) &&(mySprite[25].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[25]=outMouse_color;
						changeCoord(27,28,37,38,25);
						Redriwing();
					}
	
					else if ((button == mySprite[26]) &&(mySprite[26].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[26]=outMouse_color;
						changeCoord(28,29,38,39,26);
						Redriwing();
					}
					else if ((button == mySprite[27])&&(mySprite[27].pressed)) 
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[27]=outMouse_color;
						changeCoord(30,31,40,41,27);
						Redriwing();
					}
					else if ((button == mySprite[28]) &&(mySprite[28].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[28]=outMouse_color;
						changeCoord(31,32,41,42,28);
						Redriwing();
					}
					else if ((button == mySprite[29]) &&(mySprite[29].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[29]=outMouse_color;
						changeCoord(32,33,42,43,29);
						Redriwing();
					}
					else if ((button == mySprite[30]) &&(mySprite[30].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[30]=outMouse_color;
						changeCoord(33,34,43,44,30);
						Redriwing();
					}
					else if ((button == mySprite[31]) &&(mySprite[31].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[31]=outMouse_color;
						changeCoord(34,35,44,45,31);
						Redriwing();
					}
					else if ((button == mySprite[32]) &&(mySprite[32].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[32]=outMouse_color;
						changeCoord(35,36,45,46,32);
						Redriwing();
					}
					else if ((button == mySprite[33]) &&(mySprite[33].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[33]=outMouse_color;
						changeCoord(36,37,46,47,33);
						Redriwing();
					}
					else if ((button == mySprite[34]) &&(mySprite[34].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[34]=outMouse_color;
						changeCoord(37,38,47,48,34);
						Redriwing();
					}
					else if ((button == mySprite[35]) &&(mySprite[35].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[35]=outMouse_color;
						changeCoord(38,39,48,49,35);
						Redriwing();
					}
		
				} // End Function MouseOverHandler

					//Это вызывается, когда мышь выходит за границы кнопки
					function mouseOutHandler(e:MouseEvent):void 
					{
												
						getOrigCoord();
						Redriwing();
						//Получаем кнопку из события
						var button:MovieClip = e.target as MovieClip;
						//100% прозрачность
						button.alpha = 1;
						if (button.pressed)
						{
							color_cube[button.value] = feel_color;	
						}
						
					}

					//Это вызывается, когда мышкой кликнули по кнопке
					function mouseClickHandler(e:MouseEvent):void 
					{
						
						clickON=true;
						//trace("Pressed");
						var button:MovieClip = e.target as MovieClip;
						button.pressed = false;
						BmpLoader = new RootClass;
						BmpLoader.loadadres(BmpUrl[button.value]); 
						color_cube[button.value] = onClick_color;
						clicks[button.value] = button.value;
						changeOrigCoord(0, 0, 0, 0);
						Redriwing();
						
						
					} // End function mouseClickHandler

						//функция перерисовки
						function Redriwing():void
						{
							ClearingAll();
							DriwingCurve(); 
						}
				
									
			
			
			}//End public function WithDesigner
			
			
			// WithCompany	
	
     	public function WithCompany(container:MovieClip):void
		{
			//==Описание Переменных=======================================================================================
		
			var tweens:Array = []; //храним все твины
			var mySprite:Array = [];//храним спрайты

			//var container:MovieClip=new MovieClip(); // содержит все мувики
			var globalScene:MovieClip=new MovieClip(); //содержит все что на сцене

			var Mybackground:MovieClip = new MovieClip();//background
			var frame:MovieClip = new MovieClip();
			var widget : TextField; // прелоадер текст
			var i:int=0;//счетчик
			var xc:Number;
			var yc:Number;
			
		
			//координаты криволинейного объекта 
			//var xn:Array=[299,347.9,398.9,448.3,497.4,547.8,591.5,647,692.8,293.5,343.5,395.5,454.4,503.9,560.4,603.1,656.6,702.4,753,298,348,399.5,454.4,503.9,552.7,600.1,652.6,703.4,755.2,304,352.5,404.5,459.9,509.3,559.5,605.5,660,704.9,299,349,401,457.3,505,559.5,602.3,655.7,702.5];
			//var yn:Array=[102,92,99.3,89,110.1,110.6,96.3,100.8,109.9,162.8,153.8,159.1,149.9,166.3,168.4,151.1,155.6,163.7,170,226,214.5,218.7,210.1,223.8,225.5,212.1,214.6,223.2,227.5,288,277.1,278.7,274.3,279.1,285.6,273.7,276.3,283.9,350,340.2,342.3,333.7,339.5,343.5,332,336.6,344.2];

			var xn:Array=[282,342,400,460,527,591,657,720,783,847,
						  270,337,394,460,531,594,655,721,784,851,
						  282,342,400,460,525,587,649,715,777,839
						  ];
			
			var yn:Array = [ 518,527,526,531,531,534,530,531,527,532,
							 593,601,597,605,596,600,600,601,593,-4 ,
							 668,673,664,671,662,668,670,668,664,668 
						   ];

			for (var cv:int = 0; cv < yn.length; cv++ )
			{
				trace (768-yn[cv],",")
				}
			
			//координаты прямолинейного объекта
		
			//var xm:Array = [299,361,423,485,547,609,671,733,795,299,361,423,485,547,609,671,733,795,857,299,361,423,485,547,609,671,733,795,857,299,361,423,485,547,609,671,733,795,299,361,423,485,547,609,671,733,795];
            //var ym:Array = [102,102,102,102,102,102,102,102,102,164,164,164,164,164,164,164,164,164,164,226,226,226,226,226,226,226,226,226,226,288,288,288,288,288,288,288,288,288,350,350,350,350,350,350,350,350,350];

			
			//var xm:Array=new Array(167,217,267,317,367,417,467,517,167,217,267,317,367,417,467,517,567,617,167,217,267,317,367,417,467,517,567,617,167,217,267,317,367,417,467,517,567,167,217,267,317,367,417,467,517,167,217,267,317,367,417,467,517,567);
			//var ym:Array=new Array(29,29,29,29,29,29,29,29,79,79,79,79,79,79,79,79,79,79,129,129,129,129,129,129,129,129,129,129,179,179,179,179,179,179,179,179,179,229,229,229,229,229,229,229,229,279,279,279,279,279,279,279,279,279);

			var xOrig:Array=[];
			var yOrig:Array=[];
            var xn_:Array = [];// пересылочные координаты по X
			var yn_:Array = [];// пересылочные координаты по Y
			var clickON:Boolean=false;
			// массив прозрачностей
			var cubeAlpha:Array=[0.6, 0.2, 0.6, 0.2, 0.3, 0.5, 0.4, 0.2,0.5,
								 0.4, 0.1, 0.4, 0.1, 0.2, 0.6, 0.3, 0.1, 0.3,
								 0.3, 0.2, 0.5, 0.2, 0.3, 0.4, 0.2,0.7,0.3,
							 	 0.4, 0.1, 0.3, 0.1, 0.2, 0.5, 0.3, 0.7,0.6]; 
			
			
			var clicks:Array = [];
								 
			var Shadow:DropShadowFilter = new DropShadowFilter(); // фильтр для тени
			var blur:BlurFilter=new BlurFilter();// фильтр размытия

			var Mymatrix:Matrix;// матрица наложения битмапа
			var ArrBitmap:Array = [];//массив битмапов
			var BmpUrl:Array = [];//массив содержит URL больших картинок;
			var currentBmp:int; //при клике на изображение присваиваем номер.
			var thmb:Array=[]; //массив загрузок миниатюр
            var BmpLoader:RootClass;
			//============Переменные для работы с XML
			var my_x:Number;
			var my_y:Number;
			var my_thumb_width:Number;
			var my_thumb_height:Number;
			var my_images:XMLList;
			var my_total:Number;
			var myXMLLoader:URLLoader = new URLLoader();
			
			var _distortImage : DistortImage;//distorsion Image;
			var preloaders_mc:MovieClip;
			var _text:String;
			
			//Переменные для смещения координат от центра
			var xcentr:uint; //Центр X
			var ycentr:uint; //Центр Y
			var shiftX:Array = [];//смещение по X
			var shiftY:Array = [];//смещение по Y
			
			//массив для заливки цветом фигур
			var color_cube:Array = []; //
			var feel_color:uint = 0x00FF00; //цвет заливки
			var outMouse_color:uint = 0xFFFF0D; // цвет при наведении
			var onClick_color:uint = 0xFF0000; // цвет при нажатии
			var lineStyle:Number = 1; //толщина линии
			var lineColor:uint=0x000000; //цвет линии
			
			//==Конец Описания Переменных=======================================================================================
			
						
			//создаем фрейм для загрузки полноформатного изображения
			frame.graphics.beginFill(0x009966, 0.5);
			frame.graphics.lineStyle(0.5,0x000000);
			frame.graphics.drawRect(0, 0, 1024, 768);
			frame.graphics.endFill();
			
			
		    // создаем муви клипы
			for (i=0; i<37; i++) 
			{
				clicks[i] = -1;
				color_cube[i]=feel_color;
				mySprite[i]=new MovieClip();
				mySprite[i].value=i;
				mySprite[i].pressed=true;
			}
		 	//заполняем массив оригинальных координат
			for (i=0; i<xn.length; i++) 
			{
				xOrig[i]=xn[i];
				yOrig[i]=yn[i];
			}

			
			myXMLLoader.load(new URLRequest("gallery.xml"));
			myXMLLoader.addEventListener(Event.COMPLETE, processXML);
			

			function waitLoad(txt:String):void
			{
				//var circle_pb:preload_circle = new preload_circle;
				widget = new TextField();
				widget.text = "Loading please wait... "+txt+"%" ;
				widget.setTextFormat(new TextFormat("Courier New", 14, 0xB4DCF3, false, false, false));
				widget.width = widget.textWidth;
				widget.x = 295;
				widget.y = 201;
				//circle_pb.x = 275;
				//circle_pb.y = 201;
				widget.filters=[Shadow];
				addChild(Mybackground);
				addChild(widget);
				//addChild(circle_pb);
				
				
			}
			function processXML(e:Event):void 
			{
				
			

				var myXML:XML = new XML(e.target.data);

				my_x = myXML.@XPOSITION;
				my_y = myXML.@YPOSITION;
				my_thumb_width = myXML.@WIDTH;
				my_thumb_height = myXML.@HEIGHT;
				my_images = myXML.IMAGE;
				my_total = my_images.length();
				myXMLLoader.removeEventListener(Event.COMPLETE, processXML);
				myXMLLoader = null;
				////trace("XML is load",my_images);
				//CreateContainer();
				
				loadImage();
				
			}


//======================================================

			function loadImage():void
			{  
				waitLoad(_text);
				for(i= 0; i < my_total; i++)
				{
					BmpUrl[i] = my_images[i].@FULL;
					var thumb_url:String = my_images[i].@THUMB;
					thmb[i]= new Loader();
					thmb[i].load(new URLRequest(thumb_url));
					thmb[i].contentLoaderInfo.addEventListener(Event.COMPLETE, onImageLoad);
					
					
					
					/*var preloader_pb:ProgressBar = new ProgressBar();
					preloader_pb.source = thmb[i].contentLoaderInfo;
					
					if((i!=8)&&(i!=18)&&(i!=26)&&(i!=27)&&(i!=28)&&(i!=37))
					{
						preloader_pb.x = xn[i]+10;
						preloader_pb.y = ym[i]+10;
					}
					
					preloader_pb.width = 40;
					preloader_pb.height = 40;
					preloaders_mc.addChild(preloader_pb);
					preloader_pb.addEventListener(Event.COMPLETE, donePb);*/
	
				}
				
			}
			
			
			function donePb(e:Event):void 
			{
				var my_pb:ProgressBar = ProgressBar(e.target);
				preloaders_mc.removeChild(my_pb);
				my_pb.removeEventListener(Event.COMPLETE, donePb);
			}
			
			

			
				// вызываем когда все изображения загружены
			function onImageLoad(e:Event):void
			{
				
				
				for(i= 0; i < my_total; i++)
				{
					
					ArrBitmap[i] = new BitmapData(thmb[i].width,thmb[i].height);
					ArrBitmap[i].draw(thmb[i],new Matrix());
					Mymatrix=new Matrix();
					Mymatrix.scale(1.5, 1.5);
															
				}
					
				    
					
					if (widget.stage)
					{ 
						removeChild(widget); 
						addEventListeners();
						DriwingCurve();
					}
					
			}
			
			// функция создания контейнера			
			function CreateContainer():void 
			{   
				
				//Первый ряд
				linearsNull(mySprite[0],xn[0],yn[0],xn[1],yn[1],xn[9],yn[9],xn[10],yn[10]);
				linearsNull(mySprite[1],xn[1],yn[1],xn[2],yn[2],xn[10],yn[10],xn[11],yn[11]);
			 	linearsNull(mySprite[2],xn[2],yn[2],xn[3],yn[3],xn[11],yn[11],xn[12],yn[12]);
				linearsNull(mySprite[3],xn[3],yn[3],xn[4],yn[4],xn[12],yn[12],xn[13],yn[13]);
				linearsNull(mySprite[4],xn[4],yn[4],xn[5],yn[5],xn[13],yn[13],xn[14],yn[14]);
				linearsNull(mySprite[5],xn[5],yn[5],xn[6],yn[6],xn[14],yn[14],xn[15],yn[15]);
				linearsNull(mySprite[6],xn[6],yn[6],xn[7],yn[7],xn[15],yn[15],xn[16],yn[16]);
				linearsNull(mySprite[7],xn[7],yn[7],xn[8],yn[8],xn[16],yn[16],xn[17],yn[17]);
				//Второй ряд
				linearsNull(mySprite[8],xn[9],yn[9],xn[10],yn[10],xn[19],yn[19],xn[20],yn[20]);
				linearsNull(mySprite[9],xn[10],yn[10],xn[11],yn[11],xn[20],yn[20],xn[21],yn[21]);
				linearsNull(mySprite[10],xn[11],yn[11],xn[12],yn[12],xn[21],yn[21],xn[22],yn[22]);
				linearsNull(mySprite[11],xn[12],yn[12],xn[13],yn[13],xn[22],yn[22],xn[23],yn[23]);
				linearsNull(mySprite[12],xn[13],yn[13],xn[14],yn[14],xn[23],yn[23],xn[24],yn[24]);
				linearsNull(mySprite[13],xn[14],yn[14],xn[15],yn[15],xn[24],yn[24],xn[25],yn[25]);
				linearsNull(mySprite[14],xn[15],yn[15],xn[16],yn[16],xn[25],yn[25],xn[26],yn[26]);
				linearsNull(mySprite[15],xn[16],yn[16],xn[17],yn[17],xn[26],yn[26],xn[27],yn[27]);
				linearsNull(mySprite[16],xn[17],yn[17],xn[18],yn[18],xn[27],yn[27],xn[28],yn[28]);
				//Третий ряд
				linearsNull(mySprite[17],xn[19],yn[19],xn[20],yn[20],xn[29],yn[29],xn[30],yn[30]);
				linearsNull(mySprite[18],xn[20],yn[20],xn[21],yn[21],xn[30],yn[30],xn[31],yn[31]);
				linearsNull(mySprite[19],xn[21],yn[21],xn[22],yn[22],xn[31],yn[31],xn[32],yn[32]);
				linearsNull(mySprite[20],xn[22],yn[22],xn[23],yn[23],xn[32],yn[32],xn[33],yn[33]);
				linearsNull(mySprite[21],xn[23],yn[23],xn[24],yn[24],xn[33],yn[33],xn[34],yn[34]);
				linearsNull(mySprite[22],xn[24],yn[24],xn[25],yn[25],xn[34],yn[34],xn[35],yn[35]);
				linearsNull(mySprite[23],xn[25],yn[25],xn[26],yn[26],xn[35],yn[35],xn[36],yn[36]);
				//Четвертый ряд
				linearsNull(mySprite[24],xn[29],yn[29],xn[30],yn[30],xn[38],yn[38],xn[39],yn[39]);
				linearsNull(mySprite[25],xn[30],yn[30],xn[31],yn[31],xn[39],yn[39],xn[40],yn[40]);
				linearsNull(mySprite[26],xn[31],yn[31],xn[32],yn[32],xn[40],yn[40],xn[41],yn[41]);
				linearsNull(mySprite[27],xn[32],yn[32],xn[33],yn[33],xn[41],yn[41],xn[42],yn[42]);
				linearsNull(mySprite[28],xn[33],yn[33],xn[34],yn[34],xn[42],yn[42],xn[43],yn[43]);
				linearsNull(mySprite[29],xn[34],yn[34],xn[35],yn[35],xn[43],yn[43],xn[44],yn[44]);
				linearsNull(mySprite[30],xn[35],yn[35],xn[36],yn[36],xn[44],yn[44],xn[45],yn[45]);
				linearsNull(mySprite[31],xn[36],yn[36],xn[37],yn[37],xn[45],yn[45],xn[46],yn[46]);
				
				
			}
			  // рисуем основной объект
			function DriwingCurve():void 
			{   
				//Первый ряд
				linears(mySprite[0],xn[0],yn[0],xn[1],yn[1],xn[10],yn[10],xn[11],yn[11],ArrBitmap[0],Mymatrix,color_cube[0],cubeAlpha[0],lineStyle,lineColor);
				linears(mySprite[1],xn[1],yn[1],xn[2],yn[2],xn[11],yn[11],xn[12],yn[12],ArrBitmap[1],Mymatrix,color_cube[1],cubeAlpha[1],lineStyle,lineColor);
			 	linears(mySprite[2],xn[2],yn[2],xn[3],yn[3],xn[12],yn[12],xn[13],yn[13],ArrBitmap[2],Mymatrix,color_cube[2],cubeAlpha[2],lineStyle,lineColor);
				linears(mySprite[3],xn[3],yn[3],xn[4],yn[4],xn[13],yn[13],xn[14],yn[14],ArrBitmap[3],Mymatrix,color_cube[3],cubeAlpha[3],lineStyle,lineColor);
				linears(mySprite[4],xn[4],yn[4],xn[5],yn[5],xn[14],yn[14],xn[15],yn[15],ArrBitmap[4],Mymatrix,color_cube[4],cubeAlpha[4],lineStyle,lineColor);
				linears(mySprite[5],xn[5],yn[5],xn[6],yn[6],xn[15],yn[15],xn[16],yn[16],ArrBitmap[5],Mymatrix,color_cube[5],cubeAlpha[5],lineStyle,lineColor);
				linears(mySprite[6],xn[6],yn[6],xn[7],yn[7],xn[16],yn[16],xn[17],yn[17],ArrBitmap[6],Mymatrix,color_cube[6],cubeAlpha[6],lineStyle,lineColor);
				//linears(mySprite[7],xn[7],yn[7],xn[8],yn[8],xn[17],yn[17],xn[18],yn[18],ArrBitmap[7],Mymatrix,color_cube[7],cubeAlpha[7],lineStyle,lineColor);
				//linears(mySprite[8],xn[8],yn[8],xn[9],yn[9],xn[18],yn[18],xn[19],yn[19],ArrBitmap[8],Mymatrix,color_cube[8],cubeAlpha[8],lineStyle,lineColor);
				//Второй ряд
				linears(mySprite[9],xn[10],yn[10],xn[11],yn[11],xn[20],yn[20],xn[21],yn[21],ArrBitmap[9],Mymatrix,color_cube[9],cubeAlpha[9],lineStyle,lineColor);
				linears(mySprite[10],xn[11],yn[11],xn[12],yn[12],xn[21],yn[21],xn[22],yn[22],ArrBitmap[10],Mymatrix,color_cube[10],cubeAlpha[10],lineStyle,lineColor);
				linears(mySprite[11],xn[12],yn[12],xn[13],yn[13],xn[22],yn[22],xn[23],yn[23],ArrBitmap[11],Mymatrix,color_cube[11],cubeAlpha[11],lineStyle,lineColor);
				linears(mySprite[12],xn[13],yn[13],xn[14],yn[14],xn[23],yn[23],xn[24],yn[24],ArrBitmap[12],Mymatrix,color_cube[12],cubeAlpha[12],lineStyle,lineColor);
				linears(mySprite[13],xn[14],yn[14],xn[15],yn[15],xn[24],yn[24],xn[25],yn[25],ArrBitmap[13],Mymatrix,color_cube[13],cubeAlpha[13],lineStyle,lineColor);
				linears(mySprite[14],xn[15],yn[15],xn[16],yn[16],xn[25],yn[25],xn[26],yn[26],ArrBitmap[14],Mymatrix,color_cube[14],cubeAlpha[14],lineStyle,lineColor);
				linears(mySprite[15],xn[16],yn[16],xn[17],yn[17],xn[26],yn[26],xn[27],yn[27],ArrBitmap[15],Mymatrix,color_cube[15],cubeAlpha[15],lineStyle,lineColor);
				linears(mySprite[16],xn[17],yn[17],xn[18],yn[18],xn[27],yn[27],xn[28],yn[28],ArrBitmap[16],Mymatrix,color_cube[16],cubeAlpha[16],lineStyle,lineColor);
				//linears(mySprite[17],xn[18],yn[18],xn[19],yn[19],xn[28],yn[28],xn[29],yn[29],ArrBitmap[17],Mymatrix,color_cube[17],cubeAlpha[17],lineStyle,lineColor);
				
				//Третий ряд
				/*linears(mySprite[18],xn[20],yn[20],xn[21],yn[21],xn[30],yn[30],xn[31],yn[31],ArrBitmap[18],Mymatrix,color_cube[18],cubeAlpha[18],lineStyle,lineColor);
				linears(mySprite[19],xn[21],yn[21],xn[22],yn[22],xn[31],yn[31],xn[32],yn[32],ArrBitmap[19],Mymatrix,color_cube[19],cubeAlpha[19],lineStyle,lineColor);
				linears(mySprite[20],xn[22],yn[22],xn[23],yn[23],xn[32],yn[32],xn[33],yn[33],ArrBitmap[20],Mymatrix,color_cube[20],cubeAlpha[20],lineStyle,lineColor);
				linears(mySprite[21],xn[23],yn[23],xn[24],yn[24],xn[33],yn[33],xn[34],yn[34],ArrBitmap[21],Mymatrix,color_cube[21],cubeAlpha[21],lineStyle,lineColor);
				linears(mySprite[22],xn[24],yn[24],xn[25],yn[25],xn[34],yn[34],xn[35],yn[35],ArrBitmap[22],Mymatrix,color_cube[22],cubeAlpha[22],lineStyle,lineColor);
				linears(mySprite[23],xn[25],yn[25],xn[26],yn[26],xn[35],yn[35],xn[36],yn[36],ArrBitmap[23],Mymatrix,color_cube[23],cubeAlpha[23],lineStyle,lineColor);
				linears(mySprite[24],xn[26],yn[26],xn[27],yn[27],xn[36],yn[36],xn[37],yn[37],ArrBitmap[24],Mymatrix,color_cube[24],cubeAlpha[24],lineStyle,lineColor);
				//linears(mySprite[25],xn[27],yn[27],xn[28],yn[28],xn[37],yn[37],xn[38],yn[38],ArrBitmap[25],Mymatrix,color_cube[25],cubeAlpha[25],lineStyle,lineColor);
				//linears(mySprite[26],xn[28],yn[28],xn[29],yn[29],xn[38],yn[38],xn[39],yn[39],ArrBitmap[26],Mymatrix,color_cube[26],cubeAlpha[26],lineStyle,lineColor);
				//Четвертый ряд
				linears(mySprite[27],xn[30],yn[30],xn[31],yn[31],xn[40],yn[40],xn[41],yn[41],ArrBitmap[27],Mymatrix,color_cube[27],cubeAlpha[27],lineStyle,lineColor);
				linears(mySprite[28],xn[31],yn[31],xn[32],yn[32],xn[41],yn[41],xn[42],yn[42],ArrBitmap[28],Mymatrix,color_cube[28],cubeAlpha[28],lineStyle,lineColor);
				linears(mySprite[29],xn[32],yn[32],xn[33],yn[33],xn[42],yn[42],xn[43],yn[43],ArrBitmap[29],Mymatrix,color_cube[29],cubeAlpha[29],lineStyle,lineColor);
				linears(mySprite[30],xn[33],yn[33],xn[34],yn[34],xn[43],yn[43],xn[44],yn[44],ArrBitmap[30],Mymatrix,color_cube[30],cubeAlpha[30],lineStyle,lineColor);
				linears(mySprite[31],xn[34],yn[34],xn[35],yn[35],xn[44],yn[44],xn[45],yn[45],ArrBitmap[31],Mymatrix,color_cube[31],cubeAlpha[31],lineStyle,lineColor);
				linears(mySprite[32],xn[35],yn[35],xn[36],yn[36],xn[45],yn[45],xn[46],yn[46],ArrBitmap[32],Mymatrix,color_cube[32],cubeAlpha[32],lineStyle,lineColor);
				linears(mySprite[33],xn[36],yn[36],xn[37],yn[37],xn[46],yn[46],xn[47],yn[47],ArrBitmap[33],Mymatrix,color_cube[33],cubeAlpha[33],lineStyle,lineColor);
				linears(mySprite[34],xn[37],yn[37],xn[38],yn[38],xn[47],yn[47],xn[48],yn[48],ArrBitmap[34],Mymatrix,color_cube[34],cubeAlpha[34],lineStyle,lineColor);
				//linears(mySprite[35],xn[38],yn[38],xn[39],yn[39],xn[48],yn[48],xn[49],yn[49],ArrBitmap[35],Mymatrix,color_cube[35],cubeAlpha[35],lineStyle,lineColor);
				*/
				
			} // конец функции DriwingCurve
			
			
			
			// рисуем по точкам каждый объект
			function linears(obj:MovieClip,x1:Number,y1:Number,x2:Number,y2:Number,
							x3:Number, y3:Number, x4:Number, y4:Number, bmp:BitmapData,
							mtrx:Matrix, obj_color:uint,
							obj_alpha:Number,obj_lineStyle:Number,obj_lineColor:uint):void 
				{
				   	
			      
			
					//_distortImage = new DistortImage(bmp);
					//_distortImage.setTransform(x1, y1, x2, y2, x4, y4,x3,y3);
					//_distortImage.buttonMode = true;
					//addChild(_distortImage);
					
					/*var w:TextField = new TextField();
					w.text = String(x1) ;
					w.setTextFormat(new TextFormat("Courier New", 10, 0x000000, false, false, false));
					w.background = true;
					w.width = w.textWidth;
					w.height = w.textHeight;
					w.x = x1;
					w.y = y1;*/
					
					
					//заливаем битмапом
					
					obj.graphics.beginBitmapFill(bmp,mtrx);
					obj.graphics.lineStyle(obj_lineStyle,obj_lineColor);
					obj.graphics.moveTo(x1,y1);
					obj.graphics.lineTo(x1,y1);
					obj.graphics.lineTo(x2,y2);
					obj.graphics.lineTo(x4,y4);
					obj.graphics.lineTo(x3,y3);
					obj.graphics.lineTo(x1,y1);
					obj.graphics.endFill();
					obj.buttonMode=true;
					
			        
					//===========Затеняем
					obj.graphics.beginFill(obj_color,obj_alpha);
					obj.graphics.lineStyle(obj_lineStyle,obj_lineColor);
					obj.graphics.moveTo(x1,y1);
					//obj.graphics.moveTo(x4,y4);//пересечение
					obj.graphics.lineTo(x1,y1);
					obj.graphics.lineTo(x2,y2);
					//obj.graphics.lineTo(x3,y3);//пересечение
					obj.graphics.lineTo(x4,y4);
					obj.graphics.lineTo(x3,y3);
					obj.graphics.lineTo(x1,y1);
					obj.graphics.endFill();
					obj.buttonMode=true;
	                obj.cacheAsBitmap;
					
					
					//Mybackground.graphics.beginFill(0x3399CC, 1);
					//Mybackground.graphics.drawRect(0, 0, 768, 768);
					//Mybackground.graphics.endFill();
					//globalScene.addChild(Mybackground);
					//container.filters = [Shadow];
					//container.x=-100;
					//container.y=-10;
					//container.scaleX=1;
					//container.scaleY=1;
					//container.addChild(_distortImage);
					//container.addChild(_distortImage);
					
					//if (!_distortImage.stage)
					//{
					// container.addChild(_distortImage);
					//}
					
				/*	if (!w.stage)
					{
						
						container.addChild(w);
						
					}*/
					
					
					if (!obj.stage)
					{
						
						container.addChild(obj);
						//trace("проверка Obj",obj.name);
					}
					if (!container.stage)
					{
						//trace("проверка Container");
						globalScene.addChild(container);
					}
					if (!globalScene.stage)
					{
						//trace("проверка Global");
						addChild(globalScene);
					}
						
					if (clickON)
					{
					    
						//addFrame();
					}
					
				}
			
				function linearsNull(obj:MovieClip,x1:Number,y1:Number,x2:Number,y2:Number,
							x3:Number, y3:Number, x4:Number, y4:Number):void 
				{
					
			
			         //===========Затеняем
					obj.graphics.beginFill(0x89b462,0.2);
					obj.graphics.lineStyle(2,0xFFFFFF);
					obj.graphics.moveTo(x1,y1);
					obj.graphics.lineTo(x1,y1);
					obj.graphics.lineTo(x2,y2);
					obj.graphics.lineTo(x4,y4);
					obj.graphics.lineTo(x3,y3);
					obj.graphics.lineTo(x1,y1);
					obj.graphics.endFill();
					
	                										
					container.addChild(obj);
					globalScene.addChild(container);
					if (!globalScene.stage)
					{
						
						addChild(globalScene);
					}
					preloaders_mc = new MovieClip();
					preloaders_mc.x = obj.x;
					preloaders_mc.y = obj.y;
					addChild(preloaders_mc);
	
					
				}
			
				function addFrame():void
				{
					
					removeEventListeners();
					container.filters=null;
					xc=globalScene.x-mouseX*24-mouseX/300+container.width/2;
					yc=globalScene.y-mouseY*24-mouseY/300+container.height/2;
			
					/*var tweenX:Tween = new Tween(globalScene, "scaleX", Regular.easeOut,1, 25, 1, true);
	
					var tweenY :Tween = new Tween(globalScene, "scaleY", Regular.easeOut, 1, 25, 1, true);

					var tweenXc:Tween = new Tween(globalScene, "x", Regular.easeOut, 1, xc, 1, true);
					
					var tweenYc :Tween = new Tween(globalScene, "y", Regular.easeOut, 1, yc, 1, true);
	
					var tweenA :Tween = new Tween(container, "alpha", Regular.easeOut, 1, 0.1, 1, true);
					
		  			//Добавляем твины в массив
					tweens.push(tweenXc);
					tweens.push(tweenYc);
					tweens.push(tweenX);
					tweens.push(tweenY);
					tweens.push(tweenA);
					tweenXc.addEventListener(TweenEvent.MOTION_FINISH, scaleUpFinished);*/
					//trace("FRAME_X_Y= ",frame.x,frame.y)					
					frame.buttonMode=true;
					frame.addChild(BmpLoader);
					addChild(frame);
					//Добавляем обработчики mouse click  
					frame.addEventListener(MouseEvent.CLICK, mouseClickFrame); 
					
				}
	
	
				function scaleUpFinished(e:Event):void 
				{
					//trace("FRAME_X_Y= ",frame.x,frame.y)					
					frame.buttonMode=true;
					frame.addChild(BmpLoader);
					addChild(frame);
										
					//Добавляем обработчики mouse click  
					frame.addEventListener(MouseEvent.CLICK, mouseClickFrame); 
				}
	
				function mouseClickFrame(e:MouseEvent):void 
				{
					
					//trace("Bmpurl= ",BmpUrl[currentBmp]);
					removeChild(frame);
					frame.removeChild(BmpLoader);
					container.filters =null;
					var tweenX:Tween = new Tween(globalScene, "scaleX", Regular.easeOut,25, 1, 1, true);
					var tweenY :Tween = new Tween(globalScene, "scaleY", Regular.easeOut, 25, 1, 1, true);
					var tweenXc:Tween = new Tween(globalScene, "x", Regular.easeOut, xc, 0, 1, true);
					var tweenYc :Tween = new Tween(globalScene, "y", Regular.easeOut, yc, 0, 1, true);
					var tweenA :Tween = new Tween(container, "alpha", Regular.easeOut, 0.1, 1, 1, true);

					//Добавляем твины в массив
					tweens.push(tweenXc);
					tweens.push(tweenYc);
					tweens.push(tweenX);
					tweens.push(tweenY);
					tweens.push(tweenA);
					tweenXc.addEventListener(TweenEvent.MOTION_FINISH, scaleDownFinished);
				}
				function scaleDownFinished(e:Event):void 
				{
					addEventListeners();
					clickON=false;
					Redriwing();
				}
				
				// возвращаем оригинальные координаты
				function getOrigCoord():void 
				{
					for (var i:int=0; i<xn.length; i++) 
					{
						xn[i]=xOrig[i];
						yn[i]=yOrig[i];
					}
				}
			
				 // очищаем экран
				function ClearingAll():void 
				{
					for (i = 0; i < 37; i++) 
					{
						mySprite[i].graphics.clear();
						
					}
				}

					//добавляем обработчики событий, для каждого объекта
				function addEventListeners():void 
				{
					for(i=0;i<37;i++)
					{  
					//Добавляем обработчики mouse over  для каждой кнопки
					mySprite[i].addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
					//Добавляем обработчики mouse out  для каждой кнопки
					mySprite[i].addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
					//Добавляем обработчики mouse click   для каждой кнопки
					mySprite[i].addEventListener(MouseEvent.CLICK, mouseClickHandler); 
					}
				}

					//удаляем обработчики событий у каждого объекта
				function removeEventListeners():void 
				{
					for(i=0;i<37;i++)
					{ 
					//Добавляем обработчики mouse over   для каждой кнопки
					mySprite[i].removeEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
					//Добавляем обработчики mouse out  для каждой кнопки
					mySprite[i].removeEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
					//Добавляем обработчики mouse click   для каждой кнопки
					mySprite[i].removeEventListener(MouseEvent.CLICK, mouseClickHandler); 
					}
				}
				
				// функция смены координат
				
				function changeCoord(a:int,b:int,c:int,d:int,ncube:int):void
				{
					
					//находим центры	
					 xcentr = (xn[a] + xn[b] + xn[c] + xn[d]) / 4;
					 ycentr = (yn[a] + yn[b] + yn[c] + yn[d]) / 4;
					
					var shiftX_old:Array = [];
					var shiftY_old:Array = [];
					
					const delta1:Number = 0.66; 
					const delta2:Number = 0.25;
					var width_cub:uint = 75; 
					var A:int = 0;
					var B:int = 0;
					var C:int = 0;
					var D:int = 0;
					var shf:int = 1;
					
					
					shiftX_old[1] = xn[a];
					shiftX_old[2] = xn[b];
					shiftX_old[3] = xn[c];
					shiftX_old[4] = xn[d];
					
					shiftY_old[1] = yn[a];
					shiftY_old[2] = yn[b];
					shiftY_old[3] = yn[c];
					shiftY_old[4] = yn[d];
					
					
					
									
					//рисуем квадрат от центра				
					xn[a] = xcentr - width_cub/2; yn[a] = ycentr - width_cub/2;
					xn[b] = xcentr + width_cub/2; yn[b] = ycentr - width_cub/2;
					xn[c] = xcentr - width_cub/2; yn[c] = ycentr + width_cub/2;
					xn[d] = xcentr + width_cub/2; yn[d] = ycentr + width_cub/2;
					
					// смещение по X
					shiftX[1] = shiftX_old[1] - xn[a];
					shiftX[2] = shiftX_old[2] - xn[b];
					shiftX[3] = shiftX_old[3] - xn[c];
					shiftX[4] = shiftX_old[4] - xn[d];
					// смещение по Y
					shiftY[1] = shiftY_old[1] - yn[a];
					shiftY[2] = shiftY_old[2] - yn[b];
					shiftY[3] = shiftY_old[3] - yn[c];
					shiftY[4] = shiftY_old[4] - yn[d];
					
					
					
					//trace("xcentr= ",xcentr)
					//trace("mousex= ",mouseX)
					
					
					
					
					
					//============================GLOBAL BRAIN FUCKING ===================================
					
					//проверка по квадратам
					
					/*for (var count:int = 0; count <= 37; count++ )
					{
						if (clicks[count] == 1)
						{
							trace("click", count, "= 1");
						}
					}*/
					
					
					for (var cont:int = 0; cont <= 35; cont++ )
						{
							if ((clicks[cont] >= 0)&&(ncube+shf==clicks[cont]))
							{
								  trace(" справа нажат квадрат ", clicks[cont]);	
								shf++;
								
								/*A = clicks[cont] ;
								B = clicks[cont] +1;
								C = clicks[cont]+10;
								D = clicks[cont] + 11;*/
								//changeCoord(A, B, C, D);
							}
							
						}
					
					// проверка сверху
					if (((a>=0)&&(a<=9)))
					{
						//trace("сверху ничего нет");
					}
					else if ((a>=10)&&(a<=19))
					{
					   
						xn[a-10]-=shiftX[1]*delta1;
						yn[a-10]-=shiftY[1]*delta1;   
						xn[b-10]-=shiftX[2]*delta1;
						yn[b-10]-=shiftY[2]*delta1;
						
						
						//trace("Сверху один квадрат");	
					}
					
					else if ((a>=20)&&(a<=39))
					{
						xn[a-10]-=shiftX[1]*delta1;
						yn[a-10]-=shiftY[1]*delta1;   
						
						xn[b-10]-=shiftX[2]*delta1;
						yn[b-10]-=shiftY[2]*delta1;
						
						xn[a-20]-=shiftX[1]*delta2;
						yn[a-20]-=shiftY[1]*delta2;   
						
						xn[b-20]-=shiftX[2]*delta2;
						yn[b-20]-=shiftY[2]*delta2;
						//trace("сверху два квадрата")
					}
										
					// проверка справа
					if ((b==9)||(b==19)||(b==29)||(b==39))
					{
						//trace("справа ничего нет");
					}
					else if ((b==8)||(b==18)||(b==28)||(b==38))
					{
					    
						xn[b+1]-=shiftX[2]*delta1;
						yn[b+1]-=shiftY[2]*delta1;   
						xn[d+1]-=shiftX[4]*delta1;
						yn[d+1]-=shiftY[4]*delta1;
						//trace("справа один квадрат");	
					}
					else if ((((b>=0)&&(b<=7))) || (((b>=10)&&(b<=17))) || (((b>=20)&&(b<=27))) || (((b>=30)&&(b<=37))))
					{
						xn[b+1]-=shiftX[2]*delta1;
						yn[b+1]-=shiftY[2]*delta1;   
						xn[d+1]-=shiftX[4]*delta1;
						yn[d+1]-=shiftY[4]*delta1;
						
						xn[b+2]-=shiftX[2]*delta2;
						yn[b+2]-=shiftY[2]*delta2;   
						xn[d+2]-=shiftX[4]*delta2;
						yn[d+2]-=shiftY[4]*delta2;
						//trace("справа два квадрата")
					}
					
					
					// проверка слева
					if ((c==10)||(c==20)||(c==30)||(c==40))
					{
						//trace("слева ничего нет");
					}
					else if ((c==11)||(c==21)||(c==31)||(c==41))
					{
						xn[a-1]-=shiftX[1]*delta1;
						yn[a-1]-=shiftY[3]*delta1;   
						xn[c-1]-=shiftX[1]*delta1;
						yn[c-1]-=shiftY[3]*delta1;
						
						
						//trace("слева один квадрат");	
					}
					else if ((((c>=12)&&(c<=19))) || (((c>=22)&&(c<=29))) || (((c>=32)&&(c<=39))) || (((c>=42)&&(c<=49))))
					{
						xn[a-1]-=shiftX[1]*delta1;
						yn[a-1]-=shiftY[3]*delta1;   
						xn[c-1]-=shiftX[1]*delta1;
						yn[c-1]-=shiftY[3]*delta1;
						
						xn[a-2]-=shiftX[1]*delta2;
						yn[a-2]-=shiftY[3]*delta2;   
						xn[c-2]-=shiftX[1]*delta2;
						yn[c-2]-=shiftY[3]*delta2;
						

						//trace("слева два квадрата")
					}
					
					// проверка снизу
					if (((d>=41)&&(d<=49)))
					{
						//trace("снизу ничего нет");
					}
					else if ((d>=31)&&(d<=39))
					{
					    xn[c+10]-=shiftX[3]*delta1;
						yn[c+10]+=shiftY[4]*delta1;   
						xn[d+10]+=shiftX[3]*delta1;
						yn[d+10]-=shiftY[4]*delta1;
						
						//trace("снизу один квадрат");	
					}
					
					else if ((d>=11)&&(d<=29))
					{
						xn[c+10]-=shiftX[3]*delta1;
						yn[c+10]+=shiftY[4]*delta1;   
						xn[d+10]+=shiftX[3]*delta1;
						yn[d+10]-=shiftY[4]*delta1;
						
						xn[c+20]-=shiftX[3]*delta2;
						yn[c+20]+=shiftY[4]*delta2;   
						xn[d+20]+=shiftX[3]*delta2;
						yn[d+20]-=shiftY[4]*delta2;
						//trace("снизу два квадрата")
					}
					
					// проверка  диагоналей ==============================
					
					// проверка левой верхней диагонали
					
					
					if (!(((a>=0)&&(a<=9))||(a==10)||(a==20)||(a==30)))
					{
						
						xn[a-11]-=shiftX[1]*delta2;
						yn[a - 11] -= shiftY[1]*delta2;
						//trace("слева сверху по диагонали что-то видно");
					}
					else 
					{
					  // trace("по диагонали нет ничего");	
					}
					
					
					// проверка правой верхней диагонали
					
					if (!(((b==9)||(b==19)||(b==29)||(b==39))||(((a>=0)&&(a<=9)))))
					{
						
							xn[b-9]-=shiftX[2]*delta2;
						    yn[b-9]-=shiftY[2]*delta2;
												
						//trace("справа сверху по диагонали что-то видно");
					}
					else 
					{
					   //trace("справа сверху по диагонали нет ничего");	
					}
					
					// проверка правой нижней диагонали
					if (!((((d>=40)&&(d<=49))||(b==9)||(b==19)||(b==29)||(b==39))))
					{
							xn[d+11]-=shiftX[4]*delta2;
						    yn[d+11]-=shiftY[4]*delta2;
						
						//trace("справа снизу что-то есть");
					}
					else 
					{
					   //trace("справа снизу по диагонали нет ничего");	
					}
					// проверка левой нижней диагонали
					
					if (!(((c==10)||(c==20)||(c==30)||(c==40))||(((d>=40)&&(d<=49)))))
					{
							xn[c+9]-=shiftX[3]*delta2;
						    yn[c+9]-=shiftY[3]*delta2;
						//trace("слева снизу по диагонали что-то  есть");
					}
					else 
					{
					   //trace("слева снизу по диагонали нет ничего");	
					}
				     
					 for (var _count:int = 0; _count <= xn.length;_count++ )
					 {
						xn_[_count] = xn[_count];
						yn_[_count] = yn[_count];
					 }
					 
					
					 
					
				}// end function  ChangeCoord
				
				
				
								
				// функция смены оригинальных координат
				function changeOrigCoord(a:int,b:int,c:int,d:int):void
				{
					
					for (var _count:int = 0; _count < xn.length;_count++ )
					{
						xOrig[_count] = xn_[_count];
						yOrig[_count] = yn_[_count];
					}
				}
				
				// это вызывается когда мышь наведена
				function mouseOverHandler(e:MouseEvent):void 
				{
					//Получаем кнопку из события
					var button:MovieClip = e.target as MovieClip;
					//trace(color_cube[button.value]);
					button.alpha=0.7;
					//trace("clicks= ", clicks[button.value]);
					
					
					if ((button==mySprite[0])&&(mySprite[0].pressed))
					{
						color_cube[0]=outMouse_color;
						//trace(button.value);
						//trace(button.pressed);
						getOrigCoord();
												
						changeCoord(0,1,10,11,0);
						Redriwing();
					} 
					else if ((button == mySprite[1])&&(mySprite[1].pressed))
					{
						//trace(button.value);
						//trace(button.pressed);
						getOrigCoord();
						color_cube[1]=outMouse_color;
						
						
						changeCoord(1,2,11,12,1);
						Redriwing();
					} 
					else if ((button == mySprite[2])&&(mySprite[2].pressed)) 
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[2]=outMouse_color;
						changeCoord(2,3,12,13,2);
						Redriwing();
					} 
					else if ((button == mySprite[3])&&(mySprite[3].pressed)) 
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[3]=outMouse_color;
						changeCoord(3,4,13,14,3);
						Redriwing();
					} 
					else if ((button == mySprite[4])&&(mySprite[4].pressed)) 
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[4]=outMouse_color;
						changeCoord(4,5,14,15,4);
						Redriwing();
					}			 
					else if ((button == mySprite[5]) &&(mySprite[5].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[5]=outMouse_color;
						changeCoord(5,6,15,16,5);
						Redriwing();
					} 
					else if ((button == mySprite[6]) &&(mySprite[6].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[6]=outMouse_color;
						changeCoord(6,7,16,17,6);
						Redriwing();
					}
					else if ((button == mySprite[7]) &&(mySprite[7].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[7]=outMouse_color;
						changeCoord(7,8,17,18,7);
						Redriwing();
					} 
					else if ((button == mySprite[8]) &&(mySprite[8].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[8]=outMouse_color;
						changeCoord(8,9,18,19,8);
						Redriwing();
					} 
					else if ((button == mySprite[9]) &&(mySprite[9].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[9]=outMouse_color;
						changeCoord(10,11,20,21,9);
						Redriwing();
					} 
					else if ((button == mySprite[10]) &&(mySprite[10].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[10]=outMouse_color;
						changeCoord(11,12,21,22,10);
						Redriwing();
					}
					else if ((button == mySprite[11]) &&(mySprite[11].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[11]=outMouse_color;
						changeCoord(12,13,22,23,11);
						Redriwing();
					}
					else if ((button == mySprite[12]) &&(mySprite[12].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[12]=outMouse_color;
						changeCoord(13,14,23,24,12);
						Redriwing();
					}
					else if ((button == mySprite[13]) &&(mySprite[13].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[13]=outMouse_color;
						changeCoord(14,15,24,25,13);
						Redriwing();
					}
					else if ((button == mySprite[14]) &&(mySprite[14].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[14]=outMouse_color;
						changeCoord(15,16,25,26,14);
						Redriwing();
					}
					else if ((button == mySprite[15]) &&(mySprite[15].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[15]=outMouse_color;
						changeCoord(16,17,26,27,15);
						Redriwing();
					}
					else if ((button == mySprite[16]) &&(mySprite[16].pressed))
					{	
						//trace(button.value);
						getOrigCoord();
						color_cube[16]=outMouse_color;
						changeCoord(17,18,27,28,16);
						Redriwing();
					}
					else if ((button == mySprite[17]) &&(mySprite[17].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[17]=outMouse_color;
						changeCoord(18,19,28,29,17);
						Redriwing();
					}
					else if ((button == mySprite[18]) &&(mySprite[18].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[18]=outMouse_color;
						changeCoord(20,21,30,31,18);
						Redriwing();
					}
					else if ((button == mySprite[19]) &&(mySprite[19].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[19]=outMouse_color;
						changeCoord(21,22,31,32,19);
						Redriwing();
					}
					else if ((button == mySprite[20]) &&(mySprite[20].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[20]=outMouse_color;
						changeCoord(22,23,32,33,20);
						Redriwing();
					}
					else if ((button == mySprite[21]) &&(mySprite[21].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[21]=outMouse_color;
						changeCoord(23,24,33,34,21);
						Redriwing();
					}
					else if ((button == mySprite[22]) &&(mySprite[22].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[22]=outMouse_color;
						changeCoord(24,25,34,35,22);
						Redriwing();
					}
					else if ((button == mySprite[23]) &&(mySprite[23].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[23]=outMouse_color;
						changeCoord(25,26,35,36,23);
						Redriwing();
					}
					else if ((button == mySprite[24]) &&(mySprite[24].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[24]=outMouse_color;
						changeCoord(26,27,36,37,24);
						Redriwing();
					}
					else if ((button == mySprite[25]) &&(mySprite[25].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[25]=outMouse_color;
						changeCoord(27,28,37,38,25);
						Redriwing();
					}
	
					else if ((button == mySprite[26]) &&(mySprite[26].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[26]=outMouse_color;
						changeCoord(28,29,38,39,26);
						Redriwing();
					}
					else if ((button == mySprite[27])&&(mySprite[27].pressed)) 
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[27]=outMouse_color;
						changeCoord(30,31,40,41,27);
						Redriwing();
					}
					else if ((button == mySprite[28]) &&(mySprite[28].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[28]=outMouse_color;
						changeCoord(31,32,41,42,28);
						Redriwing();
					}
					else if ((button == mySprite[29]) &&(mySprite[29].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[29]=outMouse_color;
						changeCoord(32,33,42,43,29);
						Redriwing();
					}
					else if ((button == mySprite[30]) &&(mySprite[30].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[30]=outMouse_color;
						changeCoord(33,34,43,44,30);
						Redriwing();
					}
					else if ((button == mySprite[31]) &&(mySprite[31].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[31]=outMouse_color;
						changeCoord(34,35,44,45,31);
						Redriwing();
					}
					else if ((button == mySprite[32]) &&(mySprite[32].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[32]=outMouse_color;
						changeCoord(35,36,45,46,32);
						Redriwing();
					}
					else if ((button == mySprite[33]) &&(mySprite[33].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[33]=outMouse_color;
						changeCoord(36,37,46,47,33);
						Redriwing();
					}
					else if ((button == mySprite[34]) &&(mySprite[34].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[34]=outMouse_color;
						changeCoord(37,38,47,48,34);
						Redriwing();
					}
					else if ((button == mySprite[35]) &&(mySprite[35].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[35]=outMouse_color;
						changeCoord(38,39,48,49,35);
						Redriwing();
					}
		
				} // End Function MouseOverHandler

					//Это вызывается, когда мышь выходит за границы кнопки
					function mouseOutHandler(e:MouseEvent):void 
					{
												
						getOrigCoord();
						Redriwing();
						//Получаем кнопку из события
						var button:MovieClip = e.target as MovieClip;
						//100% прозрачность
						button.alpha = 1;
						if (button.pressed)
						{
							color_cube[button.value] = feel_color;	
						}
						
					}

					//Это вызывается, когда мышкой кликнули по кнопке
					function mouseClickHandler(e:MouseEvent):void 
					{
						
						clickON=true;
						//trace("Pressed");
						var button:MovieClip = e.target as MovieClip;
						button.pressed = false;
						BmpLoader = new RootClass;
						BmpLoader.loadadres(BmpUrl[button.value]); 
						color_cube[button.value] = onClick_color;
						clicks[button.value] = button.value;
						changeOrigCoord(0, 0, 0, 0);
						Redriwing();
						
						
					} // End function mouseClickHandler

						//функция перерисовки
						function Redriwing():void
						{
							ClearingAll();
							DriwingCurve(); 
						}
				
									
			
			
			}//End public function WithCompany
   
   } //End Public Class Main
	
   } //End Package