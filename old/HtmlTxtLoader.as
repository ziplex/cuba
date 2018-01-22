package 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.*;
	import flash.net.*;
	import flash.events.*
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.geom.Rectangle;
	import flash.display.*;
	import flash.geom.Matrix;
	import com.greensock.*;
	import com.greensock.easing.*;
	
	
	/**
	 * ...
	 * @author ziplex
	 */
	public class  HtmlTxtLoader extends Sprite
	{
		[Embed(source='font/verdana.ttf',fontFamily='verdana')]
		private var verdana:Class;
		
		/**
		 * @param	txt - текст заголовка
		 * @param	color - цвет ползунка и заголовка
		 * @param	globalStage - глобальный контейнер для прослушки нажатия
		 * @param	_output -текстовое поле, содержит текст загружаемый из файла 
		 * @param	TxtContainer - контейнер содержит в себе скролбар и текст _output
		 * @param	url - путь к загружаемому файлу
		 */
		public function HtmlTxtLoader(txt:String,color:uint,globalStage :Stage,_output:TextField, TxtContainer:Sprite, url:String):void
			{
				
				/**
				 *  содержит объет скроллер с баром
				 */
				var scrollcontainer:Sprite = new Sprite;
				/**
				 * скролбар для прокрутки текста 
				 */
				var scrollbar:Sprite = new Sprite();
				/**
				 * рамка для скролбара
				 */
				var boundbar:Sprite = new Sprite();
				/**
				 * задаем форматирование текста
				 */
				var format:TextFormat = new TextFormat();
				/**
				 * цвет контейнера и градиентов
				 */
				var containerColor:uint = 0x000000;
				var containerAlpha:Number = 0.15;
				var gradientColor:uint = 0x647883;
				/**
				 * таймлайн для анимации
				 */
				var timeline:TimelineLite = new TimelineLite();
				/**
				 * ширина текстового контейнера
				 */
				var txtWidth:Number = 500;
				/**
				 * высота текстового контейнера
				 */
				var txtHeight:Number = 646;
				/**
				 * положение контейнера по X
				 */
				var txtX:Number = 127;
				/**
				 * положение контейнера по Y
				 */
				var txtY:Number = 69;
				/**
				 * отступ слева
				 */
				var marginLeft:Number = 30;
				/**
				 * общий отступ
				 */
				var margin:Number = 10;
				/**
				 * заголовок
				 */
				var HeaderTxt:TextField = new TextField();
				
				/**
				 * формат заголовка
				 */
				var HeaderFormat:TextFormat = new TextFormat();
				
				var z:Sprite = new Sprite();
				
				HeaderFormat.font = "verdana";
				HeaderFormat.align = TextFormatAlign.LEFT;
				HeaderFormat.bold = true;
				HeaderFormat.size = 16;
				HeaderFormat.bold = true;
				HeaderFormat.color = color;
				HeaderTxt.antiAliasType = AntiAliasType.ADVANCED;
				HeaderTxt.embedFonts = true;
				HeaderTxt.text = txt;
				HeaderTxt.setTextFormat(HeaderFormat);
				HeaderTxt.y = TxtContainer.y - 30;
				HeaderTxt.selectable = false;
				TxtContainer.addChild(HeaderTxt);
				
				/**
				 * создаем текстовый контейнер
				 */
				TxtContainer.graphics.beginFill(containerColor, containerAlpha);
				TxtContainer.graphics.drawRect(0, 0, txtWidth, txtHeight);
				TxtContainer.graphics.endFill();
				TxtContainer.x = txtX;
				TxtContainer.y = txtY;
				
				scrollcontainer.graphics.lineStyle(0.5,0xFFFFFF);
				scrollcontainer.graphics.drawRect(0, 0, 500, 646);
				
				// рисуем верхний и нижний градиент в текстовом поле
				var topGradient:Sprite = new Sprite();
				var bottomGradient:Sprite = new Sprite();
				
				function createGradients():void 
				{
					var shadow:Sprite = new Sprite();
					var matrix1:Matrix = new Matrix;
					var colors1:Array = [gradientColor, gradientColor];
					var alphas1:Array = [100,0];
					var ratios1:Array = [0x00, 0xFF];
					var grad_height:int = 30;
				
					matrix1.createGradientBox(txtWidth, grad_height, (90 / 180) * Math.PI, 0, 0);
					topGradient.graphics.beginGradientFill(GradientType.LINEAR, colors1, alphas1, ratios1, matrix1);
					topGradient.graphics.drawRect(0, 0, txtWidth, grad_height);
					topGradient.graphics.endFill();
					
					matrix1.createGradientBox(txtWidth, grad_height, (270 / 180) * Math.PI, 0, txtHeight- grad_height);;
					bottomGradient.graphics.beginGradientFill(GradientType.LINEAR, colors1, alphas1, ratios1, matrix1);
					bottomGradient.graphics.drawRect(0, txtHeight-grad_height, txtWidth, grad_height);
					bottomGradient.graphics.endFill();
															
					TxtContainer.addChild(topGradient);
					TxtContainer.addChild(bottomGradient);
					
					//рисуем тень
					
					shadow.graphics.beginFill(containerColor, containerAlpha);
					shadow.graphics.drawRect(0, 0, 5, txtHeight);
					shadow.graphics.endFill();
					shadow.graphics.beginFill(containerColor, containerAlpha);
					shadow.graphics.drawRect(0, 0, txtWidth, 5);
					shadow.graphics.endFill();
					
					
					TxtContainer.addChild(shadow);
				
				}
				
				
				/**
				 * рисуем область скролбара
				 */
				
				boundbar.graphics.beginFill(0xFFFFFF, 0);
				boundbar.graphics.drawRect(0,0, margin+6, txtHeight - 32);
				boundbar.graphics.endFill();
				scrollcontainer.addChild(boundbar);
				
				boundbar.addEventListener(MouseEvent.MOUSE_DOWN, barClick);
				
				// при нажатии на поле скрола, двигаем ползунок к мышке
				function barClick(event:Event):void 
				{
					scrolling = true;
					TweenLite.to(scrollbar, 0.3, { y:mouseY - TxtContainer.y } );
					TweenLite.to(_output, 0.2, { scrollV:Math.round(((scrollbar.y - bounds.y) / txtHeight) * _output.maxScrollV) } );
					//scrollbar.y = mouseY - TxtContainer.y;
					_output.scrollV = Math.round(((scrollbar.y - bounds.y)/txtHeight)*_output.maxScrollV);
								
				}
				
				
				/**
				 * длинна сторон квадрата
				 */
				 var s:Number = 24;
				
				/**
				 * рисуем скролбар квадратик и добавляем его в текстовый контейнер
				 */
				
				// область срабатывания
				scrollbar.graphics.beginFill(0xFFFFFF, 0);
				scrollbar.graphics.moveTo( -s, s);
				scrollbar.graphics.lineTo( s,s);
				scrollbar.graphics.lineTo( s,-s);
				scrollbar.graphics.lineTo( -s, -s);
				scrollbar.graphics.lineTo( -s, s);
				scrollbar.graphics.endFill();
				
				
				// тень скролла
				s = 6;
				
				scrollbar.graphics.beginFill(0x000000, 0.1);
				scrollbar.graphics.moveTo( -s+3, s+3);
				scrollbar.graphics.lineTo( s+3,s+3);
				scrollbar.graphics.lineTo( s+3,-s+3);
				scrollbar.graphics.lineTo( -s+3, -s+3);
				scrollbar.graphics.lineTo( -s+3, s+3);
				scrollbar.graphics.endFill();
				
				// сам скролл
				scrollbar.graphics.lineStyle(0.5, 0xFFFFFF)
				scrollbar.graphics.beginFill(color, 1);
				scrollbar.graphics.moveTo( -s, s);
				scrollbar.graphics.lineTo( s,s);
				scrollbar.graphics.lineTo( s,-s);
				scrollbar.graphics.lineTo( -s, -s);
				scrollbar.graphics.lineTo( -s, s);
				scrollbar.graphics.endFill();
				
				
				scrollbar.x = txtWidth - margin;
				scrollbar.y = margin+6;
				boundbar.x = scrollbar.x-6;
				boundbar.y = scrollbar.y;
				scrollbar.scaleX = 0.33;
				scrollbar.scaleY = 0.33;
				
				scrollcontainer.addChild(scrollbar);
				
				/**
				 * граничные линии
				 */
				var ScrollBounds:Sprite = new Sprite();
				
				ScrollBounds.graphics.lineStyle(0.5, 0xFFFFFF)
				//верх
				ScrollBounds.graphics.moveTo( -s, -s);
				ScrollBounds.graphics.lineTo( s, -s);
				
				//низ
				ScrollBounds.graphics.moveTo( -s, txtHeight-26);
				ScrollBounds.graphics.lineTo( s, txtHeight-26);
				scrollcontainer.addChild(ScrollBounds);
				
				ScrollBounds.scaleX = 0.33;
				ScrollBounds.x = scrollbar.x;
				ScrollBounds.y = scrollbar.y;
				
				
				/**
				 * переменная хранит начальное положение скроллбара
				 */
				var scY:Number = scrollbar.y;
				
				/**
				 * задаем прямоугольную область где можно таскать квадрат скроллбара
				 */
				var bounds:Rectangle = new Rectangle(scrollbar.x, scrollbar.y, 0, txtHeight-32);;
				/**
				 * переменная для проверки скроллинга, в энтерфрейм
				 */
				var scrolling:Boolean = false;

				/**
				 * 
				 * @param	e событие при нажатии мыши на скролл стартуем его
				 */
				function startScroll (e:Event):void 
				{
					
					scrolling = true;
					scrollbar.startDrag (false,bounds);
				}

				/**
				 * 
				 * @param	e событие на стоп скроллинга
				 */
				function stopScroll (e:Event):void 
				{
					scrolling = false;
					scrollbar.stopDrag ();
				}

				/**
				 *  добавляем слушатели на нажатие, отпускание мыши, и событие для прокрутки текста
				 */
				scrollbar.addEventListener (MouseEvent.MOUSE_DOWN, startScroll);
				scrollbar.addEventListener(MouseEvent.MOUSE_OVER, scrollOver); 
				scrollbar.addEventListener (MouseEvent.MOUSE_OUT, scrollOut);
				
				globalStage.addEventListener (MouseEvent.MOUSE_UP, stopScroll);
				addEventListener (Event.ENTER_FRAME, enterHandler);

				timeline.stop();
				timeline.append(TweenLite.to(ScrollBounds, 0.1, { scaleX:1} ));
				timeline.append(TweenLite.to(scrollbar, 0.2, { scaleX:1,scaleY:1 } ));
					
				function scrollOver(event:MouseEvent):void 
				{
					
					//trace("мышь зашла");
					timeline.play();
				}
				function scrollOut(event:MouseEvent):void 
				{
					timeline.reverse();
				}
				
				/**
				 * 
				 * @param	e в каждый момент времени двигаем текст относительно ползунка
				 */
				function enterHandler (e:Event):void 
				{
					if (_output.scrollV == 1)
					{
						topGradient.visible = false;
						bottomGradient.visible = true;
					}
					else if (_output.scrollV == _output.maxScrollV)
					{
						topGradient.visible = true;
						bottomGradient.visible = false;
					}
					else
					{
						topGradient.visible = true;
						bottomGradient.visible =true ;
					}
					
					
					if (scrolling == true) 
					{
					_output.scrollV = Math.round(((scrollbar.y - bounds.y)/txtHeight)*_output.maxScrollV);
					}
				}
				
				/**
				 * слушаем колесо мыши
				 */
				TxtContainer.addEventListener(MouseEvent.MOUSE_WHEEL, wheelTXT);
				
				
				function wheelTXT(event:MouseEvent):void 
				{
					//var relation:Number = (TxtContainer.height-_output.scrollV)/(_output.scrollV-scrollbar.height);	
					//trace(relation);
					scrollbar.y += -event.delta * _output.maxScrollV/5;
					_output.scrollV = Math.round(((scrollbar.y - bounds.y)/txtHeight)*_output.maxScrollV);
					trace("wheeeling...",_output.maxScrollV)
					if (scrollbar.y < scY )
					{ 
						scrollbar.y = scY;
					}
					
					if (scrollbar.y > boundbar.height+16 )
					{ 
						scrollbar.y = boundbar.height+16;
					}
					
				}
				
				
				
					format.font = "verdana";
					format.align = TextFormatAlign.LEFT;
					//format.bold = true;
					//format.size = 14;
					initializeOutput();
					loadData();
					
					
	
				function initializeOutput():void
				{
					
					
				//	_output = new TextField();
					//_output.width = TxtContainer.width
					//_output.height = TxtContainer.height
					_output.wordWrap = true;
					
					TxtContainer.addChild(_output);
					addChild(TxtContainer);
					createGradients();
					TxtContainer.addChild(scrollcontainer);
					
					
				}
				function loadData():void
				{
					var loader:URLLoader = new URLLoader();
					loader.dataFormat = URLLoaderDataFormat.TEXT;
					loader.addEventListener(Event.COMPLETE, handleComplete);
					
					loader.addEventListener(IOErrorEvent.IO_ERROR, TxtIOerror);
					loader.addEventListener(IOErrorEvent.VERIFY_ERROR, TxtVeryfyIOerror);	
					loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onCecrErr);
					loader.load(new URLRequest(url));
				}
				
				
				function onCecrErr(event:SecurityErrorEvent):void
				{
					trace(event);
				}
									
				function TxtVeryfyIOerror(event:VerifyError):void
				{
					trace(event);
				}
				function TxtIOerror(event:IOErrorEvent):void
				{
					trace(event);					
				}
				
				
				
				function handleComplete(event:Event):void
				{
					var loader:URLLoader = URLLoader(event.target);
					
					_output.embedFonts = true;
					_output.antiAliasType = AntiAliasType.ADVANCED;
					_output.selectable = false;
					_output.multiline = true;
					_output.width = txtWidth-marginLeft;
					_output.height = txtHeight - margin;
					_output.x += margin;
					_output.y += margin;
					_output.htmlText = loader.data;
					_output.setTextFormat(format);
					
					loader.removeEventListener(Event.COMPLETE, handleComplete);
					loader.removeEventListener(IOErrorEvent.IO_ERROR, TxtIOerror);
					loader.removeEventListener(IOErrorEvent.VERIFY_ERROR, TxtVeryfyIOerror);	
					loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, onCecrErr);
					loader = null;
				}
			} // end of public function HtmlTxtLoader
	}
	
}