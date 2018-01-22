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
import silin.utils.Hint;
import silin.utils.Alert;
import silin.utils.Preloader;
import flash.system.Security;
import flash.system.LoaderContext;
import Designers;
import CubeXML;
import ConfigXML;
	/**
	 * ...
	 * @author ziplex
	 */
	public class Main extends Sprite 
	{
		
		//public var Designer1XmlList:XMLList;
		//public var Designer1ThuminalsBitmap:Array = [];
		//public var Designer1FullImageUrls:Array = [];
		//public var Designer1PhotoUrls:Array = [];
		//public var Designer1Filtr:Array = [];
		//public var Designer1Text:Array = [];
		//public var Designer1Name:TextField = new TextField();
		//public var Designer1Contacts:TextField = new TextField();
		
		
		public var designer1:Designers = new Designers();
		public var designer2:Designers = new Designers();
		public var designer3:Designers = new Designers();
		public var designer4:Designers = new Designers();
		
		public var teamwork1:Designers = new Designers();
		public var teamwork2:Designers = new Designers();
		public var cooperation1:Designers = new Designers();
		public var cooperation2:Designers = new Designers();
		
		public function Main():void 
		{
		 	
			//координаты для куба
			
			
			var xCube:Array = [0,54.1,54.1,0,-54.1,-54.1,
							   0,0,47.1,47.1,0,-47.1,-47.1,0,
							   0,-40.1,0,40.1,
							   3.5,3.5,43.6,43.6,
							   3.5,43.6,43.6,3.5,
							   0,40.1,0,-40.1,
							   -3.5,-3.5,-43.6,-43.6,
							   -3.5,-43.6,-43.6,-3.5,
							   0,54.1,54.1,54.1,76.91,22.81,

							  -7.7,65.45,46.05,-2.39,-32.36,-61.45,
							  -4.63,-7.51,57.23,40.68,-1.83,-26.91,-53.16,-0.65,
							  -4.06,-47.32,-7.41,49.64,
							   2.69,-3.21,53.12,38.97,
							  -0.95,51.79,37.99,1.4,
							  -0.07,32.85,-1.54,-21.29,
							  -8.01,-5.68,-24.18,-46.12,
							  -4.27,-25.85,-49.02,-10.32,
							  -2.39,46.05,62.74,68.5,69,49.5,

							  -17.97,66.84,50.15,-0.47,-32.6,-55.33,
							  -1.86,-15.27,58.62,44.2,0.16,-27.23,-47.28,-7.2,
							  -2.35,-41.19,-13.92,49.14,
							  -3.96,-11.05,54.51,41.82,
							  1.73,53.65,41.22,3.47,
							  -6.14,35.52,0.47,-22.09,
							  -5.24,-3.58,-24.55,-41.37,
							  -10.84,-26.6,-43.26,-17.55,
							  -0.47,50.15,58.9,63,78,54,

							  -12.07,53.36,65.38,-3,-40.45,-49.69,
							  -3.47,-10.18,47.15,57.54,-1.51,-34.03,-42.1,7,
							  -3.8,-35.07,-9.24,37.17,
							  9.91,-4.93,44.05,52.98,
							  0.1,44.43,53.62,1.83,
							  6.89,48.72,-0.77,-27.55,
							  -6.89,-5.26,-30.82,-37.63,
							  2.73,-31.41,-38.3,-11.88,
							  -3,65.38,59.61,63,78.5,70.5,

							  12.11,49.85,62.61,-1.89,-58.39,-46.39,
							  1.5,10.65,43.45,54.74,-1.06,-50.74,-40.26,-6.44,
							  1.82,-33.5,9.92,37.62,
							  -2.21,12.45,40.25,49.97,
							  4.92,41.01,50.81,2.7,
							  -6.59,46.94,-0.65,-43.84,
							  -2.06,-4.26,-46.92,-37.96,
							  -9.29,-46.15,-37.19,5.28,
							  -1.89,62.61,55.49,62,73,70,

							  2.65,45.94,52.98,-1.04,-70.19,-49.05,
							  -4.42,1.45,39.33,45.5,-1.29,-61.83,-43.33,2.14,
							  -3.86,-35.78,0.85,31.94,
							  5.61,5.03,36.02,41.24,
							  -0.8,36.34,41.76,1.94,
							  1.77,38.41,-1.42,-52.6,
							  -7.83,-5.06,-57.65,-41.34,
							  -1.39,-56.62,-40.47,-2,
							  -1.04,52.98,48.88,51,67,56,

							  4.2,50.04,51.54,8.54,-47.11,-63.46,
							  4.25,3.04,43.13,44.44,7.66,-41.17,-55.4,5.16,
							  4.05,-47.99,2.45,37.56,
							  8.59,6.83,39.67,40.76,
							  7.9,39.81,40.88,10.7,
							  5.21,37.88,7.22,-33.37,
							  0.91,3.75,-38.19,-50.2,
							  1.59,-38.91,-51.37,-0.27,
							  8.54,51.54,50.6,54,77,59];
			
			
			var yCube:Array = [-62.47,-31.24,31.24,62.47,31.24,-31.24,
								0,-54.39,-27.19,27.19,54.39,27.19,-27.19,0,
								-4.04,-27.19,-50.35,-27.19,
								-2.02,-48.33,-25.17,21.13,
								2.02,-21.13,25.17,48.33,
								4.04,27.19,50.35,27.2,
								2.02,48.33,25.17,-21.13,
								-2.02,21.13,-25.17,-48.33,
								62.47,31.24,12.37,12.37,25.54,56.78,

								-86.76,-15.14,33.93,52.34,35.59,-29.81,
								-5.32,-76.77,-13.39,28.48,44.63,30.61,-28.4,2.59,
								-8.93,-29.5,-71.78,-15.93,
								0.55,-67.67,-12.52,23.28,
								-2.27,-9.15,25.76,39.66,
								7.08,27.71,40.78,29.74,
								-3.05,38.47,28.13,-21.17,
								1.33,24.37,-27.69,-68.69,
								52.34,33.93,-8.28,-5,14,40.5,

								-64.07,-35.07,38.62,55.33,38.39,-10.96,
								-3.06,-55.75,-30.48,33.21,47.75,33.3,-10.23,4.67,
								-6.68,-12.81,-51.59,-30.03,
								2.47,-50.61,-28.19,27.88,
								-0.85,-24.39,30.51,42.97,
								9.26,32.39,43.96,32.06,
								-0.05,41.82,30.76,-5.75,
								3.78,26.3,-9.86,-46.42,
								55.33,38.62,0,1,15,48,

								-50.83,-38.91,43.56,60.71,33.25,-20.71,
								-3.6,-43.37,-32.92,38.31,53.12,29.28,-17.82,6.59,
								-7.45,-18.96,-39.64,-31.18,
								4.29,-38.86,-29.93,31.32,
								-1.62,-27.3,35.68,48.67,
								10.66,36.91,49.32,29.69,
								-1.13,46.03,27.29,-12.45,
								4.95,23.83,-16.38,-37.53,
								60.71,43.56,4,5,17.5,49,

								-68.87,-34.16,27.67,65.67,15.67,-44.83,
								-5.6,-60.7,-30.54,24.18,57.06,13.09,-39.78,-1.34,
								-9.86,-38.78,-56.62,-31.14,
								-3.37,-54.29,-28.73,18.4,
								-3.56,-25.02,22.44,50.78,
								2.39,24.72,52.75,14.52,
								-4,49.55,11.8,-33.38,
								-4.1,7.91,-37.26,-54.71,
								65.67,27.67,-6.82,-4.5,6,40,

								-55.72,-27.45,39.16,65.37,37.28,-41.75,
								-4.69,-48.15,-23.41,35.01,57.71,33.12,-36.04,6.65,
								-8.74,-34.46,-44.36,-24.05,
								4.74,-41.63,-21.39,28.05,
								-2.43,-18.32,32.94,52.25,
								10.59,34.56,53.88,33.09,
								-2.95,52.4,31.04,-29.95,
								4.32,27.18,-33.19,-43.59,
								65.37,39.16,0.42,2,20,46,

								-59.1,-22.1,37.4,59.9,45.94,-31.1,
								12.72,-51.04,-18.68,32.22,52.46,40.22,-26.86,3.97,
								8.39,-26.14,-47.01,-18.68,
								2.17,-43.48,-16.98,26.12,
								14.28,-11.5,31.13,46.92,
								8.38,32.7,48.75,38.56,
								14.71,47.88,37.35,-19.2,
								2.32,34.01,-24.73,-45.88,
								59.9,37.4,0,1,17,45];
			var pCube:Array = [];
			var contur:Sprite = new Sprite(); // общий контур
			
			var menu1:MovieClip = new MovieClip();
			var menu2:MovieClip = new MovieClip(); // элемент меню2   
			var menu3:MovieClip = new MovieClip();	   
			var menu4:MovieClip = new MovieClip();	   
			var menu5:MovieClip = new MovieClip();
			var menu6:MovieClip = new MovieClip(); // элемент меню6	   
			
			var menu_color1:MovieClip = new MovieClip();
			var menu_color2:MovieClip = new MovieClip(); // цвет меню2   
			var menu_color3:MovieClip = new MovieClip();	   
			var menu_color4:MovieClip = new MovieClip();	   
			var menu_color5:MovieClip = new MovieClip();
			var menu_color6:MovieClip = new MovieClip(); // цвет меню6	   
			
			var globalContainer:MovieClip = new MovieClip(); //содержит всю сцену
			var cubicContainer:MovieClip = new MovieClip();//контейнер для кубика
			var cubic:MovieClip = new MovieClip(); // кубик	   
			var tweensCube:Array = []; // храним твины		
			var CubicShadow:MovieClip = new MovieClip(); //тень		
			var Canvas:canvas = new canvas(); // канва 				
			var CubLogo:cuba_logo = new cuba_logo()//логотип;
			var cubeX:Number = 180;
			var cubeY:Number = 600;
			
			//переменные для параметров куба
			
			//Цвет заливки кнопок
			/*var FillButton1:uint;
			var FillButton2:uint;
			var FillButton3:uint;
			var FillButton4:uint;
			var FillButton5:uint;
			var FillButton6:uint;
			// прозрачность заливки кнопок
			var AlphaButton1:Number
			var AlphaButton2:Number
			var AlphaButton3:Number
			var AlphaButton4:Number
			var AlphaButton5:Number
			var AlphaButton6:Number
			//грани
			//цвет начала градиента
			var Gran1Fill1:uint
			var Gran2Fill1:uint
			var Gran3Fill1:uint
			var Gran4Fill1:uint
			var Gran5Fill1:uint
			var Gran6Fill1:uint
			//цвет окончания градиента
			var Gran1Fill2:uint
			var Gran2Fill2:uint
			var Gran3Fill2:uint
			var Gran4Fill2:uint
			var Gran5Fill2:uint
			var Gran6Fill2:uint
			//Линии граней
			var GranThicknessLine:Number;
			var GranColorLine:uint; 
			var GranAlphaLine:Number;
			//внешний контур
			var OutSideThicknessLine:Number; 
			var OutSideColorLine:uint; 
			var OutSideAlphaLine:Number;
			//внутренний контур
			var InSideThicknessLine:Number;
			var InSideColorLine:uint;
			var InSideAlphaLine:Number;
			//Тень от куба
			var ShadowCubeColor:uint;  
			var ShadowCubeAlpha:Number;
			//Подписи к кнопкам(всплывающие подсказки)
			//tooltip1
			var TOOLTIPTHICKNESSLINE1:Number; 
			var TOOLTIPCOLORLINE1:uint   
			var TOOLTIPFILL1:uint;   
			var TOOLTIPALPHALINE1 :Number;
			var TOOLTIPALPHA1 :Number;
			var TOOLTIPTEXT1:TextField=new TextField(); 
			//tooltip2
			var TOOLTIPTHICKNESSLINE2:Number;
			var TOOLTIPCOLORLINE2:uint;
			var TOOLTIPFILL2:uint;   
			var TOOLTIPALPHALINE2:Number;
			var TOOLTIPALPHA2:Number;
			var TOOLTIPTEXT2:TextField=new TextField(); 
			//tooltip3
			var TOOLTIPTHICKNESSLINE3:Number;
			var TOOLTIPCOLORLINE3:uint;
			var TOOLTIPFILL3:uint;
			var TOOLTIPALPHALINE3:Number;
			var TOOLTIPALPHA3:Number;
			var TOOLTIPTEXT3:TextField=new TextField(); 
			//tooltip4
			var TOOLTIPTHICKNESSLINE4:Number;
			var TOOLTIPCOLORLINE4:uint;
			var TOOLTIPFILL4:uint;
			var TOOLTIPALPHALINE4:Number;
			var TOOLTIPALPHA4:Number;
			var TOOLTIPTEXT4 :TextField=new TextField();
			//tooltip5
			var TOOLTIPTHICKNESSLINE5:Number
			var TOOLTIPCOLORLINE5:uint;
			var TOOLTIPFILL5:uint;
			var TOOLTIPALPHALINE5:Number;
			var TOOLTIPALPHA5:Number;
			var TOOLTIPTEXT5:TextField=new TextField(); 
			//tooltip6
			var TOOLTIPTHICKNESSLINE6:Number;
			var TOOLTIPCOLORLINE6:uint;
			var TOOLTIPFILL6:uint;
			var TOOLTIPALPHALINE6:Number;
			var TOOLTIPALPHA6:Number;
			var TOOLTIPTEXT6:TextField = new TextField(); 
			
			
			//Цвет подсветки 
			var PLATO1LIGHT:uint;
			var PLATO2LIGHT:uint;
			var PLATO3LIGHT:uint;*/
			
			var TolTip1:Sprite = new Sprite();
			var TolTip2:Sprite = new Sprite();
			var TolTip3:Sprite = new Sprite();
			var TolTip4:Sprite = new Sprite();
			var TolTip5:Sprite = new Sprite();
			var TolTip6:Sprite = new Sprite();
			
			//переменные для Config XML
			var ConfigUrl:String = "config.xml"
			/*var Designer1Url:String;
			var Designer2Url:String;
			var Designer3Url:String;
			var Designer4Url:String;
			var Cooperation1Url:String;
			var Cooperation2Url:String;
			var Teamwork1Url:String;
			var Teamwork2Url:String;
			var MainUrl:String;*/
			

			
			// фильтры свечения
			var DesignerGlow:GlowFilter
			var WithCompanyGlow:GlowFilter
			var WithDesignersGlow:GlowFilter
			//======конец описания переменных
							
			// регистрируем хинт			
		
			Hint.register(this)
			//регистрируем Алерт
			Alert.register(this);
			Alert.BG_COLOR = 0x80B1FD;
			
			//создаем прелоадер
			var preloader:Preloader = new Preloader(50, 0xFF0080, 1, 80);
			preloader.x = 1024 / 2;
			preloader.y = 768 / 2;
			preloader.label = "\n \n \n \n \n \n \n LOAD CONFIG ";
			addChild(Canvas);
			addChild(preloader);
			
			// создаем загрузчики основных XML основаные на классах ConfigXML и CubeXML
			var MainConfig:ConfigXML = new ConfigXML;
			var CubeConfig:CubeXML = new CubeXML;
				
			//загружаем основной конфиг
			MainConfig.loadMain(ConfigUrl, loadConfig,errorMainConfig);
			
			//если ошибка выводим ее
			function errorMainConfig():void
			{
				Alert.show(MainConfig.ErrorText.text);
				
			}
			
			function loadConfig():void
			{
			   CubeConfig.loadMainXml(MainConfig.MainUrl,loadCubeConfig,errorCubeConfig)
			}
			
			function errorCubeConfig():void
			{
				Alert.show(CubeConfig.ErrorText);
			}
			
			//загружаем настройки для куба
			function loadCubeConfig():void
			{
				designer1.loadXML(MainConfig.Designer1Url,designer1Create,designer1Eror)
			}
			
			function designer1Eror():void
			{
				Alert.show(designer1.ErrorText);
			}
			// загружаем информацию для дизайнеров
			function designer1Create():void
			{
				//задаем фильтры для портянок
				DesignerGlow= new GlowFilter(CubeConfig.PLATO1LIGHT, 0.3, 10, 10,5); 
				WithCompanyGlow= new GlowFilter(CubeConfig.PLATO2LIGHT, 0.3, 10, 10,5); 
				WithDesignersGlow= new GlowFilter(CubeConfig.PLATO3LIGHT, 0.3, 10, 10,5,2); 
				
				designer2.loadXML(MainConfig.Designer2Url, designer2Create,designer2Eror);
				preloader.label = "\n \n \n \n \n \n \n LOAD Designers ";
			}
			function designer2Eror():void
			{
				Alert.show(designer2.ErrorText);
			}
			
			function designer2Create():void
			{
				designer3.loadXML(MainConfig.Designer3Url,designer3Create,designer3Eror)
			}
			function designer3Eror():void
			{
				Alert.show(designer3.ErrorText);
			}
			
			function designer3Create():void
			{
				designer4.loadXML(MainConfig.Designer4Url,designer4Create,designer4Eror)
			}
			function designer4Eror():void
			{
				Alert.show(designer4.ErrorText);
			}
			
			function designer4Create():void
			{
				teamwork1.loadXML(MainConfig.Teamwork1Url,teamwork1Create,teamwork1Error)
					
			}
			function teamwork1Error():void
			{
				Alert.show(teamwork1.ErrorText);
			}
						
			// загружаем информацию для teamwork
			
			function teamwork1Create():void
			{
				preloader.label = "\n \n \n \n \n \n \n LOAD TeamWork ";
				teamwork2.loadXML(MainConfig.Teamwork2Url, teamwork2Create,teamwork2Error);
			}
			function teamwork2Error():void
			{
				Alert.show(teamwork2.ErrorText);
			}
			
			function teamwork2Create ():void
			{
				cooperation1.loadXML(MainConfig.Cooperation1Url, cooperation1Create,cooperation1Error);
			}
			function cooperation1Error():void
			{
				Alert.show(cooperation1.ErrorText);
			}
			
			function cooperation1Create():void
			{
				preloader.label = "\n \n \n \n \n \n \n LOAD Cooperation ";
				cooperation2.loadXML(MainConfig.Cooperation2Url, cooperation2Create,cooperation2Error);
			}
			function cooperation2Error():void
			{
				Alert.show(cooperation2.ErrorText);
			}
			
			function cooperation2Create():void
			{
				removeChild(preloader);
				loadAll();
				CreateCube();
				CreateTooltip();
			}
			
			/*function loadMain():void
					{
						
						var MainXml:URLLoader = new URLLoader();
						
						MainXml.load(new URLRequest(ConfigUrl));
						MainXml.addEventListener(Event.COMPLETE, processMain);
			            MainXml.addEventListener(IOErrorEvent.IO_ERROR, MainIOerror);
						MainXml.addEventListener(IOErrorEvent.VERIFY_ERROR, MainVeryfyIOerror);
						MainXml.addEventListener(ProgressEvent.PROGRESS, progressMain);
						
						function progressMain(event:ProgressEvent):void
						{
						  var total:Number=(Math.round(100*(event.bytesLoaded/event.bytesTotal)));
						    
							trace ("progress", event, "total = ", total);	
							if (total == 100)
							{
								//loadMainXml();
								MainXml.removeEventListener(ProgressEvent.PROGRESS, progressMain);
							}
						}
						
						function MainVeryfyIOerror(event:Event):void
								{
									preloader.label = "\n \n \n \n \n \n \n Error Veryfy config.xml ";
								}
						function MainIOerror(event:Event):void
								{
									
									preloader.label = "\n \n \n \n \n \n \n Error config.xml ";
								}
						function processMain(event:Event):void 
								{
									
									var mainXML:XML = new XML(event.target.data);
									
									//считываем из XML параметры и заносим в переменные
									 Designer1Url = mainXML.DESIGNER1.@PATH;
									 Designer2Url = mainXML.DESIGNER2.@PATH;
									 Designer3Url = mainXML.DESIGNER3.@PATH;
									 Designer4Url = mainXML.DESIGNER4.@PATH;
									 Cooperation1Url = mainXML.COOPERATION1.@PATH;
									 Cooperation2Url = mainXML.COOPERATION2.@PATH;
									 Teamwork1Url = mainXML.TEAMWORK1.@PATH;
									 Teamwork2Url = mainXML.TEAMWORK2.@PATH;
									 MainUrl = mainXML.MAIN.@PATH;
									 if (!(MainUrl==null))
									 {
										 loadMainXml();
									 }
									 MainXml.removeEventListener(Event.COMPLETE, processMain);
									 MainXml.removeEventListener(IOErrorEvent.IO_ERROR, MainIOerror);
									 MainXml.removeEventListener(IOErrorEvent.VERIFY_ERROR, MainVeryfyIOerror);
									 //MainXml = null;
									 //trace(Designer1Url, Designer2Url, Designer3Url, Designer4Url);
									 //trace(Cooperation1Url, Cooperation2Url, Teamwork1Url, Teamwork2Url, MainUrl);
									 //loadMainXml();	 
									 
									 
									
					    		}
					}//	  end function loadMain;	
						
						//загружаем основные XML
						function loadMainXml():void
						{
							trace("Loade mainXML");
							var CubeXmlList:XMLList;
							var MainXMLLoader:URLLoader = new URLLoader();
							//"data/main.xml"
							MainXMLLoader.load(new URLRequest(MainUrl)),new LoaderContext(true);
							MainXMLLoader.addEventListener(Event.COMPLETE, processMainXML);
			                MainXMLLoader.addEventListener(IOErrorEvent.IO_ERROR, MainXmlIOerror);
							MainXMLLoader.addEventListener(IOErrorEvent.VERIFY_ERROR, MainXMLVeryfyIOerror);	
							//addChild(Canvas);
							//addChild(preloader);
							preloader.label = "\n \n \n \n \n \n \n Загрузка среды ";
							
								function MainXMLVeryfyIOerror(event:Event):void
								{
									preloader.label = "\n \n \n \n \n \n \n Error Veryfy main.xml ";
								}
								function MainXmlIOerror(event:Event):void
								{
									trace("Error main.xml")
									preloader.label = "\n \n \n \n \n \n \n Error main.xml ";
								}
								function processMainXML(event:Event):void 
								{
									trace("Process mainXML");
									//preloader.label = "\n \n \n \n \n \n \n  загрузки main.xml ";
									var myXML:XML = new XML(event.target.data);
									CubeXmlList = myXML.FILLBUTTON;
									
									//считываем из XML параметры и заносим в переменные
									 FillButton1 = myXML.FILLBUTTON.@FILLBUTTON1;
									 FillButton2 = myXML.FILLBUTTON.@FILLBUTTON2;
									 FillButton3 = myXML.FILLBUTTON.@FILLBUTTON3;
									 FillButton4 = myXML.FILLBUTTON.@FILLBUTTON4;
									 FillButton5 = myXML.FILLBUTTON.@FILLBUTTON5;
									 FillButton6 = myXML.FILLBUTTON.@FILLBUTTON6;
									 
									 AlphaButton1 = myXML.ALPHABUTTON.@ALPHABUTTON1;
									 AlphaButton2 = myXML.ALPHABUTTON.@ALPHABUTTON2;
									 AlphaButton3 = myXML.ALPHABUTTON.@ALPHABUTTON3;
									 AlphaButton4 = myXML.ALPHABUTTON.@ALPHABUTTON4;
									 AlphaButton5 = myXML.ALPHABUTTON.@ALPHABUTTON5;
									 AlphaButton6 = myXML.ALPHABUTTON.@ALPHABUTTON6;
									
									 Gran1Fill1 = myXML.FILLGRAN1.@GRAN1FILL1;
									 Gran2Fill1 = myXML.FILLGRAN1.@GRAN2FILL1;
									 Gran3Fill1 = myXML.FILLGRAN1.@GRAN3FILL1;
									 Gran4Fill1 = myXML.FILLGRAN1.@GRAN4FILL1;
									 Gran5Fill1 = myXML.FILLGRAN1.@GRAN5FILL1;
									 Gran6Fill1 = myXML.FILLGRAN1.@GRAN6FILL1;
									 
									 Gran1Fill2 = myXML.FILLGRAN2.@GRAN1FILL2;
									 Gran2Fill2 = myXML.FILLGRAN2.@GRAN2FILL2;
									 Gran3Fill2 = myXML.FILLGRAN2.@GRAN3FILL2;
									 Gran4Fill2 = myXML.FILLGRAN2.@GRAN4FILL2;
									 Gran5Fill2 = myXML.FILLGRAN2.@GRAN5FILL2;
									 Gran6Fill2 = myXML.FILLGRAN2.@GRAN6FILL2;
									 
									 GranThicknessLine = myXML.LINEGRAN.@GRANTHICKNESSLINE;
									 GranColorLine = myXML.LINEGRAN.@GRANCOLORLINE;
									 GranAlphaLine = myXML.LINEGRAN.@GRANALPHALINE;
									 
									 OutSideThicknessLine = myXML.OUTSIDE.@OUTSIDETHICKNESSLINE;
									 OutSideColorLine = myXML.OUTSIDE.@OUTSIDECOLORLINE;
									 OutSideAlphaLine = myXML.OUTSIDE.@OUTSIDEALPHALINE;
									 
									 InSideThicknessLine = myXML.INSIDE.@INSIDETHICKNESSLINE;
									 InSideColorLine = myXML.INSIDE.@INSIDECOLORLINE;
									 InSideAlphaLine = myXML.INSIDE.@INSIDEALPHALINE;
									 
									 ShadowCubeColor = myXML.SHADOWCUBE.@SHADOWCUBECOLOR;
									 ShadowCubeAlpha = myXML.SHADOWCUBE.@SHADOWCUBEALPHA;
									 
									 TOOLTIPTEXT1.htmlText = myXML.TOOLTIPTEXT.@TOOLTIPTEXT1;
									 TOOLTIPTEXT2.htmlText = myXML.TOOLTIPTEXT.@TOOLTIPTEXT2;
									 TOOLTIPTEXT3.htmlText = myXML.TOOLTIPTEXT.@TOOLTIPTEXT3;
									 TOOLTIPTEXT4.htmlText = myXML.TOOLTIPTEXT.@TOOLTIPTEXT4;
									 TOOLTIPTEXT5.htmlText = myXML.TOOLTIPTEXT.@TOOLTIPTEXT5;
									 TOOLTIPTEXT6.htmlText = myXML.TOOLTIPTEXT.@TOOLTIPTEXT6;
									 
									 TOOLTIPTHICKNESSLINE1 = myXML.TOOLTIPTHICKNESSLINE.@TOOLTIPTHICKNESSLINE1;
									 TOOLTIPTHICKNESSLINE2 = myXML.TOOLTIPTHICKNESSLINE.@TOOLTIPTHICKNESSLINE2;
									 TOOLTIPTHICKNESSLINE3 = myXML.TOOLTIPTHICKNESSLINE.@TOOLTIPTHICKNESSLINE3;
									 TOOLTIPTHICKNESSLINE4 = myXML.TOOLTIPTHICKNESSLINE.@TOOLTIPTHICKNESSLINE4;
									 TOOLTIPTHICKNESSLINE5 = myXML.TOOLTIPTHICKNESSLINE.@TOOLTIPTHICKNESSLINE5;
									 TOOLTIPTHICKNESSLINE6 = myXML.TOOLTIPTHICKNESSLINE.@TOOLTIPTHICKNESSLINE6;
									 
									 TOOLTIPCOLORLINE1 = myXML.TOOLTIPCOLORLINE.@TOOLTIPCOLORLINE1;
									 TOOLTIPCOLORLINE2 = myXML.TOOLTIPCOLORLINE.@TOOLTIPCOLORLINE2;
									 TOOLTIPCOLORLINE3 = myXML.TOOLTIPCOLORLINE.@TOOLTIPCOLORLINE3;
									 TOOLTIPCOLORLINE4 = myXML.TOOLTIPCOLORLINE.@TOOLTIPCOLORLINE4;
									 TOOLTIPCOLORLINE5 = myXML.TOOLTIPCOLORLINE.@TOOLTIPCOLORLINE5;
									 TOOLTIPCOLORLINE6 = myXML.TOOLTIPCOLORLINE.@TOOLTIPCOLORLINE6;
									 
									 TOOLTIPFILL1 = myXML.TOOLTIPFILL.@TOOLTIPFILL1;
									 TOOLTIPFILL2 = myXML.TOOLTIPFILL.@TOOLTIPFILL2;
									 TOOLTIPFILL3 = myXML.TOOLTIPFILL.@TOOLTIPFILL3;
									 TOOLTIPFILL4 = myXML.TOOLTIPFILL.@TOOLTIPFILL4;
									 TOOLTIPFILL5 = myXML.TOOLTIPFILL.@TOOLTIPFILL5;
									 TOOLTIPFILL6 = myXML.TOOLTIPFILL.@TOOLTIPFILL6;
									 
									 TOOLTIPALPHA1 = myXML.TOOLTIPALPHA.@TOOLTIPALPHA1;
									 TOOLTIPALPHA2 = myXML.TOOLTIPALPHA.@TOOLTIPALPHA2;
									 TOOLTIPALPHA3 = myXML.TOOLTIPALPHA.@TOOLTIPALPHA3;
									 TOOLTIPALPHA4 = myXML.TOOLTIPALPHA.@TOOLTIPALPHA4;
									 TOOLTIPALPHA5 = myXML.TOOLTIPALPHA.@TOOLTIPALPHA5;
									 TOOLTIPALPHA6 = myXML.TOOLTIPALPHA.@TOOLTIPALPHA6;
									 
									 TOOLTIPALPHALINE1 = myXML.TOOLTIPALPHALINE.@TOOLTIPALPHALINE1;
									 TOOLTIPALPHALINE2 = myXML.TOOLTIPALPHALINE.@TOOLTIPALPHALINE2;
									 TOOLTIPALPHALINE3 = myXML.TOOLTIPALPHALINE.@TOOLTIPALPHALINE3;
									 TOOLTIPALPHALINE4 = myXML.TOOLTIPALPHALINE.@TOOLTIPALPHALINE4;
									 TOOLTIPALPHALINE5 = myXML.TOOLTIPALPHALINE.@TOOLTIPALPHALINE5;
									 TOOLTIPALPHALINE6 = myXML.TOOLTIPALPHALINE.@TOOLTIPALPHALINE6;
									 
									 PLATO1LIGHT = myXML.PLATOLIGHT.@PLATO1LIGHT;
									 PLATO2LIGHT = myXML.PLATOLIGHT.@PLATO2LIGHT;
									 PLATO3LIGHT = myXML.PLATOLIGHT.@PLATO3LIGHT;
									
									 DesignerGlow= new GlowFilter(PLATO1LIGHT, 0.3, 10, 10,5); 
									 WithCompanyGlow= new GlowFilter(PLATO2LIGHT, 0.3, 10, 10,5); 
									 WithDesignersGlow= new GlowFilter(PLATO3LIGHT, 0.3, 10, 10,5,2); 
									trace ("platilight =",PLATO1LIGHT)
									MainXMLLoader.removeEventListener(Event.COMPLETE, processMainXML);
			                        MainXMLLoader.removeEventListener(IOErrorEvent.IO_ERROR, MainXmlIOerror);
									MainXMLLoader.removeEventListener(IOErrorEvent.VERIFY_ERROR, MainXMLVeryfyIOerror);
									MainXMLLoader = null;
									
									
									loadDesigner1();
									
					    		}
								// загружаем битмапы для первого дизайнера
								function loadDesigner1():void
								{
									trace("Loade Designer1");
									var Designer1XmlLoader:URLLoader = new URLLoader();
									var thmb:Array = [];
									var TotalListIndex:int;
									//"data/designer1/designer1.xml"
									trace(Designer1Url);
									Designer1XmlLoader.load(new URLRequest(Designer1Url));
									Designer1XmlLoader.addEventListener(Event.COMPLETE, processDesigner1XML);
									Designer1XmlLoader.addEventListener(IOErrorEvent.IO_ERROR, Designer1XmlIOerror);
									Designer1XmlLoader.addEventListener(IOErrorEvent.VERIFY_ERROR, Designer1VeryfyIOerror);	
									
									function Designer1VeryfyIOerror(event:Event):void
									{
										trace("Error Designer1.xml")
										preloader.label = "\n \n \n \n \n \n \nVeryfy error ";
									}
									function Designer1XmlIOerror(event:Event):void
									{
										trace("Error Verify Designer1.xml");
										preloader.label = "\n \n \n \n \n \n \nОшибка designer1.xml ";
									}
									
									function processDesigner1XML(event:Event):void 
										{
											
											var myXML:XML = new XML(event.target.data);
											
											Designer1Name.htmlText = myXML.@NAME;
											Designer1Contacts.htmlText = myXML.@CONTACTS;
											Designer1PhotoUrls[0]=myXML.@PHOTO1;
											Designer1PhotoUrls[1]=myXML.@PHOTO2;
											Designer1XmlList = myXML.IMAGE;
											TotalListIndex = Designer1XmlList.length();
											Designer1XmlLoader.removeEventListener(Event.COMPLETE, processDesigner1XML);
											Designer1XmlLoader.removeEventListener(IOErrorEvent.IO_ERROR, Designer1XmlIOerror);
											Designer1XmlLoader.removeEventListener(IOErrorEvent.VERIFY_ERROR, Designer1VeryfyIOerror);	
									
											Designer1XmlLoader = null;
											loadImageDesigner1();
										}
										
										function loadImageDesigner1():void
										{  //preloader.label = "\n \n \n \n \n \n \n  загрузка designer1.xml ";
											
											for(var i:int = 0; i < TotalListIndex; i++)
											{
												Designer1FullImageUrls[i] = Designer1XmlList[i].@FULL;
												var thumb_url:String = Designer1XmlList[i].@THUMB;
												thmb[i]= new Loader();
												thmb[i].load(new URLRequest(thumb_url));
												thmb[i].contentLoaderInfo.addEventListener(Event.COMPLETE, onImageLoadDesigner1);
												
											}
											
										}
											// вызываем когда все изображения загружены
										function onImageLoadDesigner1(e:Event):void
										{
											//trace("On imageLoadDesigner1");
											for(var i:int = 0; i < TotalListIndex; i++)
											{
												Designer1ThuminalsBitmap[i] = new BitmapData(thmb[i].width,thmb[i].height);
												Designer1ThuminalsBitmap[i].draw(thmb[i],new Matrix());
												//trace("DESIGNER1= ",Designer1FullImageUrls[i])
											}
											if (preloader.stage)
											{
											 
											 removeChild(preloader);
											 loadAll();
											 CreateCube();
											 CreateTooltip();
											}
										}
								} //end function LoadDesigner1;
								
								
						}// end function loadmainXml;*/
									
						
						
						
						//Загружаем XML  	
							
							//loadMain();
							var s:String = flash.system.Security.sandboxType;
							trace(s);
							// задаем свойства стейджа
							//stage.scaleMode = StageScaleMode.SHOW_ALL;
							//stage.scaleMode = StageScaleMode.NO_SCALE;
							//stage.align = StageAlign.TOP_LEFT;
							
							
							/*var dd:MovieClip = new MovieClip();
							var mtrx:Matrix = new Matrix;
							dd.graphics.beginBitmapFill(Designer1ThuminalsBitmap[0], mtrx);
							dd.graphics.lineStyle(0.5,0xFFFFFF);
							dd.graphics.drawRect(0, 0, 1024, 768);
							dd.graphics.endFill();
							addChild(dd);*/
							
							// добавляем главный контур
							
							
							/*contur.graphics.beginFill(0xFFFFFF, 0.3);
							contur.graphics.lineStyle(0.5,0xFFFFFF);
							contur.graphics.drawRect(0, 0, 1024, 768);
							contur.graphics.endFill();
							addChild(contur);*/
							//=======================================
						   
							// размещаем кубик по X и Y
						   cubicContainer.x = cubeX;
						   cubicContainer.y = cubeY;
						   // делаем кнопки прозрачными
						   menu1.alpha = 0;
						   menu2.alpha = 0;
						   menu3.alpha = 0;
						   menu4.alpha = 0;
						   menu5.alpha = 0;
						   menu6.alpha = 0;
						   
						   menu_color1.alpha = 0;
						   menu_color2.alpha = 0;
						   menu_color3.alpha = 0;
						   menu_color4.alpha = 0;
						   menu_color5.alpha = 0;
						   menu_color6.alpha = 0;
						   // заполняем массив точек, на основе 2х массивов xCube и yCube
						   for (var j:int = 0; j < xCube.length; j++ )
						   {
							   pCube[j] = new Point(xCube[j], yCube[j]);
						   }
						   
						   // создаем тултипы
						   function CreateTooltip():void
						   {  
							   
							   var t1Width:Number = CubeConfig.TOOLTIPTEXT1.textWidth+8;
							   var t1Height:Number = CubeConfig.TOOLTIPTEXT1.textHeight+5;
							   CubeConfig.TOOLTIPTEXT1.width = CubeConfig.TOOLTIPTEXT1.textWidth+10;
							   CubeConfig.TOOLTIPTEXT1.height = CubeConfig.TOOLTIPTEXT1.textHeight+10;
							   
							   TolTip1.graphics.beginFill(CubeConfig.TOOLTIPFILL1, CubeConfig.TOOLTIPALPHA1);
							   TolTip1.graphics.lineStyle(CubeConfig.TOOLTIPALPHALINE1, CubeConfig.TOOLTIPCOLORLINE1);
							   TolTip1.graphics.drawRect(0,0,t1Width,t1Height); 
							   //TolTip1.graphics.moveTo(t1Width/2, t1Height);
							   //TolTip1.graphics.lineTo(0,100);
							   TolTip1.graphics.endFill();
							   TolTip1.addChild(CubeConfig.TOOLTIPTEXT1);
							   
							   var t2Width:Number = CubeConfig.TOOLTIPTEXT2.textWidth+8;
							   var t2Height:Number = CubeConfig.TOOLTIPTEXT2.textHeight+5;
							   CubeConfig.TOOLTIPTEXT2.width = CubeConfig.TOOLTIPTEXT2.width+10;
							   CubeConfig.TOOLTIPTEXT2.height = CubeConfig.TOOLTIPTEXT2.textHeight+10;
							   
							   TolTip2.graphics.beginFill(CubeConfig.TOOLTIPFILL2, CubeConfig.TOOLTIPALPHA2);
							   TolTip2.graphics.lineStyle(CubeConfig.TOOLTIPALPHALINE2, CubeConfig.TOOLTIPCOLORLINE2);
							   TolTip2.graphics.drawRect(0,0,t2Width,t2Height); 
							   //TolTip2.graphics.moveTo(t2Width/2, t2Height);
							   //TolTip2.graphics.lineTo(0,100);
							   TolTip2.graphics.endFill();
							   TolTip2.addChild(CubeConfig.TOOLTIPTEXT2);
							   
							   
							   var t3Width:Number = CubeConfig.TOOLTIPTEXT3.textWidth+8;
							   var t3Height:Number = CubeConfig.TOOLTIPTEXT3.textHeight+5;
							   CubeConfig.TOOLTIPTEXT3.width = CubeConfig.TOOLTIPTEXT3.width+30;
							   CubeConfig.TOOLTIPTEXT3.height = CubeConfig.TOOLTIPTEXT3.textHeight+10;
							   
							   TolTip3.graphics.beginFill(CubeConfig.TOOLTIPFILL3, CubeConfig.TOOLTIPALPHA3);
							   TolTip3.graphics.lineStyle(CubeConfig.TOOLTIPALPHALINE3, CubeConfig.TOOLTIPCOLORLINE3);
							   TolTip3.graphics.drawRect(0,0,t3Width,t3Height); 
							   //TolTip3.graphics.moveTo(0,t3Height/2);
							   //TolTip3.graphics.lineTo(-10,0);
							   TolTip3.graphics.endFill();
							   TolTip3.addChild(CubeConfig.TOOLTIPTEXT3);
							   
							   var t4Width:Number = CubeConfig.TOOLTIPTEXT4.textWidth+8;
							   var t4Height:Number = CubeConfig.TOOLTIPTEXT4.textHeight+5;
							   CubeConfig.TOOLTIPTEXT4.width = CubeConfig.TOOLTIPTEXT4.width+30;
							   CubeConfig.TOOLTIPTEXT4.height = CubeConfig.TOOLTIPTEXT4.textHeight+10;
							   
							   TolTip4.graphics.beginFill(CubeConfig.TOOLTIPFILL4, CubeConfig.TOOLTIPALPHA4);
							   TolTip4.graphics.lineStyle(CubeConfig.TOOLTIPALPHALINE4, CubeConfig.TOOLTIPCOLORLINE4);
							   TolTip4.graphics.drawRect(0,0,t4Width,t4Height); 
							   //TolTip4.graphics.moveTo(0,t4Height/2);
							   //TolTip4.graphics.lineTo(-10,0);
							   TolTip4.graphics.endFill();
							   TolTip4.addChild(CubeConfig.TOOLTIPTEXT4);
							   
							   var t5Width:Number = CubeConfig.TOOLTIPTEXT5.textWidth+8;
							   var t5Height:Number = CubeConfig.TOOLTIPTEXT5.textHeight+5;
							   CubeConfig.TOOLTIPTEXT5.width = CubeConfig.TOOLTIPTEXT5.width+10;
							   CubeConfig.TOOLTIPTEXT5.height = CubeConfig.TOOLTIPTEXT5.textHeight+10;
							   
							   TolTip5.graphics.beginFill(CubeConfig.TOOLTIPFILL5, CubeConfig.TOOLTIPALPHA5);
							   TolTip5.graphics.lineStyle(CubeConfig.TOOLTIPALPHALINE5, CubeConfig.TOOLTIPCOLORLINE5);
							   TolTip5.graphics.drawRect(0,0,t5Width,t5Height); 
							   //TolTip5.graphics.moveTo(0,t5Height/2);
							   //TolTip5.graphics.lineTo(-10,0);
							   TolTip5.graphics.endFill();
							   TolTip5.addChild(CubeConfig.TOOLTIPTEXT5);
							   
							   var t6Width:Number = CubeConfig.TOOLTIPTEXT6.textWidth+8;
							   var t6Height:Number = CubeConfig.TOOLTIPTEXT6.textHeight+5;
							   CubeConfig.TOOLTIPTEXT6.width = CubeConfig.TOOLTIPTEXT6.width+10;
							   CubeConfig.TOOLTIPTEXT6.height = CubeConfig.TOOLTIPTEXT6.textHeight+10;
							   
							   TolTip6.graphics.beginFill(CubeConfig.TOOLTIPFILL6, CubeConfig.TOOLTIPALPHA6);
							   TolTip6.graphics.lineStyle(CubeConfig.TOOLTIPALPHALINE3, CubeConfig.TOOLTIPCOLORLINE6);
							   TolTip6.graphics.drawRect(0,0,t6Width,t6Height); 
							   //TolTip6.graphics.moveTo(0,t3Height/2);
							   //TolTip6.graphics.lineTo(-10,0);
							   TolTip6.graphics.endFill();
							   TolTip6.addChild(CubeConfig.TOOLTIPTEXT6);
							   
							   
							   
							   
						   
							}
						   // рисуем кубик 
						  function CreateCube():void
						  {
						   DrawCubeMenu(cubicContainer,cubic, pCube[0], pCube[1], pCube[2], pCube[3], pCube[4], pCube[5],
										pCube[6], pCube[7], pCube[8], pCube[9], pCube[10], pCube[11], pCube[12], pCube[13],
										menu1, pCube[14], pCube[15], pCube[16], pCube[17],
										menu2, pCube[18], pCube[19], pCube[20], pCube[21],
										menu3, pCube[22], pCube[23], pCube[24], pCube[25],
										menu4, pCube[26], pCube[27], pCube[28], pCube[29],
										menu5, pCube[30], pCube[31], pCube[32], pCube[33],
										menu6, pCube[34], pCube[35], pCube[36], pCube[37],
										CubicShadow,pCube[38],pCube[39],pCube[40],pCube[41],pCube[42],pCube[43])
						  }
						   
						   
							
							// функция рисования кубика 
							function DrawCubeMenu(container:MovieClip,obj:MovieClip, p_contur1:Point, p_contur2:Point, p_contur3:Point,
																 p_contur4:Point, p_contur5:Point, p_contur6:Point,
																 
																 p_front:Point, p_inside1:Point, p_inside2:Point,
																 p_inside3:Point, p_inside4:Point, p_inside5:Point,
																 p_inside6:Point, p_back:Point,
																 
																 btn1:MovieClip, btn1_p1:Point, btn1_p2:Point, btn1_p3:Point,
																 btn1_p4:Point,
																 
																 btn2:MovieClip, btn2_p1:Point, btn2_p2:Point, btn2_p3:Point,
																 btn2_p4:Point,
																 
																 btn3:MovieClip, btn3_p1:Point, btn3_p2:Point, btn3_p3:Point,
																 btn3_p4:Point,
																 
																 btn4:MovieClip, btn4_p1:Point, btn4_p2:Point, btn4_p3:Point,
																 btn4_p4:Point,
																 
																 btn5:MovieClip, btn5_p1:Point, btn5_p2:Point, btn5_p3:Point,
																 btn5_p4:Point,
																 
																 btn6:MovieClip, btn6_p1:Point, btn6_p2:Point, btn6_p3:Point,
																 btn6_p4:Point,
																 
																 ShadowCube:MovieClip, p_shadow1:Point, p_shadow2:Point, p_shadow3:Point,
																 p_shadow4:Point,p_shadow5:Point,p_shadow6:Point
																 
																 ):void
							{
								var colorline:uint = 0xFFFFFF;
								var gran1:MovieClip = new MovieClip();
								var gran2:MovieClip = new MovieClip();
								
								
								// кнопка 1
								btn1.graphics.beginFill(0x50AFDC,0.5);
								//btn1.graphics.lineStyle(0.5,colorline);
								btn1.graphics.moveTo(btn1_p1.x, btn1_p1.y);
								btn1.graphics.lineTo(btn1_p1.x, btn1_p1.y);
								btn1.graphics.lineTo(btn1_p2.x, btn1_p2.y);
								btn1.graphics.lineTo(btn1_p3.x, btn1_p3.y);
								btn1.graphics.lineTo(btn1_p4.x, btn1_p4.y);
								btn1.graphics.lineTo(btn1_p1.x, btn1_p1.y);
								btn1.graphics.endFill();
								btn1.buttonMode = true; 
								
								// кнопка 2
								btn2.graphics.beginFill(0xA591AF,0.5);
								//btn2.graphics.lineStyle(0.5,colorline);
								btn2.graphics.moveTo(btn2_p1.x, btn2_p1.y);
								btn2.graphics.lineTo(btn2_p1.x, btn2_p1.y);
								btn2.graphics.lineTo(btn2_p2.x, btn2_p2.y);
								btn2.graphics.lineTo(btn2_p3.x, btn2_p3.y);
								btn2.graphics.lineTo(btn2_p4.x, btn2_p4.y);
								btn2.graphics.lineTo(btn2_p1.x, btn2_p1.y);
								btn2.graphics.endFill();
								btn2.buttonMode = true; 
								
								// кнопка 3
								btn3.graphics.beginFill(0xDCAAB4,0.5);
								//btn3.graphics.lineStyle(0.5,colorline);
								btn3.graphics.moveTo(btn3_p1.x, btn3_p1.y);
								btn3.graphics.lineTo(btn3_p1.x, btn3_p1.y);
								btn3.graphics.lineTo(btn3_p2.x, btn3_p2.y);
								btn3.graphics.lineTo(btn3_p3.x, btn3_p3.y);
								btn3.graphics.lineTo(btn3_p4.x, btn3_p4.y);
								btn3.graphics.lineTo(btn3_p1.x, btn3_p1.y);
								btn3.graphics.endFill();
								btn3.buttonMode = true; 
								
								// кнопка 4
								btn4.graphics.beginFill(0xEEEF8A,0.5);
								//btn4.graphics.lineStyle(0.5,colorline);
								btn4.graphics.moveTo(btn4_p1.x, btn4_p1.y);
								btn4.graphics.lineTo(btn4_p1.x, btn4_p1.y);
								btn4.graphics.lineTo(btn4_p2.x, btn4_p2.y);
								btn4.graphics.lineTo(btn4_p3.x, btn4_p3.y);
								btn4.graphics.lineTo(btn4_p4.x, btn4_p4.y);
								btn4.graphics.lineTo(btn4_p1.x, btn4_p1.y);
								btn4.graphics.endFill();
								btn4.buttonMode = true; 
								
								// кнопка 5
								btn5.graphics.beginFill(0xF09B7D,0.5);
								//btn5.graphics.lineStyle(0.5,colorline);
								btn5.graphics.moveTo(btn5_p1.x, btn5_p1.y);
								btn5.graphics.lineTo(btn5_p1.x, btn5_p1.y);
								btn5.graphics.lineTo(btn5_p2.x, btn5_p2.y);
								btn5.graphics.lineTo(btn5_p3.x, btn5_p3.y);
								btn5.graphics.lineTo(btn5_p4.x, btn5_p4.y);
								btn5.graphics.lineTo(btn5_p1.x, btn5_p1.y);
								btn5.graphics.endFill();
								btn5.buttonMode = true; 
								
								// кнопка 6
								btn6.graphics.beginFill(0xAED693,0.5);
								//btn6.graphics.lineStyle(0.5,colorline);
								btn6.graphics.moveTo(btn6_p1.x, btn6_p1.y);
								btn6.graphics.lineTo(btn6_p1.x, btn6_p1.y);
								btn6.graphics.lineTo(btn6_p2.x, btn6_p2.y);
								btn6.graphics.lineTo(btn6_p3.x, btn6_p3.y);
								btn6.graphics.lineTo(btn6_p4.x, btn6_p4.y);
								btn6.graphics.lineTo(btn6_p1.x, btn6_p1.y);
								btn6.graphics.endFill();
								btn6.buttonMode = true; 
								
								// заливка для кнопки 1
								
								menu_color1.graphics.beginFill(CubeConfig.FillButton1,CubeConfig.AlphaButton1);
								//btn1.graphics.lineStyle(0.5,colorline);
								menu_color1.graphics.moveTo(btn1_p1.x, btn1_p1.y);
								menu_color1.graphics.lineTo(btn1_p1.x, btn1_p1.y);
								menu_color1.graphics.lineTo(btn1_p2.x, btn1_p2.y);
								menu_color1.graphics.lineTo(btn1_p3.x, btn1_p3.y);
								menu_color1.graphics.lineTo(btn1_p4.x, btn1_p4.y);
								menu_color1.graphics.lineTo(btn1_p1.x, btn1_p1.y);
								menu_color1.graphics.endFill();
								menu_color1.buttonMode = true; 
								
								// заливка для кнопки 2
								menu_color2.graphics.beginFill(CubeConfig.FillButton2,CubeConfig.AlphaButton2);
								//btn2.graphics.lineStyle(0.5,colorline);
								menu_color2.graphics.moveTo(btn2_p1.x, btn2_p1.y);
								menu_color2.graphics.lineTo(btn2_p1.x, btn2_p1.y);
								menu_color2.graphics.lineTo(btn2_p2.x, btn2_p2.y);
								menu_color2.graphics.lineTo(btn2_p3.x, btn2_p3.y);
								menu_color2.graphics.lineTo(btn2_p4.x, btn2_p4.y);
								menu_color2.graphics.lineTo(btn2_p1.x, btn2_p1.y);
								menu_color2.graphics.endFill();
								menu_color2.buttonMode = true; 
								
								// заливка для кнопки 3
								menu_color3.graphics.beginFill(CubeConfig.FillButton3,CubeConfig.AlphaButton3);
								//btn3.graphics.lineStyle(0.5,colorline);
								menu_color3.graphics.moveTo(btn3_p1.x, btn3_p1.y);
								menu_color3.graphics.lineTo(btn3_p1.x, btn3_p1.y);
								menu_color3.graphics.lineTo(btn3_p2.x, btn3_p2.y);
								menu_color3.graphics.lineTo(btn3_p3.x, btn3_p3.y);
								menu_color3.graphics.lineTo(btn3_p4.x, btn3_p4.y);
								menu_color3.graphics.lineTo(btn3_p1.x, btn3_p1.y);
								menu_color3.graphics.endFill();
								menu_color3.buttonMode = true; 
								
								// заливка для кнопки 4
								menu_color4.graphics.beginFill(CubeConfig.FillButton4,CubeConfig.AlphaButton4);
								//btn4.graphics.lineStyle(0.5,colorline);
								menu_color4.graphics.moveTo(btn4_p1.x, btn4_p1.y);
								menu_color4.graphics.lineTo(btn4_p1.x, btn4_p1.y);
								menu_color4.graphics.lineTo(btn4_p2.x, btn4_p2.y);
								menu_color4.graphics.lineTo(btn4_p3.x, btn4_p3.y);
								menu_color4.graphics.lineTo(btn4_p4.x, btn4_p4.y);
								menu_color4.graphics.lineTo(btn4_p1.x, btn4_p1.y);
								menu_color4.graphics.endFill();
								menu_color4.buttonMode = true; 
								
								// заливка для кнопки 5
								menu_color5.graphics.beginFill(CubeConfig.FillButton5,CubeConfig.AlphaButton5);
								//btn5.graphics.lineStyle(0.5,colorline);
								menu_color5.graphics.moveTo(btn5_p1.x, btn5_p1.y);
								menu_color5.graphics.lineTo(btn5_p1.x, btn5_p1.y);
								menu_color5.graphics.lineTo(btn5_p2.x, btn5_p2.y);
								menu_color5.graphics.lineTo(btn5_p3.x, btn5_p3.y);
								menu_color5.graphics.lineTo(btn5_p4.x, btn5_p4.y);
								menu_color5.graphics.lineTo(btn5_p1.x, btn5_p1.y);
								menu_color5.graphics.endFill();
								menu_color5.buttonMode = true; 
								
								// заливка для кнопки 6
								menu_color6.graphics.beginFill(CubeConfig.FillButton6,CubeConfig.AlphaButton6);
								//btn6.graphics.lineStyle(0.5,colorline);
								menu_color6.graphics.moveTo(btn6_p1.x, btn6_p1.y);
								menu_color6.graphics.lineTo(btn6_p1.x, btn6_p1.y);
								menu_color6.graphics.lineTo(btn6_p2.x, btn6_p2.y);
								menu_color6.graphics.lineTo(btn6_p3.x, btn6_p3.y);
								menu_color6.graphics.lineTo(btn6_p4.x, btn6_p4.y);
								menu_color6.graphics.lineTo(btn6_p1.x, btn6_p1.y);
								menu_color6.graphics.endFill();
								menu_color6.buttonMode = true; 
								
								
								
								
								// грани
								
								//1грань
								var matrix1:Matrix = new Matrix;
								var colors1:Array = [CubeConfig.Gran1Fill1, CubeConfig.Gran1Fill2];
								var alphas1:Array = [0,0.7];
								var ratios1:Array = [0x00, 0xFF];
								matrix1.createGradientBox(60,60,-80/180*Math.PI,-10,-70)
								
								//obj.graphics.lineStyle(0.5,colorline,100,false,"normal","none","miter",3);
								obj.graphics.beginGradientFill(GradientType.LINEAR, colors1, alphas1, ratios1, matrix1);
								obj.graphics.moveTo(p_front.x,p_front.y);
     							obj.graphics.lineTo(p_front.x,p_front.y);
								obj.graphics.lineTo(p_inside6.x, p_inside6.y);
								obj.graphics.lineTo(p_inside1.x, p_inside1.y);
								obj.graphics.lineTo(p_inside2.x, p_inside2.y);
								obj.graphics.lineTo(p_front.x,p_front.y);
								obj.graphics.endFill();
								
								
								
								//2грань
								var matrix2:Matrix = new Matrix;
								var colors2:Array = [CubeConfig.Gran2Fill1, CubeConfig.Gran2Fill2];
								var alphas2:Array = [0.05,0.5];
								var ratios2:Array = [0x00, 0xFF];
								matrix2.createGradientBox(80,80,-90/180*Math.PI,0,-60)
								
								//obj.graphics.lineStyle(0.5,colorline,100,false,"normal","none","miter",3);
								obj.graphics.beginGradientFill(GradientType.LINEAR, colors2, alphas2, ratios2, matrix2);
								obj.graphics.moveTo(p_back.x,p_back.y);
     							obj.graphics.lineTo(p_back.x,p_back.y);
								obj.graphics.lineTo(p_inside1.x, p_inside1.y);
								obj.graphics.lineTo(p_inside2.x, p_inside2.y);
								obj.graphics.lineTo(p_inside3.x, p_inside3.y);
								obj.graphics.lineTo(p_back.x,p_back.y);
								obj.graphics.endFill();
								
								//3грань
								var matrix3:Matrix = new Matrix;
								var colors3:Array = [CubeConfig.Gran3Fill1, CubeConfig.Gran3Fill2];
								var alphas3:Array = [0.1,0.9];
								var ratios3:Array = [0x00, 0xFF];
								matrix3.createGradientBox(100,100,50/180*Math.PI,50,-50)
								
								//obj.graphics.lineStyle(0.5,colorline,100,false,"normal","none","miter",3);
								obj.graphics.beginGradientFill(GradientType.LINEAR, colors3, alphas3, ratios3, matrix3);
								obj.graphics.moveTo(p_front.x,p_front.y);
     							obj.graphics.lineTo(p_front.x,p_front.y);
								obj.graphics.lineTo(p_inside2.x, p_inside2.y);
								obj.graphics.lineTo(p_inside3.x, p_inside3.y);
								obj.graphics.lineTo(p_inside4.x, p_inside4.y);
								obj.graphics.lineTo(p_front.x,p_front.y);
								obj.graphics.endFill();
								
								//4грань
								var matrix4:Matrix = new Matrix;
								var colors4:Array = [CubeConfig.Gran4Fill1, CubeConfig.Gran4Fill2];
								var alphas4:Array = [0,0.35];
								var ratios4:Array = [0x00, 0xFF];
								matrix4.createGradientBox(70, 70, 210 / 180 * Math.PI, -50,-60)
								
								//obj.graphics.lineStyle(0.5,colorline,100,false,"normal","none","miter",3);
								obj.graphics.beginGradientFill(GradientType.LINEAR, colors4, alphas4, ratios4, matrix4);
								obj.graphics.moveTo(p_back.x,p_back.y);
     							obj.graphics.lineTo(p_back.x,p_back.y);
								obj.graphics.lineTo(p_inside3.x, p_inside3.y);
								obj.graphics.lineTo(p_inside4.x, p_inside4.y);
								obj.graphics.lineTo(p_inside5.x, p_inside5.y);
								obj.graphics.lineTo(p_back.x,p_back.y);
								obj.graphics.endFill();
								
								//5грань
								var matrix5:Matrix = new Matrix;
								var colors5:Array = [CubeConfig.Gran5Fill1, CubeConfig.Gran5Fill2];
								var alphas5:Array = [0.75,0.25];
								var ratios5:Array = [0x00, 0xFF];
								matrix5.createGradientBox(50, 50, 140 / 180 * Math.PI, -30, 30);
								
								//obj.graphics.lineStyle(0.5,colorline,100,false,"normal","none","miter",3);
								obj.graphics.beginGradientFill(GradientType.LINEAR, colors5, alphas5, ratios5, matrix5);
								obj.graphics.moveTo(p_front.x,p_front.y);
     							obj.graphics.lineTo(p_front.x,p_front.y);
								obj.graphics.lineTo(p_inside4.x, p_inside4.y);
								obj.graphics.lineTo(p_inside5.x, p_inside5.y);
								obj.graphics.lineTo(p_inside6.x, p_inside6.y);
								obj.graphics.lineTo(p_front.x,p_front.y);
								obj.graphics.endFill();
								
								
								//6грань
								var matrix6:Matrix = new Matrix;
								var colors6:Array = [CubeConfig.Gran6Fill1, CubeConfig.Gran6Fill2];
								var alphas6:Array = [0,0.65];
								var ratios6:Array = [0x00, 0xFF];
								matrix6.createGradientBox(45, 45, -140 / 180 * Math.PI, -50,-50)
								
								//obj.graphics.lineStyle(0.5,colorline,100,false,"normal","none","miter",3);
								obj.graphics.beginGradientFill(GradientType.LINEAR, colors6, alphas6, ratios6, matrix6);
								obj.graphics.moveTo(p_back.x,p_back.y);
     							obj.graphics.lineTo(p_back.x,p_back.y);
								obj.graphics.lineTo(p_inside5.x, p_inside5.y);
								obj.graphics.lineTo(p_inside6.x, p_inside6.y);
								obj.graphics.lineTo(p_inside1.x, p_inside1.y);
								obj.graphics.lineTo(p_back.x,p_back.y);
								obj.graphics.endFill();
								
								
								//рисуем линии граней
								obj.graphics.lineStyle(CubeConfig.GranThicknessLine,CubeConfig.GranColorLine,CubeConfig.GranAlphaLine,false,"none","none","miter",3);
								obj.graphics.moveTo(p_front.x,p_front.y);
     							obj.graphics.lineTo(p_inside2.x, p_inside2.y);
								obj.graphics.moveTo(p_front.x,p_front.y);
     							obj.graphics.lineTo(p_inside4.x, p_inside4.y);
								obj.graphics.moveTo(p_front.x,p_front.y);
     							obj.graphics.lineTo(p_inside6.x, p_inside6.y);
								
								// внешний контур
								
								obj.graphics.lineStyle(CubeConfig.OutSideThicknessLine,CubeConfig.OutSideColorLine,CubeConfig.OutSideAlphaLine,false,"normal","none","miter",3);
								obj.graphics.moveTo(p_contur1.x,p_contur1.y);
     							obj.graphics.lineTo(p_contur1.x, p_contur1.y);
								obj.graphics.lineTo(p_contur2.x, p_contur2.y);
								obj.graphics.lineTo(p_contur3.x, p_contur3.y);
								obj.graphics.lineTo(p_contur4.x, p_contur4.y);
								obj.graphics.lineTo(p_contur5.x, p_contur5.y);
								obj.graphics.lineTo(p_contur6.x, p_contur6.y);
								obj.graphics.lineTo(p_contur1.x, p_contur1.y);
								
								// внутренний контур
								
								obj.graphics.lineStyle(CubeConfig.InSideThicknessLine,CubeConfig.InSideColorLine,CubeConfig.InSideAlphaLine,false,"normal","none","miter",3);
								obj.graphics.moveTo(p_inside1.x, p_inside1.y);
								obj.graphics.lineTo(p_inside1.x, p_inside1.y);
								obj.graphics.lineTo(p_inside2.x, p_inside2.y);
								obj.graphics.lineTo(p_inside3.x, p_inside3.y);
								obj.graphics.lineTo(p_inside4.x, p_inside4.y);
								obj.graphics.lineTo(p_inside5.x, p_inside5.y);
								obj.graphics.lineTo(p_inside6.x, p_inside6.y);
								obj.graphics.lineTo(p_inside1.x, p_inside1.y);
								
								//тень
								ShadowCube.graphics.beginFill(CubeConfig.ShadowCubeColor,CubeConfig.ShadowCubeAlpha);
								//ShadowCube.graphics.lineStyle(0.5,0x777777,0,false,"normal","none","miter",3);
								ShadowCube.graphics.moveTo(p_shadow1.x, p_shadow1.y);
								ShadowCube.graphics.lineTo(p_shadow1.x, p_shadow1.y);
								ShadowCube.graphics.lineTo(p_shadow2.x, p_shadow2.y);
								ShadowCube.graphics.lineTo(p_shadow3.x, p_shadow3.y);
								ShadowCube.graphics.lineTo(p_shadow4.x, p_shadow4.y);
								ShadowCube.graphics.lineTo(p_shadow5.x, p_shadow5.y);
								ShadowCube.graphics.lineTo(p_shadow6.x, p_shadow6.y);
								ShadowCube.graphics.lineTo(p_shadow1.x, p_shadow1.y);
								ShadowCube.graphics.endFill();
								
								
								
								
								//нижние кнопки
								if (!menu_color2.stage)
								{
								  container.addChild(menu_color2);
								}
								
								if (!menu_color4.stage)
								{
								  container.addChild(menu_color4);
								}
								
								if (!menu_color6.stage)
								{
								  container.addChild(menu_color6);
								}
																
								//Логотип
								if (!CubLogo.stage)
								{
								 container.addChild(CubLogo);
								 
								}
								
								//верхние кнопки
								if (!menu_color1.stage)
								{
								  container.addChild(menu_color1);
								}
								
								if (!menu_color3.stage)
								{
								  container.addChild(menu_color3);
								}
								
								if (!menu_color5.stage)
								{
								  container.addChild(menu_color5);
								}
								
								if (!ShadowCube.stage)
								{
								
								 container.addChild(ShadowCube);
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
								
								if (!obj.stage)
								{
								 container.addChild(obj);
								}
								if (!container.stage)
								{
									addChild(container);
								}
								
								
								ShadowCube.x = cubic.x;
								ShadowCube.y = cubic.y;
								CubLogo.x = cubic.x;
								CubLogo.y = cubic.y;
								
								menu_color1.x = cubic.x; menu_color1.y = cubic.y;
								menu_color2.x = cubic.x; menu_color2.y = cubic.y;
								menu_color3.x = cubic.x; menu_color3.y = cubic.y;
								menu_color4.x = cubic.x; menu_color4.y = cubic.y;
								menu_color5.x = cubic.x; menu_color5.y = cubic.y;
								menu_color6.x = cubic.x; menu_color6.y = cubic.y;
								
							} // end function DrawCubeMenu
							
							
							// функция смещения точек
							function tweenCube (shft:int,shftR:int):void
							{
							  var time_tween:Number = 0.5;
							 //removeEventListenerMenuButton();	
							  var px0:Tween = new Tween(pCube[0+shft], "x", Regular.easeOut,pCube[0+shft].x, pCube[0+shftR].x, time_tween, true);
							  var py0:Tween = new Tween(pCube[0+shft], "y", Regular.easeOut,pCube[0+shft].y, pCube[0+shftR].y, time_tween, true);
							  var px1:Tween = new Tween(pCube[1+shft], "x", Regular.easeOut,pCube[1+shft].x, pCube[1+shftR].x, time_tween, true);
							  var py1:Tween = new Tween(pCube[1+shft], "y", Regular.easeOut, pCube[1+shft].y, pCube[1+shftR].y, time_tween, true);
							  var px2:Tween = new Tween(pCube[2+shft], "x", Regular.easeOut,pCube[2+shft].x, pCube[2+shftR].x, time_tween, true);
							  var py2:Tween = new Tween(pCube[2+shft], "y", Regular.easeOut, pCube[2+shft].y, pCube[2+shftR].y, time_tween, true);
							  var px3:Tween = new Tween(pCube[3+shft], "x", Regular.easeOut,pCube[3+shft].x, pCube[3+shftR].x, time_tween, true);
							  var py3:Tween = new Tween(pCube[3+shft], "y", Regular.easeOut, pCube[3+shft].y, pCube[3+shftR].y, time_tween, true);
							  var px4:Tween = new Tween(pCube[4+shft], "x", Regular.easeOut,pCube[4+shft].x, pCube[4+shftR].x, time_tween, true);
							  var py4:Tween = new Tween(pCube[4+shft], "y", Regular.easeOut, pCube[4+shft].y, pCube[4+shftR].y, time_tween, true);
							  var px5:Tween = new Tween(pCube[5+shft], "x", Regular.easeOut,pCube[5+shft].x, pCube[5+shftR].x, time_tween, true);
							  var py5:Tween = new Tween(pCube[5+shft], "y", Regular.easeOut, pCube[5+shft].y, pCube[5+shftR].y, time_tween, true);
							  var px6:Tween = new Tween(pCube[6+shft], "x", Regular.easeOut,pCube[6+shft].x, pCube[6+shftR].x, time_tween, true);
							  var py6:Tween = new Tween(pCube[6+shft], "y", Regular.easeOut, pCube[6+shft].y, pCube[6+shftR].y, time_tween, true);
							  var px7:Tween = new Tween(pCube[7+shft], "x", Regular.easeOut,pCube[7+shft].x, pCube[7+shftR].x, time_tween, true);
							  var py7:Tween = new Tween(pCube[7 + shft], "y", Regular.easeOut, pCube[7 + shft].y, pCube[7 + shftR].y, time_tween, true);
							  
							  var px8:Tween = new Tween(pCube[8+shft], "x", Regular.easeOut,pCube[8+shft].x, pCube[8+shftR].x, time_tween, true);
							  var py8:Tween = new Tween(pCube[8+shft], "y", Regular.easeOut,pCube[8+shft].y, pCube[8+shftR].y, time_tween, true);
							  var px9:Tween = new Tween(pCube[9+shft], "x", Regular.easeOut,pCube[9+shft].x, pCube[9+shftR].x, time_tween, true);
							  var py9:Tween = new Tween(pCube[9+shft], "y", Regular.easeOut, pCube[9+shft].y, pCube[9+shftR].y, time_tween, true);
							  var px10:Tween = new Tween(pCube[10+shft], "x", Regular.easeOut,pCube[10+shft].x, pCube[10+shftR].x, time_tween, true);
							  var py10:Tween = new Tween(pCube[10+shft], "y", Regular.easeOut, pCube[10+shft].y, pCube[10+shftR].y, time_tween, true);
							  var px11:Tween = new Tween(pCube[11+shft], "x", Regular.easeOut,pCube[11+shft].x, pCube[11+shftR].x, time_tween, true);
							  var py11:Tween = new Tween(pCube[11+shft], "y", Regular.easeOut, pCube[11+shft].y, pCube[11+shftR].y, time_tween, true);
							  var px12:Tween = new Tween(pCube[12+shft], "x", Regular.easeOut,pCube[12+shft].x, pCube[12+shftR].x, time_tween, true);
							  var py12:Tween = new Tween(pCube[12+shft], "y", Regular.easeOut, pCube[12+shft].y, pCube[12+shftR].y, time_tween, true);
							  var px13:Tween = new Tween(pCube[13+shft], "x", Regular.easeOut,pCube[13+shft].x, pCube[13+shftR].x, time_tween, true);
							  var py13:Tween = new Tween(pCube[13+shft], "y", Regular.easeOut, pCube[13+shft].y, pCube[13+shftR].y, time_tween, true);
							  var px14:Tween = new Tween(pCube[14+shft], "x", Regular.easeOut,pCube[14+shft].x, pCube[14+shftR].x, time_tween, true);
							  var py14:Tween = new Tween(pCube[14+shft], "y", Regular.easeOut, pCube[14+shft].y, pCube[14+shftR].y, time_tween, true);
							  var px15:Tween = new Tween(pCube[15+shft], "x", Regular.easeOut,pCube[15+shft].x, pCube[15+shftR].x, time_tween, true);
							  var py15:Tween = new Tween(pCube[15 + shft], "y", Regular.easeOut, pCube[15 + shft].y, pCube[15 + shftR].y, time_tween, true);
							  
							  var px16:Tween = new Tween(pCube[16+shft], "x", Regular.easeOut,pCube[16+shft].x, pCube[16+shftR].x, time_tween, true);
							  var py16:Tween = new Tween(pCube[16+shft], "y", Regular.easeOut,pCube[16+shft].y, pCube[16+shftR].y, time_tween, true);
							  var px17:Tween = new Tween(pCube[17+shft], "x", Regular.easeOut,pCube[17+shft].x, pCube[17+shftR].x, time_tween, true);
							  var py17:Tween = new Tween(pCube[17+shft], "y", Regular.easeOut, pCube[17+shft].y, pCube[17+shftR].y, time_tween, true);
							  var px18:Tween = new Tween(pCube[18+shft], "x", Regular.easeOut,pCube[18+shft].x, pCube[18+shftR].x, time_tween, true);
							  var py18:Tween = new Tween(pCube[18+shft], "y", Regular.easeOut, pCube[18+shft].y, pCube[18+shftR].y, time_tween, true);
							  var px19:Tween = new Tween(pCube[19+shft], "x", Regular.easeOut,pCube[19+shft].x, pCube[19+shftR].x, time_tween, true);
							  var py19:Tween = new Tween(pCube[19+shft], "y", Regular.easeOut, pCube[19+shft].y, pCube[19+shftR].y, time_tween, true);
							  var px20:Tween = new Tween(pCube[20+shft], "x", Regular.easeOut,pCube[20+shft].x, pCube[20+shftR].x, time_tween, true);
							  var py20:Tween = new Tween(pCube[20+shft], "y", Regular.easeOut, pCube[20+shft].y, pCube[20+shftR].y, time_tween, true);
							  var px21:Tween = new Tween(pCube[21+shft], "x", Regular.easeOut,pCube[21+shft].x, pCube[21+shftR].x, time_tween, true);
							  var py21:Tween = new Tween(pCube[21+shft], "y", Regular.easeOut, pCube[21+shft].y, pCube[21+shftR].y, time_tween, true);
							  var px22:Tween = new Tween(pCube[22+shft], "x", Regular.easeOut,pCube[22+shft].x, pCube[22+shftR].x, time_tween, true);
							  var py22:Tween = new Tween(pCube[22+shft], "y", Regular.easeOut, pCube[22+shft].y, pCube[22+shftR].y, time_tween, true);
							  var px23:Tween = new Tween(pCube[23+shft], "x", Regular.easeOut,pCube[23+shft].x, pCube[23+shftR].x, time_tween, true);
							  var py23:Tween = new Tween(pCube[23 + shft], "y", Regular.easeOut, pCube[23 + shft].y, pCube[23 + shftR].y, time_tween, true);
							  
							  var px24:Tween = new Tween(pCube[24+shft], "x", Regular.easeOut,pCube[24+shft].x, pCube[24+shftR].x, time_tween, true);
							  var py24:Tween = new Tween(pCube[24+shft], "y", Regular.easeOut,pCube[24+shft].y, pCube[24+shftR].y, time_tween, true);
							  var px25:Tween = new Tween(pCube[25+shft], "x", Regular.easeOut,pCube[25+shft].x, pCube[25+shftR].x, time_tween, true);
							  var py25:Tween = new Tween(pCube[25+shft], "y", Regular.easeOut, pCube[25+shft].y, pCube[25+shftR].y, time_tween, true);
							  var px26:Tween = new Tween(pCube[26+shft], "x", Regular.easeOut,pCube[26+shft].x, pCube[26+shftR].x, time_tween, true);
							  var py26:Tween = new Tween(pCube[26+shft], "y", Regular.easeOut, pCube[26+shft].y, pCube[26+shftR].y, time_tween, true);
							  var px27:Tween = new Tween(pCube[27+shft], "x", Regular.easeOut,pCube[27+shft].x, pCube[27+shftR].x, time_tween, true);
							  var py27:Tween = new Tween(pCube[27+shft], "y", Regular.easeOut, pCube[27+shft].y, pCube[27+shftR].y, time_tween, true);
							  var px28:Tween = new Tween(pCube[28+shft], "x", Regular.easeOut,pCube[28+shft].x, pCube[28+shftR].x, time_tween, true);
							  var py28:Tween = new Tween(pCube[28+shft], "y", Regular.easeOut, pCube[28+shft].y, pCube[28+shftR].y, time_tween, true);
							  var px29:Tween = new Tween(pCube[29+shft], "x", Regular.easeOut,pCube[29+shft].x, pCube[29+shftR].x, time_tween, true);
							  var py29:Tween = new Tween(pCube[29+shft], "y", Regular.easeOut, pCube[29+shft].y, pCube[29+shftR].y, time_tween, true);
							  var px30:Tween = new Tween(pCube[30+shft], "x", Regular.easeOut,pCube[30+shft].x, pCube[30+shftR].x, time_tween, true);
							  var py30:Tween = new Tween(pCube[30+shft], "y", Regular.easeOut, pCube[30+shft].y, pCube[30+shftR].y, time_tween, true);
							  var px31:Tween = new Tween(pCube[31+shft], "x", Regular.easeOut,pCube[31+shft].x, pCube[31+shftR].x, time_tween, true);
							  var py31:Tween = new Tween(pCube[31 + shft], "y", Regular.easeOut, pCube[31 + shft].y, pCube[31 + shftR].y, time_tween, true);
							  
							  var px32:Tween = new Tween(pCube[32+shft], "x", Regular.easeOut,pCube[32+shft].x, pCube[32+shftR].x, time_tween, true);
							  var py32:Tween = new Tween(pCube[32+shft], "y", Regular.easeOut,pCube[32+shft].y, pCube[32+shftR].y, time_tween, true);
							  var px33:Tween = new Tween(pCube[33+shft], "x", Regular.easeOut,pCube[33+shft].x, pCube[33+shftR].x, time_tween, true);
							  var py33:Tween = new Tween(pCube[33+shft], "y", Regular.easeOut, pCube[33+shft].y, pCube[33+shftR].y, time_tween, true);
							  var px34:Tween = new Tween(pCube[34+shft], "x", Regular.easeOut,pCube[34+shft].x, pCube[34+shftR].x, time_tween, true);
							  var py34:Tween = new Tween(pCube[34+shft], "y", Regular.easeOut, pCube[34+shft].y, pCube[34+shftR].y, time_tween, true);
							  var px35:Tween = new Tween(pCube[35+shft], "x", Regular.easeOut,pCube[35+shft].x, pCube[35+shftR].x, time_tween, true);
							  var py35:Tween = new Tween(pCube[35+shft], "y", Regular.easeOut, pCube[35+shft].y, pCube[35+shftR].y, time_tween, true);
							  var px36:Tween = new Tween(pCube[36+shft], "x", Regular.easeOut,pCube[36+shft].x, pCube[36+shftR].x, time_tween, true);
							  var py36:Tween = new Tween(pCube[36+shft], "y", Regular.easeOut, pCube[36+shft].y, pCube[36+shftR].y, time_tween, true);
							  var px37:Tween = new Tween(pCube[37+shft], "x", Regular.easeOut,pCube[37+shft].x, pCube[37+shftR].x, time_tween, true);
							  var py37:Tween = new Tween(pCube[37+shft], "y", Regular.easeOut, pCube[37+shft].y, pCube[37+shftR].y, time_tween, true);
							  var px38:Tween = new Tween(pCube[38+shft], "x", Regular.easeOut,pCube[38+shft].x, pCube[38+shftR].x, time_tween, true);
							  var py38:Tween = new Tween(pCube[38+shft], "y", Regular.easeOut, pCube[38+shft].y, pCube[38+shftR].y, time_tween, true);
							  var px39:Tween = new Tween(pCube[39+shft], "x", Regular.easeOut,pCube[39+shft].x, pCube[39+shftR].x, time_tween, true);
							  var py39:Tween = new Tween(pCube[39 + shft], "y", Regular.easeOut, pCube[39 + shft].y, pCube[39 + shftR].y, time_tween, true);
							  
							  var px40:Tween = new Tween(pCube[40+shft], "x", Regular.easeOut,pCube[40+shft].x, pCube[40+shftR].x, time_tween, true);
							  var py40:Tween = new Tween(pCube[40+shft], "y", Regular.easeOut,pCube[40+shft].y, pCube[40+shftR].y, time_tween, true);
							  var px41:Tween = new Tween(pCube[41+shft], "x", Regular.easeOut,pCube[41+shft].x, pCube[41+shftR].x, time_tween, true);
							  var py41:Tween = new Tween(pCube[41+shft], "y", Regular.easeOut, pCube[41+shft].y, pCube[41+shftR].y, time_tween, true);
							  var px42:Tween = new Tween(pCube[42+shft], "x", Regular.easeOut,pCube[42+shft].x, pCube[42+shftR].x, time_tween, true);
							  var py42:Tween = new Tween(pCube[42+shft], "y", Regular.easeOut, pCube[42+shft].y, pCube[42+shftR].y, time_tween, true);
							  var px43:Tween = new Tween(pCube[43+shft], "x", Regular.easeOut,pCube[43+shft].x, pCube[43+shftR].x, time_tween, true);
							  var py43:Tween = new Tween(pCube[43+shft], "y", Regular.easeOut, pCube[43+shft].y, pCube[43+shftR].y, time_tween, true);
							  
								tweensCube.push(px0); tweensCube.push(py0);
								tweensCube.push(px1); tweensCube.push(py1);
								tweensCube.push(px2); tweensCube.push(py2);
								tweensCube.push(px3); tweensCube.push(py3);
								tweensCube.push(px4); tweensCube.push(py4);
								tweensCube.push(px5); tweensCube.push(py5);
								tweensCube.push(px6); tweensCube.push(py6);
								tweensCube.push(px7); tweensCube.push(py7);
								
								tweensCube.push(px8); tweensCube.push(py8);
								tweensCube.push(px9); tweensCube.push(py9);
								tweensCube.push(px10); tweensCube.push(py10);
								tweensCube.push(px11); tweensCube.push(py11);
								tweensCube.push(px12); tweensCube.push(py12);
								tweensCube.push(px13); tweensCube.push(py13);
								tweensCube.push(px14); tweensCube.push(py14);
								tweensCube.push(px15); tweensCube.push(py15);
								
								tweensCube.push(px16); tweensCube.push(py16);
								tweensCube.push(px17); tweensCube.push(py17);
								tweensCube.push(px18); tweensCube.push(py18);
								tweensCube.push(px19); tweensCube.push(py19);
								tweensCube.push(px20); tweensCube.push(py20);
								tweensCube.push(px21); tweensCube.push(py21);
								tweensCube.push(px22); tweensCube.push(py22);
								tweensCube.push(px23); tweensCube.push(py23);
								
								tweensCube.push(px24); tweensCube.push(py24);
								tweensCube.push(px25); tweensCube.push(py25);
								tweensCube.push(px26); tweensCube.push(py26);
								tweensCube.push(px27); tweensCube.push(py27);
								tweensCube.push(px28); tweensCube.push(py28);
								tweensCube.push(px29); tweensCube.push(py29);
								tweensCube.push(px30); tweensCube.push(py30);
								tweensCube.push(px31); tweensCube.push(py31);
								
								tweensCube.push(px32); tweensCube.push(py32);
								tweensCube.push(px33); tweensCube.push(py33);
								tweensCube.push(px34); tweensCube.push(py34);
								tweensCube.push(px35); tweensCube.push(py35);
								tweensCube.push(px36); tweensCube.push(py36);
								tweensCube.push(px37); tweensCube.push(py37);
								tweensCube.push(px38); tweensCube.push(py38);
								tweensCube.push(px39); tweensCube.push(py39);
								
								tweensCube.push(px40); tweensCube.push(py40);
								tweensCube.push(px41); tweensCube.push(py41);
								tweensCube.push(px42); tweensCube.push(py42);
								tweensCube.push(px43); tweensCube.push(py43);
								
								py43.addEventListener(TweenEvent.MOTION_FINISH, removeOn);
							}
							
							// удаляем энтерфрейм слушатель
							function removeOn(event:Event):void
							{
								removeEventListener(Event.ENTER_FRAME, onEnterFrame);
								//addEventListenerMenuButton();
								
								if (whatButtonIsPressed == 1)
								{
									if (!pressMenuButton1)
									{
										if (pressMenuButton6)
										{
											backCubic();
										}
					
										designerContainer.alpha = 0;
										designerContainer.visible = true;
										var tweenDesigners:Tween = new Tween(designerContainer, "alpha", Regular.easeOut,0, 1, 1, true);
										buttonTween.push(tweenDesigners);
										pressMenuButton1 = true;
										pressMenuButton6 = false;
				 					}
									trace("pess menu1");
								}
								else if(whatButtonIsPressed == 2)
								{
									if (!pressMenuButton2)
									{	
										if (pressMenuButton6)
										{backCubic();}
										withDesignerContainer.alpha = 0;
										withDesignerContainer.visible = true;
										var withDesignerContainers:Tween = new Tween(withDesignerContainer, "alpha", Regular.easeOut,0, 1, 1, true);
										buttonTween.push(withDesignerContainers);
										pressMenuButton2 = true;
										pressMenuButton6 = false;
									}
									trace("pess menu2");
									
								}
								else if(whatButtonIsPressed == 3)
								{
									if (!pressMenuButton3)
									{
										if (pressMenuButton6)
										{backCubic();}
										withCompanyContainer.alpha = 0;
										withCompanyContainer.visible = true;
										var withCompanyContainers:Tween = new Tween(withCompanyContainer, "alpha", Regular.easeOut,0, 1, 1, true);
										buttonTween.push(withCompanyContainers);
										pressMenuButton3 = true;
										pressMenuButton6 = false;
									}
									trace("pess menu3");
									
								}
								else if(whatButtonIsPressed == 4)
								{
									trace("pess menu4");
									
								}
								else if(whatButtonIsPressed == 5)
								{
									trace("pess menu5");
									
								}
								else if(whatButtonIsPressed == 6)
								{
									if (!pressMenuButton6)
									{
										//withCompanyContainer.visible = false;
										//designerContainer.visible = false;
										//withDesignerContainer.visible = false;
										pressMenuButton1 = false;
										pressMenuButton2 = false;
										pressMenuButton3 = false;
										
										var cubicXTween:Tween = new Tween(globalContainer, "x", Regular.easeOut,0, 700, 1, true);
										buttonTween.push(cubicXTween);
										pressMenuButton6 = true;
										var cubicYTween:Tween = new Tween(globalContainer, "y", Regular.easeIn, 0, -500, 1, true)
										buttonTween.push(cubicYTween);
										cubicYTween.addEventListener(TweenEvent.MOTION_FINISH, yUpFinish);
										removeEventListenerMenuButton();
									}
									trace("pess menu6");
									
								}
								
							}
							
							// в каждом кадре отрисовываем твин движение всех точек
							function onEnterFrame(event:Event):void
							{
								//очищаем все
								cubicContainer.graphics.clear();
								
								menu1.graphics.clear();
								menu2.graphics.clear();
								menu3.graphics.clear();
								menu4.graphics.clear();
								menu5.graphics.clear();
								menu6.graphics.clear();
								cubic.graphics.clear();
								menu_color1.graphics.clear();
								menu_color2.graphics.clear();
								menu_color3.graphics.clear();
								menu_color4.graphics.clear();
								menu_color5.graphics.clear();
								menu_color6.graphics.clear();
								
								CubicShadow.graphics.clear();
								// рисуем заново кубик
								CreateCube();
								/*DrawCubeMenu(cubicContainer,cubic, pCube[0], pCube[1], pCube[2], pCube[3], pCube[4], pCube[5],
										pCube[6], pCube[7], pCube[8], pCube[9], pCube[10], pCube[11], pCube[12], pCube[13],
										menu1, pCube[14], pCube[15], pCube[16], pCube[17],
										menu2, pCube[18], pCube[19], pCube[20], pCube[21],
										menu3, pCube[22], pCube[23], pCube[24], pCube[25],
										menu4, pCube[26], pCube[27], pCube[28], pCube[29],
										menu5, pCube[30], pCube[31], pCube[32], pCube[33],
										menu6, pCube[34], pCube[35], pCube[36], pCube[37],
										CubicShadow,pCube[38],pCube[39],pCube[40],pCube[41],pCube[42],pCube[43])
								*/
							}
							// добавляем слушателей
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
							//удаляем слушателей
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
							
								
			
			// переменные для проверки нажатия кнопок
			var pressMenuButton1:Boolean = false; //
			var pressMenuButton2:Boolean = false;
			var pressMenuButton3:Boolean = false;
			var pressMenuButton4:Boolean = false;
			var pressMenuButton5:Boolean = false;
			var pressMenuButton6:Boolean = false;
			
			var whatButtonIsPressed:int;
			
			//храним твины для кнопок
			var buttonTween:Array = [];
			var EndTweenCub:Boolean = false;// проверяем проиграл твин разворачивания куба или нет
			//отслеживаем кнопку1 
			function menu1Out():void
			{
				trace("menu1 is OUT")
			}
			
			function menu1Over():void
			{
				
				Hint.show(TolTip1);
				trace ("mx: ", mouseX, "my:", mouseY);
				trace ("tx: ", TolTip1.x, "ty:",TolTip1.y);
				
				designerContainer.filters = [DesignerGlow];
				withCompanyContainer.filters = null;
				withDesignerContainer.filters = null;
				
					menu_color1.alpha = 1;
					menu_color2.alpha = 0;
					menu_color3.alpha = 0;
					menu_color4.alpha = 0;
					menu_color5.alpha = 0;
					menu_color6.alpha = 0;
				
					trace("menu1 is Over")
			}
			
			
			function menu1Click(event:MouseEvent):void
			{
			    addEventListener(Event.ENTER_FRAME, onEnterFrame);
				tweenCube(0,44);
				trace("menu1 is Click")
				
				menu_color1.alpha = 1;
				menu_color2.alpha = 0;
				menu_color3.alpha = 0;
				menu_color4.alpha = 0;
				menu_color5.alpha = 0;
				menu_color6.alpha = 0;
				
				whatButtonIsPressed = 1;
				
			/*	if (!pressMenuButton1)
				{
					if (pressMenuButton6)
					{
						backCubic();
					}
					
					designerContainer.alpha = 0;
					designerContainer.visible = true;
					var tweenDesigners:Tween = new Tween(designerContainer, "alpha", Regular.easeOut,0, 1, 1, true);
					buttonTween.push(tweenDesigners);
					pressMenuButton1 = true;
					pressMenuButton6 = false;
				 
					
				}*/
				
				
				
				
			}					
			//отслеживаем кнопку2					
			function menu2Out():void
			{
				trace("menu2 is OUT")
			}
			
			function menu2Over():void
			{
				Hint.show(TolTip2);
				withDesignerContainer.filters = [WithDesignersGlow];
				designerContainer.filters = null;
				withCompanyContainer.filters = null;
				
				
				
					menu_color1.alpha = 0;
					menu_color2.alpha = 1;
					menu_color3.alpha = 0;
					menu_color4.alpha = 0;
					menu_color5.alpha = 0;
					menu_color6.alpha = 0;
				
				trace("menu2 is Over")
			}
			
			
			function menu2Click(event:MouseEvent):void
			{
			    addEventListener(Event.ENTER_FRAME, onEnterFrame);
				tweenCube(0, 88);
				trace("menu2 is Click")
				whatButtonIsPressed = 2;
				
				menu_color1.alpha = 0;
				menu_color2.alpha = 1;
				menu_color3.alpha = 0;
				menu_color4.alpha = 0;
				menu_color5.alpha = 0;
				menu_color6.alpha = 0;
				
				
			/*	if (!pressMenuButton2)
				{
					if (pressMenuButton6)
					{backCubic();}
					withDesignerContainer.alpha = 0;
					withDesignerContainer.visible = true;
					var withDesignerContainers:Tween = new Tween(withDesignerContainer, "alpha", Regular.easeOut,0, 1, 1, true);
					buttonTween.push(withDesignerContainers);
					pressMenuButton2 = true;
					pressMenuButton6 = false;
				}
				*/
			}				   
				
			//отслеживаем кнопку3
			function menu3Out():void
			{
				trace("menu3 is OUT")
			}
			
			function menu3Over():void
			{
				
				Hint.show(TolTip3);
				withDesignerContainer.filters = null;
				designerContainer.filters = null;
				withCompanyContainer.filters = [WithCompanyGlow];
				
					menu_color1.alpha = 0;
					menu_color2.alpha = 0;
					menu_color3.alpha = 1;
					menu_color4.alpha = 0;
					menu_color5.alpha = 0;
					menu_color6.alpha = 0;
				
				trace("menu3 is Over")
			}
			
			
			function menu3Click(event:MouseEvent):void
			{
			    addEventListener(Event.ENTER_FRAME, onEnterFrame);
				tweenCube(0,132);
				trace("menu3 is Click")
				whatButtonIsPressed = 3;
				
				menu_color1.alpha = 0;
				menu_color2.alpha = 0;
				menu_color3.alpha = 1;
				menu_color4.alpha = 0;
				menu_color5.alpha = 0;
				menu_color6.alpha = 0;
				
				
			/*	if (!pressMenuButton3)
				{
					if (pressMenuButton6)
					{backCubic();}
					withCompanyContainer.alpha = 0;
					withCompanyContainer.visible = true;
					var withCompanyContainers:Tween = new Tween(withCompanyContainer, "alpha", Regular.easeOut,0, 1, 1, true);
					buttonTween.push(withCompanyContainers);
					pressMenuButton3 = true;
					pressMenuButton6 = false;
				} */
			}
			
			//отслеживаем кнопку4
			function menu4Out():void
			{
				trace("menu4 is OUT")
			}
			
			function menu4Over():void
			{
				Hint.show(TolTip4);
				withDesignerContainer.filters = null;
				designerContainer.filters = null;
				withCompanyContainer.filters = null;
				
					menu_color1.alpha = 0;
					menu_color2.alpha = 0;
					menu_color3.alpha = 0;
					menu_color4.alpha = 1;
					menu_color5.alpha = 0;
					menu_color6.alpha = 0;
				
				trace("menu4 is Over")
			}
			
			
			function menu4Click(event:MouseEvent):void
			{
				addEventListener(Event.ENTER_FRAME, onEnterFrame);
				tweenCube(0,176);
				trace("menu4 is Click")
				whatButtonIsPressed = 4;
				menu_color1.alpha = 0;
				menu_color2.alpha = 0;
				menu_color3.alpha = 0;
				menu_color4.alpha = 1;
				menu_color5.alpha = 0;
				menu_color6.alpha = 0;
			}
			
			//отслеживаем кнопку5
			function menu5Out():void
			{
				trace("menu5 is OUT")
			}
			
			function menu5Over():void
			{
				Hint.show(TolTip5);
				withDesignerContainer.filters = null;
				designerContainer.filters = null;
				withCompanyContainer.filters = null;
				
					menu_color1.alpha = 0;
					menu_color2.alpha = 0;
					menu_color3.alpha = 0;
					menu_color4.alpha = 0;
					menu_color5.alpha = 1;
					menu_color6.alpha = 0;
				
				trace("menu5 is Over")
			}
			
			
			function menu5Click(event:MouseEvent):void
			{
			    addEventListener(Event.ENTER_FRAME, onEnterFrame);
				tweenCube(0,220);
				trace("menu5 is Click")
				whatButtonIsPressed = 5;
				
				menu_color1.alpha = 0;
				menu_color2.alpha = 0;
				menu_color3.alpha = 0;
				menu_color4.alpha = 0;
				menu_color5.alpha = 1;
				menu_color6.alpha = 0;
			}
			//отслеживаем кнопку6
			function menu6Out():void
			{
				trace("menu6 is OUT")
			}
			
			function menu6Over():void
			{
				Hint.show(TolTip6);
				withDesignerContainer.filters = null;
				designerContainer.filters = null;
				withCompanyContainer.filters = null;
				
				
					menu_color1.alpha = 0;
					menu_color2.alpha = 0;
					menu_color3.alpha = 0;
					menu_color4.alpha = 0;
					menu_color5.alpha = 0;
					menu_color6.alpha = 1;
				
				trace("menu6 is Over")
			}
			
			
			function menu6Click(event:MouseEvent):void
			{
			    addEventListener(Event.ENTER_FRAME, onEnterFrame);
				tweenCube(0,264);
				trace("menu6 is Click")
				whatButtonIsPressed = 6;
				
				menu_color1.alpha = 0;
				menu_color2.alpha = 0;
				menu_color3.alpha = 0;
				menu_color4.alpha = 0;
				menu_color5.alpha = 0;
				menu_color6.alpha = 1;
				
				/*if (!pressMenuButton6)
				{
					
					
					withCompanyContainer.visible = false;
					designerContainer.visible = false;
					withDesignerContainer.visible = false;
					pressMenuButton1 = false;
					pressMenuButton2 = false;
					pressMenuButton3 = false;
					
					
					var cubicXTween:Tween = new Tween(cubicContainer, "x", Regular.easeOut,cubeX, 900, 1, true);
					buttonTween.push(cubicXTween);
					pressMenuButton6 = true;
					var cubicYTween:Tween = new Tween(cubicContainer, "y", Regular.easeIn, cubeY, 100, 1, true)
					buttonTween.push(cubicYTween);
					cubicYTween.addEventListener(TweenEvent.MOTION_FINISH, yUpFinish);
					removeEventListenerMenuButton();
				}
				*/
			}
			
						
			function yUpFinish(event:Event):void
			{
				addEventListenerMenuButton();	
				TextAboutContainer.visible = true;
			}
			
			
			//возвращаем кубик на место
			function backCubic():void
			{
					TextAboutContainer.visible = false;
					var cubicXTween:Tween = new Tween(globalContainer, "x", Regular.easeOut,700, 0, 1, true);
					buttonTween.push(cubicXTween);	
					var cubicYTween:Tween = new Tween(globalContainer, "y", Regular.easeIn, -500, 0, 1, true)
					buttonTween.push(cubicYTween);
					//cubicYTween.addEventListener(TweenEvent.MOTION_FINISH, yDownFinish);
			}
			
			function yDownFinish(event:Event):void
			{
				var cubicXTween:Tween = new Tween(cubicContainer, "x", Regular.easeOut,900, cubeX, 1, true);
				buttonTween.push(cubicXTween);	
			}
			
			
			// вернули на место
			
			//добавляем слушателей на кнопки
			addEventListenerMenuButton();
							
							
			var designerContainer:MovieClip = new MovieClip();
			var withDesignerContainer:MovieClip = new MovieClip();
			var withCompanyContainer:MovieClip = new MovieClip();					
			var TextAbout:TextField;
			var TextAboutContainer:MovieClip = new MovieClip();
			
			
			var Cubicfilter:GlowFilter = new GlowFilter(0x000000, 0.3, 100, 100, 2,3, false, false);
			var maska:Sprite = new Sprite();
			//на кубик вешаем фильтр
			cubicContainer.filters = [Cubicfilter];
			
			designerContainer.visible = false
			withDesignerContainer.visible = false
			withCompanyContainer.visible=false
			
			// создаем текстовый контейнер и делаем его невидимым
			TextAboutContainer.graphics.beginFill(0x121238, 0.3);
			TextAboutContainer.graphics.lineStyle(0.5,0xFFFFFF);
			TextAboutContainer.graphics.drawRect(0, 0, 500, 646);
			TextAboutContainer.graphics.endFill();
			TextAboutContainer.x = 127;
			TextAboutContainer.y = 69;
			TextAboutContainer.visible = false;
			
			
			//создаем маску
							maska.graphics.beginFill(0xFFFFFF, 0.3);
							maska.graphics.lineStyle(0.5,0xFFFFFF);
							maska.graphics.drawRect(13, 10.5, 1000, 746);
							maska.graphics.endFill();
							addChild(maska);
			
			
			//добавляем все в один контейнер
			globalContainer.addChild(cubicContainer);
			globalContainer.addChild(withDesignerContainer);
			globalContainer.addChild(withCompanyContainer);
			globalContainer.addChild(designerContainer);
			globalContainer.mask = maska;
			addChild(globalContainer); 
			
			//loadAll();
			
			function loadAll():void
			{
				
				DesignerDraw(designerContainer); 
				WithDesigner(withDesignerContainer);
				WithCompany(withCompanyContainer);
				HtmlTextLoader(TextAbout, TextAboutContainer);
			}
			
			
				
			
		} // End Public function Main 
		
		
		public function DesignerDraw(container:MovieClip):void
		{
			//==Описание Переменных=======================================================================================
		
			var tweens:Array = []; //храним все твины
			var mySprite:Array = [];//храним спрайты

			var globalScene:MovieClip=new MovieClip(); //содержит все что на сцене

			var Mybackground:MovieClip = new MovieClip();//background
			var frame:MovieClip = new MovieClip();
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
			var distortBmp1:Array = [];//дизайнер1
			var distortBmp2:Array = [];//дизайнер2
			var distortBmp3:Array = [];//дизайнер3
			var distortBmp4:Array = [];//дизайнер4
			var distortContainer:MovieClip = new MovieClip();
			
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
				mySprite[i].pressed = true;
				
			}
		 	
			 //заполняем дисторт битмап массивы
			for (var d:int = 0; d < designer1.count; d++ )
			{
				distortBmp1[d] = new DistortImage(designer1.dThumbImage[d]);	
			}	
			for (d = 0; d < designer2.count; d++ )
			{
				distortBmp2[d] = new DistortImage(designer2.dThumbImage[d]);	
			}
			for (d = 0; d < designer3.count; d++ )
			{
				distortBmp3[d] = new DistortImage(designer3.dThumbImage[d]);	
			}
			for (d = 0; d < designer4.count; d++ )
			{
				distortBmp4[d] = new DistortImage(designer4.dThumbImage[d]);	
			}
			
			//заполняем массив оригинальных координат
			for (i=0; i<xn.length; i++) 
			{
				xOrig[i]=xn[i];
				yOrig[i]=yn[i];
			}

			
			
			//создаем кнопки листалки
			function createPicButton(btn1:Sprite,btn2:Sprite,n1:int,n2:int):void
			{
				btn1.graphics.lineStyle(1, 0xFFFFFF);
				btn1.graphics.beginFill(0xFFFFFF, 0.6);
				btn1.graphics.moveTo(xn[n1], yn[n1]);
				btn1.graphics.lineTo(xn[n1] - 10, yn[n1]);
				btn1.graphics.lineTo(xn[n1+10] - 10, yn[n1+10]);
				btn1.graphics.lineTo(xn[n1+10] , yn[n1+10]);
				btn1.graphics.lineTo(xn[n1] , yn[n1]);
				btn1.buttonMode = true;
				
				btn2.graphics.lineStyle(1, 0xFFFFFF);
				btn2.graphics.beginFill(0xFFFFFF, 0.6);
				btn2.graphics.moveTo(xn[n2], yn[n2]);
				btn2.graphics.lineTo(xn[n2] + 10, yn[n2]);
				btn2.graphics.lineTo(xn[n2+10] + 10, yn[n2+10]);
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
			
			//добавляем слушатели на листалки для первой строки.
			prevbutton1.addEventListener(MouseEvent.MOUSE_DOWN, prevbutton1OnClick);
			nextbutton1.addEventListener(MouseEvent.MOUSE_DOWN, nextbutton1OnClick);
			
			
			function prevbutton1OnClick():void
			{
			  var ytmp:Array = [];
			  var tmp:Array = [];
				
			  if (countD1 > 0)
			  {
				  countD1--;
				  
			  distortBmp1[0].texture = designer1.dThumbImage[0 + countD1];
			  distortBmp1[1].texture = designer1.dThumbImage[1 + countD1];
			  distortBmp1[2].texture = designer1.dThumbImage[2 + countD1];
			  distortBmp1[3].texture = designer1.dThumbImage[3 + countD1];
			  distortBmp1[4].texture = designer1.dThumbImage[4 + countD1];
			  distortBmp1[5].texture = designer1.dThumbImage[5 + countD1];
			  distortBmp1[6].texture = designer1.dThumbImage[6 + countD1];
			  distortBmp1[7].texture = designer1.dThumbImage[7 + countD1];
			   
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
						/*ytmp[0] = yOrig[z]; 
						yOrig[z] = yOrig[z-1];
						yOrig[z] = ytmp[0];
					
						ytmp[1] = yOrig[z+11]; 
						yOrig[z+11] = yOrig[z+10];
						yOrig[z + 10] = ytmp[1];*/
						
					}
			  
			  				  
			  }
				
			  Redriwing();
			  trace(countD1);
			}
				
			
			
			
			
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
						
						/*tmp[0] = xn[z + 2] - xn[z + 1];
						tmp[1] = xn[z + 1] - xn[z];
						
						tmp[2] = xn[z + 12] - xn[z + 11];
						tmp[3] = xn[z + 11] - xn[z+10];
						
						shft[z] = tmp[0] - tmp[1];
						shft[z+10] = tmp[2] - tmp[3];
						
						xn[z] -= shft[z];
						xn[z+10] -= shft[z+10];*/
						//trace(xn[z]);
						
						
						//xtmp[0] = (xn[z + 2] - xn[z + 1])-( xn[z + 1] - xn[z]);
						//trace("xtmp[0]=(", xn[z + 2], "-", xn[z + 1], ")-(", xn[z + 1], "-", xn[z], ")=", xtmp[0]);
						//xn[z] += xtmp[0];//(xn[z + 2] - xn[z + 1])-( xn[z + 1] - xn[z]);
						//trace("xn[", z, "]=", xn[z], "+", xtmp[0]);
						//xn[z + 1] += xtmp[0];
						
						/*xtmp[1] = (xn[z + 12] - xn[z + 11])-( xn[z + 11] - xn[z]);
						xn[z+10] += (xn[z + 12] - xn[z + 11])-( xn[z + 11] - xn[z+10]);
						xn[z + 11] += xtmp[1];*/
						
						//xtmp[0] = xOrig[z];
						//xOrig[z] = xOrig[z + 1];
						//xOrig[z + 1] = xtmp[0];
						
						//trace("xn[", z, "]=",  xn[z]);
						//trace(xtmp[0]);
						//trace("xn[", z+10, "]=",  xn[z+10]);						
						
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
						
						ytmp[0] = yOrig[z]; 
						yOrig[z] = yOrig[z+1];
						yOrig[z + 1] = ytmp[0];
					
						ytmp[1] = yOrig[z+10]; 
						yOrig[z+10] = yOrig[z+11];
						yOrig[z + 11] = ytmp[1];
						
					}
				
				}
				
				
			  distortBmp1[0].texture = designer1.dThumbImage[0 + countD1];
			  distortBmp1[1].texture = designer1.dThumbImage[1 + countD1];
			  distortBmp1[2].texture = designer1.dThumbImage[2 + countD1];
			  distortBmp1[3].texture = designer1.dThumbImage[3 + countD1];
			  distortBmp1[4].texture = designer1.dThumbImage[4 + countD1];
			  distortBmp1[5].texture = designer1.dThumbImage[5 + countD1];
			  distortBmp1[6].texture = designer1.dThumbImage[6 + countD1];
			  distortBmp1[7].texture = designer1.dThumbImage[7 + countD1];
			 
			 				
			  trace("click_tt", countD1);
				Redriwing();
			}
				
				
			
			drawDistortBmp(true);
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
			
			function drawDistortBmp(addchld:Boolean=false):void
			{
			  //дизайнер1
			  
			  
			  distortBmp1[0].setTransform(xn[0], yn[0], xn[1], yn[1], xn[11], yn[11], xn[10], yn[10]);	
			  distortBmp1[1].setTransform(xn[1], yn[1], xn[2], yn[2], xn[12], yn[12], xn[11], yn[11]);	
			  distortBmp1[2].setTransform(xn[2], yn[2], xn[3], yn[3], xn[13], yn[13], xn[12], yn[12]);	
			  distortBmp1[3].setTransform(xn[3], yn[3], xn[4], yn[4], xn[14], yn[14], xn[13], yn[13]);	
			  distortBmp1[4].setTransform(xn[4], yn[4], xn[5], yn[5], xn[15], yn[15], xn[14], yn[14]);	
			  distortBmp1[5].setTransform(xn[5], yn[5], xn[6], yn[6], xn[16], yn[16], xn[15], yn[15]);	
			  distortBmp1[6].setTransform(xn[6], yn[6], xn[7], yn[7], xn[17], yn[17], xn[16], yn[16]);	
			  distortBmp1[7].setTransform(xn[7], yn[7], xn[8], yn[8], xn[18], yn[18], xn[17], yn[17]);	
			  
			  //дизайнер2
			  distortBmp2[0].setTransform(xn[10], yn[10], xn[11], yn[11], xn[21], yn[21], xn[20], yn[20]);
			  distortBmp2[1].setTransform(xn[11], yn[11], xn[12], yn[12], xn[22], yn[22], xn[21], yn[21]);
			  distortBmp2[2].setTransform(xn[12], yn[12], xn[13], yn[13], xn[23], yn[23], xn[22], yn[22]);	
			  distortBmp2[3].setTransform(xn[13], yn[13], xn[14], yn[14], xn[24], yn[24], xn[23], yn[23]);	
			  distortBmp2[4].setTransform(xn[14], yn[14], xn[15], yn[15], xn[25], yn[25], xn[24], yn[24]);	
			  distortBmp2[5].setTransform(xn[15], yn[15], xn[16], yn[16], xn[26], yn[26], xn[25], yn[25]);	
			  distortBmp2[6].setTransform(xn[16], yn[16], xn[17], yn[17], xn[27], yn[27], xn[26], yn[26]);	
			  distortBmp2[7].setTransform(xn[17], yn[17], xn[18], yn[18], xn[28], yn[28], xn[27], yn[27]);	
			  distortBmp2[8].setTransform(xn[18], yn[18], xn[19], yn[19], xn[29], yn[29], xn[28], yn[27]);	
			  
			  //дизайнер3
			  distortBmp3[0].setTransform(xn[20], yn[20], xn[21], yn[21], xn[31], yn[31], xn[30], yn[30]);
			  distortBmp3[1].setTransform(xn[21], yn[21], xn[22], yn[22], xn[32], yn[32], xn[31], yn[31]);
			  distortBmp3[2].setTransform(xn[22], yn[22], xn[23], yn[23], xn[33], yn[33], xn[32], yn[32]);	
			  distortBmp3[3].setTransform(xn[23], yn[23], xn[24], yn[24], xn[34], yn[34], xn[33], yn[33]);	
			  distortBmp3[4].setTransform(xn[24], yn[24], xn[25], yn[25], xn[35], yn[35], xn[34], yn[34]);	
			  distortBmp3[5].setTransform(xn[25], yn[25], xn[26], yn[26], xn[36], yn[36], xn[35], yn[35]);	
			  distortBmp3[6].setTransform(xn[26], yn[26], xn[27], yn[27], xn[37], yn[37], xn[36], yn[36]);	
			  
			  //дизайнер4
			  distortBmp4[0].setTransform(xn[30], yn[30], xn[31], yn[31], xn[41], yn[41], xn[40], yn[40]);
			  distortBmp4[1].setTransform(xn[31], yn[31], xn[32], yn[32], xn[42], yn[42], xn[41], yn[41]);
			  distortBmp4[2].setTransform(xn[32], yn[32], xn[33], yn[33], xn[43], yn[43], xn[42], yn[42]);	
			  distortBmp4[3].setTransform(xn[33], yn[33], xn[34], yn[34], xn[44], yn[44], xn[43], yn[43]);	
			  distortBmp4[4].setTransform(xn[34], yn[34], xn[35], yn[35], xn[45], yn[45], xn[44], yn[44]);	
			  distortBmp4[5].setTransform(xn[35], yn[35], xn[36], yn[36], xn[46], yn[46], xn[45], yn[45]);	
			  distortBmp4[6].setTransform(xn[36], yn[36], xn[37], yn[37], xn[47], yn[47], xn[46], yn[46]);	
			  distortBmp4[7].setTransform(xn[37], yn[37], xn[38], yn[38], xn[48], yn[48], xn[47], yn[47]);	
			  
			  if (addchld)
			  {
				container.addChild(distortBmp1[0]);
				container.addChild(distortBmp1[1]);
				container.addChild(distortBmp1[2]);
				container.addChild(distortBmp1[3]);
				container.addChild(distortBmp1[4]);
				container.addChild(distortBmp1[5]);
				container.addChild(distortBmp1[6]);
				container.addChild(distortBmp1[7]);
				
				container.addChild(distortBmp2[0]);
				container.addChild(distortBmp2[1]);
				container.addChild(distortBmp2[2]);
				container.addChild(distortBmp2[3]);
				container.addChild(distortBmp2[4]);
				container.addChild(distortBmp2[5]);
				container.addChild(distortBmp2[6]);
				container.addChild(distortBmp2[7]);
				container.addChild(distortBmp2[8]);
				
				container.addChild(distortBmp3[0]);
				container.addChild(distortBmp3[1]);
				container.addChild(distortBmp3[2]);
				container.addChild(distortBmp3[3]);
				container.addChild(distortBmp3[4]);
				container.addChild(distortBmp3[5]);
				container.addChild(distortBmp3[6]);
				
				container.addChild(distortBmp4[0]);
				container.addChild(distortBmp4[1]);
				container.addChild(distortBmp4[2]);
				container.addChild(distortBmp4[3]);
				container.addChild(distortBmp4[4]);
				container.addChild(distortBmp4[5]);
				container.addChild(distortBmp4[6]);
				container.addChild(distortBmp4[7]);
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
					    
						addFrame();
					}
					
				}
			
				
			
				function addFrame():void
				{
					
					removeEventListeners();
					//container.filters=null;
					//xc=globalScene.x-mouseX*24-mouseX/300+container.width/2;
					//yc=globalScene.y-mouseY*24-mouseY/300+container.height/2;
			
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
	
	
				/*function scaleUpFinished(e:Event):void 
				{
					//trace("FRAME_X_Y= ",frame.x,frame.y)					
					frame.buttonMode=true;
					frame.addChild(BmpLoader);
					addChild(frame);
										
					//Добавляем обработчики mouse click  
					frame.addEventListener(MouseEvent.CLICK, mouseClickFrame); 
				}*/
	
				function mouseClickFrame(e:MouseEvent):void 
				{
					
					//trace("Bmpurl= ",BmpUrl[currentBmp]);
					removeChild(frame);
					frame.removeChild(BmpLoader);
					/*container.filters =null;
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
					tweenXc.addEventListener(TweenEvent.MOTION_FINISH, scaleDownFinished);*/
					addEventListeners();
					clickON=false;
					Redriwing();
				}
				/*function scaleDownFinished(e:Event):void 
				{
					addEventListeners();
					clickON=false;
					Redriwing();
				}*/
				
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
					button.alpha = 0;
					
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
						//button.pressed = false;
						BmpLoader = new RootClass;
						color_cube[button.value] = onClick_color;
						clicks[button.value] = button.value;
						changeOrigCoord(0, 0, 0, 0);
						Redriwing();
						
						if (button==mySprite[0])
						{
														
							BmpLoader.loadadres(designer1.dFullImage[0+countD1]); 
						} 
						else if (button == mySprite[1]) 
						{
							
							BmpLoader.loadadres(designer1.dFullImage[1+countD1]); 
						} 
						else if (button == mySprite[2]) 
						{
							
							BmpLoader.loadadres(designer1.dFullImage[2+countD1]); 
						} 
						else if (button == mySprite[3]) 
						{
							
							BmpLoader.loadadres(designer1.dFullImage[3+countD1]); 
						} 
						else if (button == mySprite[4]) 
						{
							
							BmpLoader.loadadres(designer1.dFullImage[4+countD1]); 
						} 
						else if (button == mySprite[5]) 
						{
							
							BmpLoader.loadadres(designer1.dFullImage[5+countD1]); 
						} 
						else if (button == mySprite[6]) 
						{
							
							BmpLoader.loadadres(designer1.dFullImage[6+countD1]); 
						}
						else if (button == mySprite[7]) 
						{
							
							BmpLoader.loadadres(designer1.dFullImage[7+countD1]); 
						} 
						else if (button == mySprite[8]) 
						{
							
							BmpLoader.loadadres(designer1.dFullImage[8+countD1]); 
						} 
						else if (button == mySprite[9]) 
						{
							
							BmpLoader.loadadres(designer2.dFullImage[0+countD2]); 
						} 
						else if (button == mySprite[10]) 
						{
							
							BmpLoader.loadadres(designer2.dFullImage[1+countD2]); 
						}
						else if (button == mySprite[11]) 
						{
							
							BmpLoader.loadadres(designer2.dFullImage[2+countD2]); 
						}
						else if (button == mySprite[12]) 
						{
							
							BmpLoader.loadadres(designer2.dFullImage[3+countD2]); 
						}
						else if (button == mySprite[13]) 
						{
							
							BmpLoader.loadadres(designer2.dFullImage[4+countD2]); 
						}
						else if (button == mySprite[14]) 
						{
							
							BmpLoader.loadadres(designer2.dFullImage[5]); 
						}
						else if (button == mySprite[15]) 
						{
							
							BmpLoader.loadadres(designer2.dFullImage[6+countD2]); 
						}
						else if (button == mySprite[16]) 
						{
							
							BmpLoader.loadadres(designer2.dFullImage[7+countD2]); 
						}
						else if (button == mySprite[17]) 
						{
							
							BmpLoader.loadadres(designer2.dFullImage[8+countD2]); 
						}
						else if (button == mySprite[18]) 
						{
							
							BmpLoader.loadadres(designer3.dFullImage[0+countD3]); 
						}
						else if (button == mySprite[19]) 
						{
							
							BmpLoader.loadadres(designer3.dFullImage[1+countD3]); 
						}
						else if (button == mySprite[20]) 
						{
							
							BmpLoader.loadadres(designer3.dFullImage[2+countD3]); 
						}
						else if (button == mySprite[21]) 
						{
							
							BmpLoader.loadadres(designer3.dFullImage[3+countD3]); 
						}
						else if (button == mySprite[22]) 
						{
							
							BmpLoader.loadadres(designer3.dFullImage[4+countD3]); 
						}
						else if (button == mySprite[23]) 
						{
							
							BmpLoader.loadadres(designer3.dFullImage[5+countD3]); 
						}
						else if (button == mySprite[24]) 
						{
							
							BmpLoader.loadadres(designer3.dFullImage[6+countD3]); 
						}
						else if (button == mySprite[25]) 
						{
							
							BmpLoader.loadadres(designer3.dFullImage[7+countD3]); 
						}
	
						else if (button == mySprite[26]) 
						{
							
							BmpLoader.loadadres(designer3.dFullImage[8+countD3]); 
						}
						else if (button == mySprite[27]) 
						{
							
							BmpLoader.loadadres(designer4.dFullImage[0+countD4]); 
						}
						else if (button == mySprite[28]) 
						{
							
							BmpLoader.loadadres(designer4.dFullImage[1+countD4]); 
						}
						else if (button == mySprite[29]) 
						{
							
							BmpLoader.loadadres(designer4.dFullImage[2+countD4]); 
						}
						else if (button == mySprite[30]) 
						{
							
							BmpLoader.loadadres(designer4.dFullImage[3+countD4]); 
						}
						else if (button == mySprite[31]) 
						{
							
							BmpLoader.loadadres(designer4.dFullImage[4+countD4]); 
						}
						else if (button == mySprite[32]) 
						{
							BmpLoader.loadadres(designer4.dFullImage[5+countD4]); 
						}
						else if (button == mySprite[33]) 
						{
							BmpLoader.loadadres(designer4.dFullImage[6+countD4]); 
						}
						else if (button == mySprite[34]) 
						{
							BmpLoader.loadadres(designer4.dFullImage[7+countD4]); 
						}
						else if (button == mySprite[35]) 
						{
							BmpLoader.loadadres(designer4.dFullImage[8+countD4]); 
						}
						else if (button == mySprite[36]) 
						{
							BmpLoader.loadadres(designer4.dFullImage[9+countD4]); 
						}
					} // End function mouseClickHandler

						//функция перерисовки
						function Redriwing():void
						{
							ClearingAll();
							DriwingCurve(); 
							drawDistortBmp();
							createBtns();
						}
				
									
			
			
			}//End public function DesignerDraw 
		
//=======================================================================================================================================================================================================================================================				
		
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
			var feel_color:uint = 0x000000; //цвет заливки
			var outMouse_color:uint = 0xFFFF0D; // цвет при наведении
			var onClick_color:uint = 0xFF0000; // цвет при нажатии
			var lineStyle:Number = 1; //толщина линии
			var lineColor:uint=0xFFFFFF; //цвет линии
			
			var distortBmp1:Array = [];//дизайнер1
			var distortBmp2:Array = [];//дизайнер2
			
			
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
			
			//заполняем дисторт битмап массивы
			for (var d:int = 0; d < teamwork1.count; d++ )
			{
				distortBmp1[d] = new DistortImage(teamwork1.dThumbImage[d]);	
			}	
			for (d = 0; d < teamwork2.count; d++ )
			{
				distortBmp2[d] = new DistortImage(teamwork2.dThumbImage[d]);	
			}
			
			
		 	//заполняем массив оригинальных координат
			for (i=0; i<xn.length; i++) 
			{
				xOrig[i]=xn[i];
				yOrig[i]=yn[i];
			}

			
			/*myXMLLoader.load(new URLRequest("gallery.xml"));
			myXMLLoader.addEventListener(Event.COMPLETE, processXML);
			

			function waitLoad(txt:String):void
			{
				//var circle_pb:preload_circle = new preload_circle;
				widget = new TextField();
				widget.text = "Loading please wait... "+txt+"%" ;
				widget.setTextFormat(new TextFormat("Courier New", 14, 0xB4DCF3, false, false, false));
				widget.width = widget.textWidth;
				widget.visible = false;
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
					
				}
				
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
					
			}*/
			
			drawDistortBmp(true);	
			addEventListeners();
			DriwingCurve();
			
			  
			
			function drawDistortBmp(addchld:Boolean=false):void
			{
			  //дизайнер1
			  distortBmp1[0].setTransform(xn[0], yn[0], xn[1], yn[1], xn[11], yn[11], xn[10], yn[10]);	
			  distortBmp1[1].setTransform(xn[1], yn[1], xn[2], yn[2], xn[12], yn[12], xn[11], yn[11]);	
			  distortBmp1[2].setTransform(xn[2], yn[2], xn[3], yn[3], xn[13], yn[13], xn[12], yn[12]);	
			  distortBmp1[3].setTransform(xn[3], yn[3], xn[4], yn[4], xn[14], yn[14], xn[13], yn[13]);	
			  distortBmp1[4].setTransform(xn[4], yn[4], xn[5], yn[5], xn[15], yn[15], xn[14], yn[14]);	
			  distortBmp1[5].setTransform(xn[5], yn[5], xn[6], yn[6], xn[16], yn[16], xn[15], yn[15]);	
			  distortBmp1[6].setTransform(xn[6], yn[6], xn[7], yn[7], xn[17], yn[17], xn[16], yn[16]);	
			  distortBmp1[7].setTransform(xn[7], yn[7], xn[8], yn[8], xn[18], yn[18], xn[17], yn[17]);	
			  distortBmp1[8].setTransform(xn[8], yn[8], xn[9], yn[9], xn[19], yn[19], xn[18], yn[18]);	
			  //дизайнер2
			  distortBmp2[0].setTransform(xn[10], yn[10], xn[11], yn[11], xn[21], yn[21], xn[20], yn[20]);
			  distortBmp2[1].setTransform(xn[11], yn[11], xn[12], yn[12], xn[22], yn[22], xn[21], yn[21]);
			  distortBmp2[2].setTransform(xn[12], yn[12], xn[13], yn[13], xn[23], yn[23], xn[22], yn[22]);	
			  distortBmp2[3].setTransform(xn[13], yn[13], xn[14], yn[14], xn[24], yn[24], xn[23], yn[23]);	
			  distortBmp2[4].setTransform(xn[14], yn[14], xn[15], yn[15], xn[25], yn[25], xn[24], yn[24]);	
			  distortBmp2[5].setTransform(xn[15], yn[15], xn[16], yn[16], xn[26], yn[26], xn[25], yn[25]);	
			  distortBmp2[6].setTransform(xn[16], yn[16], xn[17], yn[17], xn[27], yn[27], xn[26], yn[26]);	
			  distortBmp2[7].setTransform(xn[17], yn[17], xn[18], yn[18], xn[28], yn[28], xn[27], yn[27]);	
			  
			 		 			  
			  if (addchld)
			  {
				container.addChild(distortBmp1[0]);
				container.addChild(distortBmp1[1]);
				container.addChild(distortBmp1[2]);
				container.addChild(distortBmp1[3]);
				container.addChild(distortBmp1[4]);
				container.addChild(distortBmp1[5]);
				container.addChild(distortBmp1[6]);
				container.addChild(distortBmp1[7]);
				container.addChild(distortBmp1[8]);
				
				container.addChild(distortBmp2[0]);
				container.addChild(distortBmp2[1]);
				container.addChild(distortBmp2[2]);
				container.addChild(distortBmp2[3]);
				container.addChild(distortBmp2[4]);
				container.addChild(distortBmp2[5]);
				container.addChild(distortBmp2[6]);
				container.addChild(distortBmp2[7]);
				
				
			  }
			 
			}
			
			
			
			
			// рисуем основной объект
			function DriwingCurve():void 
			{   
				//Первый ряд
				linears(mySprite[0],xn[0],yn[0],xn[1],yn[1],xn[10],yn[10],xn[11],yn[11],teamwork1.dThumbImage[0],Mymatrix,color_cube[0],cubeAlpha[0],lineStyle,lineColor);
				linears(mySprite[1],xn[1],yn[1],xn[2],yn[2],xn[11],yn[11],xn[12],yn[12],teamwork1.dThumbImage[1],Mymatrix,color_cube[1],cubeAlpha[1],lineStyle,lineColor);
			 	linears(mySprite[2],xn[2],yn[2],xn[3],yn[3],xn[12],yn[12],xn[13],yn[13],teamwork1.dThumbImage[2],Mymatrix,color_cube[2],cubeAlpha[2],lineStyle,lineColor);
				linears(mySprite[3],xn[3],yn[3],xn[4],yn[4],xn[13],yn[13],xn[14],yn[14],teamwork1.dThumbImage[3],Mymatrix,color_cube[3],cubeAlpha[3],lineStyle,lineColor);
				linears(mySprite[4],xn[4],yn[4],xn[5],yn[5],xn[14],yn[14],xn[15],yn[15],teamwork1.dThumbImage[4],Mymatrix,color_cube[4],cubeAlpha[4],lineStyle,lineColor);
				linears(mySprite[5],xn[5],yn[5],xn[6],yn[6],xn[15],yn[15],xn[16],yn[16],teamwork1.dThumbImage[5],Mymatrix,color_cube[5],cubeAlpha[5],lineStyle,lineColor);
				linears(mySprite[6],xn[6],yn[6],xn[7],yn[7],xn[16],yn[16],xn[17],yn[17],teamwork1.dThumbImage[6],Mymatrix,color_cube[6],cubeAlpha[6],lineStyle,lineColor);
				linears(mySprite[7],xn[7],yn[7],xn[8],yn[8],xn[17],yn[17],xn[18],yn[18],teamwork1.dThumbImage[7],Mymatrix,color_cube[7],cubeAlpha[7],lineStyle,lineColor);
				linears(mySprite[8],xn[8],yn[8],xn[9],yn[9],xn[18],yn[18],xn[19],yn[19],teamwork1.dThumbImage[8],Mymatrix,color_cube[8],cubeAlpha[8],lineStyle,lineColor);
				//Второй ряд
				linears(mySprite[9],xn[10],yn[10],xn[11],yn[11],xn[20],yn[20],xn[21],yn[21],teamwork2.dThumbImage[0],Mymatrix,color_cube[9],cubeAlpha[9],lineStyle,lineColor);
				linears(mySprite[10],xn[11],yn[11],xn[12],yn[12],xn[21],yn[21],xn[22],yn[22],teamwork2.dThumbImage[1],Mymatrix,color_cube[10],cubeAlpha[10],lineStyle,lineColor);
				linears(mySprite[11],xn[12],yn[12],xn[13],yn[13],xn[22],yn[22],xn[23],yn[23],teamwork2.dThumbImage[2],Mymatrix,color_cube[11],cubeAlpha[11],lineStyle,lineColor);
				linears(mySprite[12],xn[13],yn[13],xn[14],yn[14],xn[23],yn[23],xn[24],yn[24],teamwork2.dThumbImage[3],Mymatrix,color_cube[12],cubeAlpha[12],lineStyle,lineColor);
				linears(mySprite[13],xn[14],yn[14],xn[15],yn[15],xn[24],yn[24],xn[25],yn[25],teamwork2.dThumbImage[4],Mymatrix,color_cube[13],cubeAlpha[13],lineStyle,lineColor);
				linears(mySprite[14],xn[15],yn[15],xn[16],yn[16],xn[25],yn[25],xn[26],yn[26],teamwork2.dThumbImage[5],Mymatrix,color_cube[14],cubeAlpha[14],lineStyle,lineColor);
				linears(mySprite[15],xn[16],yn[16],xn[17],yn[17],xn[26],yn[26],xn[27],yn[27],teamwork2.dThumbImage[6],Mymatrix,color_cube[15],cubeAlpha[15],lineStyle,lineColor);
				linears(mySprite[16],xn[17],yn[17],xn[18],yn[18],xn[27],yn[27],xn[28],yn[28],teamwork2.dThumbImage[7],Mymatrix,color_cube[16],cubeAlpha[16],lineStyle,lineColor);
				//linears(mySprite[17],xn[18],yn[18],xn[19],yn[19],xn[28],yn[28],xn[29],yn[29],ArrBitmap[17],Mymatrix,color_cube[17],cubeAlpha[17],lineStyle,lineColor);
				
								
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
					    
						addFrame();
					}
					
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
	
	
				/*function scaleUpFinished(e:Event):void 
				{
					//trace("FRAME_X_Y= ",frame.x,frame.y)					
					frame.buttonMode=true;
					frame.addChild(BmpLoader);
					addChild(frame);
										
					//Добавляем обработчики mouse click  
					frame.addEventListener(MouseEvent.CLICK, mouseClickFrame); 
				}*/
	
				function mouseClickFrame(e:MouseEvent):void 
				{
					
					//trace("Bmpurl= ",BmpUrl[currentBmp]);
					removeChild(frame);
					frame.removeChild(BmpLoader);
					container.filters =null;
					/*var tweenX:Tween = new Tween(globalScene, "scaleX", Regular.easeOut,25, 1, 1, true);
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
					tweenXc.addEventListener(TweenEvent.MOTION_FINISH, scaleDownFinished);*/
					
					addEventListeners();
					clickON=false;
					Redriwing();
					
				}
				/*function scaleDownFinished(e:Event):void 
				{
					addEventListeners();
					clickON=false;
					Redriwing();
				}*/
				
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
						color_cube[button.value] = onClick_color;
						clicks[button.value] = button.value;
						changeOrigCoord(0, 0, 0, 0);
						Redriwing();
						
						if (button==mySprite[0])
						{
														
							BmpLoader.loadadres(teamwork1.dFullImage[0]); 
						} 
						else if (button == mySprite[1]) 
						{
							
							BmpLoader.loadadres(teamwork1.dFullImage[1]); 
						} 
						else if (button == mySprite[2]) 
						{
							
							BmpLoader.loadadres(teamwork1.dFullImage[2]); 
						} 
						else if (button == mySprite[3]) 
						{
							
							BmpLoader.loadadres(teamwork1.dFullImage[3]); 
						} 
						else if (button == mySprite[4]) 
						{
							
							BmpLoader.loadadres(teamwork1.dFullImage[4]); 
						} 
						else if (button == mySprite[5]) 
						{
							
							BmpLoader.loadadres(teamwork1.dFullImage[5]); 
						} 
						else if (button == mySprite[6]) 
						{
							
							BmpLoader.loadadres(teamwork1.dFullImage[6]); 
						}
						else if (button == mySprite[7]) 
						{
							
							BmpLoader.loadadres(teamwork1.dFullImage[7]); 
						} 
						else if (button == mySprite[8]) 
						{
							
							BmpLoader.loadadres(teamwork1.dFullImage[8]); 
						} 
						else if (button == mySprite[9]) 
						{
							
							BmpLoader.loadadres(teamwork2.dFullImage[0]); 
						} 
						else if (button == mySprite[10]) 
						{
							
							BmpLoader.loadadres(teamwork2.dFullImage[1]); 
						}
						else if (button == mySprite[11]) 
						{
							
							BmpLoader.loadadres(teamwork2.dFullImage[2]); 
						}
						else if (button == mySprite[12]) 
						{
							
							BmpLoader.loadadres(teamwork2.dFullImage[3]); 
						}
						else if (button == mySprite[13]) 
						{
							
							BmpLoader.loadadres(teamwork2.dFullImage[4]); 
						}
						else if (button == mySprite[14]) 
						{
							
							BmpLoader.loadadres(teamwork2.dFullImage[5]); 
						}
						else if (button == mySprite[15]) 
						{
							
							BmpLoader.loadadres(teamwork2.dFullImage[6]); 
						}
						else if (button == mySprite[16]) 
						{
							
							BmpLoader.loadadres(teamwork2.dFullImage[7]); 
						}
						else if (button == mySprite[17]) 
						{
							
							BmpLoader.loadadres(teamwork2.dFullImage[8]); 
						}
						
						
						
						
					} // End function mouseClickHandler

						//функция перерисовки
						function Redriwing():void
						{
							ClearingAll();
							DriwingCurve(); 
							drawDistortBmp();	
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
			var feel_color:uint = 0x000000; //цвет заливки
			var outMouse_color:uint = 0xFFFF0D; // цвет при наведении
			var onClick_color:uint = 0xFF0000; // цвет при нажатии
			var lineStyle:Number = 1; //толщина линии
			var lineColor:uint=0xFFFFFF; //цвет линии
			
			var distortBmp1:Array = [];//дизайнер1
			var distortBmp2:Array = [];//дизайнер2

			
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
		 	
			//заполняем дисторт битмап массивы
			for (var d:int = 0; d < cooperation1.count; d++ )
			{
				distortBmp1[d] = new DistortImage(cooperation1.dThumbImage[d]);	
			}	
			for (d = 0; d < cooperation2.count; d++ )
			{
				distortBmp2[d] = new DistortImage(cooperation2.dThumbImage[d]);	
			}
			
			
			//заполняем массив оригинальных координат
			for (i=0; i<xn.length; i++) 
			{
				xOrig[i]=xn[i];
				yOrig[i]=yn[i];
			}

			
			/*myXMLLoader.load(new URLRequest("gallery.xml"));
			myXMLLoader.addEventListener(Event.COMPLETE, processXML);
			

			function waitLoad(txt:String):void
			{
				//var circle_pb:preload_circle = new preload_circle;
				widget = new TextField();
				widget.text = "Loading please wait... "+txt+"%" ;
				widget.setTextFormat(new TextFormat("Courier New", 14, 0xB4DCF3, false, false, false));
				widget.width = widget.textWidth;
				widget.visible = false;
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
				
				}
				
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
					
			}*/
				drawDistortBmp(true);
				addEventListeners();
				DriwingCurve();
			
			 
				function drawDistortBmp(addchld:Boolean=false):void
			{
			  //дизайнер1
			  distortBmp1[0].setTransform(xn[0], yn[0], xn[1], yn[1], xn[11], yn[11], xn[10], yn[10]);	
			  distortBmp1[1].setTransform(xn[1], yn[1], xn[2], yn[2], xn[12], yn[12], xn[11], yn[11]);	
			  distortBmp1[2].setTransform(xn[2], yn[2], xn[3], yn[3], xn[13], yn[13], xn[12], yn[12]);	
			  distortBmp1[3].setTransform(xn[3], yn[3], xn[4], yn[4], xn[14], yn[14], xn[13], yn[13]);	
			  distortBmp1[4].setTransform(xn[4], yn[4], xn[5], yn[5], xn[15], yn[15], xn[14], yn[14]);	
			  distortBmp1[5].setTransform(xn[5], yn[5], xn[6], yn[6], xn[16], yn[16], xn[15], yn[15]);	
			  distortBmp1[6].setTransform(xn[6], yn[6], xn[7], yn[7], xn[17], yn[17], xn[16], yn[16]);	
			  	
			  
			  //дизайнер2
			  distortBmp2[0].setTransform(xn[10], yn[10], xn[11], yn[11], xn[21], yn[21], xn[20], yn[20]);
			  distortBmp2[1].setTransform(xn[11], yn[11], xn[12], yn[12], xn[22], yn[22], xn[21], yn[21]);
			  distortBmp2[2].setTransform(xn[12], yn[12], xn[13], yn[13], xn[23], yn[23], xn[22], yn[22]);	
			  distortBmp2[3].setTransform(xn[13], yn[13], xn[14], yn[14], xn[24], yn[24], xn[23], yn[23]);	
			  distortBmp2[4].setTransform(xn[14], yn[14], xn[15], yn[15], xn[25], yn[25], xn[24], yn[24]);	
			  distortBmp2[5].setTransform(xn[15], yn[15], xn[16], yn[16], xn[26], yn[26], xn[25], yn[25]);	
			  distortBmp2[6].setTransform(xn[16], yn[16], xn[17], yn[17], xn[27], yn[27], xn[26], yn[26]);	
			  distortBmp2[7].setTransform(xn[17], yn[17], xn[18], yn[18], xn[28], yn[28], xn[27], yn[27]);	
			  distortBmp2[8].setTransform(xn[18], yn[18], xn[19], yn[19], xn[29], yn[29], xn[28], yn[27]);	
 
			  
			  if (addchld)
			  {
				container.addChild(distortBmp1[0]);
				container.addChild(distortBmp1[1]);
				container.addChild(distortBmp1[2]);
				container.addChild(distortBmp1[3]);
				container.addChild(distortBmp1[4]);
				container.addChild(distortBmp1[5]);
				container.addChild(distortBmp1[6]);
				
				
				container.addChild(distortBmp2[0]);
				container.addChild(distortBmp2[1]);
				container.addChild(distortBmp2[2]);
				container.addChild(distortBmp2[3]);
				container.addChild(distortBmp2[4]);
				container.addChild(distortBmp2[5]);
				container.addChild(distortBmp2[6]);
				container.addChild(distortBmp2[7]);
				
			  }
			 
			}
				
				
				// рисуем основной объект
			function DriwingCurve():void 
			{   
				//Первый ряд
				linears(mySprite[0],xn[0],yn[0],xn[1],yn[1],xn[10],yn[10],xn[11],yn[11],cooperation1.dThumbImage[0],Mymatrix,color_cube[0],cubeAlpha[0],lineStyle,lineColor);
				linears(mySprite[1],xn[1],yn[1],xn[2],yn[2],xn[11],yn[11],xn[12],yn[12],cooperation1.dThumbImage[1],Mymatrix,color_cube[1],cubeAlpha[1],lineStyle,lineColor);
			 	linears(mySprite[2],xn[2],yn[2],xn[3],yn[3],xn[12],yn[12],xn[13],yn[13],cooperation1.dThumbImage[2],Mymatrix,color_cube[2],cubeAlpha[2],lineStyle,lineColor);
				linears(mySprite[3],xn[3],yn[3],xn[4],yn[4],xn[13],yn[13],xn[14],yn[14],cooperation1.dThumbImage[3],Mymatrix,color_cube[3],cubeAlpha[3],lineStyle,lineColor);
				linears(mySprite[4],xn[4],yn[4],xn[5],yn[5],xn[14],yn[14],xn[15],yn[15],cooperation1.dThumbImage[4],Mymatrix,color_cube[4],cubeAlpha[4],lineStyle,lineColor);
				linears(mySprite[5],xn[5],yn[5],xn[6],yn[6],xn[15],yn[15],xn[16],yn[16],cooperation1.dThumbImage[5],Mymatrix,color_cube[5],cubeAlpha[5],lineStyle,lineColor);
				linears(mySprite[6],xn[6],yn[6],xn[7],yn[7],xn[16],yn[16],xn[17],yn[17],cooperation1.dThumbImage[6],Mymatrix,color_cube[6],cubeAlpha[6],lineStyle,lineColor);
				//linears(mySprite[7],xn[7],yn[7],xn[8],yn[8],xn[17],yn[17],xn[18],yn[18],ArrBitmap[7],Mymatrix,color_cube[7],cubeAlpha[7],lineStyle,lineColor);
				//linears(mySprite[8],xn[8],yn[8],xn[9],yn[9],xn[18],yn[18],xn[19],yn[19],ArrBitmap[8],Mymatrix,color_cube[8],cubeAlpha[8],lineStyle,lineColor);
				//Второй ряд
				linears(mySprite[9],xn[10],yn[10],xn[11],yn[11],xn[20],yn[20],xn[21],yn[21],cooperation2.dThumbImage[0],Mymatrix,color_cube[9],cubeAlpha[9],lineStyle,lineColor);
				linears(mySprite[10],xn[11],yn[11],xn[12],yn[12],xn[21],yn[21],xn[22],yn[22],cooperation2.dThumbImage[1],Mymatrix,color_cube[10],cubeAlpha[10],lineStyle,lineColor);
				linears(mySprite[11],xn[12],yn[12],xn[13],yn[13],xn[22],yn[22],xn[23],yn[23],cooperation2.dThumbImage[2],Mymatrix,color_cube[11],cubeAlpha[11],lineStyle,lineColor);
				linears(mySprite[12],xn[13],yn[13],xn[14],yn[14],xn[23],yn[23],xn[24],yn[24],cooperation2.dThumbImage[3],Mymatrix,color_cube[12],cubeAlpha[12],lineStyle,lineColor);
				linears(mySprite[13],xn[14],yn[14],xn[15],yn[15],xn[24],yn[24],xn[25],yn[25],cooperation2.dThumbImage[4],Mymatrix,color_cube[13],cubeAlpha[13],lineStyle,lineColor);
				linears(mySprite[14],xn[15],yn[15],xn[16],yn[16],xn[25],yn[25],xn[26],yn[26],cooperation2.dThumbImage[5],Mymatrix,color_cube[14],cubeAlpha[14],lineStyle,lineColor);
				linears(mySprite[15],xn[16],yn[16],xn[17],yn[17],xn[26],yn[26],xn[27],yn[27],cooperation2.dThumbImage[6],Mymatrix,color_cube[15],cubeAlpha[15],lineStyle,lineColor);
				linears(mySprite[16],xn[17],yn[17],xn[18],yn[18],xn[27],yn[27],xn[28],yn[28],cooperation2.dThumbImage[7],Mymatrix,color_cube[16],cubeAlpha[16],lineStyle,lineColor);
				//linears(mySprite[17],xn[18],yn[18],xn[19],yn[19],xn[28],yn[28],xn[29],yn[29],ArrBitmap[17],Mymatrix,color_cube[17],cubeAlpha[17],lineStyle,lineColor);
				
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
					    
						addFrame();
					}
					
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
	
	
				/*function scaleUpFinished(e:Event):void 
				{
					//trace("FRAME_X_Y= ",frame.x,frame.y)					
					frame.buttonMode=true;
					frame.addChild(BmpLoader);
					addChild(frame);
										
					//Добавляем обработчики mouse click  
					frame.addEventListener(MouseEvent.CLICK, mouseClickFrame); 
				}*/
				
				function mouseClickFrame(e:MouseEvent):void 
				{
					
					//trace("Bmpurl= ",BmpUrl[currentBmp]);
					removeChild(frame);
					frame.removeChild(BmpLoader);
					container.filters =null;
					/*var tweenX:Tween = new Tween(globalScene, "scaleX", Regular.easeOut,25, 1, 1, true);
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
					tweenXc.addEventListener(TweenEvent.MOTION_FINISH, scaleDownFinished);*/
					addEventListeners();
					clickON=false;
					Redriwing();
				}
				/*function scaleDownFinished(e:Event):void 
				{
					addEventListeners();
					clickON=false;
					Redriwing();
				}*/
				
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
						color_cube[button.value] = onClick_color;
						clicks[button.value] = button.value;
						changeOrigCoord(0, 0, 0, 0);
						Redriwing();
						if (button==mySprite[0])
						{
														
							BmpLoader.loadadres(cooperation1.dFullImage[0]); 
						} 
						else if (button == mySprite[1]) 
						{
							
							BmpLoader.loadadres(cooperation1.dFullImage[1]); 
						} 
						else if (button == mySprite[2]) 
						{
							
							BmpLoader.loadadres(cooperation1.dFullImage[2]); 
						} 
						else if (button == mySprite[3]) 
						{
							
							BmpLoader.loadadres(cooperation1.dFullImage[3]); 
						} 
						else if (button == mySprite[4]) 
						{
							
							BmpLoader.loadadres(cooperation1.dFullImage[4]); 
						} 
						else if (button == mySprite[5]) 
						{
							
							BmpLoader.loadadres(cooperation1.dFullImage[5]); 
						} 
						else if (button == mySprite[6]) 
						{
							
							BmpLoader.loadadres(cooperation1.dFullImage[6]); 
						}
						else if (button == mySprite[7]) 
						{
							
							BmpLoader.loadadres(cooperation1.dFullImage[7]); 
						} 
						else if (button == mySprite[8]) 
						{
							
							BmpLoader.loadadres(cooperation1.dFullImage[8]); 
						} 
						else if (button == mySprite[9]) 
						{
							
							BmpLoader.loadadres(cooperation2.dFullImage[0]); 
						} 
						else if (button == mySprite[10]) 
						{
							
							BmpLoader.loadadres(cooperation2.dFullImage[1]); 
						}
						else if (button == mySprite[11]) 
						{
							
							BmpLoader.loadadres(cooperation2.dFullImage[2]); 
						}
						else if (button == mySprite[12]) 
						{
							
							BmpLoader.loadadres(cooperation2.dFullImage[3]); 
						}
						else if (button == mySprite[13]) 
						{
							
							BmpLoader.loadadres(cooperation2.dFullImage[4]); 
						}
						else if (button == mySprite[14]) 
						{
							
							BmpLoader.loadadres(cooperation2.dFullImage[5]); 
						}
						else if (button == mySprite[15]) 
						{
							
							BmpLoader.loadadres(cooperation2.dFullImage[6]); 
						}
						else if (button == mySprite[16]) 
						{
							
							BmpLoader.loadadres(cooperation2.dFullImage[7]); 
						}
						else if (button == mySprite[17]) 
						{
							
							BmpLoader.loadadres(cooperation2.dFullImage[8]); 
						}
						
						
					} // End function mouseClickHandler

						//функция перерисовки
						function Redriwing():void
						{
							ClearingAll();
							DriwingCurve();
							drawDistortBmp();
						}
				
									
			
			
			}//End public function WithCompany
			
			
			// public function для загрузки HTM текста
			public function HtmlTextLoader(_output:TextField,TxtContainer:MovieClip):void
			{
				// var _output:TextField;
				
					initializeOutput();
					loadData();
					
					
	
				function initializeOutput():void
				{
					_output = new TextField();
					_output.width = TxtContainer.width
					_output.height = TxtContainer.height
					TxtContainer.addChild(_output);
					addChild(TxtContainer);
				}
				function loadData():void
				{
					var loader:URLLoader = new URLLoader();
					loader.dataFormat = URLLoaderDataFormat.TEXT;
					loader.addEventListener(Event.COMPLETE, handleComplete);
					loader.load(new URLRequest("cuba.html"));
				}
				function handleComplete(event:Event):void
				{
					var loader:URLLoader = URLLoader(event.target);
					//_output.x = 400;
					//_output.y = 100;
					_output.htmlText = loader.data;
				}
			} // end of public function HtmlTextLoader
			
   } //End Public Class Main
	
   } //End Package