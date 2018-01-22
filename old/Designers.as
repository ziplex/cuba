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
	  
		 public var dContacts:TextField=new TextField();  
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
		 /**
		 *   массив миниатюрных битмапов
		 */ 
		 public var dThumbImage:Array = [];
		 /**
		 *   массив значений фильтра
		 */ 
		 public var dFiltr:Array = [];
		 /**
		 *    массив подписей к битмапам
		 */ 
		 public var dText:Array = [];
		 /**
		*    лист XML
		*/ 
		 public var DesignersXmlList:XMLList;
		 /**
	    *   счетчик, хранит кол-во битмапов
		*/ 
		 public var count:int = 0;
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
									//"data/Designers/Designers.xml"
									
									
									DesignersXmlLoader.addEventListener(Event.COMPLETE, processDesignersXML);
									DesignersXmlLoader.addEventListener(IOErrorEvent.IO_ERROR, DesignersXmlIOerror);
									DesignersXmlLoader.addEventListener(IOErrorEvent.VERIFY_ERROR, DesignersVeryfyIOerror);	
									DesignersXmlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onCecrErr);
									
									DesignersXmlLoader.load(new URLRequest(url));
									
						
									function onCecrErr(event:Event):void
									{
										ErrorText= event.toString()+url;
										trace ("Error Secure config.xml ", ErrorText);
										err();
									}
									
									
									function DesignersVeryfyIOerror(event:Event):void
									{
										ErrorText = event.toString()+url;
										trace("Error Designers.xml",url)
										err()
									}
									function DesignersXmlIOerror(event:Event):void
									{
										ErrorText = event.toString()+url;
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
											dName.autoSize = TextFieldAutoSize.LEFT;
											dContacts.autoSize = TextFieldAutoSize.LEFT;
											dName.htmlText = myXML.@NAME;
											dContacts.htmlText = myXML.@CONTACTS;
											dName.setTextFormat(NameTextFormat);
											dContacts.setTextFormat(ContactsTextFormat);
											
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
										}
										
										function loadImageDesigners():void
										{  //preloader.label = "\n \n \n \n \n \n \n  загрузка Designers.xml ";
											var ext:Boolean = true;
											for(var i:int = 0; i < TotalListIndex; i++)
											{
												dFullImage[i] = DesignersXmlList[i].@FULL;
												dFiltr[i] = DesignersXmlList[i].@FILTR;
												dText[i] = DesignersXmlList[i].@TXT;
												
												
												thmb[i]= new Loader();
												thmb[i].contentLoaderInfo.addEventListener(Event.INIT, onImageInit);
												thmb[i].contentLoaderInfo.addEventListener(Event.COMPLETE, onImageLoadDesigners);
												thmb[i].contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,onLoadProgress);
												thmb[i].contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, thmbIOerror);
												thmb[i].contentLoaderInfo.addEventListener(IOErrorEvent.VERIFY_ERROR, thmbVeryfyIOerror);	
												thmb[i].contentLoaderInfo.addEventListener(IOErrorEvent.NETWORK_ERROR, thmbNetworkerror);
												
												var thumb_url:URLRequest = new URLRequest(DesignersXmlList[i].@THUMB);
												thmb[i].load(thumb_url);
												
									 
											}
											
											
										}
										
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
											count++
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
										  	ErrorText = event.toString()+url;
											trace("thmbIOerror", event);
											err();
										}	
										function thmbIOerror(event:Event):void
										{
										  	ErrorText = event.toString()+url;
											trace("thmbIOerror", event);
											err();
										}
										function thmbVeryfyIOerror(event:Event):void
										{
											ErrorText = event.toString()+url;
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
										
								} 
								
	}//end public class DesignerItem
	
}