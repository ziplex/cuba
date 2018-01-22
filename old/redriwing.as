public function DesignerDraw(container:MovieClip):void
		{
			
			//==Описание Переменных=======================================================================================
		
			var tweens:Array = []; //храним все твины
			var mySprite:Array = [];//храним спрайты

			var globalScene:MovieClip=new MovieClip(); //содержит все что на сцене

			var Mybackground:MovieClip = new MovieClip();//background
			/**
			 * фрейм для загрузки изображения
			 */
			var frame:MovieClip = new MovieClip();
			/**
			 *  кнопка для закрытия ихображения
			 */
			var closeFrame:Sprite = new Sprite();
			var widget : TextField; // прелоадер текст
			var i:int=0;//счетчик
			var xc:Number;
			var yc:Number;
			
		
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
			
			//переменные для дисторсионных Битмапов
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
			var feel_color:uint = 0x000000; //цвет заливки
			var outMouse_color:uint = 0x8080FF; // цвет при наведении
			var onClick_color:uint = 0xFF0000; // цвет при нажатии
			var lineStyle:Number = 1; //толщина линии
			var lineColor:uint=0xFFFFFF; //цвет линии
			var alphaButton:Number=0.6;//прозрачность для кнопки
			//таймлайн для анимации кнопки закрытия
			var timelineFrame:TimelineLite = new TimelineLite();
			//==Конец Описания Переменных=======================================================================================
			
		// функция создания фрейма		 	
		function CreateFrame():void 
		{
				
			
			//создаем фрейм для загрузки полноформатного изображения
			frame.graphics.beginFill(0x009966, 0.5);
			frame.graphics.lineStyle(0.5,0xFFFFFF);
			frame.graphics.drawRect(12, 12, 1000, 744);
			frame.graphics.endFill();
			
			
			/**
				 * длинна сторон кнопки закрывалки
				 */
				 var s:Number = 24;
				 
				
				// область срабатывания
				
				 closeFrame.graphics.beginFill(0xFFFFFF, 0);
				 closeFrame.graphics.moveTo( -s, s);
				 closeFrame.graphics.lineTo( s,s);
				 closeFrame.graphics.lineTo( s,-s);
				 closeFrame.graphics.lineTo( -s, -s);
				 closeFrame.graphics.lineTo( -s, s);
				 closeFrame.graphics.endFill();
			     //сама кнопка
				   s = 8;
				 closeFrame.graphics.lineStyle(0.5,0x000000,0.8)
				 closeFrame.graphics.beginFill(0xFFFFFF, 0.8);
				 closeFrame.graphics.moveTo( -s, s);
				 closeFrame.graphics.lineTo( s,s);
				 closeFrame.graphics.lineTo( s,-s);
				 closeFrame.graphics.lineTo( -s, -s);
				 closeFrame.graphics.lineTo( -s, s);
				 closeFrame.graphics.endFill();
			     
				 closeFrame.x = 998;
				 closeFrame.y = 22;
				 closeFrame.scaleX = 0.33;
				 closeFrame.scaleY = 0.33;
				 closeFrame.buttonMode = true;
			    
				//добавляем таймлайн для анимации кнопки закрытия фрейма
				
				timelineFrame.stop();
				timelineFrame.append(TweenLite.to(closeFrame, 0.2, { scaleX:1,scaleY:1 } )); 
				 
			}	
			//создаем фрейм
			CreateFrame();
			
		    // создаем муви клипы
			for (i=0; i<37; i++) 
			{
				
				clicks[i] = -1;
				color_cube[i]=feel_color;
				mySprite[i]=new MovieClip();
				mySprite[i].value=i;
				mySprite[i].pressed = true;
				
			}
		 	
			 //заполняем дисторт битмап массивы
			for (var d:int = 0; d < designer1.count; d++ )
			{
				distortDesigner1[d] = new DistortImage(designer1.dThumbImage[d]);	
			}	
			for (d = 0; d < designer2.count; d++ )
			{
				distortDesigner2[d] = new DistortImage(designer2.dThumbImage[d]);	
			}
			for (d = 0; d < designer3.count; d++ )
			{
				distortDesigner3[d] = new DistortImage(designer3.dThumbImage[d]);	
			}
			for (d = 0; d < designer4.count; d++ )
			{
				distortDesigner4[d] = new DistortImage(designer4.dThumbImage[d]);	
			}
			
			//заполняем массив оригинальных координат
			for (i=0; i<xn.length; i++) 
			{
				xOrig[i]=xn[i];
				yOrig[i]=yn[i];
			}
           
			//designer1.filtred("ftr1", distortDesigner1);
			
			
			//переменные для пентаграмм слева от кнопок
			 
			var PentagonWidth:Number = 45;
			var PentagonAngle:Number = 75;
			var pentX:Array = [xn[0]-PentagonWidth,xn[0]-10,xn[10]-10,xn[10]-PentagonWidth,xn[0]-PentagonAngle,xn[20]-10,xn[20]-PentagonWidth,xn[20]-PentagonAngle,xn[30]-10,xn[30]-PentagonWidth,xn[30]-PentagonAngle,xn[40]-10,xn[40]-PentagonWidth,xn[40]-PentagonAngle];
			var pentY:Array = [yn[0],yn[0],yn[10],yn[10],yn[0]-(yn[0]-yn[10])/2,yn[20],yn[20],yn[10]-(yn[10]-yn[20])/2,yn[30],yn[30],yn[20]-(yn[20]-yn[30])/2,yn[40],yn[40],yn[30]-(yn[30]-yn[40])/2];
							
			var pentagon1:Sprite = new Sprite();
			var pentagon2:Sprite = new Sprite();
			var pentagon3:Sprite = new Sprite();
			var pentagon4:Sprite = new Sprite();
			//создаем пентагоны которые слева
			/**
			 * 
			 * @param	obj объект для отрисовки пентагона
			 * @param	n0 нулевая точка в которую двигаем курсор и рисуем от нее   
			 * @param	n1 первая координата
			 * @param	n2 вторая координата
			 * @param	n3 третья координата
			 * @param	n4 четвертая координата
			 */
			 
			function createPentagon (obj:Sprite,n0:int,n1:int,n2:int,n3:int,n4:int):void 
			{
				obj.graphics.lineStyle(1, 0xFFFFFF);
				obj.graphics.beginFill(0xFFFCF8, 0.6);
				obj.graphics.moveTo(pentX[n0], pentY[n0]);
				obj.graphics.lineTo(pentX[n1], pentY[n1]);
				obj.graphics.lineTo(pentX[n2], pentY[n2]);
				obj.graphics.lineTo(pentX[n3], pentY[n3]);
				obj.graphics.lineTo(pentX[n4], pentY[n4]);
				obj.graphics.lineTo(pentX[n0], pentY[n0]);
				obj.graphics.endFill();
				obj.buttonMode = true;
				if (!obj.stage)
					{
					  container.addChild(obj);
					}
			}
			
			function createPentagons():void 
			{
				createPentagon(pentagon1, 0, 1, 2, 3, 4);
				createPentagon(pentagon2, 3, 2, 5, 6, 7);
				createPentagon(pentagon3, 6, 5, 8, 9, 10);
				createPentagon(pentagon4, 9, 8, 11, 12, 13);
			}
			//создаем пентагоны
			createPentagons();
			//добавляем слушателей на пентагоны
			addEventListenersPentagons();
			
			//функция для создания анимационной линии
			/**
			 * @param   btn - кнопка для картинки
			 * @param   pnt - точка от которой рисовать
			 * @param	lineContainer - контейнер для маски и линии
			 * @param	cLine  - линия 
			 * @param	cLinemask - маска для линии
			 * @param   name - имя дизайнера  
			 * @param   contact - контакты дизайнера
			 */
			function createLine(btn:Sprite,pnt:int,lineContainer:Sprite,cLine:Sprite,cLinemask:Sprite,Dname:TextField,Dcontact:TextField):void 
			{
						var btW:Number = 10;
						var btH:Number = 20;
						//рисуем кнопку
						btn.graphics.lineStyle(0.5, 0xFFFFFF);
						btn.graphics.beginFill(0xFFFFFF, 0.5);
						btn.graphics.drawRect(0, 0,btW, btH);
						btn.graphics.endFill();
						
						btn.graphics.lineStyle(0.5, 0x000000,0.5);
						btn.graphics.beginFill(0x000000, 0.5);
						btn.graphics.moveTo(btW / 4, btH / 2);
						btn.graphics.lineTo(btW / 2, btH / 4);
						btn.graphics.lineTo(btW / 2, btH - 5 );
						btn.graphics.lineTo(btW / 4, btH / 2);
						btn.buttonMode = true;
						lineContainer.addChild(btn);
						
						//рисуем маску для линии
						cLinemask.graphics.beginFill(0xFFFFFF, 1);
						cLinemask.graphics.drawRect(pentX[pnt], pentY[pnt]-20, -300, 40);
						cLinemask.graphics.endFill();
						lineContainer.addChild(cLinemask);
						
						// рисуем линию и двигаем ее за маску
						cLine.graphics.lineStyle(0.5, 0xFFFFFF);
						cLine.graphics.moveTo(pentX[pnt], pentY[pnt]);
						cLine.graphics.lineTo(0, pentY[pnt]);
						cLine.mask = cLinemask;
						lineContainer.addChild(cLine);
						
						btn.x = cLine.x;
						btn.y = pentY[pnt]-20;
						Dname.x = btn.width+5;
						Dname.y = pentY[pnt]-17;
						Dcontact.x = btn.width+5;
						Dcontact.y = pentY[pnt];
						
						
						Dname.selectable = false;
						Dcontact.selectable = false;
						
						lineContainer.addChild(Dname);
						lineContainer.addChild(Dcontact);
						container.addChild(lineContainer);
						
			}
			//переменные для показа линии с именем дизайнера1
			var d1Button:Sprite = new Sprite();
			var d1Container:Sprite = new Sprite();
			var d1Line:Sprite = new Sprite();
			var d1MaskLine:Sprite = new Sprite();
			//запоминаем начальные координаты для того чтобы смещать контейнер относительно пентагона
			var d1X:Number = pentX[4];
			var d1Y:Number = pentY[4];
			
			//переменные для показа линии с именем дизайнера2
			var d2Button:Sprite = new Sprite();
			var d2Container:Sprite = new Sprite();
			var d2Line:Sprite = new Sprite();
			var d2MaskLine:Sprite = new Sprite();
			//запоминаем начальные координаты для того чтобы смещать контейнер относительно пентагона
			var d2X:Number = pentX[7];
			var d2Y:Number = pentY[7];
			
			//переменные для показа линии с именем дизайнера3
			var d3Button:Sprite = new Sprite();
			var d3Container:Sprite = new Sprite();
			var d3Line:Sprite = new Sprite();
			var d3MaskLine:Sprite = new Sprite();
			//запоминаем начальные координаты для того чтобы смещать контейнер относительно пентагона
			var d3X:Number = pentX[10];
			var d3Y:Number = pentY[10];
			
			//переменные для показа линии с именем дизайнера4
			var d4Button:Sprite = new Sprite();
			var d4Container:Sprite = new Sprite();
			var d4Line:Sprite = new Sprite();
			var d4MaskLine:Sprite = new Sprite();
			//запоминаем начальные координаты для того чтобы смещать контейнер относительно пентагона
			var d4X:Number = pentX[13];
			var d4Y:Number = pentY[13];
			
			//создаем линии с подписями дизайнеров
			createLine(d1Button,4, d1Container, d1Line, d1MaskLine, designer1.dName, designer1.dContacts);
			createLine(d2Button,7, d2Container, d2Line, d2MaskLine, designer2.dName, designer2.dContacts);
			createLine(d3Button,10, d3Container, d3Line, d3MaskLine, designer3.dName, designer3.dContacts);
			createLine(d4Button,13,d4Container, d4Line, d4MaskLine, designer4.dName, designer4.dContacts);
			
			//Таймлайны для кажого дизайнера
			var TimeLineDesigner1:TimelineLite = new TimelineLite();
			var TimeLineDesigner2:TimelineLite = new TimelineLite();
			var TimeLineDesigner3:TimelineLite = new TimelineLite();
			var TimeLineDesigner4:TimelineLite = new TimelineLite();
			
			//уводим линии Дизайнера1 за маску и все остальное делаем прозрачным
			
			d1Button.alpha = 0;
			d1Line.x = 300;
			designer1.dName.alpha = 0;
			designer1.dContacts.alpha = 0;
			
			//стопим таймлайн Дизайнера1 и пихаем в него анимацию появления
			TimeLineDesigner1.stop();
			TimeLineDesigner1.append(TweenLite.to(d1Line, 0.5, { x:0 } ) );
			TimeLineDesigner1.append(TweenLite.to(designer1.dName, 0.5, { alpha:1 } ) );
			TimeLineDesigner1.append(TweenLite.to(designer1.dContacts, 0.5, { alpha:1 } ) );
			TimeLineDesigner1.append(TweenLite.to(d1Button, 0.5, { alpha:1 } ) );
			
			
			//уводим линии Дизайнера2 за маску и все остальное делаем прозрачным
			
			d2Button.alpha = 0;
			d2Line.x = 300;
			designer2.dName.alpha = 0;
			designer2.dContacts.alpha = 0;
			
			//стопим таймлайн Дизайнера2 и пихаем в него анимацию появления
			TimeLineDesigner2.stop();
			TimeLineDesigner2.append(TweenLite.to(d2Line, 0.5, { x:0 } ) );
			TimeLineDesigner2.append(TweenLite.to(designer2.dName, 0.5, { alpha:1 } ) );
			TimeLineDesigner2.append(TweenLite.to(designer2.dContacts, 0.5, { alpha:1 } ) );
			TimeLineDesigner2.append(TweenLite.to(d2Button, 0.5, { alpha:1 } ) );
			
			
			//уводим линии Дизайнера3 за маску и все остальное делаем прозрачным
			
			d3Button.alpha = 0;
			d3Line.x = 300;
			designer3.dName.alpha = 0;
			designer3.dContacts.alpha = 0;
			
			//стопим таймлайн Дизайнера3 и пихаем в него анимацию появления
			TimeLineDesigner3.stop();
			TimeLineDesigner3.append(TweenLite.to(d3Line, 0.5, { x:0 } ) );
			TimeLineDesigner3.append(TweenLite.to(designer3.dName, 0.5, { alpha:1 } ) );
			TimeLineDesigner3.append(TweenLite.to(designer3.dContacts, 0.5, { alpha:1 } ) );
			TimeLineDesigner3.append(TweenLite.to(d3Button, 0.5, { alpha:1 } ) );
			
			//уводим линии Дизайнера4 за маску и все остальное делаем прозрачным
			
			d4Button.alpha = 0;
			d4Line.x = 300;
			designer4.dName.alpha = 0;
			designer4.dContacts.alpha = 0;
			
			//стопим таймлайн Дизайнера4 и пихаем в него анимацию появления
			TimeLineDesigner4.stop();
			TimeLineDesigner4.append(TweenLite.to(d4Line, 0.5, { x:0 } ) );
			TimeLineDesigner4.append(TweenLite.to(designer4.dName, 0.5, { alpha:1 } ) );
			TimeLineDesigner4.append(TweenLite.to(designer4.dContacts, 0.5, { alpha:1 } ) );
			TimeLineDesigner4.append(TweenLite.to(d4Button, 0.5, { alpha:1 } ) );
			
			
			function addEventListenersPentagons():void 
			{
				pentagon1.addEventListener(MouseEvent.MOUSE_DOWN, pentagon1onClick);
				pentagon1.addEventListener(MouseEvent.MOUSE_OVER, pentagon1onOver);
				pentagon1.addEventListener(MouseEvent.MOUSE_OUT, pentagon1onOut);
			
				pentagon2.addEventListener(MouseEvent.MOUSE_DOWN, pentagon2onClick);
				pentagon2.addEventListener(MouseEvent.MOUSE_OVER, pentagon2onOver);
				pentagon2.addEventListener(MouseEvent.MOUSE_OUT, pentagon2onOut);
				
				pentagon3.addEventListener(MouseEvent.MOUSE_DOWN, pentagon3onClick);
				pentagon3.addEventListener(MouseEvent.MOUSE_OVER, pentagon3onOver);
				pentagon3.addEventListener(MouseEvent.MOUSE_OUT, pentagon3onOut);
				
				pentagon4.addEventListener(MouseEvent.MOUSE_DOWN, pentagon4onClick);
				pentagon4.addEventListener(MouseEvent.MOUSE_OVER, pentagon4onOver);
				pentagon4.addEventListener(MouseEvent.MOUSE_OUT, pentagon4onOut);
			}
			
			//при выходе фокуса мыши из пентагона1
			
			function pentagon1onOut(event:MouseEvent):void 
			{
				TimeLineDesigner1.reverse();
				trace("вышли")
			}
			//при наведении на пентагон1 
			function pentagon1onOver(event:MouseEvent):void 
			{
				//d1Container.x = (d1X - pentX[4])*(-1);
				//d1Container.y = (d1Y - pentY[4])*(-1);
				TimeLineDesigner1.play();
				trace("вошли")
			}
			//при нажатии на пентагон 1
			function pentagon1onClick(event:MouseEvent):void 
			{
				
			}
			
			
			//при выходе фокуса мыши из пентагона2
			
			function pentagon2onOut(event:MouseEvent):void 
			{
				TimeLineDesigner2.reverse();
				trace("вышли")
			}
			//при наведении на пентагон2 
			function pentagon2onOver(event:MouseEvent):void 
			{
				TimeLineDesigner2.play();
				trace("вошли")
			}
			//при нажатии на пентагон 2
			function pentagon2onClick(event:MouseEvent):void 
			{
				
			}
			
			//при выходе фокуса мыши из пентагона3
			
			function pentagon3onOut(event:MouseEvent):void 
			{
				TimeLineDesigner3.reverse();
				trace("вышли")
			}
			//при наведении на пентагон3 
			function pentagon3onOver(event:MouseEvent):void 
			{
				TimeLineDesigner3.play();
				trace("вошли")
			}
			//при нажатии на пентагон 3
			function pentagon3onClick(event:MouseEvent):void 
			{
				
			}
			//при выходе фокуса мыши из пентагона4
			
			function pentagon4onOut(event:MouseEvent):void 
			{
				TimeLineDesigner4.reverse();
				trace("вышли")
			}
			//при наведении на пентагон4 
			function pentagon4onOver(event:MouseEvent):void 
			{
				TimeLineDesigner4.play();
				trace("вошли")
			}
			//при нажатии на пентагон 4
			function pentagon4onClick(event:MouseEvent):void 
			{
				
			}
			
			//==============================================================================
			//создаем кнопки листалки
			function createPicButton(btn1:Sprite,btn2:Sprite,n1:int,n2:int):void
			{
				var width:Number = 10;
				//рисуем кнопку1
				btn1.graphics.lineStyle(1, 0xFFFFFF);
				btn1.graphics.beginFill(0xFFFFFF, 0.6);
				btn1.graphics.moveTo(xn[n1], yn[n1]);
				btn1.graphics.lineTo(xn[n1] - width, yn[n1]);
				btn1.graphics.lineTo(xn[n1+10] - width, yn[n1+10]);
				btn1.graphics.lineTo(xn[n1+10] , yn[n1+10]);
				btn1.graphics.lineTo(xn[n1] , yn[n1]);
				btn1.buttonMode = true;
								
				
				btn2.graphics.lineStyle(1, 0xFFFFFF);
				btn2.graphics.beginFill(0xFFFFFF, 0.6);
				btn2.graphics.moveTo(xn[n2], yn[n2]);
				btn2.graphics.lineTo(xn[n2] + width, yn[n2]);
				btn2.graphics.lineTo(xn[n2+10] + width, yn[n2+10]);
				btn2.graphics.lineTo(xn[n2+10] , yn[n2+10]);
				btn2.graphics.lineTo(xn[n2] , yn[n2]);
				btn2.buttonMode = true;
				if (!btn1.stage)
					{
					  container.addChild(btn1);
						
					}
				if (!btn2.stage)
					{
					  container.addChild(btn2);
						
					}
			
			}
			
			
			var countD1:int = 0;//счетчик смещения для первого дизайнера
			var countD2:int = 0;//счетчик смещения для второго дизайнера
			var countD3:int = 0;//счетчик смещения для третьего дизайнера
			var countD4:int=0;//счетчик смещения для четвертого дизайнера
			var prevbutton1:Sprite = new Sprite();//предыдущая картинка
			var nextbutton1:Sprite = new Sprite();//следующая картинка
			var prevbutton2:Sprite = new Sprite();
			var nextbutton2:Sprite = new Sprite();
			var prevbutton3:Sprite = new Sprite();
			var nextbutton3:Sprite = new Sprite();
			var prevbutton4:Sprite = new Sprite();
			var nextbutton4:Sprite = new Sprite();
			
			
			
			
			
			
			function createBtns():void
			{
				createPicButton(prevbutton1, nextbutton1, 0, 8);	
				createPicButton(prevbutton2, nextbutton2, 10, 19);	
				createPicButton(prevbutton3, nextbutton3, 20, 27);	
				createPicButton(prevbutton4, nextbutton4, 30, 38);	
			}
			
			createBtns();
			
			//добавляем слушатели на листалки 
			prevbutton1.addEventListener(MouseEvent.MOUSE_DOWN, prevbutton1OnClick);
			nextbutton1.addEventListener(MouseEvent.MOUSE_DOWN, nextbutton1OnClick);
			prevbutton2.addEventListener(MouseEvent.MOUSE_DOWN, prevbutton2OnClick);
			nextbutton2.addEventListener(MouseEvent.MOUSE_DOWN, nextbutton2OnClick);
			prevbutton3.addEventListener(MouseEvent.MOUSE_DOWN, prevbutton3OnClick);
			nextbutton3.addEventListener(MouseEvent.MOUSE_DOWN, nextbutton3OnClick);
			prevbutton4.addEventListener(MouseEvent.MOUSE_DOWN, prevbutton4OnClick);
			nextbutton4.addEventListener(MouseEvent.MOUSE_DOWN, nextbutton4OnClick);
			// обработчики для первых листалок
			function prevbutton1OnClick():void
			{
			  var ytmp:Array = [];
			  var tmp:Array = [];
				
			  if (countD1 > 0)
			  {
				  countD1--;
				  
			  distortDesigner1[0].texture = designer1.dThumbImage[0 + countD1];
			  distortDesigner1[1].texture = designer1.dThumbImage[1 + countD1];
			  distortDesigner1[2].texture = designer1.dThumbImage[2 + countD1];
			  distortDesigner1[3].texture = designer1.dThumbImage[3 + countD1];
			  distortDesigner1[4].texture = designer1.dThumbImage[4 + countD1];
			  distortDesigner1[5].texture = designer1.dThumbImage[5 + countD1];
			  distortDesigner1[6].texture = designer1.dThumbImage[6 + countD1];
			  distortDesigner1[7].texture = designer1.dThumbImage[7 + countD1];
			   
			  for (var z:int = 7; z >= 1; z--)
					{
											
						
						tmp[0] = mySprite[z].pressed;
						mySprite[z].pressed = mySprite[z - 1].pressed;
						mySprite[z -1].pressed = tmp[0];
						
						tmp[1] = color_cube[z];
						color_cube[z] = color_cube[z - 1];
						color_cube[z - 1] = tmp[1];
						
						ytmp[0] = yn[z];
						yn[z] = yn[z-1];
						yn[z-1] = ytmp[0];
						
						trace("yn[", z, "]=",  yn[z]);
						
						ytmp[1] = yn[z+10]; 
						yn[z+10] = yn[z+9];
						yn[z + 9] = ytmp[1];
						
						yOrig[z] = yn[z];
						yOrig[z + 10] = yn[z + 10];
						
					}
			  
			  				  
			  }
				
			  RedrawDesigners();
			  trace(countD1);
			}//end function prevbutton1
				
			
			
			
			
			function nextbutton1OnClick():void
			{
				 var xtmp:Array=[];//переменные для временного  хранения
				 var ytmp:Array = [];
				 var tmp:Array=[];
				 var shft:Array = [];
				 
				 countD1++
				  
				 if (countD1 > designer1.count - 8)
				{
					countD1 = designer1.count - 8;
					
					
					
				}
				else 
				{
										
					for (var z:int = 0; z <= 7; z++)
					{
						tmp[0] = mySprite[z].pressed;
						mySprite[z].pressed = mySprite[z + 1].pressed;
						mySprite[z + 1].pressed = tmp[0];
						
						tmp[1] = color_cube[z];
						color_cube[z] = color_cube[z + 1];
						color_cube[z + 1] = tmp[1];
						
						ytmp[0] = yn[z]; 
						yn[z] = yn[z+1];
						yn[z + 1] = ytmp[0];
						trace("yn[", z, "]=",  yn[z]);
						
						ytmp[1] = yn[z+10]; 
						yn[z+10] = yn[z+11];
						yn[z + 11] = ytmp[1];
						
						yOrig[z] = yn[z];
						yOrig[z + 10] = yn[z + 10];
												
					}
				
				}
				
				
			  distortDesigner1[0].texture = designer1.dThumbImage[0 + countD1];
			  distortDesigner1[1].texture = designer1.dThumbImage[1 + countD1];
			  distortDesigner1[2].texture = designer1.dThumbImage[2 + countD1];
			  distortDesigner1[3].texture = designer1.dThumbImage[3 + countD1];
			  distortDesigner1[4].texture = designer1.dThumbImage[4 + countD1];
			  distortDesigner1[5].texture = designer1.dThumbImage[5 + countD1];
			  distortDesigner1[6].texture = designer1.dThumbImage[6 + countD1];
			  distortDesigner1[7].texture = designer1.dThumbImage[7 + countD1];
			 
			 				
			  trace("click_tt", countD1);
				RedrawDesigners();
			} //end function nextbutton1Click 
				
			//обработчики для вторых листалок
			
			function prevbutton2OnClick():void
			{
			  var ytmp:Array = [];
			  var tmp:Array = [];
				
			  if (countD2 > 0)
			  {
				  countD2--;
				  
			  distortDesigner2[0].texture = designer2.dThumbImage[0 + countD2];
			  distortDesigner2[1].texture = designer2.dThumbImage[1 + countD2];
			  distortDesigner2[2].texture = designer2.dThumbImage[2 + countD2];
			  distortDesigner2[3].texture = designer2.dThumbImage[3 + countD2];
			  distortDesigner2[4].texture = designer2.dThumbImage[4 + countD2];
			  distortDesigner2[5].texture = designer2.dThumbImage[5 + countD2];
			  distortDesigner2[6].texture = designer2.dThumbImage[6 + countD2];
			  distortDesigner2[7].texture = designer2.dThumbImage[7 + countD2];
			  distortDesigner2[8].texture = designer2.dThumbImage[8 + countD2]; 
			  
			  for (var z:int = 18; z >= 11; z--)
					{
											
						
						tmp[0] = mySprite[z].pressed;
						mySprite[z].pressed = mySprite[z - 1].pressed;
						mySprite[z -1].pressed = tmp[0];
						
						tmp[1] = color_cube[z];
						color_cube[z] = color_cube[z - 1];
						color_cube[z - 1] = tmp[1];
						
						ytmp[0] = yn[z];
						yn[z] = yn[z-1];
						yn[z-1] = ytmp[0];
						
						trace("yn[", z, "]=",  yn[z]);
						
						ytmp[1] = yn[z+10]; 
						yn[z+10] = yn[z+9];
						yn[z + 9] = ytmp[1];
						
						yOrig[z] = yn[z];
						yOrig[z + 10] = yn[z + 10];
						
					}
			  
			  				  
			  }
				
			  RedrawDesigners();
			  trace(countD1);
			}//end function prevbutton2
				
			
			
			
			
			function nextbutton2OnClick():void
			{
				 var xtmp:Array=[];//переменные для временного  хранения
				 var ytmp:Array = [];
				 var tmp:Array=[];
				 var shft:Array = [];
				 
				 countD2++
				  
				 if (countD2 >designer2.count - 9)
				{
					countD2 = designer2.count - 9;
									
				}
				else 
				{
										
					for (var z:int = 10; z <= 18; z++)
					{
						tmp[0] = mySprite[z].pressed;
						mySprite[z].pressed = mySprite[z + 1].pressed;
						mySprite[z + 1].pressed = tmp[0];
						
						tmp[1] = color_cube[z];
						color_cube[z] = color_cube[z + 1];
						color_cube[z + 1] = tmp[1];
						
						ytmp[0] = yn[z]; 
						yn[z] = yn[z+1];
						yn[z + 1] = ytmp[0];
						trace("yn[", z, "]=",  yn[z]);
						
						ytmp[1] = yn[z+10]; 
						yn[z+10] = yn[z+11];
						yn[z + 11] = ytmp[1];
						
						yOrig[z] = yn[z];
						yOrig[z + 10] = yn[z + 10];
												
					}
				
				}
				
				
			  distortDesigner2[0].texture = designer2.dThumbImage[0 + countD2];
			  distortDesigner2[1].texture = designer2.dThumbImage[1 + countD2];
			  distortDesigner2[2].texture = designer2.dThumbImage[2 + countD2];
			  distortDesigner2[3].texture = designer2.dThumbImage[3 + countD2];
			  distortDesigner2[4].texture = designer2.dThumbImage[4 + countD2];
			  distortDesigner2[5].texture = designer2.dThumbImage[5 + countD2];
			  distortDesigner2[6].texture = designer2.dThumbImage[6 + countD2];
			  distortDesigner2[7].texture = designer2.dThumbImage[7 + countD2];
			  distortDesigner2[8].texture = designer2.dThumbImage[8 + countD2];
			 				
			  trace("click_tt", countD2);
				RedrawDesigners();
			} //end function nextbutton2Click 
			
			
			//обработчики для третьих листалок
			
			function prevbutton3OnClick():void
			{
			  var ytmp:Array = [];
			  var tmp:Array = [];
				
			  if (countD3 > 0)
			  {
				  countD3--;
				  
			  distortDesigner3[0].texture = designer3.dThumbImage[0 + countD3];
			  distortDesigner3[1].texture = designer3.dThumbImage[1 + countD3];
			  distortDesigner3[2].texture = designer3.dThumbImage[2 + countD3];
			  distortDesigner3[3].texture = designer3.dThumbImage[3 + countD3];
			  distortDesigner3[4].texture = designer3.dThumbImage[4 + countD3];
			  distortDesigner3[5].texture = designer3.dThumbImage[5 + countD3];
			  distortDesigner3[6].texture = designer3.dThumbImage[6 + countD3];
			 
			  
			  for (var z:int = 26; z >= 21; z--)
					{
											
						
						tmp[0] = mySprite[z].pressed;
						mySprite[z].pressed = mySprite[z - 1].pressed;
						mySprite[z -1].pressed = tmp[0];
						
						tmp[1] = color_cube[z];
						color_cube[z] = color_cube[z - 1];
						color_cube[z - 1] = tmp[1];
						
						ytmp[0] = yn[z];
						yn[z] = yn[z-1];
						yn[z-1] = ytmp[0];
						
						trace("yn[", z, "]=",  yn[z]);
						
						ytmp[1] = yn[z+10]; 
						yn[z+10] = yn[z+9];
						yn[z + 9] = ytmp[1];
						
						yOrig[z] = yn[z];
						yOrig[z + 10] = yn[z + 10];
						
					}
			  
			  				  
			  }
				
			  RedrawDesigners();
			  trace(countD3);
			}//end function prevbutton3
				
			
			
			
			
			function nextbutton3OnClick():void
			{
				 var xtmp:Array=[];//переменные для временного  хранения
				 var ytmp:Array = [];
				 var tmp:Array=[];
				 var shft:Array = [];
				 
				 countD3++
				  
				 if (countD3 >designer3.count - 7)
				{
					countD3 = designer3.count - 7;
									
				}
				else 
				{
										
					for (var z:int = 20; z <= 26; z++)
					{
						tmp[0] = mySprite[z].pressed;
						mySprite[z].pressed = mySprite[z + 1].pressed;
						mySprite[z + 1].pressed = tmp[0];
						
						tmp[1] = color_cube[z];
						color_cube[z] = color_cube[z + 1];
						color_cube[z + 1] = tmp[1];
						
						ytmp[0] = yn[z]; 
						yn[z] = yn[z+1];
						yn[z + 1] = ytmp[0];
						trace("yn[", z, "]=",  yn[z]);
						
						ytmp[1] = yn[z+10]; 
						yn[z+10] = yn[z+11];
						yn[z + 11] = ytmp[1];
						
						yOrig[z] = yn[z];
						yOrig[z + 10] = yn[z + 10];
												
					}
				
				}
				
				
			  distortDesigner3[0].texture = designer3.dThumbImage[0 + countD3];
			  distortDesigner3[1].texture = designer3.dThumbImage[1 + countD3];
			  distortDesigner3[2].texture = designer3.dThumbImage[2 + countD3];
			  distortDesigner3[3].texture = designer3.dThumbImage[3 + countD3];
			  distortDesigner3[4].texture = designer3.dThumbImage[4 + countD3];
			  distortDesigner3[5].texture = designer3.dThumbImage[5 + countD3];
			  distortDesigner3[6].texture = designer3.dThumbImage[6 + countD3];
			  
			 				
			  trace("click_tt", countD3);
				RedrawDesigners();
			} //end function nextbutton3Click 
			
			//обработчики для четвертых листалок
			
			function prevbutton4OnClick():void
			{
			  var ytmp:Array = [];
			  var tmp:Array = [];
				
			  if (countD4 > 0)
			  {
				  countD4--;
				  
			  distortDesigner4[0].texture = designer4.dThumbImage[0 + countD4];
			  distortDesigner4[1].texture = designer4.dThumbImage[1 + countD4];
			  distortDesigner4[2].texture = designer4.dThumbImage[2 + countD4];
			  distortDesigner4[3].texture = designer4.dThumbImage[3 + countD4];
			  distortDesigner4[4].texture = designer4.dThumbImage[4 + countD4];
			  distortDesigner4[5].texture = designer4.dThumbImage[5 + countD4];
			  distortDesigner4[6].texture = designer4.dThumbImage[6 + countD4];
			  distortDesigner4[7].texture = designer4.dThumbImage[7 + countD4];
			  
			  for (var z:int = 37; z >= 31; z--)
					{
											
						
						/*tmp[0] = mySprite[z].pressed;
						mySprite[z].pressed = mySprite[z - 1].pressed;
						mySprite[z -1].pressed = tmp[0];
						
						tmp[1] = color_cube[z];
						color_cube[z] = color_cube[z - 1];
						color_cube[z - 1] = tmp[1];*/
						
						ytmp[0] = yn[z];
						yn[z] = yn[z-1];
						yn[z-1] = ytmp[0];
						
						trace("yn[", z, "]=",  yn[z]);
						
						ytmp[1] = yn[z+10]; 
						yn[z+10] = yn[z+9];
						yn[z + 9] = ytmp[1];
						
						yOrig[z] = yn[z];
						yOrig[z + 10] = yn[z + 10];
						
					}
			  
			  				  
			  }
				
			  RedrawDesigners();
			  trace(countD4);
			}//end function prevbutton4
				
			
			
			
			
			function nextbutton4OnClick():void
			{
				 var xtmp:Array=[];//переменные для временного  хранения
				 var ytmp:Array = [];
				 var tmp:Array=[];
				 var shft:Array = [];
				 
				 countD4++
				  
				 if (countD4 >designer4.count - 8)
				{
					countD4 = designer4.count - 8;
									
				}
				else 
				{
										
					for (var z:int = 30; z <= 37; z++)
					{
						/*tmp[0] = mySprite[z].pressed;
						mySprite[z].pressed = mySprite[z + 1].pressed;
						mySprite[z + 1].pressed = tmp[0];
						
						tmp[1] = color_cube[z];
						color_cube[z] = color_cube[z + 1];
						color_cube[z + 1] = tmp[1];*/
						
						ytmp[0] = yn[z]; 
						yn[z] = yn[z+1];
						yn[z + 1] = ytmp[0];
						trace("yn[", z, "]=",  yn[z]);
						
						ytmp[1] = yn[z+10]; 
						yn[z+10] = yn[z+11];
						yn[z + 11] = ytmp[1];
						
						yOrig[z] = yn[z];
						yOrig[z + 10] = yn[z + 10];
												
					}
				
				}
				
				
			  distortDesigner4[0].texture = designer4.dThumbImage[0 + countD4];
			  distortDesigner4[1].texture = designer4.dThumbImage[1 + countD4];
			  distortDesigner4[2].texture = designer4.dThumbImage[2 + countD4];
			  distortDesigner4[3].texture = designer4.dThumbImage[3 + countD4];
			  distortDesigner4[4].texture = designer4.dThumbImage[4 + countD4];
			  distortDesigner4[5].texture = designer4.dThumbImage[5 + countD4];
			  distortDesigner4[6].texture = designer4.dThumbImage[6 + countD4];
			  distortDesigner4[7].texture = designer4.dThumbImage[7 + countD4];
			 				
			  trace("click_tt", countD4);
				RedrawDesigners();
			} //end function nextbutton4Click 
			
			//==============конец обработчиков листалок
			drawdistortDesigner(true);
			addEventListeners();
			DriwingCurve();
			  // рисуем основной объект
			function DriwingCurve():void 
			{   
				//Первый ряд
				linears(mySprite[0],xn[0],yn[0],xn[1],yn[1],xn[10],yn[10],xn[11],yn[11],designer1.dThumbImage[0],Mymatrix,color_cube[0],cubeAlpha[0],lineStyle,lineColor);
				linears(mySprite[1],xn[1],yn[1],xn[2],yn[2],xn[11],yn[11],xn[12],yn[12],designer1.dThumbImage[1],Mymatrix,color_cube[1],cubeAlpha[1],lineStyle,lineColor);
			 	linears(mySprite[2],xn[2],yn[2],xn[3],yn[3],xn[12],yn[12],xn[13],yn[13],designer1.dThumbImage[2],Mymatrix,color_cube[2],cubeAlpha[2],lineStyle,lineColor);
				linears(mySprite[3],xn[3],yn[3],xn[4],yn[4],xn[13],yn[13],xn[14],yn[14],designer1.dThumbImage[3],Mymatrix,color_cube[3],cubeAlpha[3],lineStyle,lineColor);
				linears(mySprite[4],xn[4],yn[4],xn[5],yn[5],xn[14],yn[14],xn[15],yn[15],designer1.dThumbImage[4],Mymatrix,color_cube[4],cubeAlpha[4],lineStyle,lineColor);
				linears(mySprite[5],xn[5],yn[5],xn[6],yn[6],xn[15],yn[15],xn[16],yn[16],designer1.dThumbImage[5],Mymatrix,color_cube[5],cubeAlpha[5],lineStyle,lineColor);
				linears(mySprite[6],xn[6],yn[6],xn[7],yn[7],xn[16],yn[16],xn[17],yn[17],designer1.dThumbImage[6],Mymatrix,color_cube[6],cubeAlpha[6],lineStyle,lineColor);
				linears(mySprite[7],xn[7],yn[7],xn[8],yn[8],xn[17],yn[17],xn[18],yn[18],designer1.dThumbImage[7],Mymatrix,color_cube[7],cubeAlpha[7],lineStyle,lineColor);
				//linears(mySprite[8],xn[8],yn[8],xn[9],yn[9],xn[18],yn[18],xn[19],yn[19],ArrBitmap[8],Mymatrix,color_cube[8],cubeAlpha[8],lineStyle,lineColor);
				//Второй ряд
				linears(mySprite[9],xn[10],yn[10],xn[11],yn[11],xn[20],yn[20],xn[21],yn[21],designer2.dThumbImage[0],Mymatrix,color_cube[9],cubeAlpha[9],lineStyle,lineColor);
				linears(mySprite[10],xn[11],yn[11],xn[12],yn[12],xn[21],yn[21],xn[22],yn[22],designer2.dThumbImage[1],Mymatrix,color_cube[10],cubeAlpha[10],lineStyle,lineColor);
				linears(mySprite[11],xn[12],yn[12],xn[13],yn[13],xn[22],yn[22],xn[23],yn[23],designer2.dThumbImage[2],Mymatrix,color_cube[11],cubeAlpha[11],lineStyle,lineColor);
				linears(mySprite[12],xn[13],yn[13],xn[14],yn[14],xn[23],yn[23],xn[24],yn[24],designer2.dThumbImage[3],Mymatrix,color_cube[12],cubeAlpha[12],lineStyle,lineColor);
				linears(mySprite[13],xn[14],yn[14],xn[15],yn[15],xn[24],yn[24],xn[25],yn[25],designer2.dThumbImage[4],Mymatrix,color_cube[13],cubeAlpha[13],lineStyle,lineColor);
				linears(mySprite[14],xn[15],yn[15],xn[16],yn[16],xn[25],yn[25],xn[26],yn[26],designer2.dThumbImage[5],Mymatrix,color_cube[14],cubeAlpha[14],lineStyle,lineColor);
				linears(mySprite[15],xn[16],yn[16],xn[17],yn[17],xn[26],yn[26],xn[27],yn[27],designer2.dThumbImage[6],Mymatrix,color_cube[15],cubeAlpha[15],lineStyle,lineColor);
				linears(mySprite[16],xn[17],yn[17],xn[18],yn[18],xn[27],yn[27],xn[28],yn[28],designer2.dThumbImage[7],Mymatrix,color_cube[16],cubeAlpha[16],lineStyle,lineColor);
				linears(mySprite[17],xn[18],yn[18],xn[19],yn[19],xn[28],yn[28],xn[29],yn[29],designer2.dThumbImage[8],Mymatrix,color_cube[17],cubeAlpha[17],lineStyle,lineColor);
				
				//Третий ряд
				linears(mySprite[18],xn[20],yn[20],xn[21],yn[21],xn[30],yn[30],xn[31],yn[31],designer3.dThumbImage[0],Mymatrix,color_cube[18],cubeAlpha[18],lineStyle,lineColor);
				linears(mySprite[19],xn[21],yn[21],xn[22],yn[22],xn[31],yn[31],xn[32],yn[32],designer3.dThumbImage[1],Mymatrix,color_cube[19],cubeAlpha[19],lineStyle,lineColor);
				linears(mySprite[20],xn[22],yn[22],xn[23],yn[23],xn[32],yn[32],xn[33],yn[33],designer3.dThumbImage[2],Mymatrix,color_cube[20],cubeAlpha[20],lineStyle,lineColor);
				linears(mySprite[21],xn[23],yn[23],xn[24],yn[24],xn[33],yn[33],xn[34],yn[34],designer3.dThumbImage[3],Mymatrix,color_cube[21],cubeAlpha[21],lineStyle,lineColor);
				linears(mySprite[22],xn[24],yn[24],xn[25],yn[25],xn[34],yn[34],xn[35],yn[35],designer3.dThumbImage[4],Mymatrix,color_cube[22],cubeAlpha[22],lineStyle,lineColor);
				linears(mySprite[23],xn[25],yn[25],xn[26],yn[26],xn[35],yn[35],xn[36],yn[36],designer3.dThumbImage[5],Mymatrix,color_cube[23],cubeAlpha[23],lineStyle,lineColor);
				linears(mySprite[24],xn[26],yn[26],xn[27],yn[27],xn[36],yn[36],xn[37],yn[37],designer3.dThumbImage[6],Mymatrix,color_cube[24],cubeAlpha[24],lineStyle,lineColor);
				//linears(mySprite[25],xn[27],yn[27],xn[28],yn[28],xn[37],yn[37],xn[38],yn[38],ArrBitmap[25],Mymatrix,color_cube[25],cubeAlpha[25],lineStyle,lineColor);
				//linears(mySprite[26],xn[28],yn[28],xn[29],yn[29],xn[38],yn[38],xn[39],yn[39],ArrBitmap[26],Mymatrix,color_cube[26],cubeAlpha[26],lineStyle,lineColor);
				//Четвертый ряд
				linears(mySprite[27],xn[30],yn[30],xn[31],yn[31],xn[40],yn[40],xn[41],yn[41],designer4.dThumbImage[0],Mymatrix,color_cube[27],cubeAlpha[27],lineStyle,lineColor);
				linears(mySprite[28],xn[31],yn[31],xn[32],yn[32],xn[41],yn[41],xn[42],yn[42],designer4.dThumbImage[1],Mymatrix,color_cube[28],cubeAlpha[28],lineStyle,lineColor);
				linears(mySprite[29],xn[32],yn[32],xn[33],yn[33],xn[42],yn[42],xn[43],yn[43],designer4.dThumbImage[2],Mymatrix,color_cube[29],cubeAlpha[29],lineStyle,lineColor);
				linears(mySprite[30],xn[33],yn[33],xn[34],yn[34],xn[43],yn[43],xn[44],yn[44],designer4.dThumbImage[3],Mymatrix,color_cube[30],cubeAlpha[30],lineStyle,lineColor);
				linears(mySprite[31],xn[34],yn[34],xn[35],yn[35],xn[44],yn[44],xn[45],yn[45],designer4.dThumbImage[4],Mymatrix,color_cube[31],cubeAlpha[31],lineStyle,lineColor);
				linears(mySprite[32],xn[35],yn[35],xn[36],yn[36],xn[45],yn[45],xn[46],yn[46],designer4.dThumbImage[5],Mymatrix,color_cube[32],cubeAlpha[32],lineStyle,lineColor);
				linears(mySprite[33],xn[36],yn[36],xn[37],yn[37],xn[46],yn[46],xn[47],yn[47],designer4.dThumbImage[6],Mymatrix,color_cube[33],cubeAlpha[33],lineStyle,lineColor);
				linears(mySprite[34],xn[37],yn[37],xn[38],yn[38],xn[47],yn[47],xn[48],yn[48],designer4.dThumbImage[7],Mymatrix,color_cube[34],cubeAlpha[34],lineStyle,lineColor);
				//linears(mySprite[35],xn[38],yn[38],xn[39],yn[39],xn[48],yn[48],xn[49],yn[49],ArrBitmap[35],Mymatrix,color_cube[35],cubeAlpha[35],lineStyle,lineColor);
				
				
			} // конец функции DriwingCurve
			
			// функция для создания искаженных битмапов
			
			function drawdistortDesigner(addchld:Boolean=false):void
			{
			  //дизайнер1
			  
			  
			  distortDesigner1[0].setTransform(xn[0], yn[0], xn[1], yn[1], xn[11], yn[11], xn[10], yn[10]);	
			  distortDesigner1[1].setTransform(xn[1], yn[1], xn[2], yn[2], xn[12], yn[12], xn[11], yn[11]);	
			  distortDesigner1[2].setTransform(xn[2], yn[2], xn[3], yn[3], xn[13], yn[13], xn[12], yn[12]);	
			  distortDesigner1[3].setTransform(xn[3], yn[3], xn[4], yn[4], xn[14], yn[14], xn[13], yn[13]);	
			  distortDesigner1[4].setTransform(xn[4], yn[4], xn[5], yn[5], xn[15], yn[15], xn[14], yn[14]);	
			  distortDesigner1[5].setTransform(xn[5], yn[5], xn[6], yn[6], xn[16], yn[16], xn[15], yn[15]);	
			  distortDesigner1[6].setTransform(xn[6], yn[6], xn[7], yn[7], xn[17], yn[17], xn[16], yn[16]);	
			  distortDesigner1[7].setTransform(xn[7], yn[7], xn[8], yn[8], xn[18], yn[18], xn[17], yn[17]);	
			  
			  //дизайнер2
			  distortDesigner2[0].setTransform(xn[10], yn[10], xn[11], yn[11], xn[21], yn[21], xn[20], yn[20]);
			  distortDesigner2[1].setTransform(xn[11], yn[11], xn[12], yn[12], xn[22], yn[22], xn[21], yn[21]);
			  distortDesigner2[2].setTransform(xn[12], yn[12], xn[13], yn[13], xn[23], yn[23], xn[22], yn[22]);	
			  distortDesigner2[3].setTransform(xn[13], yn[13], xn[14], yn[14], xn[24], yn[24], xn[23], yn[23]);	
			  distortDesigner2[4].setTransform(xn[14], yn[14], xn[15], yn[15], xn[25], yn[25], xn[24], yn[24]);	
			  distortDesigner2[5].setTransform(xn[15], yn[15], xn[16], yn[16], xn[26], yn[26], xn[25], yn[25]);	
			  distortDesigner2[6].setTransform(xn[16], yn[16], xn[17], yn[17], xn[27], yn[27], xn[26], yn[26]);	
			  distortDesigner2[7].setTransform(xn[17], yn[17], xn[18], yn[18], xn[28], yn[28], xn[27], yn[27]);	
			  distortDesigner2[8].setTransform(xn[18], yn[18], xn[19], yn[19], xn[29], yn[29], xn[28], yn[27]);	
			  
			  //дизайнер3
			  distortDesigner3[0].setTransform(xn[20], yn[20], xn[21], yn[21], xn[31], yn[31], xn[30], yn[30]);
			  distortDesigner3[1].setTransform(xn[21], yn[21], xn[22], yn[22], xn[32], yn[32], xn[31], yn[31]);
			  distortDesigner3[2].setTransform(xn[22], yn[22], xn[23], yn[23], xn[33], yn[33], xn[32], yn[32]);	
			  distortDesigner3[3].setTransform(xn[23], yn[23], xn[24], yn[24], xn[34], yn[34], xn[33], yn[33]);	
			  distortDesigner3[4].setTransform(xn[24], yn[24], xn[25], yn[25], xn[35], yn[35], xn[34], yn[34]);	
			  distortDesigner3[5].setTransform(xn[25], yn[25], xn[26], yn[26], xn[36], yn[36], xn[35], yn[35]);	
			  distortDesigner3[6].setTransform(xn[26], yn[26], xn[27], yn[27], xn[37], yn[37], xn[36], yn[36]);	
			  
			  //дизайнер4
			  distortDesigner4[0].setTransform(xn[30], yn[30], xn[31], yn[31], xn[41], yn[41], xn[40], yn[40]);
			  distortDesigner4[1].setTransform(xn[31], yn[31], xn[32], yn[32], xn[42], yn[42], xn[41], yn[41]);
			  distortDesigner4[2].setTransform(xn[32], yn[32], xn[33], yn[33], xn[43], yn[43], xn[42], yn[42]);	
			  distortDesigner4[3].setTransform(xn[33], yn[33], xn[34], yn[34], xn[44], yn[44], xn[43], yn[43]);	
			  distortDesigner4[4].setTransform(xn[34], yn[34], xn[35], yn[35], xn[45], yn[45], xn[44], yn[44]);	
			  distortDesigner4[5].setTransform(xn[35], yn[35], xn[36], yn[36], xn[46], yn[46], xn[45], yn[45]);	
			  distortDesigner4[6].setTransform(xn[36], yn[36], xn[37], yn[37], xn[47], yn[47], xn[46], yn[46]);	
			  distortDesigner4[7].setTransform(xn[37], yn[37], xn[38], yn[38], xn[48], yn[48], xn[47], yn[47]);	
			  
			  if (addchld)
			  {
				container.addChild(distortDesigner1[0]);
				container.addChild(distortDesigner1[1]);
				container.addChild(distortDesigner1[2]);
				container.addChild(distortDesigner1[3]);
				container.addChild(distortDesigner1[4]);
				container.addChild(distortDesigner1[5]);
				container.addChild(distortDesigner1[6]);
				container.addChild(distortDesigner1[7]);
				
				container.addChild(distortDesigner2[0]);
				container.addChild(distortDesigner2[1]);
				container.addChild(distortDesigner2[2]);
				container.addChild(distortDesigner2[3]);
				container.addChild(distortDesigner2[4]);
				container.addChild(distortDesigner2[5]);
				container.addChild(distortDesigner2[6]);
				container.addChild(distortDesigner2[7]);
				container.addChild(distortDesigner2[8]);
				
				container.addChild(distortDesigner3[0]);
				container.addChild(distortDesigner3[1]);
				container.addChild(distortDesigner3[2]);
				container.addChild(distortDesigner3[3]);
				container.addChild(distortDesigner3[4]);
				container.addChild(distortDesigner3[5]);
				container.addChild(distortDesigner3[6]);
				
				container.addChild(distortDesigner4[0]);
				container.addChild(distortDesigner4[1]);
				container.addChild(distortDesigner4[2]);
				container.addChild(distortDesigner4[3]);
				container.addChild(distortDesigner4[4]);
				container.addChild(distortDesigner4[5]);
				container.addChild(distortDesigner4[6]);
				container.addChild(distortDesigner4[7]);
			  }
				
			  
			}
				
			
			
			
			
			// рисуем по точкам каждый объект
			function linears(obj:MovieClip,x1:Number,y1:Number,x2:Number,y2:Number,
							x3:Number, y3:Number, x4:Number, y4:Number, bmp:BitmapData,
							mtrx:Matrix, obj_color:uint,
							obj_alpha:Number,obj_lineStyle:Number,obj_lineColor:uint):void 
				{
				   	
					
					
					/*_distortImage = new DistortImage(bmp);	
					_distortImage.setTransform(x1, y1, x2, y2, x4, y4,x3,y3);
					_distortImage.buttonMode = true;
					_distortImage.scaleX = 0.5;
					_distortImage.scaleY = 0.5;
					_distortImage.x = 0;
					_distortImage.cacheAsBitmap;
					if (!_distortImage.stage)
					{
						trace("Добавили дисторсию");
						container.addChild(_distortImage);
					}*/
					
					
					
					/*var w:TextField = new TextField();
					w.text = String(x1) ;
					w.setTextFormat(new TextFormat("Courier New", 10, 0x000000, false, false, false));
					w.background = true;
					w.width = w.textWidth;
					w.height = w.textHeight;
					w.x = x1;
					w.y = y1;*/
					
					
					//заливаем битмапом
					
					/*obj.graphics.beginBitmapFill(bmp,mtrx);
					obj.graphics.lineStyle(obj_lineStyle,obj_lineColor);
					obj.graphics.moveTo(x1,y1);
					obj.graphics.lineTo(x1,y1);
					obj.graphics.lineTo(x2,y2);
					obj.graphics.lineTo(x4,y4);
					obj.graphics.lineTo(x3,y3);
					obj.graphics.lineTo(x1,y1);
					obj.graphics.endFill();
					obj.buttonMode=true;*/
					
			        //===========Затеняем
					obj.graphics.beginFill(obj_color,alphaButton);
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
					
					//===========Затеняем
					obj.graphics.beginFill(0xFFFFFF,obj_alpha);
					obj.graphics.lineStyle(obj_lineStyle,obj_lineColor);
					obj.graphics.moveTo(x1,y1);
					obj.graphics.lineTo(x1,y1);
					obj.graphics.lineTo(x2,y2);
					obj.graphics.lineTo(x4,y4);
					obj.graphics.lineTo(x3,y3);
					obj.graphics.lineTo(x1,y1);
					obj.graphics.endFill();
					obj.buttonMode=true;
	                obj.cacheAsBitmap;
					
					
					
					
					
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
					//если нажали показываем фрейм с большим изображением	
					if (clickON)
					{
					    
						addFrame();
					}
					
				}
			
				
			
				function addFrame():void
				{
					
					removeEventListeners();
					frame.addChild(BmpLoader);
					frame.addChild(closeFrame);
					addChild(frame);
					//Добавляем обработчики mouse на кнопку закрытия
					closeFrame.addEventListener(MouseEvent.CLICK, mouseClickFrame);
					closeFrame.addEventListener(MouseEvent.MOUSE_OUT, mouseOutFrame);
					closeFrame.addEventListener(MouseEvent.MOUSE_OVER, mouseOverFrame);
					
				}
	
				// вышли из кнопки закрытия
				function mouseOutFrame ():void 
				{
					timelineFrame.reverse();
				}
				//навели на кнопку закрытия
				function mouseOverFrame():void 
				{
					timelineFrame.play();	
				}	
				function mouseClickFrame(e:MouseEvent):void 
				{
					
					
					removeChild(frame);
					frame.removeChild(BmpLoader);
					frame.removeChild(closeFrame);
					addEventListeners();
					//клавиша не нажата
					clickON=false;
					RedrawDesigners();
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
					//очищаем пентагоны
					pentagon1.graphics.clear();
					pentagon2.graphics.clear();
					pentagon3.graphics.clear();
					pentagon4.graphics.clear();
					
					//очищаем листалки
					prevbutton1.graphics.clear();
					prevbutton2.graphics.clear();
					prevbutton3.graphics.clear();
					prevbutton4.graphics.clear();
					
					nextbutton1.graphics.clear();
					nextbutton2.graphics.clear();
					nextbutton3.graphics.clear();
					nextbutton4.graphics.clear();
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
					button.alpha = 0;
					//trace("clicks= ", clicks[button.value]);
					
					
					if ((button==mySprite[0])&&(mySprite[0].pressed))
					{
						color_cube[0]=outMouse_color;
						//trace(button.value);
						//trace(button.pressed);
						getOrigCoord();
											
						changeCoord(0,1,10,11,0);
						RedrawDesigners();
						
					} 
					else if ((button == mySprite[1])&&(mySprite[1].pressed))
					{
						//trace(button.value);
						//trace(button.pressed);
						getOrigCoord();
						color_cube[1]=outMouse_color;
						
						
						changeCoord(1,2,11,12,1);
						RedrawDesigners();
					} 
					else if ((button == mySprite[2])&&(mySprite[2].pressed)) 
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[2]=outMouse_color;
						changeCoord(2,3,12,13,2);
						RedrawDesigners();
					} 
					else if ((button == mySprite[3])&&(mySprite[3].pressed)) 
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[3]=outMouse_color;
						changeCoord(3,4,13,14,3);
						RedrawDesigners();
					} 
					else if ((button == mySprite[4])&&(mySprite[4].pressed)) 
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[4]=outMouse_color;
						changeCoord(4,5,14,15,4);
						RedrawDesigners();
					}			 
					else if ((button == mySprite[5]) &&(mySprite[5].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[5]=outMouse_color;
						changeCoord(5,6,15,16,5);
						RedrawDesigners();
					} 
					else if ((button == mySprite[6]) &&(mySprite[6].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[6]=outMouse_color;
						changeCoord(6,7,16,17,6);
						RedrawDesigners();
					}
					else if ((button == mySprite[7]) &&(mySprite[7].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[7]=outMouse_color;
						changeCoord(7,8,17,18,7);
						RedrawDesigners();
					} 
					else if ((button == mySprite[8]) &&(mySprite[8].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[8]=outMouse_color;
						changeCoord(8,9,18,19,8);
						RedrawDesigners();
					} 
					else if ((button == mySprite[9]) &&(mySprite[9].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[9]=outMouse_color;
						changeCoord(10,11,20,21,9);
						RedrawDesigners();
					} 
					else if ((button == mySprite[10]) &&(mySprite[10].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[10]=outMouse_color;
						changeCoord(11,12,21,22,10);
						RedrawDesigners();
					}
					else if ((button == mySprite[11]) &&(mySprite[11].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[11]=outMouse_color;
						changeCoord(12,13,22,23,11);
						RedrawDesigners();
					}
					else if ((button == mySprite[12]) &&(mySprite[12].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[12]=outMouse_color;
						changeCoord(13,14,23,24,12);
						RedrawDesigners();
					}
					else if ((button == mySprite[13]) &&(mySprite[13].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[13]=outMouse_color;
						changeCoord(14,15,24,25,13);
						RedrawDesigners();
					}
					else if ((button == mySprite[14]) &&(mySprite[14].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[14]=outMouse_color;
						changeCoord(15,16,25,26,14);
						RedrawDesigners();
					}
					else if ((button == mySprite[15]) &&(mySprite[15].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[15]=outMouse_color;
						changeCoord(16,17,26,27,15);
						RedrawDesigners();
					}
					else if ((button == mySprite[16]) &&(mySprite[16].pressed))
					{	
						//trace(button.value);
						getOrigCoord();
						color_cube[16]=outMouse_color;
						changeCoord(17,18,27,28,16);
						RedrawDesigners();
					}
					else if ((button == mySprite[17]) &&(mySprite[17].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[17]=outMouse_color;
						changeCoord(18,19,28,29,17);
						RedrawDesigners();
					}
					else if ((button == mySprite[18]) &&(mySprite[18].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[18]=outMouse_color;
						changeCoord(20,21,30,31,18);
						RedrawDesigners();
					}
					else if ((button == mySprite[19]) &&(mySprite[19].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[19]=outMouse_color;
						changeCoord(21,22,31,32,19);
						RedrawDesigners();
					}
					else if ((button == mySprite[20]) &&(mySprite[20].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[20]=outMouse_color;
						changeCoord(22,23,32,33,20);
						RedrawDesigners();
					}
					else if ((button == mySprite[21]) &&(mySprite[21].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[21]=outMouse_color;
						changeCoord(23,24,33,34,21);
						RedrawDesigners();
					}
					else if ((button == mySprite[22]) &&(mySprite[22].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[22]=outMouse_color;
						changeCoord(24,25,34,35,22);
						RedrawDesigners();
					}
					else if ((button == mySprite[23]) &&(mySprite[23].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[23]=outMouse_color;
						changeCoord(25,26,35,36,23);
						RedrawDesigners();
					}
					else if ((button == mySprite[24]) &&(mySprite[24].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[24]=outMouse_color;
						changeCoord(26,27,36,37,24);
						RedrawDesigners();
					}
					else if ((button == mySprite[25]) &&(mySprite[25].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[25]=outMouse_color;
						changeCoord(27,28,37,38,25);
						RedrawDesigners();
					}
	
					else if ((button == mySprite[26]) &&(mySprite[26].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[26]=outMouse_color;
						changeCoord(28,29,38,39,26);
						RedrawDesigners();
					}
					else if ((button == mySprite[27])&&(mySprite[27].pressed)) 
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[27]=outMouse_color;
						changeCoord(30,31,40,41,27);
						RedrawDesigners();
					}
					else if ((button == mySprite[28]) &&(mySprite[28].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[28]=outMouse_color;
						changeCoord(31,32,41,42,28);
						RedrawDesigners();
					}
					else if ((button == mySprite[29]) &&(mySprite[29].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[29]=outMouse_color;
						changeCoord(32,33,42,43,29);
						RedrawDesigners();
					}
					else if ((button == mySprite[30]) &&(mySprite[30].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[30]=outMouse_color;
						changeCoord(33,34,43,44,30);
						RedrawDesigners();
					}
					else if ((button == mySprite[31]) &&(mySprite[31].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[31]=outMouse_color;
						changeCoord(34,35,44,45,31);
						RedrawDesigners();
					}
					else if ((button == mySprite[32]) &&(mySprite[32].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[32]=outMouse_color;
						changeCoord(35,36,45,46,32);
						RedrawDesigners();
					}
					else if ((button == mySprite[33]) &&(mySprite[33].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[33]=outMouse_color;
						changeCoord(36,37,46,47,33);
						RedrawDesigners();
					}
					else if ((button == mySprite[34]) &&(mySprite[34].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[34]=outMouse_color;
						changeCoord(37,38,47,48,34);
						RedrawDesigners();
					}
					else if ((button == mySprite[35]) &&(mySprite[35].pressed))
					{
						//trace(button.value);
						getOrigCoord();
						color_cube[35]=outMouse_color;
						changeCoord(38,39,48,49,35);
						RedrawDesigners();
					}
		
				} // End Function MouseOverHandler

					//Это вызывается, когда мышь выходит за границы кнопки
					function mouseOutHandler(e:MouseEvent):void 
					{
												
						getOrigCoord();
						RedrawDesigners();
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
						//нажали
						clickON=true;
						//trace("Pressed");
						//кнопка как таргет объект 
						var button:MovieClip = e.target as MovieClip;
						//button.pressed = false;
						//создаем новый лоадер большой картинки
						BmpLoader = new RootClass;
						color_cube[button.value] = onClick_color;
						clicks[button.value] = button.value;
						changeOrigCoord(0, 0, 0, 0);
						RedrawDesigners();
						//будем хранить ссылку на полноформатное изображение
						var url_full:String;
						//будем хранить ссылку на проект
						var url_project:String;
						//будем хранить подпись к изображению
						var description:String;
						
						if (button==mySprite[0])
						{
							
							url_full = designer1.dFullImage[0 + countD1];
							url_project = designer1.dProject[0 + countD1];
							description = "Дизайнер: " + designer1.dName.text + " | " + designer1.dText[0 + countD1];
							BmpLoader.loadadres(url_full, url_project,description);
						} 
						else if (button == mySprite[1]) 
						{
							
							url_full = designer1.dFullImage[1 + countD1];
							url_project = designer1.dProject[1 + countD1];
							description = "Дизайнер: " + designer1.dName.text + " | " + designer1.dText[1 + countD1];
							BmpLoader.loadadres(url_full, url_project,description);
						} 
						else if (button == mySprite[2]) 
						{
							
							url_full = designer1.dFullImage[2 + countD1];
							url_project = designer1.dProject[2 + countD1];
							description = "Дизайнер: " + designer1.dName.text + " | " + designer1.dText[2 + countD1];
							BmpLoader.loadadres(url_full, url_project,description);
						} 
						else if (button == mySprite[3]) 
						{
							
							url_full = designer1.dFullImage[3 + countD1];
							url_project = designer1.dProject[3 + countD1];
							description = "Дизайнер: " + designer1.dName.text + " | " + designer1.dText[3 + countD1];
							BmpLoader.loadadres(url_full, url_project,description);
						} 
						else if (button == mySprite[4]) 
						{
							
							url_full = designer1.dFullImage[4 + countD1];
							url_project = designer1.dProject[4 + countD1];
							description = "Дизайнер: " + designer1.dName.text + " | " + designer1.dText[4 + countD1];
							BmpLoader.loadadres(url_full, url_project,description);
						} 
						else if (button == mySprite[5]) 
						{
							
							url_full = designer1.dFullImage[5 + countD1];
							url_project = designer1.dProject[5 + countD1];
							description = "Дизайнер: " + designer1.dName.text + " | " + designer1.dText[5 + countD1];
							BmpLoader.loadadres(url_full, url_project,description);
						} 
						else if (button == mySprite[6]) 
						{
							
							url_full = designer1.dFullImage[6 + countD1];
							url_project = designer1.dProject[6 + countD1];
							description = "Дизайнер: " + designer1.dName.text + " | " + designer1.dText[6 + countD1];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[7]) 
						{
							
							url_full = designer1.dFullImage[7 + countD1];
							url_project = designer1.dProject[7 + countD1];
							description = "Дизайнер: " + designer1.dName.text + " | " + designer1.dText[7 + countD1];
							BmpLoader.loadadres(url_full, url_project,description);
						} 
						else if (button == mySprite[8]) 
						{
							
							url_full = designer1.dFullImage[8 + countD1];
							url_project = designer1.dProject[8 + countD1];
							description = "Дизайнер: " + designer1.dName.text + " | " + designer1.dText[8 + countD1];
							BmpLoader.loadadres(url_full, url_project,description);
						} 
						else if (button == mySprite[9]) 
						{
							url_full = designer2.dFullImage[0 + countD2];
							url_project = designer2.dProject[0 + countD2];
							description = "Дизайнер: " + designer2.dName.text + " | " + designer2.dText[0 + countD2];
							BmpLoader.loadadres(url_full, url_project,description);
							
							
						} 
						else if (button == mySprite[10]) 
						{
							
							url_full = designer2.dFullImage[1 + countD2];
							url_project = designer2.dProject[1 + countD2];
							description = "Дизайнер: " + designer2.dName.text + " | " + designer2.dText[1 + countD2];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[11]) 
						{
							
							url_full = designer2.dFullImage[2 + countD2];
							url_project = designer2.dProject[2 + countD2];
							description = "Дизайнер: " + designer2.dName.text + " | " + designer2.dText[2 + countD2];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[12]) 
						{
							
							url_full = designer2.dFullImage[3 + countD2];
							url_project = designer2.dProject[3 + countD2];
							description = "Дизайнер: " + designer2.dName.text + " | " + designer2.dText[3 + countD2];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[13]) 
						{
							
							url_full = designer2.dFullImage[4 + countD2];
							url_project = designer2.dProject[4 + countD2];
							description = "Дизайнер: " + designer2.dName.text + " | " + designer2.dText[4 + countD2];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[14]) 
						{
							
							url_full = designer2.dFullImage[5 + countD2];
							url_project = designer2.dProject[5 + countD2];
							description = "Дизайнер: " + designer2.dName.text + " | " + designer2.dText[5 + countD2];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[15]) 
						{
							
							url_full = designer2.dFullImage[6 + countD2];
							url_project = designer2.dProject[6 + countD2];
							description = "Дизайнер: " + designer2.dName.text + " | " + designer2.dText[6 + countD2];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[16]) 
						{
							
							url_full = designer2.dFullImage[7 + countD2];
							url_project = designer2.dProject[7 + countD2];
							description = "Дизайнер: " + designer2.dName.text + " | " + designer2.dText[7 + countD2];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[17]) 
						{
							
							url_full = designer2.dFullImage[8 + countD2];
							url_project = designer2.dProject[8 + countD2];
							description = "Дизайнер: " + designer2.dName.text + " | " + designer2.dText[8 + countD2];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[18]) 
						{
							
							url_full = designer3.dFullImage[0 + countD3];
							url_project = designer3.dProject[0 + countD3];
							description = "Дизайнер: " + designer3.dName.text + " | " + designer3.dText[0 + countD3];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[19]) 
						{
							
							url_full = designer3.dFullImage[1 + countD3];
							url_project = designer3.dProject[1 + countD3];
							description = "Дизайнер: " + designer3.dName.text + " | " + designer3.dText[1 + countD3];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[20]) 
						{
							
							url_full = designer3.dFullImage[2 + countD3];
							url_project = designer3.dProject[2 + countD3];
							description = "Дизайнер: " + designer3.dName.text + " | " + designer3.dText[2 + countD3];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[21]) 
						{
							
							url_full = designer3.dFullImage[3 + countD3];
							url_project = designer3.dProject[3 + countD3];
							description = "Дизайнер: " + designer3.dName.text + " | " + designer3.dText[3 + countD3];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[22]) 
						{
							
							url_full = designer3.dFullImage[4 + countD3];
							url_project = designer3.dProject[4 + countD3];
							description = "Дизайнер: " + designer3.dName.text + " | " + designer3.dText[4 + countD3];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[23]) 
						{
							
							url_full = designer3.dFullImage[5 + countD3];
							url_project = designer3.dProject[5 + countD3];
							description = "Дизайнер: " + designer3.dName.text + " | " + designer3.dText[5 + countD3];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[24]) 
						{
							
							url_full = designer3.dFullImage[6 + countD3];
							url_project = designer3.dProject[6 + countD3];
							description = "Дизайнер: " + designer3.dName.text + " | " + designer3.dText[6 + countD3];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[25]) 
						{
							
							url_full = designer3.dFullImage[7 + countD3];
							url_project = designer3.dProject[7 + countD3];
							description = "Дизайнер: " + designer3.dName.text + " | " + designer3.dText[7 + countD3];
							BmpLoader.loadadres(url_full, url_project,description);
						}
	
						else if (button == mySprite[26]) 
						{
							
							url_full = designer3.dFullImage[8 + countD3];
							url_project = designer3.dProject[8 + countD3];
							description = "Дизайнер: " + designer3.dName.text + " | " + designer3.dText[8 + countD3];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[27]) 
						{
							
							url_full = designer4.dFullImage[0 + countD4];
							url_project = designer4.dProject[0 + countD4];
							description = "Дизайнер: " + designer4.dName.text + " | " + designer4.dText[0 + countD4];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[28]) 
						{
							
							url_full = designer4.dFullImage[1 + countD4];
							url_project = designer4.dProject[1 + countD4];
							description = "Дизайнер: " + designer4.dName.text + " | " + designer4.dText[1 + countD4];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[29]) 
						{
							
							url_full = designer4.dFullImage[2 + countD4];
							url_project = designer4.dProject[2 + countD4];
							description = "Дизайнер: " + designer4.dName.text + " | " + designer4.dText[2 + countD4];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[30]) 
						{
							
							url_full = designer4.dFullImage[3 + countD4];
							url_project = designer4.dProject[3 + countD4];
							description = "Дизайнер: " + designer4.dName.text + " | " + designer4.dText[3 + countD4];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[31]) 
						{
							
							url_full = designer4.dFullImage[4 + countD4];
							url_project = designer4.dProject[4 + countD4];
							description = "Дизайнер: " + designer4.dName.text + " | " + designer4.dText[4 + countD4];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[32]) 
						{
							url_full = designer4.dFullImage[5 + countD4];
							url_project = designer4.dProject[5 + countD4];
							description = "Дизайнер: " + designer4.dName.text + " | " + designer4.dText[5 + countD4];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[33]) 
						{
							url_full = designer4.dFullImage[6 + countD4];
							url_project = designer4.dProject[6 + countD4];
							description = "Дизайнер: " + designer4.dName.text + " | " + designer4.dText[6 + countD4];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[34]) 
						{
							url_full = designer4.dFullImage[7 + countD4];
							url_project = designer4.dProject[7 + countD4];
							description = "Дизайнер: " + designer4.dName.text + " | " + designer4.dText[7 + countD4];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[35]) 
						{
							url_full = designer4.dFullImage[8 + countD4];
							url_project = designer4.dProject[8 + countD4];
							description = "Дизайнер: " + designer4.dName.text + " | " + designer4.dText[8 + countD4];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[36]) 
						{
							url_full = designer4.dFullImage[9 + countD4];
							url_project = designer4.dProject[9 + countD4];
							description = "Дизайнер: " + designer4.dName.text + " | " + designer4.dText[9 + countD4];
							BmpLoader.loadadres(url_full, url_project,description);
						}
					} // End function mouseClickHandler

					
					//функция перерисовки
					function RedrawDesigners():void
						{
							ClearingAll();
							DriwingCurve(); 
							drawdistortDesigner();
							createBtns();
							 pentX = [xn[0]-PentagonWidth,xn[0]-10,xn[10]-10,xn[10]-PentagonWidth,xn[0]-PentagonAngle,xn[20]-10,xn[20]-PentagonWidth,xn[20]-PentagonAngle,xn[30]-10,xn[30]-PentagonWidth,xn[30]-PentagonAngle,xn[40]-10,xn[40]-PentagonWidth,xn[40]-PentagonAngle];
							 pentY = [yn[0],yn[0],yn[10],yn[10],yn[0]-(yn[0]-yn[10])/2,yn[20],yn[20],yn[10]-(yn[10]-yn[20])/2,yn[30],yn[30],yn[20]-(yn[20]-yn[30])/2,yn[40],yn[40],yn[30]-(yn[30]-yn[40])/2];
							
							 d1Container.x = (d1X - pentX[4]) * ( -1);
							 d1Container.y = (d1Y - pentY[4]) * ( -1);
							 
							 d2Container.x = (d2X - pentX[7]) * ( -1);
							 d2Container.y = (d2Y - pentY[7]) * ( -1);
							 
							 d3Container.x = (d3X - pentX[10]) * ( -1);
							 d3Container.y = (d3Y - pentY[10]) * ( -1);
							 
							 d4Container.x = (d4X - pentX[13]) * ( -1);
							 d4Container.y = (d4Y - pentY[13]) * ( -1);
							 
							 createPentagons();
						}
				
		      					
			
			
			}//End public function DesignerDraw 
		