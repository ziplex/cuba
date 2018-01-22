package 
{
	
	
	import flash.display.*;
	import fl.transitions.easing.*;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.text.*;
	import flash.events.*;
	import flash.geom.Matrix;
	import flash.display.StageScaleMode;
	import flash.net.* 
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	/**
	 * ...
	 * @author ziplex
	 */
		
	 public class Designers extends Sprite
	{
	   
	   [Embed(source='font/MyriadPro-Semibold.otf',fontWeight= "bold",fontFamily='MyriadPro-Semibold')]
		private var MyriadProSemibold:Class;
		/**
	     * прогресс загрузки миниатюр
	     */
		public var progress_txt:int = 0;
		/**
	     * имя дизайнера загружается из XML
	 	 */
		 public var dName:TextField=new TextField();  
		 
		 /**
		 *  контакты дизайнера загружается из XML  
		 */
	     		 
		 public var dContacts:TextField = new TextField();  
		 /**
		  * Емайл дизайнера загружаются из XML
		  */
		 public var dMail:TextField = new TextField();
		 /**
		 *  ссылка на первое фото  
		 */ 
		 public var dPhoto1:String;  
		 /**
		 *   ссылка на второе фото
		 */ 
		 public var dPhoto2:String;  
		 /**
		 *   массив ссылок на полноформатные изображения
		 */ 
		 public var dFullImage:Array = [];
		 public var tFullImage:Array = [];
		 /**
		 *   массив миниатюрных битмапов
		 */ 
		 public var dThumbImage:Array = [];
		 /**
		  *  храним оригинальные миниатюры, для снятия фильтра
		  */
		 public var dOriginalThumb:Array = [];
		 /**
		 *   массив значений фильтра
		 */ 
		 public var dFiltr:Array = [];
		 public var tFiltr:Array = [];
		 /**
		  * храним фильтры
		  */
		 public var dFilter:BitmapData;
		 //public var dFiltred:Array = [];
		 /**
		 *    массив подписей к битмапам
		 */ 
		 public var dText:Array = [];
		 public var tText:Array = [];
		/**
		 *  массив ссылок на проекты
		 */
		public var dProject:Array = [];
		public var tProject:Array = [];
 		/**
 		 * id дизайнера
 		 */
		public var dID:Array = [];
		public var tID:Array = [];
		/**
		 *  Подпись чей проект, кто его курирует
		 */
		public var dWHO:Array = [];
		public var tWHO:Array = [];
		/**
		*    лист XML
		*/ 
		 public var DesignersXmlList:XMLList;
		 /**
	    *   счетчик, хранит кол-во битмапов
		*/ 
		 public var count:int=0;
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
	
	public function loadXML(url:String,func:Function,err:Function=null):void
	{
									
									trace("Loade...",url);
									/**
									 * задержка в милли секундах
									 */
									var delay:int = 100;
									var DesignersXmlLoader:URLLoader = new URLLoader();
									var thmb:Array = [];
									var TotalListIndex:int;
									var loader:Loader;
									var url_load:String;
									
									//"data/Designers/Designers.xml"
									
									
									DesignersXmlLoader.addEventListener(Event.COMPLETE, processDesignersXML);
									DesignersXmlLoader.addEventListener(IOErrorEvent.IO_ERROR, DesignersXmlIOerror);
									DesignersXmlLoader.addEventListener(IOErrorEvent.VERIFY_ERROR, DesignersVeryfyIOerror);	
									DesignersXmlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onCecrErr);
									
									DesignersXmlLoader.load(new URLRequest(url));
									
						
									function onCecrErr(event:Event):void
									{
										ErrorText="Error Secure "+  event.toString()+url;
										trace ("Error Secure config.xml ", ErrorText);
										err();
									}
									
									
									function DesignersVeryfyIOerror(event:Event):void
									{
										ErrorText ="Error Veryfy"+ event.toString()+url;
										trace("Error Designers.xml",url)
										err()
									}
									function DesignersXmlIOerror(event:Event):void
									{
										ErrorText ="Error IO"+ event.toString()+url;
										trace("Error Verify Designers.xml",url);
										err();
									}
									
									function processDesignersXML(event:Event):void 
										{
											
											var myXML:XML = new XML(event.target.data);
																						
											//форматируем текст для имени
											var NameTextFormat:TextFormat = new TextFormat();
											NameTextFormat.font = "MyriadPro-Semibold";
											NameTextFormat.size = 12;
											NameTextFormat.color = 0xFFFFFF;
											
											//формат для контактов
											var ContactsTextFormat:TextFormat = new TextFormat();
											ContactsTextFormat.font = "MyriadPro-Regular";
											ContactsTextFormat.size = 10;
											ContactsTextFormat.color = 0xFFFFFF;
																						
											dName.embedFonts = true;
											dContacts.embedFonts = true;
											dMail.embedFonts = true;
											dName.autoSize = TextFieldAutoSize.LEFT;
											dContacts.autoSize = TextFieldAutoSize.LEFT;
											dMail.autoSize=TextFieldAutoSize.LEFT;
											dName.htmlText = myXML.@NAME;
											dContacts.htmlText = myXML.@CONTACTS;
											dMail.htmlText=myXML.@MAIL;
											dName.setTextFormat(NameTextFormat);
											dContacts.setTextFormat(ContactsTextFormat);
											dMail.setTextFormat(ContactsTextFormat);
											
											dPhoto1=myXML.@PHOTO1;
											dPhoto2=myXML.@PHOTO2;
											DesignersXmlList = myXML.IMAGE;
											TotalListIndex = DesignersXmlList.length();
											DesignersXmlLoader.removeEventListener(Event.COMPLETE, processDesignersXML);
											DesignersXmlLoader.removeEventListener(IOErrorEvent.IO_ERROR, DesignersXmlIOerror);
											DesignersXmlLoader.removeEventListener(IOErrorEvent.VERIFY_ERROR, DesignersVeryfyIOerror);	
											DesignersXmlLoader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, onCecrErr);
											//DesignersXmlLoader = null;
											loadImageDesigners();
											//trace("totalListIndex", TotalListIndex);
										}
										
										
										/**
										 * создаем фильтры на изображение
										 * @param	obj фильтр
										 */
										//==================================================
										
										function createFiltr(obj:Sprite):void 
										{
											//длинна стороны для квадрата фильтра
											var n:int = 150;
											//форматируем текст для имени
											var ObjTextFormat:TextFormat = new TextFormat();
											ObjTextFormat.font = "MyriadPro-Semibold";
											ObjTextFormat.size = 60;
											ObjTextFormat.color = 0xFFFFFF;
											var txt:TextField = new TextField();
											txt.text = "F"
											txt.setTextFormat(ObjTextFormat) 
											obj.graphics.lineStyle(0.5, 0xFFFFFF); 
											obj.graphics.beginFill(0xFFFFFF, 1)
											obj.graphics.drawRect(0, 0, n, n);
											obj.graphics.endFill();
											txt.x = 10;
											//obj.addChild(txt);
										}
										var Fl:Sprite = new Sprite();
										createFiltr(Fl);
										//================================================
										
										function loadImageDesigners():void
										{  //preloader.label = "\n \n \n \n \n \n \n  загрузка Designers.xml ";
											var ext:Boolean = true;
											for(var i:int = 0; i < TotalListIndex; i++)
											{
												//заполняем массивы значениями из XML
												dFullImage[i] = DesignersXmlList[i].@FULL;
												tFullImage[i] = dFullImage[i];
												
												dFiltr[i] = DesignersXmlList[i].@FILTR;
												tFiltr[i] = dFiltr[i];
												
												dText[i] = DesignersXmlList[i].@TXT;
												tText[i] = dText[i];
												
												dProject[i]=DesignersXmlList[i].@PROJECT;
												tProject[i] = dProject[i];
												
												dID[i] = DesignersXmlList[i].@ID;
												tID[i] = dID[i];
												
												dWHO[i] = DesignersXmlList[i].@WHO
												tWHO[i] = dWHO[i];
												/*thmb[i]= new Loader();
												thmb[i].contentLoaderInfo.addEventListener(Event.INIT, onImageInit);
												thmb[i].contentLoaderInfo.addEventListener(Event.COMPLETE, onImageLoadDesigners);
												thmb[i].contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,onLoadProgress);
												thmb[i].contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, thmbIOerror);
												thmb[i].contentLoaderInfo.addEventListener(IOErrorEvent.VERIFY_ERROR, thmbVeryfyIOerror);	
												thmb[i].contentLoaderInfo.addEventListener(IOErrorEvent.NETWORK_ERROR, thmbNetworkerror);
												
												var thumb_url:URLRequest = new URLRequest(DesignersXmlList[i].@THUMB);
												thmb[i].load(thumb_url);*/
												//trace("i=", i);
									 
											}
											
											//==============последовательная загрузка=====================
											
											//лоадеру присваиваем новый лоадер
											loader = new Loader();
											//добавляем слушателей лоадеру
											loader.contentLoaderInfo.addEventListener(Event.INIT, onLoadInit);
											loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,onLoadProgress);
											loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, thmbIOerror);
											loader.contentLoaderInfo.addEventListener(IOErrorEvent.VERIFY_ERROR, thmbVeryfyIOerror);	
											loader.contentLoaderInfo.addEventListener(IOErrorEvent.NETWORK_ERROR, thmbNetworkerror);
											//берем путь к нулевой( изначально count=0) картинке из XML 
											
											var thumb_url:URLRequest = new URLRequest(DesignersXmlList[count].@THUMB);
											trace("url[",count,"]","=",thumb_url.url);
											//грузим картинку	
											loader.load(thumb_url);
											//count++;
											
										}
										
									function onLoadInit(event:Event):void 
									{
											//если переданый объект не пустой грузим его в массив, иначе вываливаем ошибку в алерт
										if (loader.content != null)
										{
											//создаем битмапдату и ложим в массив затем увеличиваем счетчик
											dThumbImage[count] = new BitmapData(loader.content.width,loader.content.height);
											dThumbImage[count].draw(loader.content, new Matrix());
											//сохраняем оригиналы
											dOriginalThumb[count] = dThumbImage[count];
											count++;
											if (count < TotalListIndex)
											{
											trace("count=", count);
											
											//грохаем листенеры 
											loader.contentLoaderInfo.removeEventListener(Event.INIT, onLoadInit);
											loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,onLoadProgress);
											loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, thmbIOerror);
											loader.contentLoaderInfo.removeEventListener(IOErrorEvent.VERIFY_ERROR, thmbVeryfyIOerror);	
											loader.contentLoaderInfo.removeEventListener(IOErrorEvent.NETWORK_ERROR, thmbNetworkerror);
											
											
											
											
																						
											//лоадеру присваиваем новый лоадер
											loader = new Loader();
											//добавляем слушателей лоадеру
											loader.contentLoaderInfo.addEventListener(Event.INIT, onLoadInit);
											loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onImageLoadDesigners);
											loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,onLoadProgress);
											loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, thmbIOerror);
											loader.contentLoaderInfo.addEventListener(IOErrorEvent.VERIFY_ERROR, thmbVeryfyIOerror);	
											loader.contentLoaderInfo.addEventListener(IOErrorEvent.NETWORK_ERROR, thmbNetworkerror);
											
											//берем путь к следущей картинке из XML 
											var thumb_url:URLRequest = new URLRequest(DesignersXmlList[count].@THUMB);
											trace("url[",count,"]","=",thumb_url.url);
											//грузим картинку	
											loader.load(thumb_url);
											
											
											
											}
											else if (count ==TotalListIndex)
											{
																						
											//грохаем листенеры 
											loader.contentLoaderInfo.removeEventListener(Event.INIT, onLoadInit);
											loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onImageLoadDesigners);
											loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,onLoadProgress);
											loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, thmbIOerror);
											loader.contentLoaderInfo.removeEventListener(IOErrorEvent.VERIFY_ERROR, thmbVeryfyIOerror);	
											loader.contentLoaderInfo.removeEventListener(IOErrorEvent.NETWORK_ERROR, thmbNetworkerror);
											trace("Final count=", count)	
											//рисуем фильтр на битмапдату
											dFilter = new BitmapData(loader.content.width,loader.content.height);
											dFilter.draw(Fl);
											func();
											}
											
											
										}
										else
										{
										 ErrorText ="NUll Content"+ event.toString();
										 err();
										}
										
																					
									}//end function OnLoadInit
										
										
										
										
										
										// инициализируем битмап
										function onImageInit(event:Event):void 
										{
											//ждем 3 секунды на загрузку каждого битмапа
											var timer:Timer = new Timer(delay, 0);
											timer.addEventListener(TimerEvent.TIMER, onTimer);
											timer.start();
											
											//trace(event.target as Name , "инициализирован");
										}
										
										//по срабатыванию таймера заполняем массив
										function onTimer(event:TimerEvent):void 
										{
											//если переданый объект не пустой грузим его в массив, иначе вываливаем ошибку в алерт
											if (thmb[count].content != null)
											{
											
											dThumbImage[count] = new BitmapData(thmb[count].content.width,thmb[count].content.height);
											dThumbImage[count].draw(thmb[count].content,new Matrix());
											
											trace("count=", count);
											}
											else
											{
											 ErrorText = event.toString();
											 err();
											}
											//trace("totallist", TotalListIndex);
											if (count == TotalListIndex)
											{
											   trace("FINAL COUNT=", count); 
												func();
											}
											event.target.stop();
										}
										
										function onLoadProgress(evt:ProgressEvent):void 
										{
											var cntload:int;
											cntload= Math.round(100 * (evt.bytesLoaded / evt.bytesTotal));
											//trace("загружено",url, "[",progress_txt,"]",cntload)
											if (cntload == 100)
											{
												progress_txt++
											}
										}
										
										
										function thmbNetworkerror(event:Event):void
										{
										  	ErrorText ="thmbNetworkerror"+ event.toString()+url;
											trace("thmbIOerror", event);
											err();
										}	
										function thmbIOerror(event:Event):void
										{
										  	ErrorText ="thmbIOerror"+ event.toString()+url;
											trace("thmbIOerror", event);
											err();
										}
										function thmbVeryfyIOerror(event:Event):void
										{
											ErrorText ="thmbVeryfyIOerror"+ event.toString()+url;
											trace("thmbVerifyError", event);
											err();
										}
										// вызываем когда все изображения загружены
										function onImageLoadDesigners(e:Event):void
										{
											
											//trace("Проверка класса DEsigners типа работает");
											/*for(var i:int = 0; i < TotalListIndex; i++)
											{
												
												dThumbImage[i] = new BitmapData(thmb[i].width,thmb[i].height);
												dThumbImage[i].draw(thmb[i],new Matrix());
												//trace("Designers= ",DesignersFullImageUrls[i])
											}
											count++;*/
											
										/*	dThumbImage[count] = new BitmapData(thmb[count].width,thmb[count].height);
											dThumbImage[count].draw(thmb[count],new Matrix());
											count++
											if (count == TotalListIndex)
											{
												
												func();
											}*/
										}
										
								} //end public function LoadXml
								
			                    /**
			                     * функция для фильтрации изображений сравнивает fltr со значениями из массива dFiltr
								 *  и переносит все относящееся к фильтру влево
			                     * @param	fltr значение фильтра 
								 * @param	bmp массив битмап
			                     */
							public	function filtred(fltr:String,bmp:Array):void 
								{
									//счетчик смещения
									var k:int = 0;
									//времено храним данные
									var tmp:Array = [];
									for (var i:int = 0; i < count ; i++) 
									{
										if (dFiltr[i] != fltr)
										{
											dThumbImage[i] = dFilter;
											
										}
										else
										{
											tmp[0] = dFullImage[k];
											dFullImage[k] = dFullImage[i];
											dFullImage[i] = tmp[0];
											
											tmp[1] = dThumbImage[k];
											dThumbImage[k] = dThumbImage[i];
											dThumbImage[i] = tmp[1];
											
											tmp[2] = dFiltr[k];
											dFiltr[k] = dFiltr[i];
											dFiltr[i] = tmp[2];
											
											tmp[3] = dText[k];
											dText[k] = dText[i];
											dText[i] = tmp[3];
											
											tmp[4] = dProject[k];
											dProject[k] = dProject[i];
											dProject[i] = tmp[4];
											
											/*tmp[5] = dOriginalThumb[k];
											dOriginalThumb[k] = dOriginalThumb[i];
											dOriginalThumb[i] = tmp[5];*/
											
											tmp[6] = dID[k];
											dID[k] = dID[i];
											dID[i] = tmp[6];
											
											tmp[7] = dWHO[k];
											dWHO[k] = dWHO[i];
											dWHO[i] = tmp[7];
											
											k++;
										}
										
									}
									for (i = 0; i < count ; i++) 
									{
										bmp[i].texture = dThumbImage[i];
									}
								} //end public function filtred
								
								/**
								 * отменяем фильтрацию 
								 * @param	bmp массив битмап
								 */
								public function unFiltred(bmp:Array):void 
								{
									for (var i:int = 0; i < count; i++) 
									{
										dFullImage[i] = tFullImage[i];
										dThumbImage[i] = dOriginalThumb[i];
										dFiltr[i] = tFiltr[i];
										dText[i] = tText[i];
										dProject[i] = tProject[i];
										dID[i] = tID[i];
										dWHO[i] = tWHO[i];
									}
									for (i = 0; i < count ; i++) 
									{
										bmp[i].texture = dThumbImage[i];
									}
								} //end public function unFiltred		
	}//end public class DesignerItem
	
}