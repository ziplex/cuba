package 
{
	import flash.text.*;
	import flash.display.*;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.*;
	import flash.net.* 
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	
	/**
	 * ...
	 * @author ziplex
	 */
	public class  FiltersXml extends Sprite
	{
	   
	   
		
		 /**
		 *   массив фильтров
		 */ 
		 public var Filtr:Array = [];
		 /**
		  * массив подписей к фильтру
		  */
		 public var Description:Array = [];
		/**
		*    лист XML
		*/ 
		 public var ParserXmlList:XMLList;
		 /**
	    *   счетчик, хранит кол-во фильтров
		*/ 
		 public var TotalListIndex:int=0;
		 /**
		*   текст ошибок, при загрузке 
		*/ 
		 public var ErrorText:String;
		 
		
		 
		
		
		/**
		 * 
		 * @param	url -путь к XML файлу
		 * @param	func -  функция вызывается в случае завершения загрузки
		 * @param	err - функция вызывается в случае возникновения ошибки
		 */
	
	public function loadXML(url:String,func:Function=null,err:Function=null):void
	{
									
									trace("Loade...",url);
									//создаем загрузчик XML
									var ParserXmlLoader:URLLoader = new URLLoader();
																		
																		
									ParserXmlLoader.addEventListener(Event.COMPLETE, processParserXML);
									ParserXmlLoader.addEventListener(IOErrorEvent.IO_ERROR, ParserXmlIOerror);
									ParserXmlLoader.addEventListener(IOErrorEvent.VERIFY_ERROR, ParserVeryfyIOerror);	
									ParserXmlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onCecrErr);
									ParserXmlLoader.load(new URLRequest(url));
									
						
									function onCecrErr(event:Event):void
									{
										ErrorText= event.toString()+url;
										trace ("Error Secure config.xml ", ErrorText);
										err();
									}
									
									
									function ParserVeryfyIOerror(event:Event):void
									{
										ErrorText = event.toString()+url;
										trace("Error Parser.xml",url)
										err()
									}
									function ParserXmlIOerror(event:Event):void
									{
										ErrorText = event.toString()+url;
										trace("Error Verify Parser.xml",url);
										err();
									}
									
									function processParserXML(event:Event):void 
										{
											
											var myXML:XML = new XML(event.target.data);
																						
											ParserXmlList = myXML.FILTER;
											TotalListIndex = ParserXmlList.length();
											ParserXmlLoader.removeEventListener(Event.COMPLETE, processParserXML);
											ParserXmlLoader.removeEventListener(IOErrorEvent.IO_ERROR, ParserXmlIOerror);
											ParserXmlLoader.removeEventListener(IOErrorEvent.VERIFY_ERROR, ParserVeryfyIOerror);	
											ParserXmlLoader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, onCecrErr);
											//вызываем парсер
											parser();
											
										}
										//var t:TextFormat = new TextFormat();
										//t.underline
										function parser():void
										{  
											//форматируем текст для фильтра
											var NameTextFormat:TextFormat = new TextFormat();
											NameTextFormat.font = "MyriadPro-Semibold";
											NameTextFormat.size = 14;
											NameTextFormat.color = 0xFFFFFF;
											//NameTextFormat.underline = true;
											for(var i:int = 0; i < TotalListIndex; i++)
											{
												//заполняем массивы значениями из XML
												Filtr[i] = ParserXmlList[i].@FILTR;
												Description[i] = new TextField();
												Description[i].embedFonts = true;
												Description[i].autoSize = TextFieldAutoSize.LEFT;
												//Description[i].border = true;
												
												Description[i].borderColor = 0xFFFFFF;
												Description[i].selectable = false;
												Description[i].text=ParserXmlList[i].@TXT;
												Description[i].setTextFormat(NameTextFormat);
											}
											//вызываем функцию если она задана
											if (func != null)
											{
											 func();
											}
										}
										
									
										
								} //end function LoadXml
				
								/**
								 * создаем массив кнопок фильтров  на основе данных из XML 
								 * @param	btns массив для кнопок
								 * @param	tildArray массив для |
								 * @param	Container содержит все кнопки
								 * @param	func функция которую вызываем при нажатии на кнопку
								 */
								public function CreateButtons(btns:Array,tildArray:Array,Container:Sprite=null,func:Function=null):void 
								{
									//смещение
									var offset:uint = 0
									//задаем формат для |
									var NameTextFormat:TextFormat = new TextFormat();
											NameTextFormat.font = "MyriadPro-Semibold";
											NameTextFormat.size = 14;
											NameTextFormat.color = 0xFFFFFF;
											
									
									
									//создаем кнопки и размещаем их друг за другом
									for (var i:int = 0; i < TotalListIndex; i++) 
									{
										
										btns[i] = new Sprite();
										btns[i].addChild(Description[i]);
										btns[i].name = Filtr[i];
										btns[i].x = offset;
										offset += btns[i].width + 12;
										tildArray[i] = new TextField();
										tildArray[i].text = "|";
										tildArray[i].embedFonts = true;
										tildArray[i].selectable = false;
										tildArray[i].setTextFormat(NameTextFormat);
										tildArray[i].x = offset-6-tildArray[i].textWidth;
										btns[i].addEventListener(MouseEvent.MOUSE_OVER, onOverBtns);
										btns[i].addEventListener(MouseEvent.MOUSE_OUT, onOutBtns);
										//при нажатии вызываем функцию которую указали в параметрах public фн-ции
										btns[i].addEventListener(MouseEvent.CLICK, func);
										//если контейнер существует пихаем в него кнопки
										if (Container != null)
										{
											if (i <=TotalListIndex-2)
											{Container.addChild(tildArray[i]); }
											
											Container.addChild(btns[i]);
										}
									}
									
									
									//нажали на кнопку
									/*function onClickBtns(event:MouseEvent):void 
									{
										//разыминовываем  клип как мувик
										for (var i:int = 0; i < TotalListIndex; i++) 
										{
											btns[i].alpha = 1;
										}
										var button:Sprite = (event.currentTarget as Sprite);
										trace("id=", button.name)
										button.alpha = 0.5;
										
										
									}*/
									
									//навели на кнопку
									function onOverBtns(event:MouseEvent):void 
									{
										//разыминовываем  клип как мувик
										var button:Sprite = (event.currentTarget as Sprite);
										button.blendMode = BlendMode.INVERT;
									}
									//убрали с кнопки
									function onOutBtns(event:MouseEvent):void 
									{
									  for (var i:int = 0; i < TotalListIndex; i++) 
									  {
										  btns[i].blendMode = BlendMode.HARDLIGHT;
										  
									  }
									}
								}//end public function CreateButtons 				
								
	}//end public class FiltersXml
	
}