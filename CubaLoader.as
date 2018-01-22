package 
{
	import flash.display.Sprite;
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.events.*;
	import flash.geom.Point;
	/**
	 * ...
	 * @author ziplex
	 */
	public class CubaLoader extends Sprite 
	{
		/**
		 * 
		 * @param	obj объект для отрисовки
		 * @param	etap - этап загрузки
		 */
		public function Preload(obj:Sprite,etap:int):void
		{
			// точки для отрисовки линий
			var line1:Point = new Point(0, 0);
			var line2:Point = new Point(0, 0);
			var line3:Point = new Point(0, 0);
			var line4:Point = new Point(0, 0);
			/**
			 *  таймлайн для рисования начальной анимации
			 */
			var timelinePreload:TimelineLite = new TimelineLite({onComplete:onPreloadComplete,onReverseComplete:onPreloadComplete});
			/**
			*  координаты канвы X
			*/
			var canvas_x:Array = [0,-36,36,36,-36];
			/**
			 *  координаты канвы Y
			 */
			var canvas_y:Array = [0, -36, -36, 36, 36];
			
			//задержки
			var delay1:Number=  1;
			var delay1_1:Number=  0.5;
			var delay1_2:Number=  0.7;
			
			/**
			 * первая полоса загрузки
			 */
			var rect1:Sprite = new Sprite();
			
			/**
			 * 2 полоса загрузки
			 */
			var rect2:Sprite = new Sprite();
			
			/**
			 * 3 полоса загрузки
			 */
			var rect3:Sprite = new Sprite();
			
			/**
			 * 4 полоса загрузки
			 */
			var rect4:Sprite = new Sprite();
			
			/**
			 * 5 полоса загрузки
			 */
			var rect5:Sprite = new Sprite();
			
			/**
			 * 6 полоса загрузки
			 */
			var rect6:Sprite = new Sprite();
			
			/**
			 * 7 полоса загрузки
			 */
			var rect7:Sprite = new Sprite();
			
			/**
			 * 8 полоса загрузки
			 */
			var rect8:Sprite = new Sprite();
			/**
			 * каркас квадрата, отобразим его когда все загружено.
			 */
			var rectBasic:Sprite = new Sprite();
			
			rectBasic.graphics.lineStyle(2, 0xFFFFFF, 1, false, "normal", "none", "miter", 3);
			rectBasic.graphics.drawRect(-36, -36, 72, 72);
			rectBasic.graphics.endFill();
			
			
			
			//рисуем полоски загрузки
			function DrawLoadLines(rect:Sprite):void 
			{
				rect.graphics.lineStyle(1, 0xFFFFFF, 1, false, "normal", "none", "miter", 3);
				rect.graphics.beginFill(0xFFFFFF,1)
				rect.graphics.drawRect(-36, 0, 72, 9);
				rect.graphics.endFill();
				obj.addChild(rect);
			}
			//делаем полоски прозрачными, размещаем их по порядку и рисуем..
			rect1.alpha = 0;
			rect2.alpha = 0;
			rect3.alpha = 0;
			rect4.alpha = 0;
			rect5.alpha = 0;
			rect6.alpha = 0;
			rect7.alpha = 0;
			rect8.alpha = 0;
			rect1.y = 27;
			rect2.y = 18;
			rect3.y = 9;
			rect4.y = 0;
			rect5.y = -9;
			rect6.y = -18;
			rect7.y = -27;
			rect8.y = -36;
			DrawLoadLines(rect1);
			DrawLoadLines(rect2);
			DrawLoadLines(rect3);
			DrawLoadLines(rect4);
			DrawLoadLines(rect5);
			DrawLoadLines(rect6);
			DrawLoadLines(rect7);
			DrawLoadLines(rect8);
			
			
			//размещаем объект по центру
			obj.x =  1024/ 2;
			obj.y = 768 / 2;
			
			//функция рисования квадратика
			function DrawObj():void 
				{
				  obj.graphics.clear();
				  obj.graphics.lineStyle(2,0xFFFFFF,1,false,"normal","none","miter",3);
				  obj.graphics.moveTo(line1.x, line1.y);
				  obj.graphics.lineTo(line2.x, line2.y);
				  obj.graphics.lineTo(line3.x, line3.y);
				  obj.graphics.lineTo(line4.x, line4.y);
				  obj.graphics.lineTo(line1.x, line1.y);
				  obj.graphics.endFill();
				  
				}
			
			//рисуем канву твинами
			//фон разворачивается по горизонтали
			timelinePreload.appendMultiple
			([
						
				new TweenLite(line1, delay1_1, { x:canvas_x[1], y:canvas_y[0] }),
				new TweenLite(line2, delay1_1, { x:canvas_x[2], y:canvas_y[0] }),
				new TweenLite(line3, delay1_1, { x:canvas_x[3], y:canvas_y[0] }),
				new TweenLite(line4, delay1_1, { x:canvas_x[4], y:canvas_y[0] } ),
														 ], 0, TweenAlign.START);
				//фон разворачивается по вертикали
				timelinePreload.appendMultiple
					([
							
					new TweenLite(line1, delay1_2, { x:canvas_x[1], y:canvas_y[1] }),
					new TweenLite(line2, delay1_2, { x:canvas_x[2], y:canvas_y[2] }),
					new TweenLite(line3, delay1_2, { x:canvas_x[3], y:canvas_y[3] }),
					new TweenLite(line4, delay1_2, { x:canvas_x[4], y:canvas_y[4] } ),
															], 0, TweenAlign.START);
															
															
				timelinePreload.stop();	
				//если этап1 - разворачиваем квадрат
				if (etap == 1)
				{
					timelinePreload.play();
					addEventListener(Event.ENTER_FRAME, onR);
				}
				//если этап второй квадрат уже развернут, мигает полоса 1
				else if (etap == 2)
				{
					obj.addChild(rectBasic);
					var timelinerect1:TimelineLite = new TimelineLite({onComplete:onRect1Complete,onReverseComplete:onRect1Reverse});
					timelinerect1.append(new TweenLite(rect1, 0.5, { alpha:1 } ));
					function onRect1Complete():void 
					{
						timelinerect1.reverse();
					}
					function onRect1Reverse():void 
					{
						timelinerect1.play();
					}
				}
				//если этап 3 квадрат уже развернут, мигает полоса 2
				else if (etap == 3)
				{
					rect1.alpha = 1;
					obj.addChild(rectBasic);
					var timelinerect2:TimelineLite = new TimelineLite({onComplete:onRect2Complete,onReverseComplete:onRect2Reverse});
					timelinerect2.append(new TweenLite(rect2, 0.5, { alpha:1 } ));
					function onRect2Complete():void 
					{
						timelinerect2.reverse();
					}
					function onRect2Reverse():void 
					{
						timelinerect2.play();
					}
				}
				//если этап 4 квадрат уже развернут, мигает полоса 3
				else if (etap == 4)
				{
					rect1.alpha = 1;
					rect2.alpha = 1;
					obj.addChild(rectBasic);
					var timelinerect3:TimelineLite = new TimelineLite({onComplete:onRect3Complete,onReverseComplete:onRect3Reverse});
					timelinerect3.append(new TweenLite(rect3, 0.5, { alpha:1 } ));
					function onRect3Complete():void 
					{
						timelinerect3.reverse();
					}
					function onRect3Reverse():void 
					{
						timelinerect3.play();
					}
				}
				//если этап 5 квадрат уже развернут, мигает полоса 4
				else if (etap == 5)
				{
					rect1.alpha = 1;
					rect2.alpha = 1;
					rect3.alpha = 1;
					obj.addChild(rectBasic);
					var timelinerect4:TimelineLite = new TimelineLite({onComplete:onRect4Complete,onReverseComplete:onRect4Reverse});
					timelinerect4.append(new TweenLite(rect4, 0.5, { alpha:1 } ));
					function onRect4Complete():void 
					{
						timelinerect4.reverse();
					}
					function onRect4Reverse():void 
					{
						timelinerect4.play();
					}
				}
				//если этап 6 квадрат уже развернут, мигает полоса 5
				else if (etap == 6)
				{
					rect1.alpha = 1;
					rect2.alpha = 1;
					rect3.alpha = 1;
					rect4.alpha = 1;
					obj.addChild(rectBasic);
					var timelinerect5:TimelineLite = new TimelineLite({onComplete:onRect5Complete,onReverseComplete:onRect5Reverse});
					timelinerect5.append(new TweenLite(rect5, 0.5, { alpha:1 } ));
					function onRect5Complete():void 
					{
						timelinerect5.reverse();
					}
					function onRect5Reverse():void 
					{
						timelinerect5.play();
					}
				}
				//если этап 7 квадрат уже развернут, мигает полоса 6
				else if (etap == 7)
				{
					rect1.alpha = 1;
					rect2.alpha = 1;
					rect3.alpha = 1;
					rect4.alpha = 1;
					rect5.alpha = 1;
					obj.addChild(rectBasic);
					var timelinerect6:TimelineLite = new TimelineLite({onComplete:onRect6Complete,onReverseComplete:onRect6Reverse});
					timelinerect6.append(new TweenLite(rect6, 0.5, { alpha:1 } ));
					function onRect6Complete():void 
					{
						timelinerect6.reverse();
					}
					function onRect6Reverse():void 
					{
						timelinerect6.play();
					}
				}
				//если этап 8 квадрат уже развернут, мигает полоса 7
				else if (etap == 8)
				{
					rect1.alpha = 1;
					rect2.alpha = 1;
					rect3.alpha = 1;
					rect4.alpha = 1;
					rect5.alpha = 1;
					rect6.alpha = 1;
					obj.addChild(rectBasic);
					var timelinerect7:TimelineLite = new TimelineLite({onComplete:onRect7Complete,onReverseComplete:onRect7Reverse});
					timelinerect7.append(new TweenLite(rect7, 0.5, { alpha:1 } ));
					function onRect7Complete():void 
					{
						timelinerect7.reverse();
					}
					function onRect7Reverse():void 
					{
						timelinerect7.play();
					}
				}
				//если этап 9 квадрат уже развернут, мигает полоса 8
				else if (etap == 9)
				{
					rect1.alpha = 1;
					rect2.alpha = 1;
					rect3.alpha = 1;
					rect4.alpha = 1;
					rect5.alpha = 1;
					rect6.alpha = 1;
					rect7.alpha = 1;
					obj.addChild(rectBasic);
					
					var timelinerect8:TimelineLite = new TimelineLite({onComplete:onRect8Complete,onReverseComplete:onRect8Reverse});
					timelinerect8.append(new TweenLite(rect8, 0.5, { alpha:1 } ));
					function onRect8Complete():void 
					{
						timelinerect8.reverse();
					}
					function onRect8Reverse():void 
					{
						timelinerect8.play();
					}
				}
				//если этап 10 квадрат уже развернут, убиваем полоски и сворачиваем объект
				else if (etap == 10)
				{
					while (obj.numChildren > 0) {obj.removeChildAt(0)};
					timelinePreload.gotoAndStop(2);
					addEventListener(Event.ENTER_FRAME, onR);
					timelinePreload.reverse();
				}
				
				function onR(event:Event):void 
				{
					DrawObj();
					trace("EnterFRAME");
				}				
			//по завершению анимации грохаем нах...все
			function onPreloadComplete():void 
			{
				//удаляем слушателя на энтерфрейм для отрисовки
				removeEventListener(Event.ENTER_FRAME, onR);
				//обнуляем функцию обработчик
				onR = null;
				timelinePreload = null;
				trace("end");
				
			}
		}//end public function Preload
	}//end public class
	
	}//end package