package 
{
import flash.display.*;
import fl.transitions.Tween;
import fl.transitions.easing.*;
import fl.transitions.TweenEvent;
import fl.transitions.Tween;
import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.text.*;
import flash.events.*;
import flash.geom.Matrix;
import flash.filters.*;
import flash.display.StageScaleMode;
import flash.net.*


	
	/**
	 * ...
	 * @author ziplex
	 */
	public class Main extends Sprite 
	{
		
		
		public function Main():void 
		{
		 		
			//==Описание Переменных=======================================================================================
		
			var tweens:Array = []; //храним все твины
			var mySprite:Array = [];//храним спрайты

			var container:MovieClip=new MovieClip(); // содержит все мувики
			var globalScene:MovieClip=new MovieClip(); //содержит все что на сцене

			var Mybackground:MovieClip = new MovieClip();//background
			var frame:MovieClip = new MovieClip();
			var widget : TextField; // прелоадер текст
			var i:int;//счетчик
			var xc:Number;
			var yc:Number;
			var btColor:Number=0x000000 //цвет выделяемого объекта
		
			//координаты криволинейного объекта 
			var xn:Array=[299,347.9,398.9,448.3,497.4,547.8,591.5,647,692.8,293.5,343.5,395.5,454.4,503.9,560.4,603.1,656.6,702.4,753,298,348,399.5,454.4,503.9,552.7,600.1,652.6,703.4,755.2,304,352.5,404.5,459.9,509.3,559.5,605.5,660,704.9,299,349,401,457.3,505,559.5,602.3,655.7,702.5];
			var yn:Array=[102,92,99.3,89,110.1,110.6,96.3,100.8,109.9,162.8,153.8,159.1,149.9,166.3,168.4,151.1,155.6,163.7,170,226,214.5,218.7,210.1,223.8,225.5,212.1,214.6,223.2,227.5,288,277.1,278.7,274.3,279.1,285.6,273.7,276.3,283.9,350,340.2,342.3,333.7,339.5,343.5,332,336.6,344.2];

			//var xn:Array=new Array(167.1,215.3,258.1,304.3,349.9,399.1,438.4,480.1,167.1,215.3,258.3,308.8,349.6,397.1,431.4,473.6,511.7,556.9,161.8,211.8,259.8,308.3,349.4,400.4,435.6,478.9,517.4,561.2,164.3,215.1,257.6,317.1,356.1,400.4,436.6,480.1,515.9,175.3,215.1,257.6,316.8,355.4,396.9,437.4,476.6,169.3,215.1,259.3,311.6,355.6,402.6,442.4,481.9);
			//var yn:Array=new Array(29,21.5,32.8,26.5,29.3,26.8,37,42.3,82.0,81.8,84,79,83.3,79.3,88.8,92.5,87.8,89.5,132.8,131.8,136.8,134.8,133.8,132.5,143.5,145.5,140.8,137.8,183.8,185.6,182.3,181.8,181.8,186.3,193.1,196.6,193.3,246.8,243.8,242.6,241.8,242.1,238.1,244.8,246.3,307.6,293.3,291.6,288.1,292.1,295.1,292.3,293.3);

			//координаты прямолинейного объекта
			var xm:Array = [299, 361, 423, 485, 547, 609, 671, 733, 795, 299, 361, 423, 485, 547, 609, 671, 733, 795, 802, 857, 299, 361, 423, 485, 547, 609, 671, 733, 795, 857, 299, 361, 423, 485, 547, 609, 671, 733, 795, 299, 361, 423, 485, 547, 609, 671, 733, 795];
            var ym:Array = [102, 102, 102, 102, 102, 102, 102, 102, 102, 164, 164, 164, 164, 164, 164, 164, 164, 164, 164, 164, 226, 226, 226, 226, 226, 226, 226, 226, 226, 226, 288, 288, 288, 288, 288, 288, 288, 288, 288, 350, 350, 350, 350, 350, 350, 350, 350, 350];

			
			//var xm:Array=new Array(167,217,267,317,367,417,467,517,167,217,267,317,367,417,467,517,567,617,167,217,267,317,367,417,467,517,567,617,167,217,267,317,367,417,467,517,567,167,217,267,317,367,417,467,517,167,217,267,317,367,417,467,517,567);
			//var ym:Array=new Array(29,29,29,29,29,29,29,29,79,79,79,79,79,79,79,79,79,79,129,129,129,129,129,129,129,129,129,129,179,179,179,179,179,179,179,179,179,229,229,229,229,229,229,229,229,279,279,279,279,279,279,279,279,279);

			var xOrig:Array=[];
			var yOrig:Array=[];

			var clickON:Boolean=false;

			//var frame:bord=new bord(); // контейнер для большой картинки
			var Shadow:DropShadowFilter = new DropShadowFilter(); // фильтр для тени
			var blur:BlurFilter=new BlurFilter();// фильтр размытия

			var Mymatrix:Matrix;// матрица наложения битмапа
			var ArrBitmap:Array=[];//массив битмапов
			var thmb:Array=[]; //массив загрузок миниатюр
          
			//============Переменные для работы с XML
			var my_x:Number;
			var my_y:Number;
			var my_thumb_width:Number;
			var my_thumb_height:Number;
			var my_images:XMLList;
			var my_total:Number;
			var myXMLLoader:URLLoader = new URLLoader();
			
			//==Конец Описания Переменных=======================================================================================
			
					
			
		 	stage.scaleMode=StageScaleMode.SHOW_ALL;
			blur.blurX=100;
			blur.blurY=100;
			Shadow.alpha=0.5;
			Shadow.distance=10;
			Shadow.angle=80; 
			
			//создаем фон
			Mybackground.graphics.beginFill(0x3399CC, 1);
			Mybackground.graphics.drawRect(0, 0, 768, 768);
			Mybackground.graphics.endFill();
			globalScene.addChild(Mybackground);
			
			//создаем фрейм для загрузки полноформатного изображения
			frame.graphics.beginFill(0x009966, 0.5);
			frame.graphics.lineStyle(0.5,0x000000);
			frame.graphics.drawRect(0, 0, 768, 768);
			frame.graphics.endFill();
			
			
			
		    // создаем муви клипы
			for (i=0; i<37; i++) 
			{
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

			function waitLoad():void
			{
				
				widget = new TextField();
				widget.text = "Loading please wait...";
				widget.setTextFormat(new TextFormat("Courier New", 14, 0xB4DCF3, false, false, false));
				widget.width = widget.textWidth;
				widget.x = 295;
				widget.y = 201;
				widget.filters=[Shadow];
				addChild(Mybackground);
				addChild(widget);
				
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
				trace("XML is load",my_images);
				loadImage();
			}


//======================================================

			function loadImage():void
			{  
				waitLoad();
				for(i= 0; i < my_total; i++)
				{
					var thumb_url:String = my_images[i].@THUMB;
					thmb[i]= new Loader();
					thmb[i].load(new URLRequest(thumb_url));
					thmb[i].contentLoaderInfo.addEventListener(Event.COMPLETE, onImageLoad);
					
				}
				
	
			}
			
			



			function onImageLoad(e:Event):void
			{
				
				//var my_thumb:Loader = Loader(e.target.loader);
				for(i= 0; i < my_total; i++)
				{
					ArrBitmap[i] = new BitmapData(thmb[i].width,thmb[i].height);
					ArrBitmap[i].draw(thmb[i],new Matrix());
					Mymatrix=new Matrix();
					Mymatrix.scale(1.2,1.2);
					//trace(loaderPic.name);
				}
					
				    DriwingCurve();
					addEventListeners();
					if (widget.stage)
					{ 
					removeChild(widget); 
					
					}
					
			}
			
						
			
			
			function DriwingCurve():void 
			{   
				//Первый ряд
				linears(mySprite[0],xn[0],yn[0],xn[1],yn[1],xn[9],yn[9],xn[10],yn[10],ArrBitmap[0],Mymatrix);
				linears(mySprite[1],xn[1],yn[1],xn[2],yn[2],xn[10],yn[10],xn[11],yn[11],ArrBitmap[1],Mymatrix);
			 	linears(mySprite[2],xn[2],yn[2],xn[3],yn[3],xn[11],yn[11],xn[12],yn[12],ArrBitmap[2],Mymatrix);
				linears(mySprite[3],xn[3],yn[3],xn[4],yn[4],xn[12],yn[12],xn[13],yn[13],ArrBitmap[3],Mymatrix);
				linears(mySprite[4],xn[4],yn[4],xn[5],yn[5],xn[13],yn[13],xn[14],yn[14],ArrBitmap[4],Mymatrix);
				linears(mySprite[5],xn[5],yn[5],xn[6],yn[6],xn[14],yn[14],xn[15],yn[15],ArrBitmap[5],Mymatrix);
				linears(mySprite[6],xn[6],yn[6],xn[7],yn[7],xn[15],yn[15],xn[16],yn[16],ArrBitmap[6],Mymatrix);
				linears(mySprite[7],xn[7],yn[7],xn[8],yn[8],xn[16],yn[16],xn[17],yn[17],ArrBitmap[7],Mymatrix);
				//Второй ряд
				linears(mySprite[8],xn[9],yn[9],xn[10],yn[10],xn[19],yn[19],xn[20],yn[20],ArrBitmap[8],Mymatrix);
				linears(mySprite[9],xn[10],yn[10],xn[11],yn[11],xn[20],yn[20],xn[21],yn[21],ArrBitmap[9],Mymatrix);
				linears(mySprite[10],xn[11],yn[11],xn[12],yn[12],xn[21],yn[21],xn[22],yn[22],ArrBitmap[10],Mymatrix);
				linears(mySprite[11],xn[12],yn[12],xn[13],yn[13],xn[22],yn[22],xn[23],yn[23],ArrBitmap[11],Mymatrix);
				linears(mySprite[12],xn[13],yn[13],xn[14],yn[14],xn[23],yn[23],xn[24],yn[24],ArrBitmap[12],Mymatrix);
				linears(mySprite[13],xn[14],yn[14],xn[15],yn[15],xn[24],yn[24],xn[25],yn[25],ArrBitmap[13],Mymatrix);
				linears(mySprite[14],xn[15],yn[15],xn[16],yn[16],xn[25],yn[25],xn[26],yn[26],ArrBitmap[14],Mymatrix);
				linears(mySprite[15],xn[16],yn[16],xn[17],yn[17],xn[26],yn[26],xn[27],yn[27],ArrBitmap[15],Mymatrix);
				linears(mySprite[16],xn[17],yn[17],xn[18],yn[18],xn[27],yn[27],xn[28],yn[28],ArrBitmap[16],Mymatrix);
				//Третий ряд
				linears(mySprite[17],xn[19],yn[19],xn[20],yn[20],xn[29],yn[29],xn[30],yn[30],ArrBitmap[17],Mymatrix);
				linears(mySprite[18],xn[20],yn[20],xn[21],yn[21],xn[30],yn[30],xn[31],yn[31],ArrBitmap[18],Mymatrix);
				linears(mySprite[19],xn[21],yn[21],xn[22],yn[22],xn[31],yn[31],xn[32],yn[32],ArrBitmap[19],Mymatrix);
				linears(mySprite[20],xn[22],yn[22],xn[23],yn[23],xn[32],yn[32],xn[33],yn[33],ArrBitmap[20],Mymatrix);
				linears(mySprite[21],xn[23],yn[23],xn[24],yn[24],xn[33],yn[33],xn[34],yn[34],ArrBitmap[21],Mymatrix);
				linears(mySprite[22],xn[24],yn[24],xn[25],yn[25],xn[34],yn[34],xn[35],yn[35],ArrBitmap[22],Mymatrix);
				linears(mySprite[23],xn[25],yn[25],xn[26],yn[26],xn[35],yn[35],xn[36],yn[36],ArrBitmap[23],Mymatrix);
				//Четвертый ряд
				linears(mySprite[24],xn[29],yn[29],xn[30],yn[30],xn[38],yn[38],xn[39],yn[39],ArrBitmap[24],Mymatrix);
				linears(mySprite[25],xn[30],yn[30],xn[31],yn[31],xn[39],yn[39],xn[40],yn[40],ArrBitmap[25],Mymatrix);
				linears(mySprite[26],xn[31],yn[31],xn[32],yn[32],xn[40],yn[40],xn[41],yn[41],ArrBitmap[26],Mymatrix);
				linears(mySprite[27],xn[32],yn[32],xn[33],yn[33],xn[41],yn[41],xn[42],yn[42],ArrBitmap[27],Mymatrix);
				linears(mySprite[28],xn[33],yn[33],xn[34],yn[34],xn[42],yn[42],xn[43],yn[43],ArrBitmap[28],Mymatrix);
				linears(mySprite[29],xn[34],yn[34],xn[35],yn[35],xn[43],yn[43],xn[44],yn[44],ArrBitmap[29],Mymatrix);
				linears(mySprite[30],xn[35],yn[35],xn[36],yn[36],xn[44],yn[44],xn[45],yn[45],ArrBitmap[30],Mymatrix);
				linears(mySprite[31],xn[36],yn[36],xn[37],yn[37],xn[45],yn[45],xn[46],yn[46],ArrBitmap[31],Mymatrix);
				
				/*linears(mySprite[32],xn[39],yn[39],xn[40],yn[40],xn[47],yn[47],xn[48],yn[48],ArrBitmap[32],Mymatrix);
				linears(mySprite[33],xn[40],yn[40],xn[41],yn[41],xn[48],yn[48],xn[49],yn[49],ArrBitmap[33],Mymatrix);
				linears(mySprite[34],xn[41],yn[41],xn[42],yn[42],xn[49],yn[49],xn[50],yn[50],ArrBitmap[34],Mymatrix);
				linears(mySprite[35],xn[42],yn[42],xn[43],yn[43],xn[50],yn[50],xn[51],yn[51],ArrBitmap[35],Mymatrix);
				linears(mySprite[36],xn[43],yn[43],xn[44],yn[44],xn[51],yn[51],xn[52],yn[52],ArrBitmap[36],Mymatrix);*/

			}
			
			
			
			
			function linears(obj:MovieClip,x1:Number,y1:Number,x2:Number,y2:Number,
							x3:Number, y3:Number, x4:Number, y4:Number, bmp:BitmapData,
							mtrx:Matrix):void 
				{
    
					//заливаем битмапом
					obj.graphics.beginBitmapFill(bmp,mtrx);
					obj.graphics.lineStyle(0.5,0x000000);
					obj.graphics.moveTo(x1,y1);
					obj.graphics.lineTo(x1,y1);
					obj.graphics.lineTo(x2,y2);
					obj.graphics.lineTo(x4,y4);
					obj.graphics.lineTo(x3,y3);
					obj.graphics.lineTo(x1,y1);
					obj.graphics.endFill();
					obj.buttonMode=true;
	
					//===========Затеняем
					obj.graphics.beginFill(0xFF0000,0.2);
					obj.graphics.lineStyle(0.5,0x000000);
					obj.graphics.moveTo(x1,y1);
					obj.graphics.lineTo(x1,y1);
					obj.graphics.lineTo(x2,y2);
					obj.graphics.lineTo(x4,y4);
					obj.graphics.lineTo(x3,y3);
					obj.graphics.lineTo(x1,y1);
					obj.graphics.endFill();
					obj.buttonMode=true;
	
					//Mybackground.graphics.beginFill(0x3399CC, 1);
					//Mybackground.graphics.drawRect(0, 0, 768, 768);
					//Mybackground.graphics.endFill();
					//globalScene.addChild(Mybackground);
					container.filters = [Shadow];
					//container.x=-100;
					//container.y=-10;
					//container.scaleX=1;
					//container.scaleY=1;
					container.addChild(obj);
					globalScene.addChild(container);
					addChild(globalScene);
	
					if (clickON)
					{addCamera();}

				}
			
				
			
				function addCamera():void
				{
					removeEventListeners();
					container.filters=null;
					xc=globalScene.x-mouseX*24-mouseX/300+container.width/2;
					yc=globalScene.y-mouseY*24-mouseY/300+container.height/2;
			
					var tweenX:Tween = new Tween(globalScene, "scaleX", Regular.easeOut,1, 25, 1, true);
	
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
					tweenXc.addEventListener(TweenEvent.MOTION_FINISH, scaleUpFinished);
				}
	
	
				function scaleUpFinished(e:Event):void 
				{
					//container.filters = [blur];
					
					
					//frame.graphics.beginFill(0x009966, 0.5);
					//frame.graphics.lineStyle(0.5,0x000000);
					//frame.graphics.drawRect(0, 0, 768, 768);
					//frame.graphics.endFill();
					
					frame.buttonMode=true;
					addChild(frame);
					
					//Добавляем обработчики mouse click  
					frame.addEventListener(MouseEvent.CLICK, mouseClickFrame); 
				}
	
				function mouseClickFrame(e:MouseEvent):void 
				{
					removeChild(frame);
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
				
				
				
				
				
				
				
				function getOrigCoord():void 
				{
					for (var i:int=0; i<xn.length; i++) 
					{
						xn[i]=xOrig[i];
						yn[i]=yOrig[i];
					}
				}
			
				
				function ClearingAll():void 
				{
					for (i = 0; i < 37; i++) 
					{
						mySprite[i].graphics.clear();
					}
				}


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
				function changeCoord(a:int,b:int,c:int,d:int):void
				{
					xn[a]=xm[a];yn[a]=ym[a];
					xn[b]=xm[b];yn[b]=ym[b];
					xn[c]=xm[c];yn[c]=ym[c];
					xn[d]=xm[d];yn[d]=ym[d];
				}
				// функция смены оригинальных координат
				function changeOrigCoord(a:int,b:int,c:int,d:int):void
				{
					xOrig[a]=xm[a];yOrig[a]=ym[a];
					xOrig[b]=xm[b];yOrig[b]=ym[b];
					xOrig[c]=xm[c];yOrig[c]=ym[c];
					xOrig[d]=xm[d];yOrig[d]=ym[d];
				}
				// это вызывается когда мышь наведена
				function mouseOverHandler(e:MouseEvent):void 
				{
				//Получаем кнопку из события
				var button:MovieClip = e.target as MovieClip;
				//trace(button.name);
				button.alpha=0.3;
    
					if ((button==mySprite[0])&&(mySprite[0].pressed))
					{
						trace(button.value);
						trace(button.pressed);
						getOrigCoord();
						xn[2]+=8;xn[10]+=8;
						xn[3]+=8;xn[11]+=8;
						xn[4]+=8;xn[12]+=8;
						xn[5]+=8;xn[13]+=8;
						xn[6]+=8;xn[14]+=8;
						xn[7]+=8;xn[15]+=8;

						yn[2]+=1;yn[10]+=1;
						yn[3]+=1;yn[11]+=1;
						yn[4]+=1;yn[12]+=1;
						yn[5]+=1;yn[13]+=1;
						yn[6]+=1;yn[14]+=1;
						yn[7]+=1;yn[15]+=1;
		
						changeCoord(0,1,8,9);
						Redriwing();
					} 
					else if (button == mySprite[1]) 
					{
						trace(button.value);
						trace(button.pressed);
						getOrigCoord();
						xn[3]+=9;xn[11]+=9;
						xn[4]+=9;xn[12]+=9;
						xn[5]+=9;xn[13]+=9;
						xn[6]+=9;xn[14]+=9;
						xn[7]+=9;xn[15]+=9;

						yn[2]+=1;yn[10]+=1;
						yn[3]+=1;yn[11]+=1;
						yn[4]+=1;yn[12]+=1;
						yn[5]+=1;yn[13]+=1;
						yn[6]+=1;yn[14]+=1;
						yn[7]+=1;yn[15]+=1;
						changeCoord(1,2,9,10);
						Redriwing();
					} 
					else if (button == mySprite[2]) 
					{
						trace(button.value);
						getOrigCoord();
						xn[1]+=8;xn[9]+=8;
						xn[2]+=8;xn[10]+=8;
						xn[3]+=8;xn[11]+=8;
						xn[4]+=12;xn[12]+=12;
						xn[5]+=12;xn[13]+=12;
						xn[6]+=12;xn[14]+=12;
						xn[7]+=12;xn[15]+=12;

						yn[1]+=1;yn[9]+=10;
						yn[2]+=1;yn[10]+=1;
						yn[3]+=1;yn[11]+=1;
						yn[4]+=1;yn[12]+=1;
						yn[5]+=1;yn[13]+=1;
						yn[6]+=1;yn[14]+=1;
						yn[7]+=1;yn[15]+=1;
						changeCoord(2,3,10,11);
						Redriwing();
					} 
					else if (button == mySprite[3]) 
					{
						trace(button.value);
						getOrigCoord();
						xn[1]+=8;xn[9]+=8;
						xn[2]+=8;xn[10]+=8;
						xn[3]+=8;xn[11]+=8;
						xn[5]+=16;xn[13]+=16;
						xn[6]+=16;xn[14]+=16;
						xn[7]+=16;xn[15]+=16;

						yn[2]+=1;yn[10]+=1;
						yn[3]+=1;yn[11]+=1;
						yn[4]+=1;yn[12]+=1;
						yn[5]+=1;yn[13]+=1;
						yn[6]+=1;yn[14]+=1;
						yn[7]+=1;yn[15]+=1;
						changeCoord(3,4,11,12);
						Redriwing();
					} 
					else if (button == mySprite[4]) 
					{
						trace(button.value);
						getOrigCoord();
						xn[6]+=16;xn[14]+=16;
						xn[7]+=16;xn[15]+=16;

						yn[2]+=1;yn[10]+=1;
						yn[3]+=1;yn[11]+=1;
						yn[4]+=1;yn[12]+=1;
						yn[5]+=1;yn[13]+=1;
						yn[6]+=1;yn[14]+=1;
						yn[7]+=1;yn[15]+=1;
						changeCoord(4,5,12,13);
						Redriwing();
					}			 
					else if (button == mySprite[5]) 
					{
						trace(button.value);
						getOrigCoord();
						xn[4]+=12;xn[12]+=12;
						xn[7]+=16;xn[15]+=16;

						yn[2]+=1;yn[10]+=1;
						yn[3]+=1;yn[11]+=1;
						yn[4]+=1;yn[12]+=1;
						yn[5]+=1;yn[13]+=1;
						yn[6]+=1;yn[14]+=1;
						yn[7]+=1;yn[15]+=1;
						changeCoord(5,6,13,14);
						Redriwing();
					} 
					else if (button == mySprite[6]) 
					{
						trace(button.value);
						getOrigCoord();
						changeCoord(6,7,14,15);
						Redriwing();
					}
					else if (button == mySprite[7]) 
					{
						trace(button.value);
						getOrigCoord();
						changeCoord(8,9,18,19);
						Redriwing();
					} 
					else if (button == mySprite[8]) 
					{
						trace(button.value);
						getOrigCoord();
						changeCoord(9,10,19,20);
						Redriwing();
					} 
					else if (button == mySprite[9]) 
					{
						trace(button.value);
						getOrigCoord();
						changeCoord(10,11,20,21);
						Redriwing();
					} 
					else if (button == mySprite[10]) 
					{
						trace(button.value);
						getOrigCoord();
						changeCoord(11,12,21,22);
						Redriwing();
					}
					else if (button == mySprite[11]) 
					{
						trace(button.value);
						getOrigCoord();
						changeCoord(12,13,22,23);
						Redriwing();
					}
					else if (button == mySprite[12]) 
					{
						trace(button.value);
						getOrigCoord();
						changeCoord(13,14,23,24);
						Redriwing();
					}
					else if (button == mySprite[13]) 
					{
						trace(button.value);
						getOrigCoord();
						changeCoord(14,15,24,25);
						Redriwing();
					}
					else if (button == mySprite[14]) 
					{
						trace(button.value);
						getOrigCoord();
						changeCoord(15,16,25,26);
						Redriwing();
					}
					else if (button == mySprite[15]) 
					{
						trace(button.value);
						getOrigCoord();
						changeCoord(16,17,26,27);
						Redriwing();
					}
					else if (button == mySprite[16]) 
					{	
						trace(button.value);
						getOrigCoord();
						changeCoord(18,19,28,29);
						Redriwing();
					}
					else if (button == mySprite[17]) 
					{
						trace(button.value);
						getOrigCoord();
						changeCoord(19,20,29,30);
						Redriwing();
					}
					else if (button == mySprite[18]) 
					{
						trace(button.value);
						getOrigCoord();
						changeCoord(20,21,30,31);
						Redriwing();
					}
					else if (button == mySprite[19]) 
					{
						trace(button.value);
						getOrigCoord();
						changeCoord(21,22,31,32);
						Redriwing();
					}
					else if (button == mySprite[20]) 
					{
						trace(button.value);
						getOrigCoord();
						changeCoord(22,23,32,33);
						Redriwing();
					}
					else if (button == mySprite[21]) 
					{
						trace(button.value);
						getOrigCoord();
						changeCoord(23,24,33,34);
						Redriwing();
					}
					else if (button == mySprite[22]) 
					{
						trace(button.value);
						getOrigCoord();
						changeCoord(24,25,34,35);
						Redriwing();
					}
					else if (button == mySprite[23]) 
					{
						trace(button.value);
						getOrigCoord();
						changeCoord(25,26,35,36);
						Redriwing();
					}
					else if (button == mySprite[24]) 
					{
						trace(button.value);
						getOrigCoord();
						changeCoord(28,29,37,38);
						Redriwing();
					}
					else if (button == mySprite[25]) 
					{
						trace(button.value);
						getOrigCoord();
						changeCoord(29,30,38,39);
						Redriwing();
					}
	
					else if (button == mySprite[26]) 
					{
						trace(button.value);
						getOrigCoord();
						changeCoord(30,31,39,40);
						Redriwing();
					}
					else if (button == mySprite[27]) 
					{
						trace(button.value);
						getOrigCoord();
						changeCoord(31,32,40,41);
						Redriwing();
					}
					else if (button == mySprite[28]) 
					{
						trace(button.value);
						getOrigCoord();
						changeCoord(32,33,41,42);
						Redriwing();
					}
					else if (button == mySprite[29]) 
					{
						trace(button.value);
						getOrigCoord();
						changeCoord(33,34,42,43);
						Redriwing();
					}
					else if (button == mySprite[30]) 
					{
						trace(button.value);
						getOrigCoord();
						changeCoord(37,38,45,46);
						Redriwing();
					}
					else if (button == mySprite[31]) 
					{
						trace(button.value);
						getOrigCoord();
						changeCoord(38,39,46,47);
						Redriwing();
					}
					else if (button == mySprite[32]) 
					{
						trace(button.value);
						getOrigCoord();
						changeCoord(39,40,47,48);
						Redriwing();
					}
					else if (button == mySprite[33]) 
					{
						trace(button.value);
						getOrigCoord();
						changeCoord(40,41,48,49);
						Redriwing();
					}
					else if (button == mySprite[34]) 
					{
						trace(button.value);
						getOrigCoord();
						changeCoord(41,42,49,50);
						Redriwing();
					}
					else if (button == mySprite[35]) 
					{
						trace(button.value);
						getOrigCoord();
						changeCoord(42,43,50,51);
						Redriwing();
					}
					else if (button == mySprite[36]) 
					{
						trace(button.value);
						getOrigCoord();
						changeCoord(43,44,51,52);
						Redriwing();
					}
		
}

					//Это вызывается, когда мышь выходит за границы кнопки
					function mouseOutHandler(e:MouseEvent):void 
					{
						getOrigCoord();
						Redriwing();
						//Получаем кнопку из события
						var button:MovieClip = e.target as MovieClip;
						//50% прозрачность
						button.alpha = 1;
					}

					//Это вызывается, когда мышкой кликнули по кнопке
					function mouseClickHandler(e:MouseEvent):void 
					{
						clickON=true;
						//addCamera();
						trace("Pressed");
						var button:MovieClip = e.target as MovieClip;
						//button.pressed=false;
						if (button==mySprite[0])
						{
							changeOrigCoord(0,1,8,9);
							Redriwing();
						} 
						else if (button == mySprite[1]) 
						{
							changeOrigCoord(1,2,9,10);
							Redriwing();
						} 
						else if (button == mySprite[2]) 
						{
							changeOrigCoord(2,3,10,11);
							Redriwing();
						} 
						else if (button == mySprite[3]) 
						{
							changeOrigCoord(3,4,11,12);
							Redriwing();
						} 
						else if (button == mySprite[4]) 
						{
							changeOrigCoord(4,5,12,13);
							Redriwing();
						} 
						else if (button == mySprite[5]) 
						{
							changeOrigCoord(5,6,13,14);
							Redriwing();
						} 
						else if (button == mySprite[6]) 
						{
							changeOrigCoord(6,7,14,15);
							Redriwing();
						}
						else if (button == mySprite[7]) 
						{
							changeOrigCoord(8,9,18,19);
							Redriwing();
						} 
						else if (button == mySprite[8]) 
						{
							changeOrigCoord(9,10,19,20);
							Redriwing();
						} 
						else if (button == mySprite[9]) 
						{
							changeOrigCoord(10,11,20,21);
							Redriwing();
						} 
						else if (button == mySprite[10]) 
						{
							changeOrigCoord(11,12,21,22);
							Redriwing();
						}
						else if (button == mySprite[11]) 
						{
							changeOrigCoord(12,13,22,23);
							Redriwing();
						}
						else if (button == mySprite[12]) 
						{
							changeOrigCoord(13,14,23,24);
							Redriwing();
						}
						else if (button == mySprite[13]) 
						{
							changeOrigCoord(14,15,24,25);
							Redriwing();
						}
						else if (button == mySprite[14]) 
						{
							changeOrigCoord(15,16,25,26);
							Redriwing();
						}
						else if (button == mySprite[15]) 
						{
							changeOrigCoord(16,17,26,27);
							Redriwing();
						}
						else if (button == mySprite[16]) 
						{
							changeOrigCoord(18,19,28,29);
							Redriwing();
						}
						else if (button == mySprite[17]) 
						{
							changeOrigCoord(19,20,29,30);
							Redriwing();
						}
						else if (button == mySprite[18]) 
						{
							changeOrigCoord(20,21,30,31);
							Redriwing();
						}
						else if (button == mySprite[19]) 
						{
							changeOrigCoord(21,22,31,32);
							Redriwing();
						}
						else if (button == mySprite[20]) 
						{
							changeOrigCoord(22,23,32,33);
							Redriwing();
						}
						else if (button == mySprite[21]) 
						{
							changeOrigCoord(23,24,33,34);
							Redriwing();
						}
						else if (button == mySprite[22]) 
						{
							changeOrigCoord(24,25,34,35);
							Redriwing();
						}
						else if (button == mySprite[23]) 
						{
							changeOrigCoord(25,26,35,36);
							Redriwing();
						}
						else if (button == mySprite[24]) 
						{
							changeOrigCoord(28,29,37,38);
							Redriwing();
						}
						else if (button == mySprite[25]) 
						{
							changeOrigCoord(29,30,38,39);
							Redriwing();
						}
	
						else if (button == mySprite[26]) 
						{
							changeOrigCoord(30,31,39,40);
							Redriwing();
						}
						else if (button == mySprite[27]) 
						{
							changeOrigCoord(31,32,40,41);
							Redriwing();
						}
						else if (button == mySprite[28]) 
						{
							changeOrigCoord(32,33,41,42);
							Redriwing();
						}
						else if (button == mySprite[29]) 
						{
							changeOrigCoord(33,34,42,43);
							Redriwing();
						}
						else if (button == mySprite[30]) 
						{
							changeOrigCoord(37,38,45,46);
							Redriwing();
						}
						else if (button == mySprite[31]) 
						{
							changeOrigCoord(38,39,46,47);
							Redriwing();
						}
						else if (button == mySprite[32]) 
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
						}
					}

						//функция перерисовки
						function Redriwing():void
						{
							ClearingAll();
							DriwingCurve(); 
						}
				
				
			
				
				
				
				
				
				
				
				
				
			
			
		}
		
		public function DesignerDraw():void
		{
			var object:MovieClip = new MovieClip();
			object.graphics.beginFill(0x13A62D)
			object.graphics.drawCircle(100,100,100)
			object.graphics.endFill();
			addChild(object);
			}
		
				
		
			
			
			
				
	
   
   
   }
	
}