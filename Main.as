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
import RootClass;//класс для загрузки картинок
import Hint;
import silin.utils.Alert;
import silin.utils.Preloader;
import flash.system.Security;
import flash.system.LoaderContext;
import Designers;
import CubeXML;
import ConfigXML;
import flash.geom.Rectangle;
import HtmlTxtLoader;
import com.greensock.*;
import com.greensock.easing.*;
import FiltersXml;

	/**
	 * ...
	 * @author ziplex
	 */
	public class Main extends Sprite 
	{
		/**
		 * цвет обводки для всех линий портянок
		 */
		public var LINECOLOR:uint;
		/**
		 * цвет заливки для портянки1 
		 */
		public var FILLCOLOR1:uint;
		/**
		 * цвет заливки для портянки2 
		 */
		public var FILLCOLOR2:uint;
		/**
		 * цвет заливки для портянки3 
		 */
		public var FILLCOLOR3:uint;
		/**
		 * цвет тени для всех объектов
		 */
		public var SHADOWCOLOR:uint;
		/**
		 * Цвет наложения прозрачности для портянки1
		 */
		public var PLATOLIGHT1:uint;
		/**
		 * Цвет наложения прозрачности для портянки2
		 */
		public var PLATOLIGHT2:uint;
		/**
		 * Цвет наложения прозрачности для портянки3
		 */
		public var PLATOLIGHT3:uint;
		/**
		 * цвет кнопок листалок
		 */
		public var NAVIGATIONBUTTONCOLOR:uint;
		/**
		 * линия обводки для дизайнеров
		 */
		public var StrokeLineDesigners:uint;
		/**
		 * линия обводки для совместных работ
		 */
		public var StrokeLineTeamWork:uint;
		/**
		 * линия обводки для сотрудничества с другими
		 */
		public var StrokeLineCooperation:uint;
		/**
		 * подсказка для кнопки назад
		 */
		public var PrevToolTip:Sprite = new Sprite();
		/**
		 * подсказка для кнопки вперед
		 */
		public var NextToolTip:Sprite = new Sprite();
		/**
		 * подсказка для кнопки отправки сообщения
		 */
		public var SendMessageToolTip:Sprite = new Sprite();
		
		// переменные для дизайнеров
		public var designer1:Designers = new Designers();
		public var designer2:Designers = new Designers();
		public var designer3:Designers = new Designers();
		public var designer4:Designers = new Designers();
		
		public var distortDesigner1:Array = [];//массив дисторшенов дизайнер1
		public var distortDesigner2:Array = [];//массив дисторшенов дизайнер2
		public var distortDesigner3:Array = [];//массив дисторшенов дизайнер3
		public var distortDesigner4:Array = [];//массив дисторшенов дизайнер4
		//перерисовка дизайнеров
		public var redrawDesign:Function;
		
		//перерисовка совместных работ
		public var redrawTeamworks:Function;		
		public var teamwork1:Designers = new Designers();
		public var teamwork2:Designers = new Designers();
		public var distortTeamwork1:Array = [];//массив дисторшенов совместная работа1
		public var distortTeamwork2:Array = [];//массив дисторшенов совместная работа2
		
		//перерисовка сотрудничеств 
		public var redrawCooperation:Function;		
		public var cooperation1:Designers = new Designers();
		public var cooperation2:Designers = new Designers();
		public var distortCooperation1:Array = [];//массив дисторшенов сотрудничество1
		public var distortCooperation2:Array = [];//массив дисторшенов сотрудничество2
		
		/**
		 *  глобальная функция показа линии дизайнера при наведении на плашку совместных проектов или сотрудничества
		 */
		public var ShowDesignerLine:Function;
		/**
		 *  глобальная функция скрытия линии дизайнера при отведении от плашки совместных проектов или сотрудничества
		 */
		public var HideDesignerLine:Function;
		/**
		 * линия обводки для плашек с дизайнерами
		 */
		public var DesignerStroke:Sprite = new Sprite();
		/**
		 * линия обводки для плашек с совемстными проектами
		 */
		public var TeamWorkStroke:Sprite = new Sprite();
		/**
		 * линия обводки для плашек сотрудничество
		 */
		public var CooperationStroke:Sprite = new Sprite();
		/**
		 *  содержит фильтры и их подписи
		 */
		public var Filters:FiltersXml = new FiltersXml();
		
			/**
			 *  Контейнер содержит всю сцену
			 */
		public var globalContainer:MovieClip = new MovieClip(); 
		
		public function Main():void 
		{
		 	
			
			/**
			 * координаты X для куба 
			 */
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
			
			/**
			 *  координаты Y для куба
			 */
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
								59.9, 37.4, 0, 1, 17, 45];
			/**
			 *  массив точек куба 
			 */					
			var pCube:Array = [];
			/**
			 *  общий контур
			 */
			var contur:Sprite = new Sprite(); // общий контур
			/**
			 * элемент меню 1
			 */
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
			
			/**
			 *  контейнер для кубика
			 */
			var cubicContainer:MovieClip = new MovieClip();//контейнер для кубика
			/**
			 *  объект куб
			 */
			var cubic:MovieClip = new MovieClip(); // кубик	   
			/**
			 * массив твинов
			 */
			var tweensCube:Array = []; // храним твины		
			/**
			 *  тень для куба
			 */
			var CubicShadow:MovieClip = new MovieClip(); //тень		
			/**
			 *  канва, из класса canvas
			 */
			var Canvas:Sprite = new Sprite();				
			/**
			 * логотип на кубике
			 */
			var CubLogo:cuba_logo = new cuba_logo()//логотип;
			/**
			 * положение куба по X
			 */
			var cubeX:Number = 180;
			/**
			 * положение куба по Y
			 */
			var cubeY:Number = 600;
			
			
			//тултипы 
			var TolTip1:Sprite = new Sprite();
			var TolTip2:Sprite = new Sprite();
			var TolTip3:Sprite = new Sprite();
			var TolTip4:Sprite = new Sprite();
			var TolTip5:Sprite = new Sprite();
			var TolTip6:Sprite = new Sprite();
			
			/**
			 * переменная содержит путь к конфигурационному файлу
			 */
			
			var ConfigUrl:String = "config.xml"
			/**
			 * контейнер содержит кнопки с фильрами
			 */
			var FilterButtonsContainer:Sprite = new Sprite();	
			/**
			 * массив кнопок фильтров
			 */
			var FilterButtons:Array = [];
			/**
			 * массив который содержит |
			 */
			var FilterTilda:Array = [];
				
			/**
			 *  фильтр свечения 
			 */
			var DesignerGlow:GlowFilter
			var WithCompanyGlow:GlowFilter
			var WithDesignersGlow:GlowFilter
			//======конец описания переменных
						
			// регистрируем хинт			
			Hint.register(this);
			//Hint.dragHint = false;
			//регистрируем Алерт
			Alert.register(this);
			Alert.BG_COLOR = 0x80B1FD;
			
			//создаем прелоадер
			var preloader:CubaLoader = new CubaLoader();
			//создаем объект, который хранит инф. о загрузке, т.е. в нем будем рисовать квадрат и отображать ход загрузки поэтапно.
			var LoadInformer:Sprite = new Sprite();
			addChild(LoadInformer);
			/*var preloader:Preloader = new Preloader (50, 0xFFFFFF, 1, 60);
			preloader.x = 1024 / 2;
			preloader.y = 768 / 2;
			preloader.label = "\n \n \n \n \n \n \n LOAD CONFIG ";
			trace("canvas width and height", Canvas.width, "x", Canvas.height);
			addChild(preloader);*/
			//рисуем канву
			addChild(Canvas);
			
			
			//Security.allowDomain( "195.38.55.70" );
			/*function createCanvas():void 
			{
				
					var canvas_x:Array = [0,-500,500,500,-500];
					var canvas_y:Array = [0,-372,-372,372,372];
					
					var matrix1:Matrix = new Matrix;
					var colors1:Array = [0xA2BBCC, 0x507085];
					var alphas1:Array = [1,1];
					var ratios1:Array = [0x00, 0xFF];
					var cX:Number = 1000;
					var cY:Number = 744;
					var hX:Number = 12
					var hY:Number = 12;
					
					matrix1.createGradientBox(2500,2500,0/180*Math.PI,-1550,-1550)
							
					Canvas.graphics.lineStyle(0.5,0xFFFFFF,100,false,"normal","none","miter",3);
					Canvas.graphics.beginGradientFill(GradientType.RADIAL, colors1, alphas1, ratios1, matrix1);
					
					Canvas.graphics.moveTo(hX, hY);
					Canvas.graphics.lineTo(cX, hY);
					Canvas.graphics.lineTo(cX, cY);
					Canvas.graphics.lineTo( hX, cY);
					Canvas.graphics.lineTo( hX, hY);
					Canvas.graphics.endFill();
					Canvas.scaleY = 0.001;
					addChild(Canvas);
					
			}
			createCanvas();*/
			
			
			
			
			
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
			   //загружаем фильтры
				Filters.loadXML("filters.xml");
				//preloader.label = "\n \n \n \n \n \n \n LOAD "+MainConfig.MainUrl;
				preloader.Preload(LoadInformer, 2);
				CubeConfig.loadMainXml(MainConfig.MainUrl,loadCubeConfig,errorCubeConfig)
			}
			
			function errorCubeConfig():void
			{
				Alert.show(CubeConfig.ErrorText);
			}
			
			//загружаем настройки для куба
			function loadCubeConfig():void
			{
				preloader.Preload(LoadInformer, 3);
				//preloader.label = "\n \n \n \n \n \n \n LOAD "+MainConfig.Designer1Url;
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
				//DesignerGlow= new GlowFilter(CubeConfig.PLATO1LIGHT, 0.3, 10, 10,5); 
				//WithCompanyGlow= new GlowFilter(CubeConfig.PLATO2LIGHT, 0.3, 10, 10,5); 
				//WithDesignersGlow= new GlowFilter(CubeConfig.PLATO3LIGHT, 0.3, 10, 10,5,2); 
				
				// делаем обводки невидимыми
				DesignerStroke.visible = false;
				TeamWorkStroke.visible = false;
				CooperationStroke.visible = false;
				
				designer2.loadXML(MainConfig.Designer2Url, designer2Create,designer2Eror);
				preloader.Preload(LoadInformer, 4);
				//preloader.label = "\n \n \n \n \n \n \n LOAD  "+MainConfig.Designer2Url;
			}
			function designer2Eror():void
			{
				Alert.show(designer2.ErrorText);
			}
			
			function designer2Create():void
			{
				preloader.Preload(LoadInformer, 5);
				//preloader.label = "\n \n \n \n \n \n \n LOAD  "+MainConfig.Designer3Url;
				designer3.loadXML(MainConfig.Designer3Url,designer3Create,designer3Eror)
			}
			function designer3Eror():void
			{
				Alert.show(designer3.ErrorText);
			}
			
			function designer3Create():void
			{
				preloader.Preload(LoadInformer, 6);
				//preloader.label = "\n \n \n \n \n \n \n LOAD "+MainConfig.Designer4Url;
				designer4.loadXML(MainConfig.Designer4Url,designer4Create,designer4Eror)
			}
			function designer4Eror():void
			{
				Alert.show(designer4.ErrorText);
			}
			
			function designer4Create():void
			{
				preloader.Preload(LoadInformer, 7);
				//preloader.label = "\n \n \n \n \n \n \n LOAD  "+MainConfig.Teamwork1Url;
				teamwork1.loadXML(MainConfig.Teamwork1Url,teamwork1Create,teamwork1Error)
					
			}
			function teamwork1Error():void
			{
				Alert.show(teamwork1.ErrorText);
			}
						
			// загружаем информацию для teamwork
			
			function teamwork1Create():void
			{
				preloader.Preload(LoadInformer, 8);
				//preloader.label = "\n \n \n \n \n \n \n LOAD  "+MainConfig.Teamwork2Url;
				teamwork2.loadXML(MainConfig.Teamwork2Url, teamwork2Create,teamwork2Error);
			}
			function teamwork2Error():void
			{
				Alert.show(teamwork2.ErrorText);
			}
			
			function teamwork2Create ():void
			{
				preloader.Preload(LoadInformer, 10);
				//preloader.label = "\n \n \n \n \n \n \n LOAD  "+MainConfig.Cooperation1Url;
				cooperation1.loadXML(MainConfig.Cooperation1Url, cooperation1Create,cooperation1Error);
			}
			function cooperation1Error():void
			{
				Alert.show(cooperation1.ErrorText);
			}
			
			function cooperation1Create():void
			{
				//preloader.Preload(LoadInformer, 10);
				//preloader.label = "\n \n \n \n \n \n \n LOAD  "+MainConfig.Cooperation2Url;
				cooperation2.loadXML(MainConfig.Cooperation2Url, cooperation2Create,cooperation2Error);
			}
			function cooperation2Error():void
			{
				Alert.show(cooperation2.ErrorText);
			}
			
			function cooperation2Create():void
			{
				//пишем на лейбе загрузки что все готово
				//preloader.label = "\n \n \n \n \n \n \n LOAD Complete";
				//убиваем предзагрузчик
				removeChild(LoadInformer);
				//задаем основные цвета для объектов
				LINECOLOR = CubeConfig.LineColor;
				FILLCOLOR1 = CubeConfig.FillColor1;
				FILLCOLOR2 = CubeConfig.FillColor2;
				FILLCOLOR3 = CubeConfig.FillColor3;
				SHADOWCOLOR = CubeConfig.SHADOW;
				NAVIGATIONBUTTONCOLOR = CubeConfig.NavigationButtonColor;
				PLATOLIGHT1 = CubeConfig.PLATO1LIGHT;
				PLATOLIGHT2 = CubeConfig.PLATO2LIGHT;
				PLATOLIGHT3 = CubeConfig.PLATO3LIGHT;
				StrokeLineDesigners = CubeConfig.StrokeLine1;
				StrokeLineTeamWork = CubeConfig.StrokeLine2;
				StrokeLineCooperation = CubeConfig.StrokeLine3;
				//создаем все основные объекты
				ApplyFilter();
				loadAll();
				// анимируем кубик
				CubAnimation();
				//CreateCube();
				// сохдаем тултипы
				CreateTooltip();
				//создаем кнопки фильтров
				CreateFiltrButtons();
				
			}
			
			
									
						
			
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
						   cubicContainer.x = 1024 / 2;
						   cubicContainer.y = 768 / 2;
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
							   var prevWidth:Number = CubeConfig.PREVBUTTONTEXT.textWidth + 8;
							   var prevHeight:Number = CubeConfig.PREVBUTTONTEXT.textHeight + 5;
							   CubeConfig.PREVBUTTONTEXT.autoSize = TextFieldAutoSize.LEFT;
							   PrevToolTip.graphics.lineStyle(CubeConfig.PREVBUTTONTHIKNESLINE, CubeConfig.PREVBUTTONCOLORLINE, CubeConfig.PREVBUTTONALPHALINE);
							   PrevToolTip.graphics.beginFill(CubeConfig.PREVBUTTONFILL, CubeConfig.PREVBUTTONALPHA);
							   PrevToolTip.graphics.drawRect(0, 0, prevWidth, prevHeight);
							   PrevToolTip.graphics.endFill();
							   PrevToolTip.addChild(CubeConfig.PREVBUTTONTEXT);
							   
							   var nextWidth:Number = CubeConfig.NEXTBUTTONTEXT.textWidth + 8;
							   var nextHeight:Number = CubeConfig.NEXTBUTTONTEXT.textHeight + 5;
							   CubeConfig.NEXTBUTTONTEXT.autoSize = TextFieldAutoSize.LEFT;
							   NextToolTip.graphics.lineStyle(CubeConfig.NEXTBUTTONTHIKNESLINE, CubeConfig.NEXTBUTTONCOLORLINE, CubeConfig.NEXTBUTTONALPHALINE);
							   NextToolTip.graphics.beginFill(CubeConfig.NEXTBUTTONFILL, CubeConfig.NEXTBUTTONALPHA);
							   NextToolTip.graphics.drawRect(0, 0, nextWidth, nextHeight);
							   NextToolTip.graphics.endFill();
							   NextToolTip.addChild(CubeConfig.NEXTBUTTONTEXT);
							   
							   var sendWidth:Number = CubeConfig.SENDMESSAGETEXT.textWidth + 8;
							   var sendHeight:Number = CubeConfig.SENDMESSAGETEXT.textHeight + 5;
							   CubeConfig.SENDMESSAGETEXT.autoSize = TextFieldAutoSize.LEFT;
							   SendMessageToolTip.graphics.lineStyle(CubeConfig.NEXTBUTTONTHIKNESLINE, CubeConfig.NEXTBUTTONCOLORLINE, CubeConfig.NEXTBUTTONALPHALINE);
							   SendMessageToolTip.graphics.beginFill(CubeConfig.NEXTBUTTONFILL, CubeConfig.NEXTBUTTONALPHA);
							   SendMessageToolTip.graphics.drawRect(0, 0, sendWidth, sendHeight);
							   SendMessageToolTip.graphics.endFill();
							   SendMessageToolTip.addChild(CubeConfig.SENDMESSAGETEXT);
							   
							   
							   var t1Width:Number = CubeConfig.TOOLTIPTEXT1.textWidth+8;
							   var t1Height:Number = CubeConfig.TOOLTIPTEXT1.textHeight+5;
							   //CubeConfig.TOOLTIPTEXT1.width = CubeConfig.TOOLTIPTEXT1.textWidth+10;
							   //CubeConfig.TOOLTIPTEXT1.height = CubeConfig.TOOLTIPTEXT1.textHeight+10;
							   CubeConfig.TOOLTIPTEXT1.autoSize = TextFormatAlign.LEFT;
							   CubeConfig.TOOLTIPTEXT1.x = 2;
							   TolTip1.graphics.beginFill(CubeConfig.TOOLTIPFILL1, CubeConfig.TOOLTIPALPHA1);
							   TolTip1.graphics.lineStyle(CubeConfig.TOOLTIPALPHALINE1, CubeConfig.TOOLTIPCOLORLINE1);
							   TolTip1.graphics.drawRect(0,0,t1Width,t1Height); 
							   //TolTip1.graphics.moveTo(t1Width/2, t1Height);
							   //TolTip1.graphics.lineTo(0,100);
							   TolTip1.graphics.endFill();
							   TolTip1.addChild(CubeConfig.TOOLTIPTEXT1);
							   //TolTip1.x = -TolTip1.width/2;
							   //TolTip1.y = TolTip1.height-35;
							   var t2Width:Number = CubeConfig.TOOLTIPTEXT2.textWidth+8;
							   var t2Height:Number = CubeConfig.TOOLTIPTEXT2.textHeight+5;
							   //CubeConfig.TOOLTIPTEXT2.width = CubeConfig.TOOLTIPTEXT2.width+15;
							   //CubeConfig.TOOLTIPTEXT2.height = CubeConfig.TOOLTIPTEXT2.textHeight+10;
							   CubeConfig.TOOLTIPTEXT2.autoSize=TextFormatAlign.LEFT;
							   CubeConfig.TOOLTIPTEXT2.x = 2;
							   TolTip2.graphics.beginFill(CubeConfig.TOOLTIPFILL2, CubeConfig.TOOLTIPALPHA2);
							   TolTip2.graphics.lineStyle(CubeConfig.TOOLTIPALPHALINE2, CubeConfig.TOOLTIPCOLORLINE2);
							   TolTip2.graphics.drawRect(0,0,t2Width,t2Height); 
							   //TolTip2.graphics.moveTo(t2Width/2, t2Height);
							   //TolTip2.graphics.lineTo(0,100);
							   TolTip2.graphics.endFill();
							   TolTip2.addChild(CubeConfig.TOOLTIPTEXT2);
							   //TolTip2.x = 30;
							   //TolTip2.y = TolTip2.height - 9;
							   var t3Width:Number = CubeConfig.TOOLTIPTEXT3.textWidth+8;
							   var t3Height:Number = CubeConfig.TOOLTIPTEXT3.textHeight+5;
							   //CubeConfig.TOOLTIPTEXT3.width = CubeConfig.TOOLTIPTEXT3.width+30;
							   //CubeConfig.TOOLTIPTEXT3.height = CubeConfig.TOOLTIPTEXT3.textHeight+10;
							   CubeConfig.TOOLTIPTEXT3.autoSize=TextFormatAlign.LEFT;
							   CubeConfig.TOOLTIPTEXT3.x = 2;
							   TolTip3.graphics.beginFill(CubeConfig.TOOLTIPFILL3, CubeConfig.TOOLTIPALPHA3);
							   TolTip3.graphics.lineStyle(CubeConfig.TOOLTIPALPHALINE3, CubeConfig.TOOLTIPCOLORLINE3);
							   TolTip3.graphics.drawRect(0,0,t3Width,t3Height); 
							   //TolTip3.graphics.moveTo(0,t3Height/2);
							   //TolTip3.graphics.lineTo(-10,0);
							   TolTip3.graphics.endFill();
							   TolTip3.addChild(CubeConfig.TOOLTIPTEXT3);
							   
							   var t4Width:Number = CubeConfig.TOOLTIPTEXT4.textWidth+8;
							   var t4Height:Number = CubeConfig.TOOLTIPTEXT4.textHeight+5;
							   //CubeConfig.TOOLTIPTEXT4.width = CubeConfig.TOOLTIPTEXT4.width+30;
							   //CubeConfig.TOOLTIPTEXT4.height = CubeConfig.TOOLTIPTEXT4.textHeight+10;
							   CubeConfig.TOOLTIPTEXT4.autoSize=TextFormatAlign.LEFT;
							   CubeConfig.TOOLTIPTEXT4.x = 2;
							   TolTip4.graphics.beginFill(CubeConfig.TOOLTIPFILL4, CubeConfig.TOOLTIPALPHA4);
							   TolTip4.graphics.lineStyle(CubeConfig.TOOLTIPALPHALINE4, CubeConfig.TOOLTIPCOLORLINE4);
							   TolTip4.graphics.drawRect(0,0,t4Width,t4Height); 
							   //TolTip4.graphics.moveTo(0,t4Height/2);
							   //TolTip4.graphics.lineTo(-10,0);
							   TolTip4.graphics.endFill();
							   TolTip4.addChild(CubeConfig.TOOLTIPTEXT4);
							   
							   var t5Width:Number = CubeConfig.TOOLTIPTEXT5.textWidth+8;
							   var t5Height:Number = CubeConfig.TOOLTIPTEXT5.textHeight+5;
							   //CubeConfig.TOOLTIPTEXT5.width = CubeConfig.TOOLTIPTEXT5.width+10;
							   //CubeConfig.TOOLTIPTEXT5.height = CubeConfig.TOOLTIPTEXT5.textHeight+10;
							   CubeConfig.TOOLTIPTEXT5.autoSize=TextFormatAlign.LEFT;
							   CubeConfig.TOOLTIPTEXT5.x = 2;
							   TolTip5.graphics.beginFill(CubeConfig.TOOLTIPFILL5, CubeConfig.TOOLTIPALPHA5);
							   TolTip5.graphics.lineStyle(CubeConfig.TOOLTIPALPHALINE5, CubeConfig.TOOLTIPCOLORLINE5);
							   TolTip5.graphics.drawRect(0,0,t5Width,t5Height); 
							   //TolTip5.graphics.moveTo(0,t5Height/2);
							   //TolTip5.graphics.lineTo(-10,0);
							   TolTip5.graphics.endFill();
							   TolTip5.addChild(CubeConfig.TOOLTIPTEXT5);
							   
							   var t6Width:Number = CubeConfig.TOOLTIPTEXT6.textWidth+8;
							   var t6Height:Number = CubeConfig.TOOLTIPTEXT6.textHeight+5;
							   //CubeConfig.TOOLTIPTEXT6.width = CubeConfig.TOOLTIPTEXT6.width+10;
							   //CubeConfig.TOOLTIPTEXT6.height = CubeConfig.TOOLTIPTEXT6.textHeight+10;
							   CubeConfig.TOOLTIPTEXT6.autoSize=TextFormatAlign.LEFT;
							   CubeConfig.TOOLTIPTEXT6.x = 2;
							   TolTip6.graphics.beginFill(CubeConfig.TOOLTIPFILL6, CubeConfig.TOOLTIPALPHA6);
							   TolTip6.graphics.lineStyle(CubeConfig.TOOLTIPALPHALINE3, CubeConfig.TOOLTIPCOLORLINE6);
							   TolTip6.graphics.drawRect(0,0,t6Width,t6Height); 
							   //TolTip6.graphics.moveTo(0,t3Height/2);
							   //TolTip6.graphics.lineTo(-10,0);
							   TolTip6.graphics.endFill();
							   TolTip6.addChild(CubeConfig.TOOLTIPTEXT6);
							   
												   
						   
							}
						//=======================================================================================================   
					    //т.к. кубик сначала в середине создаем для него таймлайн для последущего движения
						var CubMoveTimeline:TimelineLite = new TimelineLite({onComplete:onCubMoveHome});
						// переменная для проверки куба в центре он или нет
						var CubIsCentr:Boolean = false;
						//переменные для проверки состояния куба после того как он был в центре чтобы вернуть в левый угол
						var CubAfterCentr:Boolean = false;
						var CubBeforeCentr:Boolean = false;
						//функция которая вызывается после того как кубик приехал на место влевый угол
						function onCubMoveHome():void 
						{
							
							if (whatButtonIsPressed == 1)
								{
									addEventListener(Event.ENTER_FRAME, onEnterFrame);
									tweenCube(0, 44);
									//кубик уже после центра
									CubAfterCentr = true;
									CubBeforeCentr = true;
								}
															
								else if(whatButtonIsPressed == 2)
								{
									addEventListener(Event.ENTER_FRAME, onEnterFrame);
									tweenCube(0, 88);
									//кубик уже после центра
									CubAfterCentr = true;
									CubBeforeCentr = true;
								}
								else if(whatButtonIsPressed == 3)
								{
									addEventListener(Event.ENTER_FRAME, onEnterFrame);
									tweenCube(0, 132);
									//кубик уже после центра
									CubAfterCentr = true;
									CubBeforeCentr = true;
								}
								if (whatButtonIsPressed == 4)
								{
									addEventListener(Event.ENTER_FRAME, onEnterFrame);
									tweenCube(0, 176);
									//кубик уже после центра
									CubAfterCentr = true;
									CubBeforeCentr = true;
								}
															
								else if(whatButtonIsPressed == 5)
								{
									addEventListener(Event.ENTER_FRAME, onEnterFrame);
									tweenCube(0, 220);
								}
								else if(whatButtonIsPressed == 6)
								{
									addEventListener(Event.ENTER_FRAME, onEnterFrame);
									tweenCube(0, 264);
								}
								
						}
						
						
						// начальная анимация куба его разворачивание от середины
						function CubAnimation():void 
						{
							/**
							 *  таймлайн для рисования начальной анимации
							 */
							var timelinePreload:TimelineLite = new TimelineLite({onComplete:onPreloadComplete});
							/**
							 *  координаты канвы X
							 */
							var canvas_x:Array = [0,-500,500,500,-500];
							/**
							 *  координаты канвы Y
							 */
							var canvas_y:Array = [0,-372,-372,372,372];
							
							// точки для отрисовки линий
							var line1:Point = new Point(0, 0);
							var line2:Point = new Point(0, 0);
							var line3:Point = new Point(0, 0);
							var line4:Point = new Point(0, 0);
							
							//параметры для заливки канвы градиентной основой							
							var matrix1:Matrix = new Matrix;
							var colors1:Array = [CubeConfig.CanvaFill1, CubeConfig.CanvaFill2];
							var alphas1:Array = [1,1];
							var ratios1:Array = [0x00, 0xFF];
							
							//текст снизу
							var BottomTxt:TextField = new TextField();
							var FontFormat:TextFormat = new TextFormat();
							FontFormat.font = "MyriadPro-Regular";
							FontFormat.align = TextFormatAlign.CENTER;
							FontFormat.bold = true;
							FontFormat.size = 12;
							FontFormat.color = 0xFFFFFF;
							
							BottomTxt.antiAliasType = AntiAliasType.ADVANCED;
							BottomTxt.embedFonts = true;
							BottomTxt.selectable = false;
							BottomTxt.multiline = true;
							BottomTxt.text = "© 2010, CUB.A | Дизайн интерьеров и мебели";
							BottomTxt.autoSize = TextFieldAutoSize.CENTER;
							BottomTxt.setTextFormat(FontFormat);
							BottomTxt.x = 512-BottomTxt.textWidth/2;
							BottomTxt.y = 730;
							addChild(BottomTxt);
							BottomTxt.alpha = 0;
							
							
							//размещаем канву по центру
							Canvas.x =  1024/ 2;
							Canvas.y = 768 / 2;
							
							//задержки
							var delay1:Number=  1;
							var delay1_1:Number=  0.5;
							var delay1_2:Number=  0.7;
							
							
							
							//функция рисования канвы
							function DrawCanva():void 
							{
							  matrix1.createGradientBox(2500,2500,0/180*Math.PI,-1550,-1550)
							  Canvas.graphics.lineStyle(0.5,0xFFFFFF,100,false,"normal","none","miter",3);
							  Canvas.graphics.beginGradientFill(GradientType.RADIAL, colors1, alphas1, ratios1, matrix1);
							
							  Canvas.graphics.moveTo(line1.x, line1.y);
							  Canvas.graphics.lineTo(line2.x, line2.y);
							  Canvas.graphics.lineTo(line3.x, line3.y);
							  Canvas.graphics.lineTo(line4.x, line4.y);
							  Canvas.graphics.lineTo(line1.x, line1.y);
							  Canvas.graphics.endFill();
							  //Canvas.cacheAsBitmap=true;
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
							
							
							// заменяем значения точек куба на 0 для анимации от начала координат
						  for (var a:int = 0; a <13 ; a++) 
						   {
							   pCube[a].x = 0;
							   pCube[a].y = 0;
						   }
							for (a= 38; a <43 ; a++) 
						   {
							   pCube[a].x = 0;
							   pCube[a].y = 0;
						   }
						   
							// логотип и тень делаем полностью прозрачными
						    CubLogo.alpha = 0;
							CubicShadow.alpha = 0;
						    
														
							timelinePreload.appendMultiple
							([
							
							new TweenLite(pCube[0], 0.5, { x:xCube[8], y:yCube[8] }),
							new TweenLite(pCube[2], 0.5, { x:xCube[10], y:yCube[10] }),
							new TweenLite(pCube[4], 0.5, { x:xCube[12], y:yCube[12] }),
													
							new TweenLite(pCube[1], 0.5, { x:xCube[8], y:yCube[8] } ),
							new TweenLite(pCube[3], 0.5, { x:xCube[10], y:yCube[10] } ),
							new TweenLite(pCube[5], 0.5, { x:xCube[12], y:yCube[12] } ),
							
							new TweenLite(pCube[8], 0.5, { x:xCube[8], y:yCube[8] } ),
							new TweenLite(pCube[10], 0.5, { x:xCube[10], y:yCube[10] } ),
							new TweenLite(pCube[12], 0.5, { x:xCube[12], y:yCube[12] } ),
							
							new TweenLite(pCube[7], 0.5, { x:xCube[8], y:yCube[8] } ),
							new TweenLite(pCube[9], 0.5, { x:xCube[10], y:yCube[10] } ),
							new TweenLite(pCube[11], 0.5, { x:xCube[12], y:yCube[12] } )							
							
							
							], 0, TweenAlign.START);
							
							
							timelinePreload.appendMultiple
							([
							
							new TweenLite(pCube[0], 0.5, { x:xCube[7], y:yCube[7] }),
							new TweenLite(pCube[2], 0.5, { x:xCube[9], y:yCube[9] }),
							new TweenLite(pCube[4], 0.5, { x:xCube[11], y:yCube[11] }),
													
							new TweenLite(pCube[7], 0.5, { x:xCube[7], y:yCube[7] } ),
							new TweenLite(pCube[9], 0.5, { x:xCube[9], y:yCube[9] } ),
							new TweenLite(pCube[11], 0.5, { x:xCube[11], y:yCube[11] } ),
							
														
							],0,TweenAlign.START);
							
							timelinePreload.appendMultiple
							([
							
							new TweenLite(pCube[0], 0.5, { x:xCube[0], y:yCube[0] }),
							new TweenLite(pCube[1], 0.5, { x:xCube[1], y:yCube[1] }),
							new TweenLite(pCube[2], 0.5, { x:xCube[2], y:yCube[2] }),
													
							new TweenLite(pCube[3], 0.5, { x:xCube[3], y:yCube[3] } ),
							new TweenLite(pCube[4], 0.5, { x:xCube[4], y:yCube[4] } ),
							new TweenLite(pCube[5], 0.5, { x:xCube[5], y:yCube[5] } ),
							
													
							],0,TweenAlign.START);
							
							
							
							//появляется тень и лого
							timelinePreload.appendMultiple
							([
							
							new TweenLite(CubLogo, 0.5, { alpha:1 } ),
							new TweenLite(pCube[38], 0.5, { x:xCube[39], y:yCube[39] }),
							new TweenLite(pCube[39], 0.5, { x:xCube[39], y:yCube[39] }),
							new TweenLite(pCube[40], 0.5, { x:xCube[40], y:yCube[40] }),
													
							new TweenLite(pCube[41], 0.5, { x:xCube[41], y:yCube[41] } ),
							new TweenLite(pCube[42], 0.5, { x:xCube[42], y:yCube[42] } ),
							
							
													
							],0,TweenAlign.START);
							
							//тень выходит из границ проявляется
							timelinePreload.appendMultiple
							([
							
							new TweenLite(CubicShadow, 0.5, {alpha:0.5  } ),
							new TweenLite(pCube[38], 0.5, { x:xCube[38], y:yCube[38] }),
							new TweenLite(pCube[39], 0.5, { x:xCube[39], y:yCube[39] }),
							new TweenLite(pCube[40], 0.5, { x:xCube[40], y:yCube[40] }),
													
							new TweenLite(pCube[41], 0.5, { x:xCube[41], y:yCube[41] } ),
							new TweenLite(pCube[42], 0.5, { x:xCube[42], y:yCube[42] } ),
							new TweenLite(pCube[43], 0.5, { x:xCube[43], y:yCube[43] } ),
							
													
							],0,TweenAlign.START);
							
							//двигаем куб на место
							//timelinePreload.append(TweenLite.to(cubicContainer, 0.5, { x:cubeX,y:cubeY } ) );
							//CubMoveTimeline.append(TweenLite.to(cubicContainer, 0.5, { x:cubeX, y:cubeY } ) );
							//CubMoveTimeline.stop();
							//показываем текст снизу
							timelinePreload.append(TweenLite.to(BottomTxt, 0.5, { alpha:1 } ) );							
							timelinePreload.play();
							addEventListener(Event.ENTER_FRAME, onR);
														
							
							function onR(event:Event):void 
							{
								//в каждом кадре рисуем канву чистим куб и перерисовываем в новые координаты
								//trace("ONR");
								DrawCanva();
								
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
							}
							
							//по завершению анимации грохаем нах...все
							function onPreloadComplete():void 
							{
							    
								//удаляем слушателя на энтерфрейм для отрисовки
								removeEventListener(Event.ENTER_FRAME, onR);
								//обнуляем функцию обработчик
								onR = null;
								timelinePreload = null;
								
								//добавляем слушателей на кнопки
								addEventListenerMenuButton();	
							}
							
							
							
						}//end function CubAnimation
						
						
						/**
						 * тригер проверки нажатия фильтра 
						 */
							var pressed:Boolean = false;
							/**
							 * таймлайн для появления фильтров
							 */
							var FilterTimeline:TimelineLite = new TimelineLite();
							/**
							 * линия которая выезжает по нажатию кнопки фильтров
							 */
							var FilterLine:Sprite = new Sprite();
							/**
							 * маска для линии фильтров;
							 */
							var FilterLineMask:Sprite = new Sprite();
							/**
							 * контейнер, содержит линию фильтра и его маску
							 */
							var FilterLineContainer:Sprite = new Sprite();
							//рисуем маску для линии
							FilterLineMask.graphics.beginFill(0xFFFFFF, 1);
							FilterLineMask.graphics.drawRect(0, 0, 40, 40);
							FilterLineMask.graphics.endFill();
							FilterLineMask.x -= 20;
							FilterLineContainer.addChild(FilterLineMask);
							
							//рисуем линию и добавляем ее в контейнер.
							FilterLine.graphics.lineStyle(0.5, 0xFFFFFF, 1);
							FilterLine.graphics.lineTo(0, 40); 
							FilterLine.graphics.endFill();
							FilterLine.mask = FilterLineMask;
							FilterLine.y -= 40;
							FilterLineContainer.addChild(FilterLine);
							addChild(FilterLineContainer);
							FilterLineContainer.x = cubeX-2;
							FilterLineContainer.y = cubeY+65.5;
							
						//создаем кнопки для фильтров
						function CreateFiltrButtons():void 
						{
							
							//размещаем контейнер с фильтрами по Х 
							FilterButtonsContainer.x = cubeX+2;// + 12.5;
							//размещаем контейнер с фильтрами по У 
							FilterButtonsContainer.y = cubeY+90.5; 
							//создаем кнопки фильтров на основе класса FiltersXml
							//массив FilterButtons в контейнер FilterButtonsContainer, функция при нажатии onClickBtns
							Filters.CreateButtons(FilterButtons,FilterTilda, FilterButtonsContainer,onClickBtns);
							//добавляем контейнер с кнопками в глобальный контейнер
							globalContainer.addChild(FilterButtonsContainer);
							//делаем контейнер с фильтрами невидимым и прозрачным
							FilterButtonsContainer.visible = false;
							FilterButtonsContainer.alpha = 0;
							//добавляем в таймлайн анимацию
							FilterTimeline.stop();
							FilterTimeline.append(TweenLite.to(FilterLine, 0.5, { y:0 } ) );
							FilterTimeline.append(TweenLite.to(FilterButtonsContainer, 0, { visible:1 } ) );
							FilterTimeline.append(TweenLite.to(FilterButtonsContainer, 0.5, { alpha:1 } ) );
							
							//нажали на кнопку фильтра
								function onClickBtns(event:MouseEvent):void 
								{
									//разыминовываем  клип как спрайт
									var button:Sprite = (event.currentTarget as Sprite);
									
									//все кнопки стали не прозрачными
										for (var i:int = 0; i < Filters.TotalListIndex; i++) 
										{
											FilterButtons[i].alpha = 1;
										}
										
										//значение фильтра это имя нажатой кнопки
										var filtr:String = button.name;
										trace("id=", filtr);
										// нажатую кнопу делаем прозрачной
										button.alpha = 0.5;
										
										//сначала отменяем фильтры 
										designer1.unFiltred(distortDesigner1);
										designer2.unFiltred(distortDesigner2);
										designer3.unFiltred(distortDesigner3);
										designer4.unFiltred(distortDesigner4);
										
										teamwork1.unFiltred(distortTeamwork1);
										teamwork2.unFiltred(distortTeamwork2);
										
										cooperation1.unFiltred(distortCooperation1);
										cooperation2.unFiltred(distortCooperation2);
										
										//фильтруем и перерисовываем
										designer1.filtred(filtr, distortDesigner1);
										designer2.filtred(filtr, distortDesigner2);
										designer3.filtred(filtr, distortDesigner3);
										designer4.filtred(filtr, distortDesigner4);
										redrawDesign();
										
										teamwork1.filtred(filtr, distortTeamwork1);
										teamwork2.filtred(filtr, distortTeamwork2);
										redrawTeamworks();
										
										cooperation1.filtred(filtr, distortCooperation1);
										cooperation2.filtred(filtr, distortCooperation2);
										redrawCooperation();
									
									
									//если не нажата фильтруем
									/*if(!pressed)
									{
									  //все кнопки стали не прозрачными
										for (var i:int = 0; i < Filters.TotalListIndex; i++) 
										{
											FilterButtons[i].alpha = 1;
										}
										
										//значение фильтра это имя нажатой кнопки
										var filtr:String = button.name;
										trace("id=", filtr);
										// нажатую кнопу делаем прозрачной
										button.alpha = 0.5;
										
										//сначала отменяем фильтры 
										designer1.unFiltred(distortDesigner1);
										designer2.unFiltred(distortDesigner2);
										designer3.unFiltred(distortDesigner3);
										designer4.unFiltred(distortDesigner4);
										
										teamwork1.unFiltred(distortTeamwork1);
										teamwork2.unFiltred(distortTeamwork2);
										
										cooperation1.unFiltred(distortCooperation1);
										cooperation2.unFiltred(distortCooperation2);
										
										//фильтруем и перерисовываем
										designer1.filtred(filtr, distortDesigner1);
										designer2.filtred(filtr, distortDesigner2);
										designer3.filtred(filtr, distortDesigner3);
										designer4.filtred(filtr, distortDesigner4);
										redrawDesign();
										
										teamwork1.filtred(filtr, distortTeamwork1);
										teamwork2.filtred(filtr, distortTeamwork2);
										redrawTeamworks();
										
										cooperation1.filtred(filtr, distortCooperation1);
										cooperation2.filtred(filtr, distortCooperation2);
										redrawCooperation();
										
										//уже нажали
										pressed = true;
									}
									//если нажата убираем фильтры
									else if (pressed)
									{
										//все кнопки стали не прозрачными
										for ( i = 0; i < Filters.TotalListIndex; i++) 
										{
											FilterButtons[i].alpha = 1;
										}
										//отменяем фильтры
										designer1.unFiltred(distortDesigner1);
										designer2.unFiltred(distortDesigner2);
										designer3.unFiltred(distortDesigner3);
										designer4.unFiltred(distortDesigner4);
										redrawDesign();
										
										teamwork1.unFiltred(distortTeamwork1);
										teamwork2.unFiltred(distortTeamwork2);
										redrawTeamworks();
										
										cooperation1.unFiltred(distortCooperation1);
										cooperation2.unFiltred(distortCooperation2);
										redrawCooperation();
										//отжали
										pressed = false;
									}*/
									
								}// endfunction onClickBtns
						}// end function CreateFiltrButtons
						
			//=======================================================================================================
			
							
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
								//btn1.cacheAsBitmap;
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
								//btn2.cacheAsBitmap;
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
								//btn3.cacheAsBitmap;
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
								//btn4.cacheAsBitmap;
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
								//btn5.cacheAsBitmap;
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
								//btn6.cacheAsBitmap;
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
								//menu_color1.cacheAsBitmap;
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
								//menu_color2.cacheAsBitmap;
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
								//menu_color3.cacheAsBitmap;
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
								//menu_color4.cacheAsBitmap;
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
								//menu_color5.cacheAsBitmap;
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
								//menu_color6.cacheAsBitmap;
								
								
								
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
								//obj.cacheAsBitmap;
								
								
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
								//obj.cacheAsBitmap;
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
								//obj.cacheAsBitmap;
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
								//obj.cacheAsBitmap;
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
								//obj.cacheAsBitmap;
								
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
								//obj.cacheAsBitmap;
								
								//рисуем линии граней
								obj.graphics.lineStyle(CubeConfig.GranThicknessLine,CubeConfig.GranColorLine,CubeConfig.GranAlphaLine,false,"none","none","miter",3);
								obj.graphics.moveTo(p_front.x,p_front.y);
     							obj.graphics.lineTo(p_inside2.x, p_inside2.y);
								obj.graphics.moveTo(p_front.x,p_front.y);
     							obj.graphics.lineTo(p_inside4.x, p_inside4.y);
								obj.graphics.moveTo(p_front.x,p_front.y);
     							obj.graphics.lineTo(p_inside6.x, p_inside6.y);
								//obj.cacheAsBitmap;
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
								//obj.cacheAsBitmap;
								// внутренний контур
								
								obj.graphics.lineStyle(CubeConfig.InSideThicknessLine, CubeConfig.InSideColorLine, CubeConfig.InSideAlphaLine, false, "normal", "none", "miter", 3);
								obj.graphics.moveTo(p_inside1.x, p_inside1.y);
								obj.graphics.lineTo(p_inside1.x, p_inside1.y);
								obj.graphics.lineTo(p_inside2.x, p_inside2.y);
								obj.graphics.lineTo(p_inside3.x, p_inside3.y);
								obj.graphics.lineTo(p_inside4.x, p_inside4.y);
								obj.graphics.lineTo(p_inside5.x, p_inside5.y);
								obj.graphics.lineTo(p_inside6.x, p_inside6.y);
								obj.graphics.lineTo(p_inside1.x, p_inside1.y);
								//obj.cacheAsBitmap;
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
								//ShadowCube.cacheAsBitmap;
								
								//container.cacheAsBitmap;
								
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
							
							// удаляем энтерфрейм слушатель и проверяем нажатие кнопок
							function removeOn(event:Event):void
							{
								
								removeEventListener(Event.ENTER_FRAME, onEnterFrame);
								//addEventListenerMenuButton();
								
								if (whatButtonIsPressed == 1)
								{
									//реализуем механизм тригерной кнопки
									//если не нажата была  то покажем портянку
									if (!pressMenuButton1)
									{
										if ((pressMenuButton5)||(pressMenuButton6))
										{
											//скрываем связующие линии и возвращаем куб на место
											mLine.alpha = 0;
											cLine.alpha = 0;
											backCubic();
										}
										
										else
										{
											designerContainer.visible = true;
											designersTimeline.play();
										}
										pressMenuButton1 = true;
										pressMenuButton2 = false;
										pressMenuButton3 = false;					
										pressMenuButton4 = false;
										pressMenuButton5 = false;					
										pressMenuButton6 = false;
										
										
				 					}
									//если  нажата была  то уберем портянку
									else if (pressMenuButton1)
									{
										designerContainer.visible = false;
										designersTimeline.reverse();
										pressMenuButton1 = false;
										pressMenuButton5 = false;					
										pressMenuButton6 = false;
									}
									//убираем фильтры
										designer1.unFiltred(distortDesigner1);
										designer2.unFiltred(distortDesigner2);
										designer3.unFiltred(distortDesigner3);
										designer4.unFiltred(distortDesigner4);
										redrawDesign();
									trace("pess menu1");
								}
								else if(whatButtonIsPressed == 2)
								{
									if (!pressMenuButton2)
									{	
										if ((pressMenuButton5)||(pressMenuButton6))
										{
											//скрываем связующие линии и возвращаем куб на место
											mLine.alpha = 0;
											cLine.alpha = 0;
											backCubic();
										}
										else
										{
											
											TeamWorkContainer.visible = true;
											teamworkTimeline.play();
										}
										pressMenuButton2 = true;
										pressMenuButton1 = false;
										pressMenuButton3 = false;					
										pressMenuButton4 = false;
										pressMenuButton5 = false;					
										pressMenuButton6 = false;
										
										
									}
									else if (pressMenuButton2)
									{
										TeamWorkContainer.visible = false;
										teamworkTimeline.reverse()
										pressMenuButton2 = false;
										pressMenuButton5 = false;	
										pressMenuButton6 = false;
									}
									//убираем фильтры
										teamwork1.unFiltred(distortTeamwork1);
										teamwork2.unFiltred(distortTeamwork2);
										redrawTeamworks();
									trace("pess menu2");
									
								}
								else if(whatButtonIsPressed == 3)
								{
									if (!pressMenuButton3)
									{
										if ((pressMenuButton5)||(pressMenuButton6))
										{
											//скрываем связующие линии и возвращаем куб на место
											mLine.alpha = 0;
											cLine.alpha = 0;
											backCubic();
										}
										else
										{ 
											CooperationContainer.visible = true;	 
											cooperationTimeline.play();
										}
										pressMenuButton3 = true;
										pressMenuButton1 = false;
										pressMenuButton2 = false;					
										pressMenuButton4 = false;
										pressMenuButton5 = false;					
										pressMenuButton6 = false;
										
									}
									else if (pressMenuButton3)
									{
										CooperationContainer.visible = false;	 
										cooperationTimeline.reverse();
										pressMenuButton3 = false;
										pressMenuButton5 = false;	
										pressMenuButton6 = false;
									}
									//убираем фильтры
										cooperation1.unFiltred(distortCooperation1);
										cooperation2.unFiltred(distortCooperation2);
										redrawCooperation();
									trace("pess menu3");
									
								}
								else if(whatButtonIsPressed == 4)
								{
									//делаем линию для фильтров видимой.
									FilterLine.visible = true;
									// если кнопка 4 ненажата то проверям дальше
									if (!pressMenuButton4)
									{
										//если были нажаты 5 или 6 кнопки то вернем куб на место
										if ((pressMenuButton5)||(pressMenuButton6))
										{
											//скрываем связующие линии и возвращаем куб на место
											mLine.alpha = 0;
											cLine.alpha = 0;
											backCubic();
										}
										//если была нажата первая кнопа оставляем портянку в том же состоянии 
										//остальные делаем зафильтроваными
										else if (pressMenuButton1)
										{
											//врубаем две нижних плахи
											TeamWorkContainer.visible = true;
											CooperationContainer.visible = true;
											teamworkTimeline.play();
											cooperationTimeline.play();
											//показываем кнопки фильтров
											FilterTimeline.play();
											
											//закрываем сетку фильтрами
											teamwork1.filtred("pusto", distortTeamwork1);
											teamwork2.filtred("pusto", distortTeamwork2);
											redrawTeamworks();
									
											cooperation1.filtred("pusto", distortCooperation1);
											cooperation2.filtred("pusto", distortCooperation2);
											redrawCooperation();
										}
										//если была нажата вторая кнопа оставляем портянку в том же состоянии 
										//остальные делаем зафильтроваными
										else if (pressMenuButton2)
										{
											//врубаем верхнюю плахи чтобы их фильтровать
											designerContainer.visible = true;
											CooperationContainer.visible = true;	 
											designersTimeline.play();
											cooperationTimeline.play();
											//показываем кнопки фильтров
											FilterTimeline.play();
											
											//закрываем сетку фильтрами
											designer1.filtred("pusto", distortDesigner1);
											designer2.filtred("pusto", distortDesigner2);
											designer3.filtred("pusto", distortDesigner3);
											designer4.filtred("pusto", distortDesigner4);
											redrawDesign();
										
											cooperation1.filtred("pusto", distortCooperation1);
											cooperation2.filtred("pusto", distortCooperation2);
											redrawCooperation();
											
										}
										//если была нажата третья кнопа оставляем портянку в том же состоянии 
										//остальные делаем зафильтроваными
										else if (pressMenuButton3)
										{
											//врубаем верхнюю и среднюю плахи чтобы их фильтровать
											designerContainer.visible = true;
											TeamWorkContainer.visible = true;
											designersTimeline.play();
											teamworkTimeline.play();
											//показываем кнопки фильтров
											FilterTimeline.play();
											//закрываем сетку фильтрами
											designer1.filtred("pusto", distortDesigner1);
											designer2.filtred("pusto", distortDesigner2);
											designer3.filtred("pusto", distortDesigner3);
											designer4.filtred("pusto", distortDesigner4);
											redrawDesign();
										
											teamwork1.filtred("pusto", distortTeamwork1);
											teamwork2.filtred("pusto", distortTeamwork2);
											redrawTeamworks();
									
										}
										// иначе все делаем зафильтрованным
										else
										{
											//врубаем все плахи чтобы их фильтровать
											designerContainer.visible = true;
											TeamWorkContainer.visible = true;
											CooperationContainer.visible = true;	 
										
											designersTimeline.play();
											teamworkTimeline.play();
											cooperationTimeline.play();
											FilterTimeline.play();
											
											//закрываем сетку фильтрами
											designer1.filtred("pusto", distortDesigner1);
											designer2.filtred("pusto", distortDesigner2);
											designer3.filtred("pusto", distortDesigner3);
											designer4.filtred("pusto", distortDesigner4);
											redrawDesign();
										
											teamwork1.filtred("pusto", distortTeamwork1);
											teamwork2.filtred("pusto", distortTeamwork2);
											redrawTeamworks();
									
											cooperation1.filtred("pusto", distortCooperation1);
											cooperation2.filtred("pusto", distortCooperation2);
											redrawCooperation();
											
										}
										pressMenuButton4 = true;
										pressMenuButton5 = false;	
										pressMenuButton6 = false;
									}
									// если кнопка 4 уже была нажата то убираем кнопки с фильтрами, и отменяем фильтрацию
									else if (pressMenuButton4)
									{
										//все кнопки стали не прозрачными
										for (var i:int = 0; i < Filters.TotalListIndex; i++) 
										{
											FilterButtons[i].alpha = 1;
										}
										//отменяем фильтры
										designer1.unFiltred(distortDesigner1);
										designer2.unFiltred(distortDesigner2);
										designer3.unFiltred(distortDesigner3);
										designer4.unFiltred(distortDesigner4);
										redrawDesign();
										
										teamwork1.unFiltred(distortTeamwork1);
										teamwork2.unFiltred(distortTeamwork2);
										redrawTeamworks();
										
										cooperation1.unFiltred(distortCooperation1);
										cooperation2.unFiltred(distortCooperation2);
										redrawCooperation();
										
											FilterTimeline.reverse();
											pressMenuButton1 = false;
											pressMenuButton2 = false;	
											pressMenuButton3 = false;
											pressMenuButton4 = false;
											pressMenuButton5 = false;	
											pressMenuButton6 = false;
											
									}
									
									trace("pess menu4");
									
								}
								else if(whatButtonIsPressed == 5)
								{
									//показываем связующие линии
									cLine.alpha = 0;
									mLine.alpha = 1;
									//кнопка 5 нажата
									pressMenuButton5 = true;
									//остальные не нажаты
									pressMenuButton1 = false;
									pressMenuButton2 = false;
									pressMenuButton3 = false;
									pressMenuButton4 = false;
									
									
									if (pressMenuButton6)
									{
										trace("Т.к. кнопка 6 нажата то показываем текст")
										TextAboutContainer.visible = false;
										TextCubaContainer.visible = true;
										
										showTextCubaTimeline.gotoAndPlay(2);
										showTextAboutTimeline.gotoAndStop(0);
										//showTextCuba();
									}
									else
									{
										designerContainer.visible = false;
										TeamWorkContainer.visible = false;
										CooperationContainer.visible = false;	 
										//иначе двигаем куб
										cubmove();
									}
									
									trace("pess menu5");
									
									
								}
								else if(whatButtonIsPressed == 6)
								{
									//показываем связующие линии
									cLine.alpha = 1;
									mLine.alpha = 0;
									//кнопка 6 нажата
									pressMenuButton6 = true;
									//остальные не нажаты
									pressMenuButton1 = false;
									pressMenuButton2 = false;
									pressMenuButton3 = false;
									pressMenuButton4 = false;
									
									
									if (pressMenuButton5)
									{
										//убираем текст5
										TextCubaContainer.visible = false;
										TextAboutContainer.visible = true;
										
										showTextAboutTimeline.gotoAndPlay(1.5);
										showTextCubaTimeline.gotoAndStop(0);
										
										 //showTextAbout();
										trace("Т.к. кнопка 5 нажата кажем текст")
										
									}
									else
									{
										designerContainer.visible = false;
										TeamWorkContainer.visible = false;
										CooperationContainer.visible = false;	 
										//иначе двигаем куб
										cubmove();
									}
									
									trace("pess menu6");
									
								}
								
							}
							
							function appendTimeline():void 
							{
									//добавляем в таймлайны анимацию
									showTextCubaTimeline.append(TweenLite.to(mLine, 0.5, { x:0} ));
									showTextCubaTimeline.append(TweenLite.to(mFrame, 0.5, { y:0 } ));
									showTextCubaTimeline.append(TweenLite.to(mFramemask, 0.5, { y:0 } ));
									showTextCubaTimeline.append( TweenLite.to(TextCubaContainer, 0.5, { alpha:1 } ));
									showTextCubaTimeline.append( TweenLite.to(TextCuba, 0.5, { alpha:1, x:10 } ));
									
									showTextAboutTimeline.append(TweenLite.to(cLine, 0.5, { x:0} ));
									showTextAboutTimeline.append(TweenLite.to(cFrame, 0.5, {y:0}));
									showTextAboutTimeline.append( TweenLite.to(TextAboutContainer, 0.5, { alpha:1 } ));
									showTextAboutTimeline.append( TweenLite.to(TextAbout, 0.5, { alpha:1,x:10 } ));
							}
							
							
							//показываем текст при нажатии кнопки 5
							function showTextCuba():void 
							{
								/*if (!timeAppendCuba)
								{
									
									showTextCubaTimeline.append(TweenLite.to(mLine, 0.5, { x:0} ));
									showTextCubaTimeline.append(TweenLite.to(mFrame, 0.5, { y:0 } ));
									showTextCubaTimeline.append(TweenLite.to(mFramemask, 0.5, { y:0 } ));
									showTextCubaTimeline.append( TweenLite.to(TextCubaContainer, 0.5, { alpha:1 } ));
									showTextCubaTimeline.append( TweenLite.to(TextCuba, 0.5, { alpha:1,x:10 } ));
									timeAppendCuba = true;
								}*/
								showTextCubaTimeline.play();
								TextCubaContainer.visible = true;
							}
							//прячем текст5
							function hideTextCuba():void 
							{
								showTextCubaTimeline.reverse();
							}
							
							//показываем текст about кнопка 6
							function showTextAbout():void 
							{
							/*	if (!timeAppendAbout)
								{
									showTextAboutTimeline.append(TweenLite.to(cLine, 0.5, { x:0} ));
									showTextAboutTimeline.append(TweenLite.to(cFrame, 0.5, {y:0}));
									showTextAboutTimeline.append( TweenLite.to(TextAboutContainer, 0.5, { alpha:1 } ));
									showTextAboutTimeline.append( TweenLite.to(TextAbout, 0.5, { alpha:1,x:10 } ));
									timeAppendAbout= true;
								}*/
								showTextAboutTimeline.play();
								TextAboutContainer.visible = true;
							}
							//прячем текст about
							function hideTextAbout():void 
							{
								showTextAboutTimeline.reverse();
							}
							
							//двигаем куб при нажатии кнопки
							function cubmove():void 
							{
								//если куб был в центре то показываем текст на который нажали иначе двигаем его 
								if (!CubAfterCentr)
								{
									CubAfterCentr = true;
									onComplete();
								}
								else
								{
									if (!timeAppend)
									{
									//CubeMoveTimeline.insert(TweenLite.to(globalContainer, 1, { x:700,  ease:Regular.easeOut } ));
									//CubeMoveTimeline.insert(TweenLite.to(globalContainer, 1, { y: -500, ease:Regular.easeIn } ));
									CubeMoveTimeline.insert(TweenLite.to(cubicContainer, 1, { x:880,  ease:Regular.easeOut } ));
									CubeMoveTimeline.insert(TweenLite.to(cubicContainer, 1, { y: 100, ease:Regular.easeIn } ));
									timeAppend = true;
									}
									
								
								//TextAboutContainer.visible = true;
								CubeMoveTimeline.play();
								}
							}
							
							
							//возвращаем кубик на место
						function backCubic():void
						{
						   	//если нажата кнопка 5 прячем текст и возвращаем куб на место по событию реверс комплит
							if (pressMenuButton5)
							{
								hideTextCuba();
								
							}
							if (pressMenuButton6)
							{
								hideTextAbout();
								
							}
							removeEventListenerMenuButton();
							
						}
						//возвратим куб на место после того как он был в центре, если была нажата одна из клавиш текста.
						function GoHomeCub():void 
						{
						  var GoCub:TimelineLite= new TimelineLite({onComplete:onReverseComplete});
						  GoCub.insert(TweenLite.to(cubicContainer, 1, { x:cubeX,  ease:Regular.easeIn } ));
						  GoCub.insert(TweenLite.to(cubicContainer, 1, { y: cubeY, ease:Regular.easeOut } ));
					      GoCub.play();	
						}
						
						function onReverseShowAbout():void 
						{
							if ((pressMenuButton1)||(pressMenuButton2)||(pressMenuButton3)||(pressMenuButton4))
								{
								  if (!CubBeforeCentr)
								  {
									  GoHomeCub();
									  CubBeforeCentr = true;
								  }
								  else
									{
										CubeMoveTimeline.reverse();		
									}
								}
						}
						function onReverseShowCuba():void 
							{
								if ((pressMenuButton1)||(pressMenuButton2)||(pressMenuButton3)||(pressMenuButton4))
								{
									if (!CubBeforeCentr)
								  {
									  GoHomeCub();
									  CubBeforeCentr = true;
								  }
								  else
									{
									 CubeMoveTimeline.reverse();		
									}
								}
								
							}
						//вернули кубик на место	
						function onReverseComplete():void 
							{
								
								addEventListenerMenuButton();
								TextAboutContainer.visible = false;
								TextCubaContainer.visible = false;
								
								if (whatButtonIsPressed == 1)
								{
									designerContainer.visible = true;
									designersTimeline.play();
								}
															
								else if(whatButtonIsPressed == 2)
								{
									TeamWorkContainer.visible = true;
									teamworkTimeline.play();
								}
								else if(whatButtonIsPressed == 3)
								{
									CooperationContainer.visible = true;	 
									cooperationTimeline.play();
									
								}
								else if(whatButtonIsPressed == 4)
								{
									designerContainer.visible = true;
									TeamWorkContainer.visible = true;
									CooperationContainer.visible = true;	 
									designersTimeline.play();
									teamworkTimeline.play();
									cooperationTimeline.play();
									FilterTimeline.play();
									
									//закрываем сетку фильтрами
									designer1.filtred("pusto", distortDesigner1);
									designer2.filtred("pusto", distortDesigner2);
									designer3.filtred("pusto", distortDesigner3);
									designer4.filtred("pusto", distortDesigner4);
									redrawDesign();
										
									teamwork1.filtred("pusto", distortTeamwork1);
									teamwork2.filtred("pusto", distortTeamwork2);
									redrawTeamworks();
									
									cooperation1.filtred("pusto", distortCooperation1);
									cooperation2.filtred("pusto", distortCooperation2);
									redrawCooperation();
								}
								
							}
						function onComplete():void 
							{
								if (pressMenuButton5)
								{
									showTextCuba();
								}
								if (pressMenuButton6)
								{
									showTextAbout();
								}
								//addEventListenerMenuButton();
								trace("Complete")
							}	
						
						/**
						 * переменная для проверки добавлен ли в таймлайн  твин движения куба
						 */
						var timeAppend:Boolean = false;
						/**
						 * переменная для проверки добавлен ли в таймлайн "мы можем" твин
						 */
						var timeAppendCuba:Boolean = false;
						/**
						 * переменная для проверки добавлен ли в таймлайн "О нас" твин
						 */
						var timeAppendAbout:Boolean = false;
						
						/**
						 * положение анимационной рамки по X
						 */	
						var txtFrameX:Number = 127;
						/**
						 * положение анимационной рамки по Y
						 */	
						var txtFrameY:Number = 69;
						/**
						 * ширина анимационной рамки
						 */
						var txtFrameWidth:Number = 500;
						/**
						 * высота анимационной рамки
						 */
						var txtFrameHeight:Number = 646;
						/**
						 * таймлайн для анимации перемещения куба "
						 */
						var CubeMoveTimeline:TimelineLite = new TimelineLite( { onReverseComplete:onReverseComplete,onComplete:onComplete } );
						
						/**
						 * таймлайн для анимации куба при нажатии кннопки5 "Мы можем"
						 */
						var showTextCubaTimeline:TimelineLite = new TimelineLite({ onReverseComplete:onReverseShowCuba} );
						/**
						 * таймлайн для about
						 */
						var showTextAboutTimeline:TimelineLite = new TimelineLite({ onReverseComplete:onReverseShowAbout} );
						/**
						 * анимационная линия
						 */
						var cLine:Sprite = new Sprite();
						/**
						 * маска для линии
						 */ 
						var cLinemask:Sprite = new Sprite();
						//рисуем маску для линии
						cLinemask.graphics.beginFill(0xFFFFFF, 1);
						cLinemask.graphics.drawRect(txtFrameX+690, 0, txtFrameX-844, 300);
						cLinemask.graphics.endFill();
						addChild(cLinemask);
						// рисуем линию и двигаем ее за маску
						cLine.graphics.lineStyle(0.5, 0xFFFFFF);
						cLine.graphics.moveTo(txtFrameX+690, txtFrameY);
						cLine.graphics.lineTo( txtFrameX, txtFrameY);
						cLine.mask = cLinemask;
						cLine.x = 1000;
						addChild(cLine);
						
						/**
						 *  анимационная рамка
						 */
						var cFrame:Sprite = new Sprite();
						/**
						 * маска для анимационной рамки
						 */
						var cFramemask:Sprite = new Sprite();
						// рисуем маску
						cFramemask.graphics.beginFill(0xFFCCFF,0.5);
						cFramemask.graphics.drawRect(txtFrameX-2, txtFrameY, txtFrameWidth+10, txtFrameHeight+20);
						addChild(cFramemask);
						
						//рисуем рамку и помещаем ее за маску
						cFrame.graphics.lineStyle(0.5, 0xFFFFFF);
						cFrame.graphics.drawRect(txtFrameX, txtFrameY, txtFrameWidth, txtFrameHeight);
						cFrame.y = -700;
						cFrame.mask = cFramemask;
						addChild(cFrame);
											
						/**
						 * анимационная линия
						 */
						var mLine:Sprite = new Sprite();
						/**
						 * маска для линии mLine
						 */
						var mLineMask:Sprite = new Sprite();
						
						//рисуем маску для линии
						mLineMask.graphics.beginFill(0xFFFFFF, 1);
						mLineMask.graphics.drawRect(txtFrameX+683, 0, txtFrameX-844, 300);
						mLineMask.graphics.endFill();
						addChild(mLineMask);
						
						//рисуем линию
						mLine.graphics.lineStyle(0.5, 0xFFFFFF);
						mLine.graphics.moveTo(txtFrameX+690, txtFrameY+68.5);
						mLine.graphics.lineTo( txtFrameX+txtFrameWidth, txtFrameY+68.5);
						mLine.mask = mLineMask;
						mLine.x = 800;
						addChild(mLine);
						
						
						/**
						 *  анимационная рамка
						 */
						var mFrame:Sprite = new Sprite();
						/**
						 * маска для анимационной рамки
						 */
						var mFramemask:Sprite = new Sprite();
						// рисуем маску
						mFramemask.graphics.beginFill(0xFFCCFF,0.5);
						mFramemask.graphics.drawRect(txtFrameX-2, txtFrameY, txtFrameWidth+10, txtFrameHeight+20);
						mFramemask.y +=  68.5;
						addChild(mFramemask);
						
						//рисуем рамку и помещаем ее за маску
						mFrame.graphics.lineStyle(0.5, 0xFFFFFF);
						mFrame.graphics.drawRect(txtFrameX, txtFrameY, txtFrameWidth, txtFrameHeight);
					    mFrame.y = -580;
						mFrame.mask = mFramemask;
						addChild(mFrame);
						
						
						
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
			//var EndTweenCub:Boolean = false;// проверяем проиграл твин разворачивания куба или нет
			//функция проверяет какая кнопка была нажата и в соответствии с этим подсвечивает ее при выходе мыши из куба
			function onOutCub():void 
			{
					menu_color1.alpha = 0;
					menu_color2.alpha = 0;
					menu_color3.alpha = 0;
					menu_color4.alpha = 0;
					menu_color5.alpha = 0;
					menu_color6.alpha = 0;
					if (whatButtonIsPressed == 1)
					{
						menu_color1.alpha = 1;
						DesignerStroke.visible = true;
						TeamWorkStroke.visible = false;
						CooperationStroke.visible = false;
					
					}
															
					else if(whatButtonIsPressed == 2)
					{
						menu_color2.alpha = 1;
						TeamWorkStroke.visible = true;
						DesignerStroke.visible = false;
						CooperationStroke.visible = false;
				
					}
					else if(whatButtonIsPressed == 3)
					{
						menu_color3.alpha = 1;
						CooperationStroke.visible = true;
						DesignerStroke.visible = false;
						TeamWorkStroke.visible = false;
				
						
					}
					else if (whatButtonIsPressed == 4)
					{
						menu_color4.alpha = 1;
					}
					else if(whatButtonIsPressed == 5)
					{
						menu_color5.alpha = 1;
					}
					else if(whatButtonIsPressed == 6)
					{
						menu_color6.alpha = 1;
					}
					
					
			}// end function onOutCub
			
			
			//отслеживаем кнопку1 
			function menu1Out():void
			{
				onOutCub();
				trace("menu1 is OUT")
			}
			
			function menu1Over():void
			{
				var tx:Number = -TolTip1.width/2;
				var ty:Number= -35-TolTip1.height;
				Hint.OffSetXY(tx,ty);
				Hint.show(TolTip1);
				trace ("mx: ", mouseX, "my:", mouseY);
				trace ("tx: ", TolTip1.x, "ty:",TolTip1.y);
				
				//designerContainer.filters = [DesignerGlow];
				//CooperationContainer.filters = null;
				//TeamWorkContainer.filters = null;
				
				//обводим портянку на которую навели мышь
				DesignerStroke.visible = true;
				TeamWorkStroke.visible = false;
				CooperationStroke.visible = false;
				
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
			    //если куб в центре то двигаем его в левый угол, иначе просто разворачиваем
				if (!CubIsCentr)
				{
					CubMoveTimeline.append(TweenLite.to(cubicContainer, 0.5, { x:cubeX, y:cubeY } ) );
					CubMoveTimeline.play();
					CubIsCentr = true;
				}
				else
				{
					mLine.alpha = 0;
					cLine.alpha = 0;
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					tweenCube(0,44);
				}
				trace("menu1 is Click")
				
				menu_color1.alpha = 1;
				menu_color2.alpha = 0;
				menu_color3.alpha = 0;
				menu_color4.alpha = 0;
				menu_color5.alpha = 0;
				menu_color6.alpha = 0;
				//присваиваем переменной какая кнопка нажата
				whatButtonIsPressed = 1;
				//делаем линию для фильтров невидимой.
				FilterLine.visible = false;
				FilterTimeline.reverse();
				
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
				onOutCub();
				trace("menu2 is OUT")
			}
			
			function menu2Over():void
			{
				var tx:Number = 30;
				var ty:Number= -9-TolTip2.height;
				Hint.OffSetXY(tx,ty);
				Hint.show(TolTip2);
				//TeamWorkContainer.filters = [WithDesignersGlow];
				//designerContainer.filters = null;
				//CooperationContainer.filters = null;
				
				//обводим портянку на которую навели мышь
				
				TeamWorkStroke.visible = true;
				DesignerStroke.visible = false;
				CooperationStroke.visible = false;
				
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
			    //если куб в центре то двигаем его в левый угол, иначе просто разворачиваем
				if (!CubIsCentr)
				{
					CubMoveTimeline.append(TweenLite.to(cubicContainer, 0.5, { x:cubeX, y:cubeY } ) );
					CubMoveTimeline.play();
					CubIsCentr = true;
				}
				else
				{
					mLine.alpha = 0;
					cLine.alpha = 0;
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					tweenCube(0, 88);
				}
				trace("menu2 is Click")
				whatButtonIsPressed = 2;
				
				menu_color1.alpha = 0;
				menu_color2.alpha = 1;
				menu_color3.alpha = 0;
				menu_color4.alpha = 0;
				menu_color5.alpha = 0;
				menu_color6.alpha = 0;
				
				//делаем линию для фильтров невидимой.
				FilterLine.visible = false;
				FilterTimeline.reverse();
			/*	if (!pressMenuButton2)
				{
					if (pressMenuButton6)
					{backCubic();}
					TeamWorkContainer.alpha = 0;
					TeamWorkContainer.visible = true;
					var TeamWorkContainers:Tween = new Tween(TeamWorkContainer, "alpha", Regular.easeOut,0, 1, 1, true);
					buttonTween.push(TeamWorkContainers);
					pressMenuButton2 = true;
					pressMenuButton6 = false;
				}
				*/
			}				   
				
			//отслеживаем кнопку3
			function menu3Out():void
			{
				onOutCub();
				trace("menu3 is OUT")
			}
			
			function menu3Over():void
			{
				var tx:Number = 30;
				var ty:Number = 9;
				Hint.OffSetXY(tx,ty);
				Hint.show(TolTip3);
				//TeamWorkContainer.filters = null;
				//designerContainer.filters = null;
				//CooperationContainer.filters = [WithCompanyGlow];
				
				//обводим портянку на которую навели мышь
				CooperationStroke.visible = true;
				TeamWorkStroke.visible = false;
				DesignerStroke.visible = false;
				
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
			    //если куб в центре то двигаем его в левый угол, иначе просто разворачиваем
				if (!CubIsCentr)
				{
					CubMoveTimeline.append(TweenLite.to(cubicContainer, 0.5, { x:cubeX, y:cubeY } ) );
					CubMoveTimeline.play();
					CubIsCentr = true;
				}
				else
				{
					mLine.alpha = 0;
					cLine.alpha = 0;
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					tweenCube(0, 132);
				}
				trace("menu3 is Click")
				whatButtonIsPressed = 3;
				
				menu_color1.alpha = 0;
				menu_color2.alpha = 0;
				menu_color3.alpha = 1;
				menu_color4.alpha = 0;
				menu_color5.alpha = 0;
				menu_color6.alpha = 0;
				
				//делаем линию для фильтров невидимой.
				FilterLine.visible = false;
				FilterTimeline.reverse();
			/*	if (!pressMenuButton3)
				{
					if (pressMenuButton6)
					{backCubic();}
					CooperationContainer.alpha = 0;
					CooperationContainer.visible = true;
					var CooperationContainers:Tween = new Tween(CooperationContainer, "alpha", Regular.easeOut,0, 1, 1, true);
					buttonTween.push(CooperationContainers);
					pressMenuButton3 = true;
					pressMenuButton6 = false;
				} */
			}
			
			//отслеживаем кнопку4
			function menu4Out():void
			{
				onOutCub();
				trace("menu4 is OUT")
			}
			
			function menu4Over():void
			{
				var tx:Number = -TolTip1.width/2;
				var ty:Number = 35;
				Hint.OffSetXY(tx,ty);
				Hint.show(TolTip4);
				//TeamWorkContainer.filters = null;
				//designerContainer.filters = null;
				//CooperationContainer.filters = null;
				
				// делаем обводки невидимыми
				DesignerStroke.visible = false;
				TeamWorkStroke.visible = false;
				CooperationStroke.visible = false;
				
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
				 //если куб в центре то двигаем его в левый угол, иначе просто разворачиваем
				if (!CubIsCentr)
				{
					CubMoveTimeline.append(TweenLite.to(cubicContainer, 0.5, { x:cubeX, y:cubeY } ) );
					CubMoveTimeline.play();
					CubIsCentr = true;
				}
				else
				{
					mLine.alpha = 0;
					cLine.alpha = 0;
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					tweenCube(0, 176);
				}
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
				onOutCub();
				trace("menu5 is OUT")
			}
			
			function menu5Over():void
			{
				var tx:Number = -30-TolTip5.width/2;
				var ty:Number = 9;
				Hint.OffSetXY(tx,ty);
				Hint.show(TolTip5);
				//TeamWorkContainer.filters = null;
				//designerContainer.filters = null;
				//CooperationContainer.filters = null;
				
				// делаем обводки невидимыми
				DesignerStroke.visible = false;
				TeamWorkStroke.visible = false;
				CooperationStroke.visible = false;
				
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
			     //если куб в центре то двигаем его в левый угол, иначе просто разворачиваем
				if (!CubIsCentr)
				{
					CubMoveTimeline.insert(TweenLite.to(cubicContainer, 1, { x:880,  ease:Regular.easeOut } ));
					CubMoveTimeline.insert(TweenLite.to(cubicContainer, 1, { y: 100, ease:Regular.easeIn } ));
					CubMoveTimeline.play();
					CubIsCentr = true;
					
					
				}
				else
				{
					cLine.alpha = 0;
					mLine.alpha = 0;
					//showTextAboutTimeline.gotoAndStop(0);
					//showTextAboutTimeline.reverse();
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					tweenCube(0, 220);
				}	
				trace("menu5 is Click")
				whatButtonIsPressed = 5;
				
				menu_color1.alpha = 0;
				menu_color2.alpha = 0;
				menu_color3.alpha = 0;
				menu_color4.alpha = 0;
				menu_color5.alpha = 1;
				menu_color6.alpha = 0;
				//делаем линию для фильтров невидимой.
				FilterLine.visible = false;
				//вырубаем все плахи 
				designersTimeline.reverse();
				teamworkTimeline.reverse();
				cooperationTimeline.reverse();
				FilterTimeline.reverse();
			}
			//отслеживаем кнопку6
			function menu6Out():void
			{
				onOutCub();
				trace("menu6 is OUT")
			}
			
			function menu6Over():void
			{
				var tx:Number = -30-TolTip6.width/2;
				var ty:Number= -9-TolTip6.height;
				Hint.OffSetXY(tx,ty);
				Hint.show(TolTip6);
				//TeamWorkContainer.filters = null;
				//designerContainer.filters = null;
				//CooperationContainer.filters = null;
				
				
				// делаем обводки невидимыми
				DesignerStroke.visible = false;
				TeamWorkStroke.visible = false;
				CooperationStroke.visible = false;
				
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
			     //если куб в центре то двигаем его в левый угол, иначе просто разворачиваем
				if (!CubIsCentr)
				{
					CubMoveTimeline.insert(TweenLite.to(cubicContainer, 1, { x:880,  ease:Regular.easeOut } ));
					CubMoveTimeline.insert(TweenLite.to(cubicContainer, 1, { y: 100, ease:Regular.easeIn } ));
					CubMoveTimeline.play();
					CubIsCentr = true;
				}
				else
				{
					mLine.alpha = 0;
					cLine.alpha = 0;
					//showTextCubaTimeline.reverse();
					//showTextCubaTimeline.gotoAndStop(0);
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					tweenCube(0, 264);
				}	
				trace("menu6 is Click")
				whatButtonIsPressed = 6;
				
				menu_color1.alpha = 0;
				menu_color2.alpha = 0;
				menu_color3.alpha = 0;
				menu_color4.alpha = 0;
				menu_color5.alpha = 0;
				menu_color6.alpha = 1;
				//делаем линию для фильтров невидимой.
				FilterLine.visible = false;
				//вырубаем все плахи 
				designersTimeline.reverse();
				teamworkTimeline.reverse();
				cooperationTimeline.reverse();
				FilterTimeline.reverse();
				
				/*if (!pressMenuButton6)
				{
					
					
					CooperationContainer.visible = false;
					designerContainer.visible = false;
					TeamWorkContainer.visible = false;
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
			
			
			
			// вернули на место
			
			
							
			/**
			 *  контейнер хранит 4 плашки дизайнеров
			 */				
			var designerContainer:MovieClip = new MovieClip();
			/**
			 *  контейнер хранит 2 плашки с общими работами
			 */
			var TeamWorkContainer:MovieClip = new MovieClip();
			/**
			 * контейнер хранит 2 плашки с компаниями
			 */
			var CooperationContainer:MovieClip = new MovieClip();					
			/**
			 * путь к файлу с текстом о компании
			 */
			var urlAbout:String = "about.html";
			/**
			 * текстовое поле о компании
			 */
			var TextAbout:TextField=new TextField();
			/**
			 * контейнер в который пихаем текст о компании
			 */
			var TextAboutContainer:Sprite=new Sprite();
			// текстовый контейнер  делаем  невидимым
			TextAboutContainer.visible = false;
			
			/**
			 * путь к файлу с текстом "мы можем"
			 */
			var urlCuba:String = "cuba.html";
			/**
			 * текстовое поле "мы можем"
			 */
			var TextCuba:TextField = new TextField();
			/**
			 * контейнер в который пихаем текст "мы можем"
			 */
			var TextCubaContainer:Sprite = new Sprite(); 
			//текстовый контейнер  делаем невидимым
			TextCubaContainer.visible = false;
			
			/**
			 *  фильтр для куба
			 */
			var Cubicfilter:GlowFilter //= new GlowFilter(SHADOWCOLOR, 0.3, 100, 100, 2,3, false, false);
			// функция для считывания фильтра из XML
			function ApplyFilter():void 
			{
				Cubicfilter = new GlowFilter(CubeConfig.ShadowCubeColor, 0.3, 100, 100, 2, 3, false, false);
				//на кубик вешаем фильтр
				cubicContainer.filters = [Cubicfilter];
			}
			/**
			 * маска на всю сцену 
			 */
			var maska:Sprite = new Sprite();
			
			
			
			
			
			//таймлайны для анимации появления контейнеров с плахами.
			
			var designersTimeline:TimelineLite = new TimelineLite();
			var teamworkTimeline:TimelineLite = new TimelineLite();
			var cooperationTimeline:TimelineLite = new TimelineLite();
			
			designersTimeline.stop();
			designersTimeline.append(TweenLite.to(designerContainer, 0, { visible:1 } ) );
			designersTimeline.append(TweenLite.to(designerContainer, 0.5, { alpha:1 } ) );
			
			
			teamworkTimeline.stop();
			teamworkTimeline.append(TweenLite.to(TeamWorkContainer, 0, { visible:1 } ) );
			teamworkTimeline.append(TweenLite.to(TeamWorkContainer, 0.5, { alpha:1 } ) );
			
			cooperationTimeline.stop();
			cooperationTimeline.append(TweenLite.to(CooperationContainer, 0, { visible:1 } ) );
			cooperationTimeline.append(TweenLite.to(CooperationContainer, 0.5, { alpha:1 } ) );
			
			
			
			//designerContainer.cacheAsBitmap;
			//TeamWorkContainer.cacheAsBitmap;
			//CooperationContainer.cacheAsBitmap;
			
			designerContainer.x = 100;
			TeamWorkContainer.x = 100;
			CooperationContainer.x = 100;
			
			
			//создаем маску
			maska.graphics.beginFill(0xFFFFFF, 0.3);
			maska.graphics.lineStyle(0.5,0xFFFFFF);
			maska.graphics.drawRect(13, 10.5, 1000, 746);
			maska.graphics.endFill();
			addChild(maska);
			
			
			//добавляем все в один контейнер
			globalContainer.addChild(designerContainer);
			globalContainer.addChild(TeamWorkContainer);
			globalContainer.addChild(CooperationContainer);
			
			globalContainer.addChild(cubicContainer);
			globalContainer.mask = maska;
			addChild(globalContainer); 
			
			//loadAll();
			
			function loadAll():void
			{
			//добавляем в таймлайны анимацию	
			appendTimeline();
			/**
			 *  класс о компании  
			 */
			var txtColor:uint = CubeConfig.TextColor;
			var aboutTxt:HtmlTxtLoader= new HtmlTxtLoader(SHADOWCOLOR,CubeConfig.TextContainerColor1,CubeConfig.TextContainerAlpha,CubeConfig.TextContainerGradientColor, CubeConfig.TOOLTIPTEXT6.text,txtColor,CubeConfig.FillButton6,stage,TextAbout, TextAboutContainer, urlAbout); 
			var cubaTxt:HtmlTxtLoader = new HtmlTxtLoader(SHADOWCOLOR,CubeConfig.TextContainerColor2,CubeConfig.TextContainerAlpha,CubeConfig.TextContainerGradientColor,CubeConfig.TOOLTIPTEXT5.text,txtColor, CubeConfig.FillButton5, stage, TextCuba, TextCubaContainer, urlCuba);	
				
				TextCuba.x = -500;
				TextAbout.x = 500;
				TextAboutContainer.alpha = 0;
				TextAbout.alpha = 0;
				TextCubaContainer.alpha = 0;
				TextCuba.alpha = 0;
				
				//делаем контейнеры с плахами невидимыми и прозрачными
				designerContainer.visible = false
				TeamWorkContainer.visible = false
				CooperationContainer.visible=false
			
				designerContainer.alpha = 0;
				TeamWorkContainer.alpha = 0;
				CooperationContainer.alpha = 0;
				
				DesignerDraw(designerContainer); 
				WithDesigner(TeamWorkContainer);
				WithCompany(CooperationContainer);
				addChild(aboutTxt);
				addChild(cubaTxt);
				
			}
			
			
				
			
		} // End Public function Main 
		
		
		public static function Rasterize(clip : MovieClip):void 
		{
		
			while (clip.numChildren > 0) {clip.removeChildAt(0)};
			var clipContentsBound:Rectangle = clip.getBounds(clip);
			var bitmapData : BitmapData = new BitmapData(clipContentsBound.width, clipContentsBound.height, true, 0x00000000);
			var matrix:Matrix = new Matrix();
			matrix.translate( - clipContentsBound.x, - clipContentsBound.y);
			bitmapData.draw(clip, matrix);
			
			
			clip.graphics.clear();
			var bitmap:Bitmap = new Bitmap(bitmapData);
			bitmap.x = clipContentsBound.x;
			bitmap.y = clipContentsBound.y;
			clip.addChild(bitmap);
		}// end public static function Rasterize
		
		//=================Designer Draw========================================
		public function DesignerDraw(container:MovieClip):void
		{
			
			//==Описание Переменных=======================================================================================
		
			
			var mySprite:Array = [];//храним спрайты

			//var globalScene:MovieClip=new MovieClip(); //содержит все что на сцене

			
			/**
			 * фрейм для загрузки изображения
			 */
			var frame:MovieClip = new MovieClip();
			/**
			 *  кнопка для закрытия ихображения
			 */
			var closeFrame:Sprite = new Sprite();
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
			/*var cubeAlpha:Array=[0.6, 0.2, 0.6, 0.2, 0.3, 0.5, 0.4, 0.2,0.5,
								 0.4, 0.1, 0.4, 0.1, 0.2, 0.6, 0.3, 0.1, 0.3,
								 0.3, 0.2, 0.5, 0.2, 0.3, 0.4, 0.2,0.7,0.3,
							 	 0.4, 0.1, 0.3, 0.1, 0.2, 0.5, 0.3, 0.7,0.6]; */
			
								 							 
								 // массив прозрачностей
			/*var cubeAlpha:Array=[0.10, 0.62, 0.10, 0.62, 0.49, 0.23, 0.36, 0.62,0.5,
								 0.36, 0.75, 0.36, 0.75, 0.62, 0.10, 0.49, 0.75, 0.49,
								 0.49, 0.62, 0.23, 0.62, 0.49, 0.36, 0.62,0.7,0.23,
							 	 0.36, 0.75, 0.49, 0.75, 0.62, 0.23, 0.49, 0.75,0.49]; */
								 							 
								 // массив прозрачностей
			var cubeAlpha:Array=[0.10, 0.75, 0.15, 0.75, 0.6, 0.3, 0.45, 0.75,0.5,
								 0.45, 0.82, 0.45, 0.82, 0.75, 0.15, 0.6, 0.82, 0.6,
								 0.6, 0.75, 0.3, 0.75, 0.6, 0.45, 0.75,0.7,0.3,
							 	 0.45, 0.82, 0.6, 0.82, 0.75, 0.3, 0.6, 0.82,0.6]; 
			
			
			var clicks:Array = [];
								 
			
			

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
			
			
			//Переменные для смещения координат от центра
			var xcentr:uint; //Центр X
			var ycentr:uint; //Центр Y
			var shiftX:Array = [];//смещение по X
			var shiftY:Array = [];//смещение по Y
			
			//массив для заливки цветом фигур
			var color_cube:Array = []; //
			var feel_color:uint = FILLCOLOR1; //цвет заливки
			var outMouse_color:uint = 0x8080FF; // цвет при наведении
			var onClick_color:uint = 0xFF0000; // цвет при нажатии
			var lineStyle:Number = 1; //толщина линии
			var lineColor:uint = LINECOLOR; //цвет линии
			var StrokelineColor:uint=StrokeLineDesigners; //цвет линии выделения портянки
			var alphaButton:Number=1;//прозрачность для кнопки
			//таймлайн для анимации кнопки закрытия
			var timelineFrame:TimelineLite = new TimelineLite();
			
			/**
				 *  тень для портянки
				 */
				var ShadowPlain:Sprite = new Sprite();
			//==Конец Описания Переменных=======================================================================================
			
		// функция создания фрейма		 	
		function CreateFrame():void 
		{
				
			
			//создаем фрейм для загрузки полноформатного изображения
			frame.graphics.beginFill(0x000000, 0.5);
			frame.graphics.lineStyle(0.5,lineColor);
			frame.graphics.drawRect(12, 12, 1000, 744);
			frame.graphics.endFill();
			
			
			/**
				 * длинна сторон кнопки закрывалки
				 */
				 var s:Number = 12.5;
				 /**
				  * фильтр для крестика
				  */
				 var fltrCloseframe:DropShadowFilter = new DropShadowFilter(0, 0, 0x000000, 1,4,4,1);
				
				// область срабатывания
				
				 closeFrame.graphics.beginFill(0xFFFFFF, 0);
				 closeFrame.graphics.moveTo( -s, s);
				 closeFrame.graphics.lineTo( s,s);
				 closeFrame.graphics.lineTo( s,-s);
				 closeFrame.graphics.lineTo( -s, -s);
				 closeFrame.graphics.lineTo( -s, s);
				 closeFrame.graphics.endFill();
			     //сама кнопка
				/*   s = 11.25;
				 //closeFrame.graphics.lineStyle(0.5, 0x000000, 1);
				 closeFrame.graphics.beginFill(0x000000, 1);
				 closeFrame.graphics.moveTo( -s, s);
				 closeFrame.graphics.lineTo( s,s);
				 closeFrame.graphics.lineTo( s,-s);
				 closeFrame.graphics.lineTo( -s, -s);
				 closeFrame.graphics.lineTo( -s, s);
				 closeFrame.graphics.endFill();*/
			      s = 6.25;
				 closeFrame.graphics.lineStyle(2, 0xFFFFFF, 1,false,"normal",CapsStyle.NONE,JointStyle.MITER);
				 closeFrame.graphics.moveTo( -s, s);
				 closeFrame.graphics.lineTo( s,-s);
				 closeFrame.graphics.moveTo( s, s);
				 closeFrame.graphics.lineTo( -s,-s);
				 
			     
				 
				 closeFrame.x = 1003-3;
				 closeFrame.y = 22+3;
				 //closeFrame.scaleX = 0.75;
				 //closeFrame.scaleY = 0.75;
				 closeFrame.filters = [fltrCloseframe];
				 closeFrame.buttonMode = true;
				 
			     closeFrame.blendMode = BlendMode.LAYER;
				//добавляем таймлайн для анимации кнопки закрытия фрейма
				
				timelineFrame.stop();
				timelineFrame.append(TweenMax.to(closeFrame, 1, {dropShadowFilter:{blurX:6,blurY:6,strength:3,alpha:0.8}}));
				//timelineFrame.append(TweenLite.to(closeFrame, 0.2, { scaleX:1,scaleY:1 } )); 
				
			}	
			//создаем фрейм
			CreateFrame();
			//пихаем тень в контейнер
			container.addChild(ShadowPlain);
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
				obj.graphics.lineStyle(1, lineColor);
				obj.graphics.beginFill(NAVIGATIONBUTTONCOLOR, 0.6);
				obj.graphics.moveTo(pentX[n0], pentY[n0]);
				obj.graphics.lineTo(pentX[n1], pentY[n1]);
				obj.graphics.lineTo(pentX[n2], pentY[n2]);
				obj.graphics.lineTo(pentX[n3], pentY[n3]);
				obj.graphics.lineTo(pentX[n4], pentY[n4]);
				obj.graphics.lineTo(pentX[n0], pentY[n0]);
				obj.graphics.endFill();
				obj.buttonMode = true;
				obj.x =- 2.5;
				if (!obj.stage)
					{
					  container.addChild(obj);
					}
			}
			
			function createPentagons():void 
			{
				trace("вызываем createPentagons")
				createPentagon(pentagon1, 0, 1, 2, 3, 4);
				createPentagon(pentagon2, 3, 2, 5, 6, 7);
				createPentagon(pentagon3, 6, 5, 8, 9, 10);
				createPentagon(pentagon4, 9, 8, 11, 12, 13);
			}
			
			
			
			//функция для создания анимационной линии
			/**
			 * @param   btn - кнопка для картинки
			 * @param   pnt - точка от которой рисовать
			 * @param	lineContainer - контейнер для маски и линии
			 * @param	cLine  - линия 
			 * @param	cLinemask - маска для линии
			 * @param   Dname - имя дизайнера  
			 * @param   Dcontact - контакты дизайнера
			 * @param   Dmail - e-mail дизайнера
			 */
			function createLine(btn:Sprite,pnt:int,lineContainer:Sprite,cLine:Sprite,cLinemask:Sprite,Dname:TextField,Dcontact:TextField,Dmail:TextField):void 
			{
						var btW:Number = 10;
						var btH:Number = 20;
						//рисуем кнопку
						btn.graphics.lineStyle(0.5, lineColor);
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
						//lineContainer.addChild(btn);
						
						//рисуем маску для линии
						cLinemask.graphics.beginFill(0xFFFFFF, 1);
						cLinemask.graphics.drawRect(pentX[pnt], pentY[pnt]-20, -300, 40);
						cLinemask.graphics.endFill();
						lineContainer.addChild(cLinemask);
						
						// рисуем линию и двигаем ее за маску
						cLine.graphics.lineStyle(0.5, lineColor);
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
						Dcontact.appendText("\n" + Dmail.text);
						Dname.selectable = false;
						Dcontact.selectable = false;
						
						//подложка 
						var plain:Sprite = new Sprite();
						plain.graphics.beginFill(0x000000, 0);
						plain.graphics.moveTo(pentX[pnt], pentY[pnt]);
						plain.graphics.lineTo(0, pentY[pnt]);
						plain.graphics.lineTo(0, pentY[pnt] + 20);
						plain.graphics.lineTo(pentX[pnt], pentY[pnt] + 20);
						plain.graphics.lineTo(pentX[pnt], pentY[pnt]);
						
						plain.graphics.moveTo(pentX[pnt], pentY[pnt]);
						plain.graphics.lineTo(0, pentY[pnt]);
						plain.graphics.lineTo(0, pentY[pnt] - 20);
						plain.graphics.lineTo(pentX[pnt], pentY[pnt] - 20);
						plain.graphics.lineTo(pentX[pnt], pentY[pnt]);
						
						plain.graphics.endFill();
						
						
						
						lineContainer.addChild(Dname);
						lineContainer.addChild(Dcontact);
						lineContainer.addChild(plain);
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
			createLine(d1Button,4, d1Container, d1Line, d1MaskLine, designer1.dName, designer1.dContacts,designer1.dMail);
			createLine(d2Button,7, d2Container, d2Line, d2MaskLine, designer2.dName, designer2.dContacts,designer2.dMail);
			createLine(d3Button,10, d3Container, d3Line, d3MaskLine, designer3.dName, designer3.dContacts,designer3.dMail);
			createLine(d4Button,13,d4Container, d4Line, d4MaskLine, designer4.dName, designer4.dContacts,designer4.dMail);
			
			//создаем пентагоны
			createPentagons();
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
			
			//добавляем слушателей на пентагоны
			addEventListenersPentagons();
			function addEventListenersPentagons():void 
			{
				//вешаем события на пентагоны
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
				
				//вешаем события на линии с показом информации о дизайнерах
				d1Container.addEventListener(MouseEvent.MOUSE_DOWN, pentagon1onClick);
				d1Container.addEventListener(MouseEvent.MOUSE_OVER, pentagon1onOver);
				d1Container.addEventListener(MouseEvent.MOUSE_OUT, pentagon1onOut);
				d1Container.buttonMode = true;
				
				d2Container.addEventListener(MouseEvent.MOUSE_DOWN, pentagon2onClick);
				d2Container.addEventListener(MouseEvent.MOUSE_OVER, pentagon2onOver);
				d2Container.addEventListener(MouseEvent.MOUSE_OUT, pentagon2onOut);
				d2Container.buttonMode = true;
				
				d3Container.addEventListener(MouseEvent.MOUSE_DOWN, pentagon3onClick);
				d3Container.addEventListener(MouseEvent.MOUSE_OVER, pentagon3onOver);
				d3Container.addEventListener(MouseEvent.MOUSE_OUT, pentagon3onOut);
				d3Container.buttonMode = true;
				
				d4Container.addEventListener(MouseEvent.MOUSE_DOWN, pentagon4onClick);
				d4Container.addEventListener(MouseEvent.MOUSE_OVER, pentagon4onOver);
				d4Container.addEventListener(MouseEvent.MOUSE_OUT, pentagon4onOut);
				d4Container.buttonMode = true;
				
				//вешаем события на кнопки которые с линией контактов
				d1Button.addEventListener(MouseEvent.CLICK, ond1ButtonClick);
				d2Button.addEventListener(MouseEvent.CLICK, ond2ButtonClick);
				d3Button.addEventListener(MouseEvent.CLICK, ond3ButtonClick);
				d4Button.addEventListener(MouseEvent.CLICK, ond4ButtonClick);
			}
			
			/**
			 *  таймлайн для движения основного контейнера по оси X
			 */
			var TimelineContainer:TimelineLite = new TimelineLite();
			TimelineContainer.stop();
			TimelineContainer.append(TweenLite.to(container, 0.5, { x:400 } ) );
			
			/**
			 * проверка на нажатие кнопки дизайнера1
			 */
			var d1Pressed:Boolean = false;
			/**
			 * проверка на нажатие кнопки дизайнера2
			 */
			var d2Pressed:Boolean = false;
			/**
			 * проверка на нажатие кнопки дизайнера3
			 */
			var d3Pressed:Boolean = false;
			/**
			 * проверка на нажатие кнопки дизайнера4
			 */
			var d4Pressed:Boolean = false;
			/**
			 * фото для первого дизайнера
			 */
			var d1Photo:PicLoader = new PicLoader();
			/**
			 * фото для второго дизайнера
			 */
			var d2Photo:PicLoader = new PicLoader();
			/**
			 * фото для третьего дизайнера
			 */
			var d3Photo:PicLoader = new PicLoader();
			/**
			 * фото для четвертого дизайнера
			 */
			var d4Photo:PicLoader = new PicLoader();
			
			//нажали на кнопку показа фото  дизайнера1
			function ond1ButtonClick(event:MouseEvent):void 
			{
				if (!d1Pressed)
				{
					d1Photo.LoadPic(designer1.dPhoto1, 100, 200);
					d1Photo.x = d1Button.x - 105;
					d1Photo.y = d1Button.y - 50;
					d1Container.addChild(d1Photo);
					
					d1Pressed = true;
					TimelineContainer.play();
					d1Button.alpha = 0.5;
				}
				else if (d1Pressed)
				{
					d1Pressed = false;
					TimelineContainer.reverse();
					d1Button.alpha = 1;
					d1Container.removeChild(d1Photo);
				}
				trace("button1");
			}
			//нажали на кнопку показа фото  дизайнера2
			function ond2ButtonClick(event:MouseEvent):void 
			{
				if (!d2Pressed)
				{
					d2Photo.LoadPic(designer2.dPhoto1, 100, 200);
					d2Photo.x = d2Button.x - 105;
					d2Photo.y = d2Button.y - 50;
					d2Container.addChild(d2Photo);
					
					d2Pressed = true;
					TimelineContainer.play();
					d2Button.alpha = 0.5;
				}
				else if (d2Pressed)
				{
					d2Pressed = false;
					TimelineContainer.reverse();
					d2Button.alpha = 1;
					d2Container.removeChild(d2Photo);
				}
				trace("button2");
			}
			//нажали на кнопку показа фото  дизайнера3
			function ond3ButtonClick(event:MouseEvent):void 
			{
				if (!d3Pressed)
				{
					d3Photo.LoadPic(designer3.dPhoto1, 100, 200);
					d3Photo.x = d3Button.x - 105;
					d3Photo.y = d3Button.y - 50;
					d3Container.addChild(d3Photo);
					
					d3Pressed = true;
					TimelineContainer.play();
					d3Button.alpha = 0.5;
				}
				else if (d3Pressed)
				{
					d3Pressed = false;
					TimelineContainer.reverse();
					d3Button.alpha = 1;
					d3Container.removeChild(d3Photo);
				}
				trace("button3");
			}
			//нажали на кнопку показа фото  дизайнера4
			function ond4ButtonClick(event:MouseEvent):void 
			{
				if (!d4Pressed)
				{
					d4Photo.LoadPic(designer4.dPhoto1, 100, 200);
					d4Photo.x = d4Button.x - 105;
					d4Photo.y = d4Button.y - 50;
					d4Container.addChild(d4Photo);
					
					d4Pressed = true;
					TimelineContainer.play();
					d4Button.alpha = 0.5;
				}
				else if (d4Pressed)
				{
					d4Pressed = false;
					TimelineContainer.reverse();
					d4Button.alpha = 1;
					d4Container.removeChild(d4Photo);
				}
				trace("button4");
			}
			
			/**
			 * проверка на нажатие пентагона1
			 */
			var pentagon1Pressed:Boolean = false;
			/**
			 * проверка на нажатие пентагона2
			 */
			var pentagon2Pressed:Boolean = false;
			/**
			 * проверка на нажатие пентагона3
			 */
			var pentagon3Pressed:Boolean = false;
			/**
			 * проверка на нажатие пентагона4
			 */
			var pentagon4Pressed:Boolean = false;
			/**
			 * создаем форму обратной связи
			 */
			var MailBackForm:BackForm = new BackForm();
			addChild(MailBackForm);
			//MailBackForm.x = container.x;
			//MailBackForm.y = container.y;
			pentagon1.alpha = 0.6;
			pentagon2.alpha = 0.6;
			pentagon3.alpha = 0.6;
			pentagon4.alpha = 0.6;
			//при выходе фокуса мыши из пентагона1
			
			function pentagon1onOut(event:MouseEvent):void 
			{
				//если не нажимали на пентагон то уводим линию назад
				
				/*if (!pentagon1Pressed)
				{
				 TimeLineDesigner1.reverse();
				 trace("вышли")
				}*/
				TimeLineDesigner1.reverse();
				pentagon1.alpha = 0.6;
				
			}
			//при наведении на пентагон1 
			function pentagon1onOver(event:MouseEvent):void 
			{
				Hint.show(SendMessageToolTip);
				TimeLineDesigner1.play();
				pentagon1.alpha = 1;
			}
			//при нажатии на пентагон 1
			function pentagon1onClick(event:MouseEvent):void 
			{
				MailBackForm.MailForm(designer1.dMail.text);
				//если нажат то ставим флаг в состояние нажат, иначе в состояние не нажат 
				/*if (!pentagon1Pressed)
				{
					pentagon1.alpha = 0.5;
					pentagon1Pressed = true;
					TimeLineDesigner1.play();
				}
				else if (pentagon1Pressed)
				{
					pentagon1.alpha = 1;
					pentagon1Pressed = false;
					TimeLineDesigner1.reverse();
				}*/
			}
			
			
			//при выходе фокуса мыши из пентагона2
			
			function pentagon2onOut(event:MouseEvent):void 
			{
				/*if (!pentagon2Pressed)
				{	TimeLineDesigner2.reverse();
					trace("вышли")
				}*/
				TimeLineDesigner2.reverse();
				pentagon2.alpha = 0.6;
				
			}
			//при наведении на пентагон2 
			function pentagon2onOver(event:MouseEvent):void 
			{
				Hint.show(SendMessageToolTip);
				TimeLineDesigner2.play();
				pentagon2.alpha = 1;
			}
			//при нажатии на пентагон 2
			function pentagon2onClick(event:MouseEvent):void 
			{
				MailBackForm.MailForm(designer2.dMail.text);
				//если нажат то ставим флаг в состояние нажат, иначе в состояние не нажат 
				/*if (!pentagon2Pressed)
				{
					pentagon2.alpha = 0.5;
					pentagon2Pressed = true;
					TimeLineDesigner2.play();
				}
				else if (pentagon2Pressed)
				{
					pentagon2.alpha = 1;
					pentagon2Pressed = false;
					TimeLineDesigner2.reverse();
				}*/
			}
			
			//при выходе фокуса мыши из пентагона3
			
			function pentagon3onOut(event:MouseEvent):void 
			{
				/*if (!pentagon3Pressed)
				{
					TimeLineDesigner3.reverse();
					trace("вышли")
				}*/
				TimeLineDesigner3.reverse();
				pentagon3.alpha = 0.6;
				
			}
			//при наведении на пентагон3 
			function pentagon3onOver(event:MouseEvent):void 
			{
				Hint.show(SendMessageToolTip);
				TimeLineDesigner3.play();
				pentagon3.alpha = 1;
			}
			//при нажатии на пентагон 3
			function pentagon3onClick(event:MouseEvent):void 
			{
				MailBackForm.MailForm(designer3.dMail.text);
				//если нажат то ставим флаг в состояние нажат, иначе в состояние не нажат 
				/*if (!pentagon3Pressed)
				{
					pentagon3.alpha = 0.5;
					pentagon3Pressed = true;
					TimeLineDesigner3.play();
				}
				else if (pentagon3Pressed)
				{
					pentagon3.alpha = 1;
					pentagon3Pressed = false;
					TimeLineDesigner3.reverse();
				}*/
			}
			//при выходе фокуса мыши из пентагона4
			
			function pentagon4onOut(event:MouseEvent):void 
			{
				/*if(!pentagon4Pressed)
				{
					TimeLineDesigner4.reverse();
					trace("вышли")
				}*/
				TimeLineDesigner4.reverse();
				pentagon4.alpha = 0.6;
			}
			//при наведении на пентагон4 
			function pentagon4onOver(event:MouseEvent):void 
			{
				Hint.show(SendMessageToolTip);
				TimeLineDesigner4.play();
				pentagon4.alpha = 1;
			}
			//при нажатии на пентагон 4
			function pentagon4onClick(event:MouseEvent):void 
			{
				MailBackForm.MailForm(designer4.dMail.text);
				//если нажат то ставим флаг в состояние нажат, иначе в состояние не нажат 
				/*if (!pentagon4Pressed)
				{
					pentagon4.alpha = 0.5;
					pentagon4Pressed = true;
					TimeLineDesigner4.play();
				}
				else if (pentagon4Pressed)
				{
					pentagon4.alpha = 1;
					pentagon4Pressed = false;
					TimeLineDesigner4.reverse();
				}*/
			}
			//==============================================================================
			// создаем глобальные функции для показа линий с именем дизайнера при наведении на превью 
			/**
			 * 
			 * @param	id указывает какой таймлайн проигрывать
			 */
			ShowDesignerLine= function SDL(id:String):void 
			{
				if (id == "designer1")
				{
					TimeLineDesigner1.play();
				}
				else if (id == "designer2")
				{
					TimeLineDesigner2.play();
				}
				else if (id == "designer3")
				{
					TimeLineDesigner3.play();
				}
				else if (id == "designer4")
				{
					TimeLineDesigner4.play();
				}
			}
			
			HideDesignerLine = function HDL():void 
			{
				TimeLineDesigner1.reverse();
				TimeLineDesigner2.reverse();
				TimeLineDesigner3.reverse();
				TimeLineDesigner4.reverse();
				
			}
			
			//==============================================================================
			// обводка для листалок left
			var strokeprev1:Sprite = new Sprite();
			var strokeprev2:Sprite = new Sprite();
			var strokeprev3:Sprite = new Sprite();
			var strokeprev4:Sprite = new Sprite();
			// обводка для листалок right
			var strokenext1:Sprite = new Sprite();
			var strokenext2:Sprite = new Sprite();
			var strokenext3:Sprite = new Sprite();
			var strokenext4:Sprite = new Sprite();
			//создаем кнопки листалки
			
			function createPicButton(btn1:Sprite,str1:Sprite,btn2:Sprite,str2:Sprite,n1:int,n2:int):void
			{
				var width:Number = 12.5;
				//рисуем кнопку1
				btn1.graphics.lineStyle(1, lineColor);
				btn1.graphics.beginFill(NAVIGATIONBUTTONCOLOR,alphaButton);
				btn1.graphics.moveTo(xn[n1], yn[n1]);
				btn1.graphics.lineTo(xn[n1] - width, yn[n1]);
				btn1.graphics.lineTo(xn[n1+10] - width, yn[n1+10]);
				btn1.graphics.lineTo(xn[n1+10] , yn[n1+10]);
				btn1.graphics.lineTo(xn[n1] , yn[n1]);
				btn1.buttonMode = true;
				//рисуем обводку для кнопки1
				str1.graphics.lineStyle(1, lineColor);
				str1.graphics.moveTo(xn[n1], yn[n1]);
				str1.graphics.lineTo(xn[n1] - width, yn[n1]);
				str1.graphics.lineTo(xn[n1+10] - width, yn[n1+10]);
				str1.graphics.lineTo(xn[n1+10] , yn[n1+10]);
				str1.graphics.lineTo(xn[n1] , yn[n1]);
				
						
				btn2.graphics.lineStyle(1, lineColor);
				btn2.graphics.beginFill(NAVIGATIONBUTTONCOLOR, alphaButton);
				btn2.graphics.moveTo(xn[n2], yn[n2]);
				btn2.graphics.lineTo(xn[n2] + width, yn[n2]);
				btn2.graphics.lineTo(xn[n2+10] + width, yn[n2+10]);
				btn2.graphics.lineTo(xn[n2+10] , yn[n2+10]);
				btn2.graphics.lineTo(xn[n2] , yn[n2]);
				btn2.buttonMode = true;
				
				//рисуем обводку для кнопки2
				str2.graphics.lineStyle(1, lineColor);
				str2.graphics.moveTo(xn[n2], yn[n2]);
				str2.graphics.lineTo(xn[n2] + width, yn[n2]);
				str2.graphics.lineTo(xn[n2+10] + width, yn[n2+10]);
				str2.graphics.lineTo(xn[n2+10] , yn[n2+10]);
				str2.graphics.lineTo(xn[n2] , yn[n2]);
				
				
				if (!str1.stage)
					{
					  container.addChild(str1);
						
					}
				if (!str2.stage)
					{
					  container.addChild(str2);
						
					}
				
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
				trace("Вызываем createBtns");
				createPicButton(prevbutton1,strokeprev1, nextbutton1,strokenext1, 0, 8);	
				createPicButton(prevbutton2,strokeprev2, nextbutton2,strokenext2, 10, 19);	
				createPicButton(prevbutton3,strokeprev3, nextbutton3,strokenext3, 20, 27);	
				createPicButton(prevbutton4,strokeprev4, nextbutton4,strokenext4, 30, 38);	
			}
			
			createBtns();
			
			//добавляем слушатели на листалки 
			// для первого дизайнера если картинок больше 8 то добавляем слушателей на кнопки листалки иначе делаем прозрачной кнопку next
			if (designer1.count > 8)
			{				
				prevbutton1.addEventListener(MouseEvent.MOUSE_DOWN, prevbutton1OnClick);
				prevbutton1.addEventListener(MouseEvent.MOUSE_OVER, prevbuttonOnOver);
				nextbutton1.addEventListener(MouseEvent.MOUSE_DOWN, nextbutton1OnClick);
				nextbutton1.addEventListener(MouseEvent.MOUSE_OVER, nextbuttonOnOver);
			}
			else
			{
				nextbutton1.alpha = 0;
			}
			// для второго дизайнера если картинок больше 9 то добавляем слушателей на кнопки листалки иначе делаем прозрачной кнопку next
			if (designer2.count > 9)
			{
				prevbutton2.addEventListener(MouseEvent.MOUSE_DOWN, prevbutton2OnClick);
				prevbutton2.addEventListener(MouseEvent.MOUSE_OVER, prevbuttonOnOver);
				nextbutton2.addEventListener(MouseEvent.MOUSE_DOWN, nextbutton2OnClick);
				nextbutton2.addEventListener(MouseEvent.MOUSE_OVER, nextbuttonOnOver);
			}
			else
			{
				nextbutton2.alpha = 0;
			}
			// для третьего дизайнера если картинок больше 7 то добавляем слушателей на кнопки листалки иначе делаем прозрачной кнопку next
			if (designer3.count > 7)
			{
				prevbutton3.addEventListener(MouseEvent.MOUSE_DOWN, prevbutton3OnClick);
				prevbutton3.addEventListener(MouseEvent.MOUSE_OVER, prevbuttonOnOver);
				nextbutton3.addEventListener(MouseEvent.MOUSE_DOWN, nextbutton3OnClick);
				nextbutton3.addEventListener(MouseEvent.MOUSE_OVER, nextbuttonOnOver);
			}
			else
			{
				nextbutton3.alpha = 0;
			}
			
			// для четвертого дизайнера если картинок больше 8 то добавляем слушателей на кнопки листалки иначе делаем прозрачной кнопку next
			if (designer4.count > 8)
			{
				prevbutton4.addEventListener(MouseEvent.MOUSE_DOWN, prevbutton4OnClick);
				prevbutton4.addEventListener(MouseEvent.MOUSE_OVER, prevbuttonOnOver);
				nextbutton4.addEventListener(MouseEvent.MOUSE_DOWN, nextbutton4OnClick);
				nextbutton4.addEventListener(MouseEvent.MOUSE_OVER, nextbuttonOnOver);
			}
			else
			{
				nextbutton4.alpha = 0;
			}
			//делаем кнопки листалки слева прозрачными, т.к. изначально слева некуда листать
			prevbutton1.alpha = 0;
			prevbutton2.alpha = 0;
			prevbutton3.alpha = 0;
			prevbutton4.alpha = 0;
			
			//обработчики для всех кнопок при наведении для показа хинтов
			function prevbuttonOnOver(event:MouseEvent):void 
			{
				Hint.show(PrevToolTip);
			}
			function nextbuttonOnOver(event:MouseEvent):void 
			{
				Hint.show(NextToolTip);
			}
			
			// обработчики для первых листалок
			function prevbutton1OnClick():void
			{
			  var ytmp:Array = [];
			  var tmp:Array = [];
			  nextbutton1.alpha = 1;
			if (countD1 > 0)
			{
			  countD1--;
			  
			  if (countD1 < 1)
			  {
				 prevbutton1.alpha = 0; 
				
			  }
			  
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
				 prevbutton1.alpha = 1;
				 countD1++
				  if (countD1 > designer1.count - 9)
				{
					nextbutton1.alpha = 0;
				}
				 
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
				nextbutton2.alpha = 1;
			  if (countD2 > 0)
			  {
				  countD2--;
				   if (countD2 < 1)
					{
						prevbutton2.alpha = 0; 
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
				 prevbutton2.alpha = 1;
				 countD2++
				   if (countD2 > designer2.count - 10)
					{
						nextbutton2.alpha = 0;
					} 
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
				nextbutton3.alpha = 1;
			  if (countD3 > 0)
			  {
				  countD3--;
				  if (countD3 < 1)
					{
						prevbutton3.alpha = 0; 
					}
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
				 prevbutton3.alpha = 1;
				 countD3++
				 if (countD3 > designer3.count - 8)
					{
						nextbutton3.alpha = 0;
					}  
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
				nextbutton4.alpha = 1;
			  if (countD4 > 0)
			  {
				  countD4--;
				  if (countD4 < 1)
					{
						prevbutton4.alpha = 0; 
					}
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
				 prevbutton4.alpha = 1;
				 countD4++
				  if (countD4 > designer4.count - 9)
					{
						nextbutton4.alpha = 0;
					}  
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
			{   trace("Вызываем DriwingCurve");
				//Первый ряд
				linears(mySprite[0],xn[0],yn[0],xn[1],yn[1],xn[10],yn[10],xn[11],yn[11],color_cube[0],cubeAlpha[0],lineStyle,lineColor);
				linears(mySprite[1],xn[1],yn[1],xn[2],yn[2],xn[11],yn[11],xn[12],yn[12],color_cube[1],cubeAlpha[1],lineStyle,lineColor);
			 	linears(mySprite[2],xn[2],yn[2],xn[3],yn[3],xn[12],yn[12],xn[13],yn[13],color_cube[2],cubeAlpha[2],lineStyle,lineColor);
				linears(mySprite[3],xn[3],yn[3],xn[4],yn[4],xn[13],yn[13],xn[14],yn[14],color_cube[3],cubeAlpha[3],lineStyle,lineColor);
				linears(mySprite[4],xn[4],yn[4],xn[5],yn[5],xn[14],yn[14],xn[15],yn[15],color_cube[4],cubeAlpha[4],lineStyle,lineColor);
				linears(mySprite[5],xn[5],yn[5],xn[6],yn[6],xn[15],yn[15],xn[16],yn[16],color_cube[5],cubeAlpha[5],lineStyle,lineColor);
				linears(mySprite[6],xn[6],yn[6],xn[7],yn[7],xn[16],yn[16],xn[17],yn[17],color_cube[6],cubeAlpha[6],lineStyle,lineColor);
				linears(mySprite[7],xn[7],yn[7],xn[8],yn[8],xn[17],yn[17],xn[18],yn[18],color_cube[7],cubeAlpha[7],lineStyle,lineColor);
				//linears(mySprite[8],xn[8],yn[8],xn[9],yn[9],xn[18],yn[18],xn[19],yn[19],ArrBitmap[8],Mymatrix,color_cube[8],cubeAlpha[8],lineStyle,lineColor);
				//Второй ряд
				linears(mySprite[9],xn[10],yn[10],xn[11],yn[11],xn[20],yn[20],xn[21],yn[21],color_cube[9],cubeAlpha[9],lineStyle,lineColor);
				linears(mySprite[10],xn[11],yn[11],xn[12],yn[12],xn[21],yn[21],xn[22],yn[22],color_cube[10],cubeAlpha[10],lineStyle,lineColor);
				linears(mySprite[11],xn[12],yn[12],xn[13],yn[13],xn[22],yn[22],xn[23],yn[23],color_cube[11],cubeAlpha[11],lineStyle,lineColor);
				linears(mySprite[12],xn[13],yn[13],xn[14],yn[14],xn[23],yn[23],xn[24],yn[24],color_cube[12],cubeAlpha[12],lineStyle,lineColor);
				linears(mySprite[13],xn[14],yn[14],xn[15],yn[15],xn[24],yn[24],xn[25],yn[25],color_cube[13],cubeAlpha[13],lineStyle,lineColor);
				linears(mySprite[14],xn[15],yn[15],xn[16],yn[16],xn[25],yn[25],xn[26],yn[26],color_cube[14],cubeAlpha[14],lineStyle,lineColor);
				linears(mySprite[15],xn[16],yn[16],xn[17],yn[17],xn[26],yn[26],xn[27],yn[27],color_cube[15],cubeAlpha[15],lineStyle,lineColor);
				linears(mySprite[16],xn[17],yn[17],xn[18],yn[18],xn[27],yn[27],xn[28],yn[28],color_cube[16],cubeAlpha[16],lineStyle,lineColor);
				linears(mySprite[17],xn[18],yn[18],xn[19],yn[19],xn[28],yn[28],xn[29],yn[29],color_cube[17],cubeAlpha[17],lineStyle,lineColor);
				
				//Третий ряд
				linears(mySprite[18],xn[20],yn[20],xn[21],yn[21],xn[30],yn[30],xn[31],yn[31],color_cube[18],cubeAlpha[18],lineStyle,lineColor);
				linears(mySprite[19],xn[21],yn[21],xn[22],yn[22],xn[31],yn[31],xn[32],yn[32],color_cube[19],cubeAlpha[19],lineStyle,lineColor);
				linears(mySprite[20],xn[22],yn[22],xn[23],yn[23],xn[32],yn[32],xn[33],yn[33],color_cube[20],cubeAlpha[20],lineStyle,lineColor);
				linears(mySprite[21],xn[23],yn[23],xn[24],yn[24],xn[33],yn[33],xn[34],yn[34],color_cube[21],cubeAlpha[21],lineStyle,lineColor);
				linears(mySprite[22],xn[24],yn[24],xn[25],yn[25],xn[34],yn[34],xn[35],yn[35],color_cube[22],cubeAlpha[22],lineStyle,lineColor);
				linears(mySprite[23],xn[25],yn[25],xn[26],yn[26],xn[35],yn[35],xn[36],yn[36],color_cube[23],cubeAlpha[23],lineStyle,lineColor);
				linears(mySprite[24],xn[26],yn[26],xn[27],yn[27],xn[36],yn[36],xn[37],yn[37],color_cube[24],cubeAlpha[24],lineStyle,lineColor);
				//linears(mySprite[25],xn[27],yn[27],xn[28],yn[28],xn[37],yn[37],xn[38],yn[38],ArrBitmap[25],Mymatrix,color_cube[25],cubeAlpha[25],lineStyle,lineColor);
				//linears(mySprite[26],xn[28],yn[28],xn[29],yn[29],xn[38],yn[38],xn[39],yn[39],ArrBitmap[26],Mymatrix,color_cube[26],cubeAlpha[26],lineStyle,lineColor);
				//Четвертый ряд
				linears(mySprite[27],xn[30],yn[30],xn[31],yn[31],xn[40],yn[40],xn[41],yn[41],color_cube[27],cubeAlpha[27],lineStyle,lineColor);
				linears(mySprite[28],xn[31],yn[31],xn[32],yn[32],xn[41],yn[41],xn[42],yn[42],color_cube[28],cubeAlpha[28],lineStyle,lineColor);
				linears(mySprite[29],xn[32],yn[32],xn[33],yn[33],xn[42],yn[42],xn[43],yn[43],color_cube[29],cubeAlpha[29],lineStyle,lineColor);
				linears(mySprite[30],xn[33],yn[33],xn[34],yn[34],xn[43],yn[43],xn[44],yn[44],color_cube[30],cubeAlpha[30],lineStyle,lineColor);
				linears(mySprite[31],xn[34],yn[34],xn[35],yn[35],xn[44],yn[44],xn[45],yn[45],color_cube[31],cubeAlpha[31],lineStyle,lineColor);
				linears(mySprite[32],xn[35],yn[35],xn[36],yn[36],xn[45],yn[45],xn[46],yn[46],color_cube[32],cubeAlpha[32],lineStyle,lineColor);
				linears(mySprite[33],xn[36],yn[36],xn[37],yn[37],xn[46],yn[46],xn[47],yn[47],color_cube[33],cubeAlpha[33],lineStyle,lineColor);
				linears(mySprite[34],xn[37],yn[37],xn[38],yn[38],xn[47],yn[47],xn[48],yn[48],color_cube[34],cubeAlpha[34],lineStyle,lineColor);
				//linears(mySprite[35],xn[38],yn[38],xn[39],yn[39],xn[48],yn[48],xn[49],yn[49],ArrBitmap[35],Mymatrix,color_cube[35],cubeAlpha[35],lineStyle,lineColor);
				
				
			} // конец функции DriwingCurve
			
			// функция для создания искаженных битмапов
			
			function drawdistortDesigner(addchld:Boolean=false):void
			{
			  //дизайнер1
			  
			  trace("Вызываем drawdistortDesigner");
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
			  distortDesigner2[8].setTransform(xn[18], yn[18], xn[19], yn[19], xn[29], yn[29], xn[28], yn[28]);	
			  
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
				trace("СОздаем дисторты")
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
							x3:Number, y3:Number, x4:Number, y4:Number, 
							obj_color:uint, obj_alpha:Number,obj_lineStyle:Number,obj_lineColor:uint):void 
				{
				   	
					
					var n:Graphics = obj.graphics;
					n.clear();
					//===========Затеняем
					n.beginFill(obj_color,obj_alpha);
					n.lineStyle(obj_lineStyle,obj_lineColor);
					n.moveTo(x1,y1);
					//n.moveTo(x4,y4);//пересечение
					n.lineTo(x1,y1);
					n.lineTo(x2,y2);
					//n.lineTo(x3,y3);//пересечение
					n.lineTo(x4,y4);
					n.lineTo(x3,y3);
					n.lineTo(x1,y1);
					n.endFill();
					
	                //obj.cacheAsBitmap;
					
					//===========Затеняем
					n.beginFill(PLATOLIGHT1,obj_alpha);
					n.lineStyle(obj_lineStyle,obj_lineColor);
					n.moveTo(x1,y1);
					n.lineTo(x1,y1);
					n.lineTo(x2,y2);
					n.lineTo(x4,y4);
					n.lineTo(x3,y3);
					n.lineTo(x1,y1);
					n.endFill();
					obj.buttonMode=true;
			        obj.cacheAsBitmap=true;
					obj.blendMode = BlendMode.HARDLIGHT;
				   //Rasterize(obj);
				   
					if (!obj.stage)
					{
						
						container.addChild(obj);
						//trace("проверка Obj",obj.name);
					}
					
						
					/*if (!container.stage)
					{
						//trace("проверка Container");
						//globalScene.addChild(container);
						
					}
					if (!globalScene.stage)
					{
						//trace("проверка Global");
						//addChild(globalScene);
					}*/
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
				
				// рисуем тень для портянки
				function CreateShadow():void 
				{
					trace("вызываем CreateShadow");
					var delta:int = 27;
					var delta2:int = 3;
					
					ShadowPlain.graphics.clear();
					
					ShadowPlain.graphics.beginFill(SHADOWCOLOR, 0.5);
					ShadowPlain.graphics.moveTo(xn[40], yn[40]);
					ShadowPlain.graphics.lineTo(xn[41], yn[41]);
					ShadowPlain.graphics.lineTo(xn[42], yn[42]);
					ShadowPlain.graphics.lineTo(xn[43], yn[43]);
					ShadowPlain.graphics.lineTo(xn[44], yn[44]);
					ShadowPlain.graphics.lineTo(xn[45], yn[45]);
					ShadowPlain.graphics.lineTo(xn[46], yn[46]);
					ShadowPlain.graphics.lineTo(xn[47], yn[47]);
					ShadowPlain.graphics.lineTo(xn[48], yn[48]);
					
					//ShadowPlain.graphics.lineTo(xn[48], yn[48]);
					ShadowPlain.graphics.lineTo(xn[47]+delta, yOrig[40] + (yOrig[40]-yn[47])/delta2);
					ShadowPlain.graphics.lineTo(xn[46]+delta, yOrig[40] + (yOrig[40]-yn[46])/delta2);
					ShadowPlain.graphics.lineTo(xn[45]+delta, yOrig[40] + (yOrig[40]-yn[45])/delta2);
					ShadowPlain.graphics.lineTo(xn[44]+delta, yOrig[40] + (yOrig[40]-yn[44])/delta2);
					ShadowPlain.graphics.lineTo(xn[43]+delta, yOrig[40] + (yOrig[40]-yn[43])/delta2);
					ShadowPlain.graphics.lineTo(xn[42]+delta, yOrig[40] + (yOrig[40]-yn[42])/delta2);
					ShadowPlain.graphics.lineTo(xn[41]+delta, yOrig[40] + (yOrig[40]-yn[41])/delta2);
					ShadowPlain.graphics.lineTo(xn[40], yn[40]);
					ShadowPlain.graphics.endFill();
					
					
					
					ShadowPlain.graphics.beginFill(SHADOWCOLOR, 0.5);
					ShadowPlain.graphics.moveTo(xn[37], yn[37]);
					ShadowPlain.graphics.lineTo(xn[27], yn[27]);
					ShadowPlain.graphics.lineTo(xn[28], yn[28]);
					ShadowPlain.graphics.lineTo(xn[29], yn[29]);
					ShadowPlain.graphics.lineTo(xn[19], yn[19]);
					
					ShadowPlain.graphics.lineTo(xn[29], yOrig[20]+delta2 + (yOrig[20]-yn[29])/delta2);
					ShadowPlain.graphics.lineTo(xn[28]+delta, yOrig[20]+delta2 + (yOrig[20]-yn[28])/delta2);
					ShadowPlain.graphics.lineTo(xn[27]+delta, yOrig[20]+delta2 + (yOrig[20]-yn[27])/delta2);
					ShadowPlain.graphics.lineTo(xn[37]+delta, yOrig[30]+delta2 + (yOrig[30]-yn[37])/delta2);
					
					ShadowPlain.graphics.endFill();
					
					
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
					/*for (i = 0; i < 37; i++) 
					{
						mySprite[i].graphics.clear();
					 
					}*/
					trace("Вызываем ClearingAll");
					
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
					strokeprev1.graphics.clear();
					strokeprev2.graphics.clear();
					strokeprev3.graphics.clear();
					strokeprev4.graphics.clear();
					
					nextbutton1.graphics.clear();
					nextbutton2.graphics.clear();
					nextbutton3.graphics.clear();
					nextbutton4.graphics.clear();
					strokenext1.graphics.clear();
					strokenext2.graphics.clear();
					strokenext3.graphics.clear();
					strokenext4.graphics.clear();
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
					var button:MovieClip = e.currentTarget as MovieClip;
					//trace(color_cube[button.value]);
					button.alpha = 0;
					
					
					// проверяем по рядам на какой навели, для того и показываем линию с дизайнером
					if ((button.value >=0) && (button.value<8))
					{
						TimeLineDesigner1.play();
					}
					else if ((button.value >=9) && (button.value<18))
					{
						TimeLineDesigner2.play();
					}
					else if ((button.value >=18) && (button.value<27))
					{
						TimeLineDesigner3.play();
					}
					else if ((button.value >=27) && (button.value<36))
					{
						TimeLineDesigner4.play();
					}
					
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
						//Получаем кнопку из события
						var button:MovieClip = e.currentTarget as MovieClip;
						//100% прозрачность
						button.alpha = 1;						
						
						TimeLineDesigner1.reverse();
						TimeLineDesigner2.reverse();
						TimeLineDesigner3.reverse();
						TimeLineDesigner4.reverse();
						
						if (button.pressed)
						{
							color_cube[button.value] = feel_color;	
						}
						getOrigCoord();
						RedrawDesigners();
						
						
					}
					

					//Это вызывается, когда мышкой кликнули по кнопке
					function mouseClickHandler(e:MouseEvent):void 
					{
						//нажали
						clickON=true;
						//trace("Pressed");
						//кнопка как таргет объект 
						var button:MovieClip = e.currentTarget as MovieClip;
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
							description = designer1.dName.text +designer1.dWHO[0 + countD1]+ " | " + designer1.dText[0 + countD1];
							BmpLoader.loadadres(url_full, url_project,description);
						} 
						else if (button == mySprite[1]) 
						{
							
							url_full = designer1.dFullImage[1 + countD1];
							url_project = designer1.dProject[1 + countD1];
							description = designer1.dName.text +designer1.dWHO[1 + countD1]+ " | " + designer1.dText[1 + countD1];
							BmpLoader.loadadres(url_full, url_project,description);
						} 
						else if (button == mySprite[2]) 
						{
							
							url_full = designer1.dFullImage[2 + countD1];
							url_project = designer1.dProject[2 + countD1];
							description = designer1.dName.text +designer1.dWHO[2 + countD1]+ " | " + designer1.dText[2 + countD1];
							BmpLoader.loadadres(url_full, url_project,description);
						} 
						else if (button == mySprite[3]) 
						{
							
							url_full = designer1.dFullImage[3 + countD1];
							url_project = designer1.dProject[3 + countD1];
							description = designer1.dName.text +designer1.dWHO[3 + countD1]+ " | " + designer1.dText[3 + countD1];
							BmpLoader.loadadres(url_full, url_project,description);
						} 
						else if (button == mySprite[4]) 
						{
							
							url_full = designer1.dFullImage[4 + countD1];
							url_project = designer1.dProject[4 + countD1];
							description = designer1.dName.text +designer1.dWHO[4 + countD1]+ " | " + designer1.dText[4 + countD1];
							BmpLoader.loadadres(url_full, url_project,description);
						} 
						else if (button == mySprite[5]) 
						{
							
							url_full = designer1.dFullImage[5 + countD1];
							url_project = designer1.dProject[5 + countD1];
							description = designer1.dName.text +designer1.dWHO[5 + countD1]+ " | " + designer1.dText[5 + countD1];
							BmpLoader.loadadres(url_full, url_project,description);
						} 
						else if (button == mySprite[6]) 
						{
							
							url_full = designer1.dFullImage[6 + countD1];
							url_project = designer1.dProject[6 + countD1];
							description = designer1.dName.text +designer1.dWHO[6 + countD1]+ " | " + designer1.dText[6 + countD1];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[7]) 
						{
							
							url_full = designer1.dFullImage[7 + countD1];
							url_project = designer1.dProject[7 + countD1];
							description = designer1.dName.text +designer1.dWHO[7 + countD1]+ " | " + designer1.dText[7 + countD1];
							BmpLoader.loadadres(url_full, url_project,description);
						} 
						else if (button == mySprite[8]) 
						{
							
							url_full = designer1.dFullImage[8 + countD1];
							url_project = designer1.dProject[8 + countD1];
							description = designer1.dName.text +designer1.dWHO[8 + countD1]+ " | " + designer1.dText[8 + countD1];
							BmpLoader.loadadres(url_full, url_project,description);
						} 
						else if (button == mySprite[9]) 
						{
							url_full = designer2.dFullImage[0 + countD2];
							url_project = designer2.dProject[0 + countD2];
							description = designer2.dName.text +designer2.dWHO[0 + countD2]+ " | " + designer2.dText[0 + countD2];
							BmpLoader.loadadres(url_full, url_project,description);
							
							
						} 
						else if (button == mySprite[10]) 
						{
							
							url_full = designer2.dFullImage[1 + countD2];
							url_project = designer2.dProject[1 + countD2];
							description = designer2.dName.text +designer2.dWHO[1 + countD2]+ " | " + designer2.dText[1 + countD2];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[11]) 
						{
							
							url_full = designer2.dFullImage[2 + countD2];
							url_project = designer2.dProject[2 + countD2];
							description = designer2.dName.text +designer2.dWHO[2 + countD2]+ " | " + designer2.dText[2 + countD2];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[12]) 
						{
							
							url_full = designer2.dFullImage[3 + countD2];
							url_project = designer2.dProject[3 + countD2];
							description = designer2.dName.text +designer2.dWHO[3 + countD2]+ " | " + designer2.dText[3 + countD2];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[13]) 
						{
							
							url_full = designer2.dFullImage[4 + countD2];
							url_project = designer2.dProject[4 + countD2];
							description = designer2.dName.text +designer2.dWHO[4 + countD2]+ " | " + designer2.dText[4 + countD2];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[14]) 
						{
							
							url_full = designer2.dFullImage[5 + countD2];
							url_project = designer2.dProject[5 + countD2];
							description = designer2.dName.text +designer2.dWHO[5 + countD2]+ " | " + designer2.dText[5 + countD2];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[15]) 
						{
							
							url_full = designer2.dFullImage[6 + countD2];
							url_project = designer2.dProject[6 + countD2];
							description = designer2.dName.text +designer2.dWHO[6 + countD2]+ " | " + designer2.dText[6 + countD2];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[16]) 
						{
							
							url_full = designer2.dFullImage[7 + countD2];
							url_project = designer2.dProject[7 + countD2];
							description = designer2.dName.text +designer2.dWHO[7 + countD2]+ " | " + designer2.dText[7 + countD2];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[17]) 
						{
							
							url_full = designer2.dFullImage[8 + countD2];
							url_project = designer2.dProject[8 + countD2];
							description = designer2.dName.text +designer2.dWHO[8 + countD2]+ " | " + designer2.dText[8 + countD2];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[18]) 
						{
							
							url_full = designer3.dFullImage[0 + countD3];
							url_project = designer3.dProject[0 + countD3];
							description = designer3.dName.text +designer3.dWHO[0 + countD3]+ " | " + designer3.dText[0 + countD3];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[19]) 
						{
							
							url_full = designer3.dFullImage[1 + countD3];
							url_project = designer3.dProject[1 + countD3];
							description = designer3.dName.text +designer3.dWHO[1 + countD3]+ " | " + designer3.dText[1 + countD3];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[20]) 
						{
							
							url_full = designer3.dFullImage[2 + countD3];
							url_project = designer3.dProject[2 + countD3];
							description = designer3.dName.text +designer3.dWHO[2 + countD3]+ " | " + designer3.dText[2 + countD3];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[21]) 
						{
							
							url_full = designer3.dFullImage[3 + countD3];
							url_project = designer3.dProject[3 + countD3];
							description = designer3.dName.text +designer3.dWHO[3 + countD3]+ " | " + designer3.dText[3 + countD3];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[22]) 
						{
							
							url_full = designer3.dFullImage[4 + countD3];
							url_project = designer3.dProject[4 + countD3];
							description = designer3.dName.text +designer3.dWHO[4 + countD3]+ " | " + designer3.dText[4 + countD3];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[23]) 
						{
							
							url_full = designer3.dFullImage[5 + countD3];
							url_project = designer3.dProject[5 + countD3];
							description = designer3.dName.text +designer3.dWHO[5 + countD3]+ " | " + designer3.dText[5 + countD3];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[24]) 
						{
							
							url_full = designer3.dFullImage[6 + countD3];
							url_project = designer3.dProject[6 + countD3];
							description = designer3.dName.text +designer3.dWHO[6 + countD3]+ " | " + designer3.dText[6 + countD3];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[25]) 
						{
							
							url_full = designer3.dFullImage[7 + countD3];
							url_project = designer3.dProject[7 + countD3];
							description = designer3.dName.text +designer3.dWHO[7 + countD3]+ " | " + designer3.dText[7 + countD3];
							BmpLoader.loadadres(url_full, url_project,description);
						}
	
						else if (button == mySprite[26]) 
						{
							
							url_full = designer3.dFullImage[8 + countD3];
							url_project = designer3.dProject[8 + countD3];
							description = designer3.dName.text +designer3.dWHO[8 + countD3]+ " | " + designer3.dText[8 + countD3];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[27]) 
						{
							
							url_full = designer4.dFullImage[0 + countD4];
							url_project = designer4.dProject[0 + countD4];
							description = designer4.dName.text +designer4.dWHO[0 + countD4]+ " | " + designer4.dText[0 + countD4];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[28]) 
						{
							
							url_full = designer4.dFullImage[1 + countD4];
							url_project = designer4.dProject[1 + countD4];
							description = designer4.dName.text +designer4.dWHO[1 + countD4]+ " | " + designer4.dText[1 + countD4];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[29]) 
						{
							
							url_full = designer4.dFullImage[2 + countD4];
							url_project = designer4.dProject[2 + countD4];
							description = designer4.dName.text +designer4.dWHO[2 + countD4]+ " | " + designer4.dText[2 + countD4];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[30]) 
						{
							
							url_full = designer4.dFullImage[3 + countD4];
							url_project = designer4.dProject[3 + countD4];
							description = designer4.dName.text +designer4.dWHO[3 + countD4]+ " | " + designer4.dText[3 + countD4];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[31]) 
						{
							
							url_full = designer4.dFullImage[4 + countD4];
							url_project = designer4.dProject[4 + countD4];
							description = designer4.dName.text +designer4.dWHO[4 + countD4]+ " | " + designer4.dText[4 + countD4];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[32]) 
						{
							url_full = designer4.dFullImage[5 + countD4];
							url_project = designer4.dProject[5 + countD4];
							description = designer4.dName.text +designer4.dWHO[5 + countD4]+ " | " + designer4.dText[5 + countD4];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[33]) 
						{
							url_full = designer4.dFullImage[6 + countD4];
							url_project = designer4.dProject[6 + countD4];
							description = designer4.dName.text +designer4.dWHO[6 + countD4]+ " | " + designer4.dText[6 + countD4];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[34]) 
						{
							url_full = designer4.dFullImage[7 + countD4];
							url_project = designer4.dProject[7 + countD4];
							description = designer4.dName.text +designer4.dWHO[7 + countD4]+ " | " + designer4.dText[7 + countD4];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[35]) 
						{
							url_full = designer4.dFullImage[8 + countD4];
							url_project = designer4.dProject[8 + countD4];
							description = designer4.dName.text +designer4.dWHO[8 + countD4]+ " | " + designer4.dText[8 + countD4];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[36]) 
						{
							url_full = designer4.dFullImage[9 + countD4];
							url_project = designer4.dProject[9 + countD4];
							description = designer4.dName.text +designer4.dWHO[9 + countD4]+ " | " + designer4.dText[9 + countD4];
							BmpLoader.loadadres(url_full, url_project,description);
						}
					} // End function mouseClickHandler

					
					var contr:int = 0;
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
							 DesignerStroke.graphics.clear();
							 CreateStrokeLine();
							 CreateShadow();
							 //contr++;
							 trace("Вызываем RedrawDesigners");
							 
						}
				
		      			//глобальная функция для перерисовки ссылка на локальную
					redrawDesign=function Redraw():void
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
							 DesignerStroke.graphics.clear();
							 CreateStrokeLine();
							 CreateShadow();
						}
			    // рисуем линию обводки
				function CreateStrokeLine():void 
				{
					trace("вызываем CreateStrokeLine");
					
					DesignerStroke.graphics.lineStyle(4, StrokelineColor, 1,false,"normal",CapsStyle.NONE,JointStyle.MITER);
					DesignerStroke.graphics.moveTo(xn[0], yn[0]);
					DesignerStroke.graphics.lineTo(xn[1], yn[1]);
					DesignerStroke.graphics.lineTo(xn[2], yn[2]);
					DesignerStroke.graphics.lineTo(xn[3], yn[3]);
					DesignerStroke.graphics.lineTo(xn[4], yn[4]);
					DesignerStroke.graphics.lineTo(xn[5], yn[5]);
					DesignerStroke.graphics.lineTo(xn[6], yn[6]);
					DesignerStroke.graphics.lineTo(xn[7], yn[7]);
					DesignerStroke.graphics.lineTo(xn[8], yn[8]);
					DesignerStroke.graphics.lineTo(xn[18], yn[18]);
					DesignerStroke.graphics.lineTo(xn[19], yn[19]);
					DesignerStroke.graphics.lineTo(xn[29], yn[29]);
					DesignerStroke.graphics.lineTo(xn[28], yn[28]);
					DesignerStroke.graphics.lineTo(xn[27], yn[27]);
					DesignerStroke.graphics.lineTo(xn[37], yn[37]);
					DesignerStroke.graphics.lineTo(xn[38], yn[38]);
					DesignerStroke.graphics.lineTo(xn[48], yn[48]);
					DesignerStroke.graphics.lineTo(xn[47], yn[47]);
					DesignerStroke.graphics.lineTo(xn[46], yn[46]);
					DesignerStroke.graphics.lineTo(xn[45], yn[45]);
					DesignerStroke.graphics.lineTo(xn[44], yn[44]);
					DesignerStroke.graphics.lineTo(xn[43], yn[43]);
					DesignerStroke.graphics.lineTo(xn[42], yn[42]);
					DesignerStroke.graphics.lineTo(xn[41], yn[41]);
					DesignerStroke.graphics.lineTo(xn[40], yn[40]);
					DesignerStroke.graphics.lineTo(xn[30], yn[30]);
					DesignerStroke.graphics.lineTo(xn[20], yn[20]);
					DesignerStroke.graphics.lineTo(xn[10], yn[10]);
					DesignerStroke.graphics.lineTo(xn[0], yn[0]);
					
					if (!DesignerStroke.stage)
					{
						container.addChild(DesignerStroke);
					}
				} // end function CreateStrokeLine
			}//End public function DesignerDraw 
		
//=======================================================================================================================================================================================================================================================				
		
			// WithDesigner teamwork
			
			public function WithDesigner(container:MovieClip):void
		{
			//==Описание Переменных=======================================================================================
		
			
			var mySprite:Array = [];//храним спрайты

			//var container:MovieClip=new MovieClip(); // содержит все мувики
			//var globalScene:MovieClip=new MovieClip(); //содержит все что на сцене

			
			/** 
			* фрейм для загрузки изображения
			 */
			var frame:MovieClip = new MovieClip();
			/**
			 *  кнопка для закрытия ихображения
			 */
			var closeFrame:Sprite = new Sprite();
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
		
		
			var xOrig:Array=[];
			var yOrig:Array=[];
            var xn_:Array = [];// пересылочные координаты по X
			var yn_:Array = [];// пересылочные координаты по Y
			var clickON:Boolean=false;
			// массив прозрачностей
			/*var cubeAlpha:Array=[0.6, 0.2, 0.6, 0.2, 0.3, 0.5, 0.4, 0.2,0.5,
								 0.4, 0.1, 0.4, 0.1, 0.2, 0.6, 0.3, 0.1, 0.3,
								 0.3, 0.2, 0.5, 0.2, 0.3, 0.4, 0.2,0.7,0.3,
							 	 0.4, 0.1, 0.3, 0.1, 0.2, 0.5, 0.3, 0.7,0.6]; */
	   	    // массив прозрачностей
			var cubeAlpha:Array=[0.10, 0.75, 0.15, 0.75, 0.6, 0.3, 0.45, 0.75,0.5,
								 0.45, 0.82, 0.45, 0.82, 0.75, 0.15, 0.6, 0.82, 0.6,
								 0.6, 0.75, 0.3, 0.75, 0.6, 0.45, 0.75,0.7,0.3,
							 	 0.45, 0.82, 0.6, 0.82, 0.75, 0.3, 0.6, 0.82,0.6]; 
			
			
			var clicks:Array = [];
								 
			
			

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
			
				
			//Переменные для смещения координат от центра
			var xcentr:uint; //Центр X
			var ycentr:uint; //Центр Y
			var shiftX:Array = [];//смещение по X
			var shiftY:Array = [];//смещение по Y
			
			//массив для заливки цветом фигур
			var color_cube:Array = []; //
			var feel_color:uint = FILLCOLOR2; //цвет заливки
			var outMouse_color:uint = 0x8080FF; // цвет при наведении
			var onClick_color:uint = 0xFF0000; // цвет при нажатии
			var lineStyle:Number = 1; //толщина линии
			var lineColor:uint = LINECOLOR; //цвет линии
			var StrokelineColor:uint=StrokeLineTeamWork; //цвет линии выделения портянки
			var alphaButton:Number=1;//прозрачность для кнопки
			
			
			
			//таймлайн для анимации кнопки закрытия
			var timelineFrame:TimelineLite = new TimelineLite();
			
			/**
				 *  тень для портянки
				 */
				var ShadowPlain:Sprite = new Sprite();
			//==Конец Описания Переменных=======================================================================================
			
		// функция создания фрейма		 	
		function CreateFrame():void 
		{
				
			
			//создаем фрейм для загрузки полноформатного изображения
			frame.graphics.beginFill(0x000000, 0.5);
			frame.graphics.lineStyle(0.5,lineColor);
			frame.graphics.drawRect(12, 12, 1000, 744);
			frame.graphics.endFill();
			
			
			/**
				 * длинна сторон кнопки закрывалки
				 */
				 var s:Number = 12.5;
				 /**
				  * фильтр для крестика
				  */
				 var fltrCloseframe:DropShadowFilter = new DropShadowFilter(0, 0, 0x000000, 1,4,4,1);
				
				// область срабатывания
				
				 closeFrame.graphics.beginFill(0xFFFFFF, 0);
				 closeFrame.graphics.moveTo( -s, s);
				 closeFrame.graphics.lineTo( s,s);
				 closeFrame.graphics.lineTo( s,-s);
				 closeFrame.graphics.lineTo( -s, -s);
				 closeFrame.graphics.lineTo( -s, s);
				 closeFrame.graphics.endFill();
			     //сама кнопка
				/*   s = 11.25;
				 //closeFrame.graphics.lineStyle(0.5, 0x000000, 1);
				 closeFrame.graphics.beginFill(0x000000, 1);
				 closeFrame.graphics.moveTo( -s, s);
				 closeFrame.graphics.lineTo( s,s);
				 closeFrame.graphics.lineTo( s,-s);
				 closeFrame.graphics.lineTo( -s, -s);
				 closeFrame.graphics.lineTo( -s, s);
				 closeFrame.graphics.endFill();*/
			      s = 6.25;
				 closeFrame.graphics.lineStyle(2, 0xFFFFFF, 1,false,"normal",CapsStyle.NONE,JointStyle.MITER);
				 closeFrame.graphics.moveTo( -s, s);
				 closeFrame.graphics.lineTo( s,-s);
				 closeFrame.graphics.moveTo( s, s);
				 closeFrame.graphics.lineTo( -s,-s);
				 
			     
				 
				 closeFrame.x = 1003-3;
				 closeFrame.y = 22+3;
				 //closeFrame.scaleX = 0.75;
				 //closeFrame.scaleY = 0.75;
				 closeFrame.filters = [fltrCloseframe];
				 closeFrame.buttonMode = true;
				 
			     closeFrame.blendMode = BlendMode.LAYER;
				//добавляем таймлайн для анимации кнопки закрытия фрейма
				
				timelineFrame.stop();
				timelineFrame.append(TweenMax.to(closeFrame, 1, {dropShadowFilter:{blurX:6,blurY:6,strength:3,alpha:0.8}}));
				//timelineFrame.append(TweenLite.to(closeFrame, 0.2, { scaleX:1,scaleY:1 } )); 
				
			}	
			//создаем фрейм
			CreateFrame();
			//пихаем тень в контейнер
			container.addChild(ShadowPlain);
			
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
				distortTeamwork1[d] = new DistortImage(teamwork1.dThumbImage[d]);	
			}	
			for (d = 0; d < teamwork2.count; d++ )
			{
				distortTeamwork2[d] = new DistortImage(teamwork2.dThumbImage[d]);	
			}
			
			
		 	//заполняем массив оригинальных координат
			for (i=0; i<xn.length; i++) 
			{
				xOrig[i]=xn[i];
				yOrig[i]=yn[i];
			}

			
			
			var PentagonWidth:Number = 45;
			var PentagonAngle:Number = 75;
			var pentX:Array = [xn[0]-PentagonWidth,xn[0]-10,xn[10]-10,xn[10]-PentagonWidth,xn[0]-PentagonAngle,xn[20]-10,xn[20]-PentagonWidth,xn[20]-PentagonAngle,xn[30]-10,xn[30]-PentagonWidth,xn[30]-PentagonAngle,xn[40]-10,xn[40]-PentagonWidth,xn[40]-PentagonAngle];
			var pentY:Array = [yn[0],yn[0],yn[10],yn[10],yn[0]-(yn[0]-yn[10])/2,yn[20],yn[20],yn[10]-(yn[10]-yn[20])/2,yn[30],yn[30],yn[20]-(yn[20]-yn[30])/2,yn[40],yn[40],yn[30]-(yn[30]-yn[40])/2];
							
			var pentagon1:Sprite = new Sprite();
			var pentagon2:Sprite = new Sprite();
			
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
				obj.graphics.lineStyle(1, lineColor);
				//obj.graphics.beginFill(0xFFFCF8, 0.6);
				obj.graphics.moveTo(pentX[n0], pentY[n0]);
				obj.graphics.lineTo(pentX[n1], pentY[n1]);
				obj.graphics.lineTo(pentX[n2], pentY[n2]);
				obj.graphics.lineTo(pentX[n3], pentY[n3]);
				obj.graphics.lineTo(pentX[n4], pentY[n4]);
				obj.graphics.lineTo(pentX[n0], pentY[n0]);
				obj.graphics.endFill();
				obj.buttonMode = true;
				obj.x =- 2.5;
				if (!obj.stage)
					{
					  container.addChild(obj);
					}
			}
			
			function createPentagons():void 
			{
				createPentagon(pentagon1, 0, 1, 2, 3, 4);
				createPentagon(pentagon2, 3, 2, 5, 6, 7);
				
			}
			//создаем пентагоны
			createPentagons();
			
			
			//==============================================================================
			// обводка для листалок left
			var strokeprev1:Sprite = new Sprite();
			var strokeprev2:Sprite = new Sprite();
			
			// обводка для листалок right
			var strokenext1:Sprite = new Sprite();
			var strokenext2:Sprite = new Sprite();
			//создаем кнопки листалки
			
			function createPicButton(btn1:Sprite,str1:Sprite,btn2:Sprite,str2:Sprite,n1:int,n2:int):void
			{
				var width:Number = 12.5;
				//рисуем кнопку1
				btn1.graphics.lineStyle(1, lineColor);
				btn1.graphics.beginFill(NAVIGATIONBUTTONCOLOR,alphaButton);
				btn1.graphics.moveTo(xn[n1], yn[n1]);
				btn1.graphics.lineTo(xn[n1] - width, yn[n1]);
				btn1.graphics.lineTo(xn[n1+10] - width, yn[n1+10]);
				btn1.graphics.lineTo(xn[n1+10] , yn[n1+10]);
				btn1.graphics.lineTo(xn[n1] , yn[n1]);
				btn1.buttonMode = true;
				//рисуем обводку для кнопки1
				str1.graphics.clear();
				str1.graphics.lineStyle(1, lineColor);
				str1.graphics.moveTo(xn[n1], yn[n1]);
				str1.graphics.lineTo(xn[n1] - width, yn[n1]);
				str1.graphics.lineTo(xn[n1+10] - width, yn[n1+10]);
				str1.graphics.lineTo(xn[n1+10] , yn[n1+10]);
				str1.graphics.lineTo(xn[n1] , yn[n1]);
				
						
				btn2.graphics.lineStyle(1, lineColor);
				btn2.graphics.beginFill(NAVIGATIONBUTTONCOLOR, alphaButton);
				btn2.graphics.moveTo(xn[n2], yn[n2]);
				btn2.graphics.lineTo(xn[n2] + width, yn[n2]);
				btn2.graphics.lineTo(xn[n2+10] + width, yn[n2+10]);
				btn2.graphics.lineTo(xn[n2+10] , yn[n2+10]);
				btn2.graphics.lineTo(xn[n2] , yn[n2]);
				btn2.buttonMode = true;
				
				//рисуем обводку для кнопки2
				str2.graphics.clear();
				str2.graphics.lineStyle(1, lineColor);
				str2.graphics.moveTo(xn[n2], yn[n2]);
				str2.graphics.lineTo(xn[n2] + width, yn[n2]);
				str2.graphics.lineTo(xn[n2+10] + width, yn[n2+10]);
				str2.graphics.lineTo(xn[n2+10] , yn[n2+10]);
				str2.graphics.lineTo(xn[n2] , yn[n2]);
				
				
				if (!str1.stage)
					{
					  container.addChild(str1);
						
					}
				if (!str2.stage)
					{
					  container.addChild(str2);
						
					}
				
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
			var prevbutton1:Sprite = new Sprite();//предыдущая картинка
			var nextbutton1:Sprite = new Sprite();//следующая картинка
			var prevbutton2:Sprite = new Sprite();
			var nextbutton2:Sprite = new Sprite();
			
			
				
			
			
			function createBtns():void
			{
				trace("Вызываем createBtns");
				createPicButton(prevbutton1,strokeprev1, nextbutton1,strokenext1, 0, 9);	
				createPicButton(prevbutton2,strokeprev2, nextbutton2,strokenext2, 10, 18);	

			}
			
			createBtns();
			
			//добавляем слушатели на листалки 
			// для первой портянки если картинок больше 9 то добавляем слушателей на кнопки листалки иначе делаем прозрачной кнопку next
			if (teamwork1.count > 9)
			{
				prevbutton1.addEventListener(MouseEvent.MOUSE_DOWN, prevbutton1OnClick);
				prevbutton1.addEventListener(MouseEvent.MOUSE_OVER, prevbuttonOnOver);
				nextbutton1.addEventListener(MouseEvent.MOUSE_DOWN, nextbutton1OnClick);
				nextbutton1.addEventListener(MouseEvent.MOUSE_OVER, nextbuttonOnOver);
			}
			else
			{
				nextbutton1.alpha = 0;
			}
			// для первой портянки если картинок больше 8 то добавляем слушателей на кнопки листалки иначе делаем прозрачной кнопку next
			if (teamwork2.count > 8)
			{
				prevbutton2.addEventListener(MouseEvent.MOUSE_DOWN, prevbutton2OnClick);
				prevbutton2.addEventListener(MouseEvent.MOUSE_OVER, prevbuttonOnOver);
				nextbutton2.addEventListener(MouseEvent.MOUSE_DOWN, nextbutton2OnClick);
				nextbutton2.addEventListener(MouseEvent.MOUSE_OVER, nextbuttonOnOver);
			}
			else
			{
				nextbutton2.alpha = 0;
			}
			
			//делаем кнопки листалки слева полупрозрачными, т.к. изначально слева некуда листать
			prevbutton1.alpha = 0;
			prevbutton2.alpha = 0;
			
			//обработчики для всех кнопок при наведении для показа хинтов
			function prevbuttonOnOver(event:MouseEvent):void 
			{
				Hint.show(PrevToolTip);
			}
			function nextbuttonOnOver(event:MouseEvent):void 
			{
				Hint.show(NextToolTip);
			}
			// обработчики для первых листалок
			function prevbutton1OnClick():void
			{
			  nextbutton1.alpha = 1;
			  var ytmp:Array = [];
			  var tmp:Array = [];
				
			  if (countD1 > 0)
			  {
				  countD1--;
				  if (countD1 < 1)
					{
						prevbutton1.alpha = 0; 
					}
				  
			  distortTeamwork1[0].texture = teamwork1.dThumbImage[0 + countD1];
			  distortTeamwork1[1].texture = teamwork1.dThumbImage[1 + countD1];
			  distortTeamwork1[2].texture = teamwork1.dThumbImage[2 + countD1];
			  distortTeamwork1[3].texture = teamwork1.dThumbImage[3 + countD1];
			  distortTeamwork1[4].texture = teamwork1.dThumbImage[4 + countD1];
			  distortTeamwork1[5].texture = teamwork1.dThumbImage[5 + countD1];
			  distortTeamwork1[6].texture = teamwork1.dThumbImage[6 + countD1];
			  distortTeamwork1[7].texture = teamwork1.dThumbImage[7 + countD1];
			  distortTeamwork1[8].texture = teamwork1.dThumbImage[8 + countD1]; 
			  
			  for (var z:int = 8; z >= 1; z--)
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
				
			  Redriwing();
			  trace(countD1);
			}//end function prevbutton1
				
			
			
			
			
			function nextbutton1OnClick():void
			{
				 var xtmp:Array=[];//переменные для временного  хранения
				 var ytmp:Array = [];
				 var tmp:Array=[];
				 var shft:Array = [];
				 prevbutton1.alpha = 1;
				 countD1++
				 if (countD1 > designer1.count - 10)
				{
					nextbutton1.alpha = 0;
				} 
				
				if (countD1 > designer1.count - 9)
				{
					countD1 = designer1.count - 9;
				}
				else 
				{
										
					for (var z:int = 0; z <= 8; z++)
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
				
				
			  distortTeamwork1[0].texture = teamwork1.dThumbImage[0 + countD1];
			  distortTeamwork1[1].texture = teamwork1.dThumbImage[1 + countD1];
			  distortTeamwork1[2].texture = teamwork1.dThumbImage[2 + countD1];
			  distortTeamwork1[3].texture = teamwork1.dThumbImage[3 + countD1];
			  distortTeamwork1[4].texture = teamwork1.dThumbImage[4 + countD1];
			  distortTeamwork1[5].texture = teamwork1.dThumbImage[5 + countD1];
			  distortTeamwork1[6].texture = teamwork1.dThumbImage[6 + countD1];
			  distortTeamwork1[7].texture = teamwork1.dThumbImage[7 + countD1];
			  distortTeamwork1[8].texture = teamwork1.dThumbImage[8 + countD1];
			 
			 				
			  trace("click_tt", countD1);
				Redriwing();
			} //end function nextbutton1Click 
			
			
			
			// обработчики для вторых листалок
			function prevbutton2OnClick():void
			{
			  var ytmp:Array = [];
			  var tmp:Array = [];
			  nextbutton2.alpha = 1;
			  if (countD2 > 0)
			  {
				  countD2--;
					if (countD2 < 1)
					{
						prevbutton2.alpha = 0; 
				
					}
			  
			  distortTeamwork2[0].texture = teamwork2.dThumbImage[0 + countD2];
			  distortTeamwork2[1].texture = teamwork2.dThumbImage[1 + countD2];
			  distortTeamwork2[2].texture = teamwork2.dThumbImage[2 + countD2];
			  distortTeamwork2[3].texture = teamwork2.dThumbImage[3 + countD2];
			  distortTeamwork2[4].texture = teamwork2.dThumbImage[4 + countD2];
			  distortTeamwork2[5].texture = teamwork2.dThumbImage[5 + countD2];
			  distortTeamwork2[6].texture = teamwork2.dThumbImage[6 + countD2];
			  distortTeamwork2[7].texture = teamwork2.dThumbImage[7 + countD2];
			  
			  
			  for (var z:int = 17; z >= 11; z--)
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
				
			  Redriwing();
			  trace(countD1);
			}//end function prevbutton2
				
			
			
			
			
			function nextbutton2OnClick():void
			{
				 var xtmp:Array=[];//переменные для временного  хранения
				 var ytmp:Array = [];
				 var tmp:Array=[];
				 var shft:Array = [];
				 prevbutton2.alpha = 1;
				 countD2++
				if (countD2 > designer2.count - 9)
				{
					nextbutton2.alpha = 0;
				}  
				 if (countD2 > designer2.count - 8)
				{
					countD2 = designer2.count - 8;
				}
				else 
				{
										
					for (var z:int = 10; z <= 17; z++)
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
				
				
			  distortTeamwork2[0].texture = teamwork2.dThumbImage[0 + countD2];
			  distortTeamwork2[1].texture = teamwork2.dThumbImage[1 + countD2];
			  distortTeamwork2[2].texture = teamwork2.dThumbImage[2 + countD2];
			  distortTeamwork2[3].texture = teamwork2.dThumbImage[3 + countD2];
			  distortTeamwork2[4].texture = teamwork2.dThumbImage[4 + countD2];
			  distortTeamwork2[5].texture = teamwork2.dThumbImage[5 + countD2];
			  distortTeamwork2[6].texture = teamwork2.dThumbImage[6 + countD2];
			  distortTeamwork2[7].texture = teamwork2.dThumbImage[7 + countD2];
			 
			 
			 				
			  trace("click_tt", countD2);
				Redriwing();
			} //end function nextbutton2Click 
			
			
			drawdistortTeamwork(true);	
			addEventListeners();
			DriwingCurve();
			
			  
			
			function drawdistortTeamwork(addchld:Boolean=false):void
			{
			  //дизайнер1
			  distortTeamwork1[0].setTransform(xn[0], yn[0], xn[1], yn[1], xn[11], yn[11], xn[10], yn[10]);	
			  distortTeamwork1[1].setTransform(xn[1], yn[1], xn[2], yn[2], xn[12], yn[12], xn[11], yn[11]);	
			  distortTeamwork1[2].setTransform(xn[2], yn[2], xn[3], yn[3], xn[13], yn[13], xn[12], yn[12]);	
			  distortTeamwork1[3].setTransform(xn[3], yn[3], xn[4], yn[4], xn[14], yn[14], xn[13], yn[13]);	
			  distortTeamwork1[4].setTransform(xn[4], yn[4], xn[5], yn[5], xn[15], yn[15], xn[14], yn[14]);	
			  distortTeamwork1[5].setTransform(xn[5], yn[5], xn[6], yn[6], xn[16], yn[16], xn[15], yn[15]);	
			  distortTeamwork1[6].setTransform(xn[6], yn[6], xn[7], yn[7], xn[17], yn[17], xn[16], yn[16]);	
			  distortTeamwork1[7].setTransform(xn[7], yn[7], xn[8], yn[8], xn[18], yn[18], xn[17], yn[17]);	
			  distortTeamwork1[8].setTransform(xn[8], yn[8], xn[9], yn[9], xn[19], yn[19], xn[18], yn[18]);	
			  //дизайнер2
			  distortTeamwork2[0].setTransform(xn[10], yn[10], xn[11], yn[11], xn[21], yn[21], xn[20], yn[20]);
			  distortTeamwork2[1].setTransform(xn[11], yn[11], xn[12], yn[12], xn[22], yn[22], xn[21], yn[21]);
			  distortTeamwork2[2].setTransform(xn[12], yn[12], xn[13], yn[13], xn[23], yn[23], xn[22], yn[22]);	
			  distortTeamwork2[3].setTransform(xn[13], yn[13], xn[14], yn[14], xn[24], yn[24], xn[23], yn[23]);	
			  distortTeamwork2[4].setTransform(xn[14], yn[14], xn[15], yn[15], xn[25], yn[25], xn[24], yn[24]);	
			  distortTeamwork2[5].setTransform(xn[15], yn[15], xn[16], yn[16], xn[26], yn[26], xn[25], yn[25]);	
			  distortTeamwork2[6].setTransform(xn[16], yn[16], xn[17], yn[17], xn[27], yn[27], xn[26], yn[26]);	
			  distortTeamwork2[7].setTransform(xn[17], yn[17], xn[18], yn[18], xn[28], yn[28], xn[27], yn[27]);	
			  
			 		 			  
			  if (addchld)
			  {
				container.addChild(distortTeamwork1[0]);
				container.addChild(distortTeamwork1[1]);
				container.addChild(distortTeamwork1[2]);
				container.addChild(distortTeamwork1[3]);
				container.addChild(distortTeamwork1[4]);
				container.addChild(distortTeamwork1[5]);
				container.addChild(distortTeamwork1[6]);
				container.addChild(distortTeamwork1[7]);
				container.addChild(distortTeamwork1[8]);
				
				container.addChild(distortTeamwork2[0]);
				container.addChild(distortTeamwork2[1]);
				container.addChild(distortTeamwork2[2]);
				container.addChild(distortTeamwork2[3]);
				container.addChild(distortTeamwork2[4]);
				container.addChild(distortTeamwork2[5]);
				container.addChild(distortTeamwork2[6]);
				container.addChild(distortTeamwork2[7]);
				
				
			  }
			 
			}
			
			
			
			
			// рисуем основной объект
			function DriwingCurve():void 
			{   
				//Первый ряд
				linears(mySprite[0],xn[0],yn[0],xn[1],yn[1],xn[10],yn[10],xn[11],yn[11],color_cube[0],cubeAlpha[0],lineStyle,lineColor);
				linears(mySprite[1],xn[1],yn[1],xn[2],yn[2],xn[11],yn[11],xn[12],yn[12],color_cube[1],cubeAlpha[1],lineStyle,lineColor);
			 	linears(mySprite[2],xn[2],yn[2],xn[3],yn[3],xn[12],yn[12],xn[13],yn[13],color_cube[2],cubeAlpha[2],lineStyle,lineColor);
				linears(mySprite[3],xn[3],yn[3],xn[4],yn[4],xn[13],yn[13],xn[14],yn[14],color_cube[3],cubeAlpha[3],lineStyle,lineColor);
				linears(mySprite[4],xn[4],yn[4],xn[5],yn[5],xn[14],yn[14],xn[15],yn[15],color_cube[4],cubeAlpha[4],lineStyle,lineColor);
				linears(mySprite[5],xn[5],yn[5],xn[6],yn[6],xn[15],yn[15],xn[16],yn[16],color_cube[5],cubeAlpha[5],lineStyle,lineColor);
				linears(mySprite[6],xn[6],yn[6],xn[7],yn[7],xn[16],yn[16],xn[17],yn[17],color_cube[6],cubeAlpha[6],lineStyle,lineColor);
				linears(mySprite[7],xn[7],yn[7],xn[8],yn[8],xn[17],yn[17],xn[18],yn[18],color_cube[7],cubeAlpha[7],lineStyle,lineColor);
				linears(mySprite[8],xn[8],yn[8],xn[9],yn[9],xn[18],yn[18],xn[19],yn[19],color_cube[8],cubeAlpha[8],lineStyle,lineColor);
				//Второй ряд
				linears(mySprite[9],xn[10],yn[10],xn[11],yn[11],xn[20],yn[20],xn[21],yn[21],color_cube[9],cubeAlpha[9],lineStyle,lineColor);
				linears(mySprite[10],xn[11],yn[11],xn[12],yn[12],xn[21],yn[21],xn[22],yn[22],color_cube[10],cubeAlpha[10],lineStyle,lineColor);
				linears(mySprite[11],xn[12],yn[12],xn[13],yn[13],xn[22],yn[22],xn[23],yn[23],color_cube[11],cubeAlpha[11],lineStyle,lineColor);
				linears(mySprite[12],xn[13],yn[13],xn[14],yn[14],xn[23],yn[23],xn[24],yn[24],color_cube[12],cubeAlpha[12],lineStyle,lineColor);
				linears(mySprite[13],xn[14],yn[14],xn[15],yn[15],xn[24],yn[24],xn[25],yn[25],color_cube[13],cubeAlpha[13],lineStyle,lineColor);
				linears(mySprite[14],xn[15],yn[15],xn[16],yn[16],xn[25],yn[25],xn[26],yn[26],color_cube[14],cubeAlpha[14],lineStyle,lineColor);
				linears(mySprite[15],xn[16],yn[16],xn[17],yn[17],xn[26],yn[26],xn[27],yn[27],color_cube[15],cubeAlpha[15],lineStyle,lineColor);
				linears(mySprite[16],xn[17],yn[17],xn[18],yn[18],xn[27],yn[27],xn[28],yn[28],color_cube[16],cubeAlpha[16],lineStyle,lineColor);
				//linears(mySprite[17],xn[18],yn[18],xn[19],yn[19],xn[28],yn[28],xn[29],yn[29],ArrBitmap[17],Mymatrix,color_cube[17],cubeAlpha[17],lineStyle,lineColor);
				
								
			} // конец функции DriwingCurve
			
			
			
			// рисуем по точкам каждый объект
			function linears(obj:MovieClip,x1:Number,y1:Number,x2:Number,y2:Number,
							x3:Number, y3:Number, x4:Number, y4:Number, 
							obj_color:uint, obj_alpha:Number,obj_lineStyle:Number,obj_lineColor:uint):void 
				{
				   	
			      
			
					var n:Graphics = obj.graphics;					
			        
					//===========Затеняем
					/*obj.graphics.beginFill(obj_color,obj_alpha);
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
	                //obj.cacheAsBitmap;
					
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
					obj.buttonMode=true;*/
	               // obj.cacheAsBitmap;
					
					//===========Затеняем
					n.beginFill(obj_color,obj_alpha);
					n.lineStyle(obj_lineStyle,obj_lineColor);
					n.moveTo(x1,y1);
					//n.moveTo(x4,y4);//пересечение
					n.lineTo(x1,y1);
					n.lineTo(x2,y2);
					//n.lineTo(x3,y3);//пересечение
					n.lineTo(x4,y4);
					n.lineTo(x3,y3);
					n.lineTo(x1,y1);
					n.endFill();
					//obj.buttonMode=true;
	                //obj.cacheAsBitmap;
					
					//===========Затеняем
					n.beginFill(PLATOLIGHT2,obj_alpha);
					n.lineStyle(obj_lineStyle,obj_lineColor);
					n.moveTo(x1,y1);
					n.lineTo(x1,y1);
					n.lineTo(x2,y2);
					n.lineTo(x4,y4);
					n.lineTo(x3,y3);
					n.lineTo(x1,y1);
					n.endFill();
					obj.buttonMode=true;
					obj.blendMode = BlendMode.HARDLIGHT;
					
					if (!obj.stage)
					{
						
						container.addChild(obj);
						//trace("проверка Obj",obj.name);
					}
					/*if (!container.stage)
					{
						//trace("проверка Container");
						globalScene.addChild(container);
					}
					if (!globalScene.stage)
					{
						//trace("проверка Global");
						addChild(globalScene);
					}*/
						
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
	
				// рисуем тень для портянки
				function CreateShadow():void 
				{
					
					var delta:int = 27;
					var delta2:int = 3;
					
					ShadowPlain.graphics.clear();
					
					ShadowPlain.graphics.beginFill(0x000000, 0.5);
					ShadowPlain.graphics.moveTo(xn[20], yn[20]);
					ShadowPlain.graphics.lineTo(xn[21], yn[21]);
					ShadowPlain.graphics.lineTo(xn[22], yn[22]);
					ShadowPlain.graphics.lineTo(xn[23], yn[23]);
					ShadowPlain.graphics.lineTo(xn[24], yn[24]);
					ShadowPlain.graphics.lineTo(xn[25], yn[25]);
					ShadowPlain.graphics.lineTo(xn[26], yn[26]);
					ShadowPlain.graphics.lineTo(xn[27], yn[27]);
					ShadowPlain.graphics.lineTo(xn[28], yn[28]);
					ShadowPlain.graphics.lineTo(xn[18], yn[18]);
					ShadowPlain.graphics.lineTo(xn[19], yn[19]);
					
					
					
					ShadowPlain.graphics.lineTo(xn[18] + delta, yOrig[10] + (yOrig[10] - yn[18]) / delta2);
					ShadowPlain.graphics.lineTo(xn[28] + delta, yOrig[20] + (yOrig[20] - yn[28]) / delta2);
					
					
					ShadowPlain.graphics.lineTo(xn[27] + delta, yOrig[20] + (yOrig[20] - yn[27]) / delta2);
					ShadowPlain.graphics.lineTo(xn[26] + delta, yOrig[20] + (yOrig[20] - yn[26]) / delta2);
					ShadowPlain.graphics.lineTo(xn[25] + delta, yOrig[20] + (yOrig[20] - yn[25]) / delta2);
					ShadowPlain.graphics.lineTo(xn[24] + delta, yOrig[20] + (yOrig[20] - yn[24]) / delta2);
					ShadowPlain.graphics.lineTo(xn[23] + delta, yOrig[20] + (yOrig[20] - yn[23]) / delta2);
					ShadowPlain.graphics.lineTo(xn[22] + delta, yOrig[20] + (yOrig[20] - yn[22]) / delta2);
					ShadowPlain.graphics.lineTo(xn[21] + delta, yOrig[20] + (yOrig[20] - yn[21]) / delta2);
					ShadowPlain.graphics.lineTo(xn[20], yn[20]);
					ShadowPlain.graphics.endFill();
					
					
					
					/*ShadowPlain.graphics.beginFill(0x000000, 0.5);
					ShadowPlain.graphics.moveTo(xn[37], yn[37]);
					ShadowPlain.graphics.lineTo(xn[27], yn[27]);
					ShadowPlain.graphics.lineTo(xn[28], yn[28]);
					ShadowPlain.graphics.lineTo(xn[29], yn[29]);
					ShadowPlain.graphics.lineTo(xn[19], yn[19]);
					
					ShadowPlain.graphics.lineTo(xn[29], yOrig[20]+delta2 + (yOrig[20]-yn[29])/delta2);
					ShadowPlain.graphics.lineTo(xn[28]+delta, yOrig[20]+delta2 + (yOrig[20]-yn[28])/delta2);
					ShadowPlain.graphics.lineTo(xn[27]+delta, yOrig[20]+delta2 + (yOrig[20]-yn[27])/delta2);
					ShadowPlain.graphics.lineTo(xn[37]+delta, yOrig[30]+delta2 + (yOrig[30]-yn[37])/delta2);
					
					ShadowPlain.graphics.endFill();*/
					
					
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
					
					//очищаем пентагоны
					pentagon1.graphics.clear();
					pentagon2.graphics.clear();
					
					prevbutton1.graphics.clear();
					prevbutton2.graphics.clear();
					nextbutton1.graphics.clear();
					nextbutton2.graphics.clear();
					
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
					var button:MovieClip = e.currentTarget as MovieClip;
					//trace(color_cube[button.value]);
					button.alpha=0;
					//trace("clicks= ", clicks[button.value]);
					var id:String;
					trace("Значение кнопки= ", button.value);
					//проверка на что навели для показа чей проект
					if (button.value >= 0 && button.value <= 8)
					{
						//запоминаем текущее id дизайнера
						id = teamwork1.dID[button.value + countD1];
						//показываем кому принадлежит эта работа
						ShowDesignerLine(id);
						trace("больше нуля меньше 8")
						trace(id)
					}
					else if (button.value >= 9 && button.value <= 16)
					{
						//запоминаем текущее id дизайнера
						id = teamwork2.dID[(button.value-9) + countD2];
						//показываем кому принадлежит эта работа
						ShowDesignerLine(id);
						trace("больше 9 меньше 16")
						trace(id);
					}
					
					//проверка смещений
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
						//убираем линии с именем дизайнера
						HideDesignerLine();						
						//Получаем кнопку из события
						var button:MovieClip = e.currentTarget as MovieClip;
						//100% прозрачность
						button.alpha = 1;
						if (button.pressed)
						{
							color_cube[button.value] = feel_color;	
						}
						getOrigCoord();
						Redriwing();
						
						
					}

					//Это вызывается, когда мышкой кликнули по кнопке
					function mouseClickHandler(e:MouseEvent):void 
					{
						
						clickON=true;
						//trace("Pressed");
						var button:MovieClip = e.currentTarget as MovieClip;
						//button.pressed = false;
						BmpLoader = new RootClass;
						color_cube[button.value] = onClick_color;
						clicks[button.value] = button.value;
						changeOrigCoord(0, 0, 0, 0);
						Redriwing();
						//будем хранить ссылку на полноформатное изображение
						var url_full:String;
						//будем хранить ссылку на проект
						var url_project:String;
						//будем хранить подпись к изображению
						var description:String;
						
						if (button==mySprite[0])
						{
														
							url_full = teamwork1.dFullImage[0 + countD1];
							url_project = teamwork1.dProject[0 + countD1];
							description = teamwork1.dWHO[0 + countD1] + " | " + teamwork1.dText[0 + countD1];
							BmpLoader.loadadres(url_full, url_project,description);
						} 
						else if (button == mySprite[1]) 
						{
							
							url_full = teamwork1.dFullImage[1 + countD1];
							url_project = teamwork1.dProject[1 + countD1];
							description = teamwork1.dWHO[1 + countD1] + " | " + teamwork1.dText[1 + countD1];
							BmpLoader.loadadres(url_full, url_project,description);
						} 
						else if (button == mySprite[2]) 
						{
							
							url_full = teamwork1.dFullImage[2 + countD1];
							url_project = teamwork1.dProject[2 + countD1];
							description = teamwork1.dWHO[2 + countD1] + " | " + teamwork1.dText[2 + countD1];
							BmpLoader.loadadres(url_full, url_project,description);
						} 
						else if (button == mySprite[3]) 
						{
							
							url_full = teamwork1.dFullImage[3 + countD1];
							url_project = teamwork1.dProject[3 + countD1];
							description = teamwork1.dWHO[3 + countD1] + " | " + teamwork1.dText[3 + countD1];
							BmpLoader.loadadres(url_full, url_project,description);
						} 
						else if (button == mySprite[4]) 
						{
							
							url_full = teamwork1.dFullImage[4 + countD1];
							url_project = teamwork1.dProject[4 + countD1];
							description = teamwork1.dWHO[4 + countD1] + " | " + teamwork1.dText[4 + countD1];
							BmpLoader.loadadres(url_full, url_project,description);
						} 
						else if (button == mySprite[5]) 
						{
							
							url_full = teamwork1.dFullImage[5 + countD1];
							url_project = teamwork1.dProject[5 + countD1];
							description = teamwork1.dWHO[5 + countD1] + " | " + teamwork1.dText[5 + countD1];
							BmpLoader.loadadres(url_full, url_project,description);
						} 
						else if (button == mySprite[6]) 
						{
							
							url_full = teamwork1.dFullImage[6 + countD1];
							url_project = teamwork1.dProject[6 + countD1];
							description = teamwork1.dWHO[6 + countD1] + " | " + teamwork1.dText[6 + countD1];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[7]) 
						{
							
							url_full = teamwork1.dFullImage[7 + countD1];
							url_project = teamwork1.dProject[7 + countD1];
							description = teamwork1.dWHO[7 + countD1] + " | " + teamwork1.dText[7 + countD1];
							BmpLoader.loadadres(url_full, url_project,description);
						} 
						else if (button == mySprite[8]) 
						{
							
							url_full = teamwork1.dFullImage[8 + countD1];
							url_project = teamwork1.dProject[8 + countD1];
							description = teamwork1.dWHO[8 + countD1] + " | " + teamwork1.dText[8 + countD1];
							BmpLoader.loadadres(url_full, url_project,description);
						} 
						else if (button == mySprite[9]) 
						{
							
							url_full = teamwork2.dFullImage[0 + countD2];
							url_project = teamwork2.dProject[0 + countD2];
							description = teamwork2.dWHO[0 + countD2] + " | " + teamwork2.dText[0 + countD2];
							BmpLoader.loadadres(url_full, url_project,description);
						} 
						else if (button == mySprite[10]) 
						{
							
							url_full = teamwork2.dFullImage[1 + countD2];
							url_project = teamwork2.dProject[1 + countD2];
							description = teamwork2.dWHO[1 + countD2] + " | " + teamwork2.dText[1 + countD2];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[11]) 
						{
							
							url_full = teamwork2.dFullImage[2 + countD2];
							url_project = teamwork2.dProject[2 + countD2];
							description = teamwork2.dWHO[1 + countD2] + " | " + teamwork2.dText[2 + countD2];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[12]) 
						{
							
							url_full = teamwork2.dFullImage[3 + countD2];
							url_project = teamwork2.dProject[3 + countD2];
							description = teamwork2.dWHO[3 + countD2] + " | " + teamwork2.dText[3 + countD2];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[13]) 
						{
							
							url_full = teamwork2.dFullImage[4 + countD2];
							url_project = teamwork2.dProject[4 + countD2];
							description = teamwork2.dWHO[4 + countD2] + " | " + teamwork2.dText[4 + countD2];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[14]) 
						{
							
							url_full = teamwork2.dFullImage[5 + countD2];
							url_project = teamwork2.dProject[5 + countD2];
							description = teamwork2.dWHO[5 + countD2] + " | " + teamwork2.dText[5 + countD2];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[15]) 
						{
							
							url_full = teamwork2.dFullImage[6 + countD2];
							url_project = teamwork2.dProject[6 + countD2];
							description = teamwork2.dWHO[6 + countD2] + " | " + teamwork2.dText[6 + countD2];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[16]) 
						{
							
							url_full = teamwork2.dFullImage[7 + countD2];
							url_project = teamwork2.dProject[7 + countD2];
							description = teamwork2.dWHO[7 + countD2] + " | " + teamwork2.dText[7 + countD2];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[17]) 
						{
							
							url_full = teamwork2.dFullImage[8 + countD2];
							url_project = teamwork2.dProject[8 + countD2];
							description = teamwork2.dWHO[8 + countD2] + " | " + teamwork2.dText[8 + countD2];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						
						
						
						
					} // End function mouseClickHandler

						//функция перерисовки
						function Redriwing():void
						{
							ClearingAll();
							DriwingCurve(); 
							drawdistortTeamwork();
							createBtns();
							pentX = [xn[0]-PentagonWidth,xn[0]-10,xn[10]-10,xn[10]-PentagonWidth,xn[0]-PentagonAngle,xn[20]-10,xn[20]-PentagonWidth,xn[20]-PentagonAngle,xn[30]-10,xn[30]-PentagonWidth,xn[30]-PentagonAngle,xn[40]-10,xn[40]-PentagonWidth,xn[40]-PentagonAngle];
							pentY = [yn[0],yn[0],yn[10],yn[10],yn[0]-(yn[0]-yn[10])/2,yn[20],yn[20],yn[10]-(yn[10]-yn[20])/2,yn[30],yn[30],yn[20]-(yn[20]-yn[30])/2,yn[40],yn[40],yn[30]-(yn[30]-yn[40])/2];
						    createPentagons();
							TeamWorkStroke.graphics.clear();
							CreateStrokeLine();
							CreateShadow();
						}
				
						//функция перерисовки внешняя
					 redrawTeamworks = function RedrawTeam():void
						{
							ClearingAll();
							DriwingCurve(); 
							drawdistortTeamwork();
							createBtns();
							pentX = [xn[0]-PentagonWidth,xn[0]-10,xn[10]-10,xn[10]-PentagonWidth,xn[0]-PentagonAngle,xn[20]-10,xn[20]-PentagonWidth,xn[20]-PentagonAngle,xn[30]-10,xn[30]-PentagonWidth,xn[30]-PentagonAngle,xn[40]-10,xn[40]-PentagonWidth,xn[40]-PentagonAngle];
							pentY = [yn[0],yn[0],yn[10],yn[10],yn[0]-(yn[0]-yn[10])/2,yn[20],yn[20],yn[10]-(yn[10]-yn[20])/2,yn[30],yn[30],yn[20]-(yn[20]-yn[30])/2,yn[40],yn[40],yn[30]-(yn[30]-yn[40])/2];
						    createPentagons();
							TeamWorkStroke.graphics.clear();
							CreateStrokeLine();
							CreateShadow();
							
						}	
						// рисуем линию обводки
				function CreateStrokeLine():void 
				{
					
					TeamWorkStroke.graphics.lineStyle(4,StrokelineColor, 1,false,"normal",CapsStyle.NONE,JointStyle.MITER);
					TeamWorkStroke.graphics.moveTo(xn[0], yn[0]);
					TeamWorkStroke.graphics.lineTo(xn[1], yn[1]);
					TeamWorkStroke.graphics.lineTo(xn[2], yn[2]);
					TeamWorkStroke.graphics.lineTo(xn[3], yn[3]);
					TeamWorkStroke.graphics.lineTo(xn[4], yn[4]);
					TeamWorkStroke.graphics.lineTo(xn[5], yn[5]);
					TeamWorkStroke.graphics.lineTo(xn[6], yn[6]);
					TeamWorkStroke.graphics.lineTo(xn[7], yn[7]);
					TeamWorkStroke.graphics.lineTo(xn[8], yn[8]);
					TeamWorkStroke.graphics.lineTo(xn[9], yn[9]);
					TeamWorkStroke.graphics.lineTo(xn[19], yn[19]);
					TeamWorkStroke.graphics.lineTo(xn[18], yn[18]);
					TeamWorkStroke.graphics.lineTo(xn[28], yn[28]);
					TeamWorkStroke.graphics.lineTo(xn[27], yn[27]);
					TeamWorkStroke.graphics.lineTo(xn[26], yn[26]);
					TeamWorkStroke.graphics.lineTo(xn[25], yn[25]);
					TeamWorkStroke.graphics.lineTo(xn[24], yn[24]);
					TeamWorkStroke.graphics.lineTo(xn[23], yn[23]);
					TeamWorkStroke.graphics.lineTo(xn[22], yn[22]);
					TeamWorkStroke.graphics.lineTo(xn[21], yn[21]);
					TeamWorkStroke.graphics.lineTo(xn[20], yn[20]);
					TeamWorkStroke.graphics.lineTo(xn[10], yn[10]);
					TeamWorkStroke.graphics.lineTo(xn[0], yn[0]);
					
					if (!TeamWorkStroke.stage)
					{
						container.addChild(TeamWorkStroke);
					}
				} // end function CreateStrokeLine
			
			
			}//End public function WithDesigner
			
			
			// WithCompany	cooperation
	
     	public function WithCompany(container:MovieClip):void
		{
			//==Описание Переменных=======================================================================================
		
			
			var mySprite:Array = [];//храним спрайты

			//var container:MovieClip=new MovieClip(); // содержит все мувики
			//var globalScene:MovieClip=new MovieClip(); //содержит все что на сцене

			
			/**
			 * фрейм для загрузки изображения
			 */
			var frame:MovieClip = new MovieClip();
			/**
			 *  кнопка для закрытия ихображения
			 */
			var closeFrame:Sprite = new Sprite();
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
			/*var cubeAlpha:Array=[0.6, 0.2, 0.6, 0.2, 0.3, 0.5, 0.4, 0.2,0.5,
								 0.4, 0.1, 0.4, 0.1, 0.2, 0.6, 0.3, 0.1, 0.3,
								 0.3, 0.2, 0.5, 0.2, 0.3, 0.4, 0.2,0.7,0.3,
							 	 0.4, 0.1, 0.3, 0.1, 0.2, 0.5, 0.3, 0.7,0.6];*/
			// массив прозрачностей
			var cubeAlpha:Array=[0.10, 0.75, 0.15, 0.75, 0.6, 0.3, 0.45, 0.75,0.5,
								 0.45, 0.82, 0.45, 0.82, 0.75, 0.15, 0.6, 0.82, 0.6,
								 0.6, 0.75, 0.3, 0.75, 0.6, 0.45, 0.75,0.7,0.3,
							 	 0.45, 0.82, 0.6, 0.82, 0.75, 0.3, 0.6, 0.82,0.6]; 
			
			
			var clicks:Array = [];
								 
			
			

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
			
				
			//Переменные для смещения координат от центра
			var xcentr:uint; //Центр X
			var ycentr:uint; //Центр Y
			var shiftX:Array = [];//смещение по X
			var shiftY:Array = [];//смещение по Y
			
			//массив для заливки цветом фигур
			var color_cube:Array = []; //
			var feel_color:uint = FILLCOLOR3; //цвет заливки
			var outMouse_color:uint = 0x8080FF; // цвет при наведении
			var onClick_color:uint = 0xFF0000; // цвет при нажатии
			var lineStyle:Number = 1; //толщина линии
			var lineColor:uint = LINECOLOR; //цвет линии
			var StrokelineColor:uint=StrokeLineCooperation //цвет линии выделения портянки
			var alphaButton:Number=1;//прозрачность для кнопки
			
			
			//таймлайн для анимации кнопки закрытия
			var timelineFrame:TimelineLite = new TimelineLite();
			/**
				 *  тень для портянки
				 */
				var ShadowPlain:Sprite = new Sprite();
			
			//==Конец Описания Переменных=======================================================================================
			
						
		// функция создания фрейма		 	
		function CreateFrame():void 
		{
				
			
			//создаем фрейм для загрузки полноформатного изображения
			frame.graphics.beginFill(0x000000, 0.5);
			frame.graphics.lineStyle(0.5,lineColor);
			frame.graphics.drawRect(12, 12, 1000, 744);
			frame.graphics.endFill();
			
			
			/**
				 * длинна сторон кнопки закрывалки
				 */
				 var s:Number = 12.5;
				 /**
				  * фильтр для крестика
				  */
				 var fltrCloseframe:DropShadowFilter = new DropShadowFilter(0, 0, 0x000000, 1,4,4,1);
				
				// область срабатывания
				
				 closeFrame.graphics.beginFill(0xFFFFFF, 0);
				 closeFrame.graphics.moveTo( -s, s);
				 closeFrame.graphics.lineTo( s,s);
				 closeFrame.graphics.lineTo( s,-s);
				 closeFrame.graphics.lineTo( -s, -s);
				 closeFrame.graphics.lineTo( -s, s);
				 closeFrame.graphics.endFill();
			     //сама кнопка
				/*   s = 11.25;
				 //closeFrame.graphics.lineStyle(0.5, 0x000000, 1);
				 closeFrame.graphics.beginFill(0x000000, 1);
				 closeFrame.graphics.moveTo( -s, s);
				 closeFrame.graphics.lineTo( s,s);
				 closeFrame.graphics.lineTo( s,-s);
				 closeFrame.graphics.lineTo( -s, -s);
				 closeFrame.graphics.lineTo( -s, s);
				 closeFrame.graphics.endFill();*/
			      s = 6.25;
				 closeFrame.graphics.lineStyle(2, 0xFFFFFF, 1,false,"normal",CapsStyle.NONE,JointStyle.MITER);
				 closeFrame.graphics.moveTo( -s, s);
				 closeFrame.graphics.lineTo( s,-s);
				 closeFrame.graphics.moveTo( s, s);
				 closeFrame.graphics.lineTo( -s,-s);
				 
			     
				 
				 closeFrame.x = 1003-3;
				 closeFrame.y = 22+3;
				 //closeFrame.scaleX = 0.75;
				 //closeFrame.scaleY = 0.75;
				 closeFrame.filters = [fltrCloseframe];
				 closeFrame.buttonMode = true;
				 
			     closeFrame.blendMode = BlendMode.LAYER;
				//добавляем таймлайн для анимации кнопки закрытия фрейма
				
				timelineFrame.stop();
				timelineFrame.append(TweenMax.to(closeFrame, 1, {dropShadowFilter:{blurX:6,blurY:6,strength:3,alpha:0.8}}));
				//timelineFrame.append(TweenLite.to(closeFrame, 0.2, { scaleX:1,scaleY:1 } )); 
				
			}	
			//создаем фрейм
			CreateFrame();
			//пихаем тень в контейнер
			container.addChild(ShadowPlain);
			
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
				distortCooperation1[d] = new DistortImage(cooperation1.dThumbImage[d]);	
			}	
			for (d = 0; d < cooperation2.count; d++ )
			{
				distortCooperation2[d] = new DistortImage(cooperation2.dThumbImage[d]);	
			}
			
			
			//заполняем массив оригинальных координат
			for (i=0; i<xn.length; i++) 
			{
				xOrig[i]=xn[i];
				yOrig[i]=yn[i];
			}

			
			
			var PentagonWidth:Number = 45;
			var PentagonAngle:Number = 75;
			var pentX:Array = [xn[0]-PentagonWidth,xn[0]-10,xn[10]-10,xn[10]-PentagonWidth,xn[0]-PentagonAngle,xn[20]-10,xn[20]-PentagonWidth,xn[20]-PentagonAngle,xn[30]-10,xn[30]-PentagonWidth,xn[30]-PentagonAngle,xn[40]-10,xn[40]-PentagonWidth,xn[40]-PentagonAngle];
			var pentY:Array = [yn[0],yn[0],yn[10],yn[10],yn[0]-(yn[0]-yn[10])/2,yn[20],yn[20],yn[10]-(yn[10]-yn[20])/2,yn[30],yn[30],yn[20]-(yn[20]-yn[30])/2,yn[40],yn[40],yn[30]-(yn[30]-yn[40])/2];
							
			var pentagon1:Sprite = new Sprite();
			var pentagon2:Sprite = new Sprite();
			
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
				obj.graphics.lineStyle(1, lineColor);
				//obj.graphics.beginFill(0xFFFCF8, 0.6);
				obj.graphics.moveTo(pentX[n0], pentY[n0]);
				obj.graphics.lineTo(pentX[n1], pentY[n1]);
				obj.graphics.lineTo(pentX[n2], pentY[n2]);
				obj.graphics.lineTo(pentX[n3], pentY[n3]);
				obj.graphics.lineTo(pentX[n4], pentY[n4]);
				obj.graphics.lineTo(pentX[n0], pentY[n0]);
				obj.graphics.endFill();
				obj.buttonMode = true;
				obj.x =- 2.5;
				if (!obj.stage)
					{
					  container.addChild(obj);
					}
			}
			
			function createPentagons():void 
			{
				createPentagon(pentagon1, 0, 1, 2, 3, 4);
				createPentagon(pentagon2, 3, 2, 5, 6, 7);
				
			}
			//создаем пентагоны
			createPentagons();
			
			//==============================================================================
			// обводка для листалок left
			var strokeprev1:Sprite = new Sprite();
			var strokeprev2:Sprite = new Sprite();
			
			// обводка для листалок right
			var strokenext1:Sprite = new Sprite();
			var strokenext2:Sprite = new Sprite();
			//создаем кнопки листалки
			
			function createPicButton(btn1:Sprite,str1:Sprite,btn2:Sprite,str2:Sprite,n1:int,n2:int):void
			{
				var width:Number = 12.5;
				//рисуем кнопку1
				btn1.graphics.lineStyle(1, lineColor);
				btn1.graphics.beginFill(NAVIGATIONBUTTONCOLOR,alphaButton);
				btn1.graphics.moveTo(xn[n1], yn[n1]);
				btn1.graphics.lineTo(xn[n1] - width, yn[n1]);
				btn1.graphics.lineTo(xn[n1+10] - width, yn[n1+10]);
				btn1.graphics.lineTo(xn[n1+10] , yn[n1+10]);
				btn1.graphics.lineTo(xn[n1] , yn[n1]);
				btn1.buttonMode = true;
				//рисуем обводку для кнопки1
				str1.graphics.clear();
				str1.graphics.lineStyle(1, lineColor);
				str1.graphics.moveTo(xn[n1], yn[n1]);
				str1.graphics.lineTo(xn[n1] - width, yn[n1]);
				str1.graphics.lineTo(xn[n1+10] - width, yn[n1+10]);
				str1.graphics.lineTo(xn[n1+10] , yn[n1+10]);
				str1.graphics.lineTo(xn[n1] , yn[n1]);
				
						
				btn2.graphics.lineStyle(1, lineColor);
				btn2.graphics.beginFill(NAVIGATIONBUTTONCOLOR, alphaButton);
				btn2.graphics.moveTo(xn[n2], yn[n2]);
				btn2.graphics.lineTo(xn[n2] + width, yn[n2]);
				btn2.graphics.lineTo(xn[n2+10] + width, yn[n2+10]);
				btn2.graphics.lineTo(xn[n2+10] , yn[n2+10]);
				btn2.graphics.lineTo(xn[n2] , yn[n2]);
				btn2.buttonMode = true;
				
				//рисуем обводку для кнопки2
				str2.graphics.clear();
				str2.graphics.lineStyle(1, lineColor);
				str2.graphics.moveTo(xn[n2], yn[n2]);
				str2.graphics.lineTo(xn[n2] + width, yn[n2]);
				str2.graphics.lineTo(xn[n2+10] + width, yn[n2+10]);
				str2.graphics.lineTo(xn[n2+10] , yn[n2+10]);
				str2.graphics.lineTo(xn[n2] , yn[n2]);
				
				
				if (!str1.stage)
					{
					  container.addChild(str1);
						
					}
				if (!str2.stage)
					{
					  container.addChild(str2);
						
					}
				
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
			var prevbutton1:Sprite = new Sprite();//предыдущая картинка
			var nextbutton1:Sprite = new Sprite();//следующая картинка
			var prevbutton2:Sprite = new Sprite();
			var nextbutton2:Sprite = new Sprite();
			
			
				
			
			
			function createBtns():void
			{
				trace("Вызываем createBtns");
				createPicButton(prevbutton1,strokeprev1, nextbutton1,strokenext1, 0, 7);	
				createPicButton(prevbutton2,strokeprev2, nextbutton2,strokenext2, 10, 18);	

			}
			
			createBtns();
			
			//добавляем слушатели на листалки 
			
			// для первой портянки если картинок больше 7 то добавляем слушателей на кнопки листалки иначе делаем прозрачной кнопку next
			if (cooperation1.count > 7)
			{
				prevbutton1.addEventListener(MouseEvent.MOUSE_DOWN, prevbutton1OnClick);
				prevbutton1.addEventListener(MouseEvent.MOUSE_OVER, prevbuttonOnOver);
				nextbutton1.addEventListener(MouseEvent.MOUSE_DOWN, nextbutton1OnClick);
				nextbutton1.addEventListener(MouseEvent.MOUSE_OVER, nextbuttonOnOver);
			}	
			else
			{
				nextbutton1.alpha = 0;
			}
			// для второй портянки если картинок больше 8 то добавляем слушателей на кнопки листалки иначе делаем прозрачной кнопку next
			if (cooperation2.count > 8)
			{
				prevbutton2.addEventListener(MouseEvent.MOUSE_DOWN, prevbutton2OnClick);
				prevbutton2.addEventListener(MouseEvent.MOUSE_OVER, prevbuttonOnOver);
				nextbutton2.addEventListener(MouseEvent.MOUSE_DOWN, nextbutton2OnClick);
				nextbutton2.addEventListener(MouseEvent.MOUSE_OVER, nextbuttonOnOver);
			}
			else
			{
				nextbutton2.alpha = 0;
			}
			
			//делаем кнопки листалки слева полупрозрачными, т.к. изначально слева некуда листать
			prevbutton1.alpha = 0;
			prevbutton2.alpha = 0;
			
			//обработчики для всех кнопок при наведении для показа хинтов
			function prevbuttonOnOver(event:MouseEvent):void 
			{
				Hint.show(PrevToolTip);
			}
			function nextbuttonOnOver(event:MouseEvent):void 
			{
				Hint.show(NextToolTip);
			}
			// обработчики для первых листалок
			function prevbutton1OnClick():void
			{
				var ytmp:Array = [];
				var tmp:Array = [];
				nextbutton1.alpha = 1;
			  if (countD1 > 0)
			  {
				  countD1--;
					if (countD1 < 1)
					{
						prevbutton1.alpha = 0; 
					}
			  distortCooperation1[0].texture = cooperation1.dThumbImage[0 + countD1];
			  distortCooperation1[1].texture = cooperation1.dThumbImage[1 + countD1];
			  distortCooperation1[2].texture = cooperation1.dThumbImage[2 + countD1];
			  distortCooperation1[3].texture = cooperation1.dThumbImage[3 + countD1];
			  distortCooperation1[4].texture = cooperation1.dThumbImage[4 + countD1];
			  distortCooperation1[5].texture = cooperation1.dThumbImage[5 + countD1];
			  distortCooperation1[6].texture = cooperation1.dThumbImage[6 + countD1];
			  
			  
			  for (var z:int = 6; z >= 1; z--)
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
				
			  Redriwing();
			  trace(countD1);
			}//end function prevbutton1
				
			
			
			
			
			function nextbutton1OnClick():void
			{
				 var xtmp:Array=[];//переменные для временного  хранения
				 var ytmp:Array = [];
				 var tmp:Array=[];
				 var shft:Array = [];
				 prevbutton1.alpha = 1;
				 countD1++
				 if (countD1 > designer1.count - 8)
					{
						nextbutton1.alpha = 0;
					} 
				 if (countD1 > designer1.count - 7)
					{
						countD1 = designer1.count - 7;
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
				
				
			  distortCooperation1[0].texture = cooperation1.dThumbImage[0 + countD1];
			  distortCooperation1[1].texture = cooperation1.dThumbImage[1 + countD1];
			  distortCooperation1[2].texture = cooperation1.dThumbImage[2 + countD1];
			  distortCooperation1[3].texture = cooperation1.dThumbImage[3 + countD1];
			  distortCooperation1[4].texture = cooperation1.dThumbImage[4 + countD1];
			  distortCooperation1[5].texture = cooperation1.dThumbImage[5 + countD1];
			  distortCooperation1[6].texture = cooperation1.dThumbImage[6 + countD1];
			  
			 
			 				
			  trace("click_tt", countD1);
				Redriwing();
			} //end function nextbutton1Click 
			
			
			
			// обработчики для вторых листалок
			function prevbutton2OnClick():void
			{
				var ytmp:Array = [];
				var tmp:Array = [];
				nextbutton2.alpha = 1;
			  if (countD2 > 0)
			  {
				  countD2--;
				   if (countD2 < 1)
					{
						prevbutton2.alpha = 0; 
					}
			  distortCooperation2[0].texture = cooperation2.dThumbImage[0 + countD2];
			  distortCooperation2[1].texture = cooperation2.dThumbImage[1 + countD2];
			  distortCooperation2[2].texture = cooperation2.dThumbImage[2 + countD2];
			  distortCooperation2[3].texture = cooperation2.dThumbImage[3 + countD2];
			  distortCooperation2[4].texture = cooperation2.dThumbImage[4 + countD2];
			  distortCooperation2[5].texture = cooperation2.dThumbImage[5 + countD2];
			  distortCooperation2[6].texture = cooperation2.dThumbImage[6 + countD2];
			  distortCooperation2[7].texture = cooperation2.dThumbImage[7 + countD2];
			  
			  
			  for (var z:int = 17; z >= 11; z--)
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
				
			  Redriwing();
			  trace(countD1);
			}//end function prevbutton2
				
			
			
			
			
			function nextbutton2OnClick():void
			{
				 var xtmp:Array=[];//переменные для временного  хранения
				 var ytmp:Array = [];
				 var tmp:Array=[];
				 var shft:Array = [];
				 prevbutton2.alpha = 1;
				 countD2++
				if (countD2 > designer2.count - 9)
				{
					nextbutton2.alpha = 0;
				}
				 if (countD2 > designer2.count - 8)
				{
					countD2 = designer2.count - 8;
				}
				else 
				{
										
					for (var z:int = 10; z <= 17; z++)
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
				
				
			  distortCooperation2[0].texture = cooperation2.dThumbImage[0 + countD2];
			  distortCooperation2[1].texture = cooperation2.dThumbImage[1 + countD2];
			  distortCooperation2[2].texture = cooperation2.dThumbImage[2 + countD2];
			  distortCooperation2[3].texture = cooperation2.dThumbImage[3 + countD2];
			  distortCooperation2[4].texture = cooperation2.dThumbImage[4 + countD2];
			  distortCooperation2[5].texture = cooperation2.dThumbImage[5 + countD2];
			  distortCooperation2[6].texture = cooperation2.dThumbImage[6 + countD2];
			  distortCooperation2[7].texture = cooperation2.dThumbImage[7 + countD2];
			 
			 
			 				
			  trace("click_tt", countD2);
				Redriwing();
			} //end function nextbutton2Click 
				
			
			
			    drawdistortCooperation(true);
				addEventListeners();
				DriwingCurve();
			
			 
				function drawdistortCooperation(addchld:Boolean=false):void
			{
			  //дизайнер1
			  distortCooperation1[0].setTransform(xn[0], yn[0], xn[1], yn[1], xn[11], yn[11], xn[10], yn[10]);	
			  distortCooperation1[1].setTransform(xn[1], yn[1], xn[2], yn[2], xn[12], yn[12], xn[11], yn[11]);	
			  distortCooperation1[2].setTransform(xn[2], yn[2], xn[3], yn[3], xn[13], yn[13], xn[12], yn[12]);	
			  distortCooperation1[3].setTransform(xn[3], yn[3], xn[4], yn[4], xn[14], yn[14], xn[13], yn[13]);	
			  distortCooperation1[4].setTransform(xn[4], yn[4], xn[5], yn[5], xn[15], yn[15], xn[14], yn[14]);	
			  distortCooperation1[5].setTransform(xn[5], yn[5], xn[6], yn[6], xn[16], yn[16], xn[15], yn[15]);	
			  distortCooperation1[6].setTransform(xn[6], yn[6], xn[7], yn[7], xn[17], yn[17], xn[16], yn[16]);	
			  	
			  
			  //дизайнер2
			  distortCooperation2[0].setTransform(xn[10], yn[10], xn[11], yn[11], xn[21], yn[21], xn[20], yn[20]);
			  distortCooperation2[1].setTransform(xn[11], yn[11], xn[12], yn[12], xn[22], yn[22], xn[21], yn[21]);
			  distortCooperation2[2].setTransform(xn[12], yn[12], xn[13], yn[13], xn[23], yn[23], xn[22], yn[22]);	
			  distortCooperation2[3].setTransform(xn[13], yn[13], xn[14], yn[14], xn[24], yn[24], xn[23], yn[23]);	
			  distortCooperation2[4].setTransform(xn[14], yn[14], xn[15], yn[15], xn[25], yn[25], xn[24], yn[24]);	
			  distortCooperation2[5].setTransform(xn[15], yn[15], xn[16], yn[16], xn[26], yn[26], xn[25], yn[25]);	
			  distortCooperation2[6].setTransform(xn[16], yn[16], xn[17], yn[17], xn[27], yn[27], xn[26], yn[26]);	
			  distortCooperation2[7].setTransform(xn[17], yn[17], xn[18], yn[18], xn[28], yn[28], xn[27], yn[27]);	
			  //distortCooperation2[8].setTransform(xn[18], yn[18], xn[19], yn[19], xn[29], yn[29], xn[28], yn[27]);	
 
			  
			  if (addchld)
			  {
				container.addChild(distortCooperation1[0]);
				container.addChild(distortCooperation1[1]);
				container.addChild(distortCooperation1[2]);
				container.addChild(distortCooperation1[3]);
				container.addChild(distortCooperation1[4]);
				container.addChild(distortCooperation1[5]);
				container.addChild(distortCooperation1[6]);
				
				
				container.addChild(distortCooperation2[0]);
				container.addChild(distortCooperation2[1]);
				container.addChild(distortCooperation2[2]);
				container.addChild(distortCooperation2[3]);
				container.addChild(distortCooperation2[4]);
				container.addChild(distortCooperation2[5]);
				container.addChild(distortCooperation2[6]);
				container.addChild(distortCooperation2[7]);
				
			  }
			 
			}
				
				
				// рисуем основной объект
			function DriwingCurve():void 
			{   
				//Первый ряд
				linears(mySprite[0],xn[0],yn[0],xn[1],yn[1],xn[10],yn[10],xn[11],yn[11],color_cube[0],cubeAlpha[0],lineStyle,lineColor);
				linears(mySprite[1],xn[1],yn[1],xn[2],yn[2],xn[11],yn[11],xn[12],yn[12],color_cube[1],cubeAlpha[1],lineStyle,lineColor);
			 	linears(mySprite[2],xn[2],yn[2],xn[3],yn[3],xn[12],yn[12],xn[13],yn[13],color_cube[2],cubeAlpha[2],lineStyle,lineColor);
				linears(mySprite[3],xn[3],yn[3],xn[4],yn[4],xn[13],yn[13],xn[14],yn[14],color_cube[3],cubeAlpha[3],lineStyle,lineColor);
				linears(mySprite[4],xn[4],yn[4],xn[5],yn[5],xn[14],yn[14],xn[15],yn[15],color_cube[4],cubeAlpha[4],lineStyle,lineColor);
				linears(mySprite[5],xn[5],yn[5],xn[6],yn[6],xn[15],yn[15],xn[16],yn[16],color_cube[5],cubeAlpha[5],lineStyle,lineColor);
				linears(mySprite[6],xn[6],yn[6],xn[7],yn[7],xn[16],yn[16],xn[17],yn[17],color_cube[6],cubeAlpha[6],lineStyle,lineColor);
				//linears(mySprite[7],xn[7],yn[7],xn[8],yn[8],xn[17],yn[17],xn[18],yn[18],ArrBitmap[7],Mymatrix,color_cube[7],cubeAlpha[7],lineStyle,lineColor);
				//linears(mySprite[8],xn[8],yn[8],xn[9],yn[9],xn[18],yn[18],xn[19],yn[19],ArrBitmap[8],Mymatrix,color_cube[8],cubeAlpha[8],lineStyle,lineColor);
				//Второй ряд
				linears(mySprite[9],xn[10],yn[10],xn[11],yn[11],xn[20],yn[20],xn[21],yn[21],color_cube[9],cubeAlpha[9],lineStyle,lineColor);
				linears(mySprite[10],xn[11],yn[11],xn[12],yn[12],xn[21],yn[21],xn[22],yn[22],color_cube[10],cubeAlpha[10],lineStyle,lineColor);
				linears(mySprite[11],xn[12],yn[12],xn[13],yn[13],xn[22],yn[22],xn[23],yn[23],color_cube[11],cubeAlpha[11],lineStyle,lineColor);
				linears(mySprite[12],xn[13],yn[13],xn[14],yn[14],xn[23],yn[23],xn[24],yn[24],color_cube[12],cubeAlpha[12],lineStyle,lineColor);
				linears(mySprite[13],xn[14],yn[14],xn[15],yn[15],xn[24],yn[24],xn[25],yn[25],color_cube[13],cubeAlpha[13],lineStyle,lineColor);
				linears(mySprite[14],xn[15],yn[15],xn[16],yn[16],xn[25],yn[25],xn[26],yn[26],color_cube[14],cubeAlpha[14],lineStyle,lineColor);
				linears(mySprite[15],xn[16],yn[16],xn[17],yn[17],xn[26],yn[26],xn[27],yn[27],color_cube[15],cubeAlpha[15],lineStyle,lineColor);
				linears(mySprite[16],xn[17],yn[17],xn[18],yn[18],xn[27],yn[27],xn[28],yn[28],color_cube[16],cubeAlpha[16],lineStyle,lineColor);
				//linears(mySprite[17],xn[18],yn[18],xn[19],yn[19],xn[28],yn[28],xn[29],yn[29],ArrBitmap[17],Mymatrix,color_cube[17],cubeAlpha[17],lineStyle,lineColor);
				
			} // конец функции DriwingCurve
			
			
			
			// рисуем по точкам каждый объект
			function linears(obj:MovieClip,x1:Number,y1:Number,x2:Number,y2:Number,
							x3:Number, y3:Number, x4:Number, y4:Number, 
							obj_color:uint, obj_alpha:Number,obj_lineStyle:Number,obj_lineColor:uint):void 
				{
				   	
			      
			
					var n:Graphics = obj.graphics;
					//===========Затеняем
					n.beginFill(obj_color,obj_alpha);
					n.lineStyle(obj_lineStyle,obj_lineColor);
					n.moveTo(x1,y1);
					//n.moveTo(x4,y4);//пересечение
					n.lineTo(x1,y1);
					n.lineTo(x2,y2);
					//n.lineTo(x3,y3);//пересечение
					n.lineTo(x4,y4);
					n.lineTo(x3,y3);
					n.lineTo(x1,y1);
					n.endFill();
					
	                //obj.cacheAsBitmap;
					
					//===========Затеняем
					n.beginFill(PLATOLIGHT3,obj_alpha);
					n.lineStyle(obj_lineStyle,obj_lineColor);
					n.moveTo(x1,y1);
					n.lineTo(x1,y1);
					n.lineTo(x2,y2);
					n.lineTo(x4,y4);
					n.lineTo(x3,y3);
					n.lineTo(x1,y1);
					n.endFill();
					obj.buttonMode=true;
					obj.blendMode = BlendMode.HARDLIGHT;
			        
					//===========Затеняем
					/*obj.graphics.beginFill(obj_color,obj_alpha);
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
	                //obj.cacheAsBitmap;
					
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
	                //obj.cacheAsBitmap;*/
					
					
					
					if (!obj.stage)
					{
						
						container.addChild(obj);
						//trace("проверка Obj",obj.name);
					}
					/*if (!container.stage)
					{
						//trace("проверка Container");
						globalScene.addChild(container);
					}
					if (!globalScene.stage)
					{
						//trace("проверка Global");
						addChild(globalScene);
					}*/
						
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
				// рисуем тень для портянки
				function CreateShadow():void 
				{
					var delta:int = 27;
					var delta2:int = 1;
					
					ShadowPlain.graphics.clear();
					
					ShadowPlain.graphics.beginFill(0x000000, 0.5);
					ShadowPlain.graphics.moveTo(xn[20], yn[20]);
					ShadowPlain.graphics.lineTo(xn[21], yn[21]);
					ShadowPlain.graphics.lineTo(xn[22], yn[22]);
					ShadowPlain.graphics.lineTo(xn[23], yn[23]);
					ShadowPlain.graphics.lineTo(xn[24], yn[24]);
					ShadowPlain.graphics.lineTo(xn[25], yn[25]);
					ShadowPlain.graphics.lineTo(xn[26], yn[26]);
					ShadowPlain.graphics.lineTo(xn[27], yn[27]);
					ShadowPlain.graphics.lineTo(xn[28], yn[28]);
					
					
					
					ShadowPlain.graphics.lineTo(xn[27] + delta, yOrig[20] + (yOrig[20] - yn[27]) / delta2);
					ShadowPlain.graphics.lineTo(xn[26] + delta, yOrig[20] + (yOrig[20] - yn[26]) / delta2);
					ShadowPlain.graphics.lineTo(xn[25] + delta, yOrig[20] + (yOrig[20] - yn[25]) / delta2);
					ShadowPlain.graphics.lineTo(xn[24] + delta, yOrig[20] + (yOrig[20] - yn[24]) / delta2);
					ShadowPlain.graphics.lineTo(xn[23] + delta, yOrig[20] + (yOrig[20] - yn[23]) / delta2);
					ShadowPlain.graphics.lineTo(xn[22] + delta, yOrig[20] + (yOrig[20] - yn[22]) / delta2);
					ShadowPlain.graphics.lineTo(xn[21] + delta, yOrig[20] + (yOrig[20] - yn[21]) / delta2);
					ShadowPlain.graphics.lineTo(xn[20], yn[20]);
					ShadowPlain.graphics.endFill();
					
					
					
					ShadowPlain.graphics.beginFill(0x000000, 0.5);
					ShadowPlain.graphics.moveTo(xn[7], yn[7]);
					ShadowPlain.graphics.lineTo(xn[17], yn[17]);
					//ShadowPlain.graphics.lineTo(xn[18], yn[18]);
					
					
					//ShadowPlain.graphics.lineTo(xn[17]+delta, yOrig[10]+delta2 + (yOrig[10]-yn[17])/delta2);
					ShadowPlain.graphics.lineTo(xn[7]+delta, yOrig[10]+delta2 + (yOrig[10]-yn[7])/delta2);
					
					ShadowPlain.graphics.endFill();
					
					
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
					//очищаем пентагоны
					pentagon1.graphics.clear();
					pentagon2.graphics.clear();
					
					prevbutton1.graphics.clear();
					prevbutton2.graphics.clear();
					nextbutton1.graphics.clear();
					nextbutton2.graphics.clear();
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
					var button:MovieClip = e.currentTarget as MovieClip;
					//trace(color_cube[button.value]);
					button.alpha=0;
					//trace("clicks= ", clicks[button.value]);
					var id:String;
					trace("Значение кнопки= ", button.value);
					//проверка на что навели для показа чей проект
					if (button.value >= 0 && button.value <= 8)
					{
						//запоминаем текущее id дизайнера
						id = cooperation1.dID[button.value + countD1];
						//показываем кому принадлежит эта работа
						ShowDesignerLine(id);
						trace("больше нуля меньше 8")
						trace(id)
					}
					else if (button.value >= 9 && button.value <= 16)
					{
						//запоминаем текущее id дизайнера
						id = cooperation2.dID[(button.value-9) + countD2];
						//показываем кому принадлежит эта работа
						ShowDesignerLine(id);
						trace("больше 9 меньше 16")
						trace(id);
					}
					
					//проверка смещений
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
						//скрываем линию с подписью дизайнера
						HideDesignerLine();
						//Получаем кнопку из события
						var button:MovieClip = e.currentTarget as MovieClip;
						//100% прозрачность
						button.alpha = 1;
						if (button.pressed)
						{
							color_cube[button.value] = feel_color;	
						}						
						getOrigCoord();
						Redriwing();
						
						
					}

					//Это вызывается, когда мышкой кликнули по кнопке
					function mouseClickHandler(e:MouseEvent):void 
					{
						
						clickON=true;
						//trace("Pressed");
						var button:MovieClip = e.currentTarget as MovieClip;
						//button.pressed = false;
						BmpLoader = new RootClass;
						color_cube[button.value] = onClick_color;
						clicks[button.value] = button.value;
						changeOrigCoord(0, 0, 0, 0);
						Redriwing();
						//будем хранить ссылку на полноформатное изображение
						var url_full:String;
						//будем хранить ссылку на проект
						var url_project:String;
						//будем хранить подпись к изображению
						var description:String;
						
						
						if (button==mySprite[0])
						{
														
							url_full = cooperation1.dFullImage[0 + countD1];
							url_project = cooperation1.dProject[0 + countD1];
							description = cooperation1.dWHO[0 + countD1] + " | " + cooperation1.dText[0 + countD1];
							BmpLoader.loadadres(url_full, url_project,description);
						} 
						else if (button == mySprite[1]) 
						{
							
							url_full = cooperation1.dFullImage[1 + countD1];
							url_project = cooperation1.dProject[1 + countD1];
							description = cooperation1.dWHO[1 + countD1] + " | " + cooperation1.dText[1 + countD1];
							BmpLoader.loadadres(url_full, url_project,description);
						} 
						else if (button == mySprite[2]) 
						{
							
							url_full = cooperation1.dFullImage[2 + countD1];
							url_project = cooperation1.dProject[2 + countD1];
							description = cooperation1.dWHO[2 + countD1] + " | " + cooperation1.dText[2 + countD1];
							BmpLoader.loadadres(url_full, url_project,description);
						} 
						else if (button == mySprite[3]) 
						{
							
							url_full = cooperation1.dFullImage[3 + countD1];
							url_project = cooperation1.dProject[3 + countD1];
							description = cooperation1.dWHO[3 + countD1] + " | " + cooperation1.dText[3 + countD1];
							BmpLoader.loadadres(url_full, url_project,description);
						} 
						else if (button == mySprite[4]) 
						{
							
							url_full = cooperation1.dFullImage[4 + countD1];
							url_project = cooperation1.dProject[4 + countD1];
							description = cooperation1.dWHO[4 + countD1] + " | " + cooperation1.dText[4 + countD1];
							BmpLoader.loadadres(url_full, url_project,description);
						} 
						else if (button == mySprite[5]) 
						{
							
							url_full = cooperation1.dFullImage[5 + countD1];
							url_project = cooperation1.dProject[5 + countD1];
							description = cooperation1.dWHO[5 + countD1] + " | " + cooperation1.dText[5 + countD1];
							BmpLoader.loadadres(url_full, url_project,description);
						} 
						else if (button == mySprite[6]) 
						{
							
							url_full = cooperation1.dFullImage[6 + countD1];
							url_project = cooperation1.dProject[6 + countD1];
							description = cooperation1.dWHO[6 + countD1] + " | " + cooperation1.dText[6 + countD1];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[7]) 
						{
							
							url_full = cooperation1.dFullImage[7 + countD1];
							url_project = cooperation1.dProject[7 + countD1];
							description = cooperation1.dWHO[7 + countD1] + " | " + cooperation1.dText[7 + countD1];
							BmpLoader.loadadres(url_full, url_project,description);
						} 
						else if (button == mySprite[8]) 
						{
							
							url_full = cooperation1.dFullImage[8 + countD1];
							url_project = cooperation1.dProject[8 + countD1];
							description = cooperation1.dWHO[8 + countD1] + " | " + cooperation1.dText[8 + countD1];
							BmpLoader.loadadres(url_full, url_project,description);
						} 
						else if (button == mySprite[9]) 
						{
							
							url_full = cooperation2.dFullImage[0 + countD2];
							url_project = cooperation2.dProject[0 + countD2];
							description = cooperation2.dWHO[0 + countD2] + " | " + cooperation2.dText[0 + countD2];
							BmpLoader.loadadres(url_full, url_project,description);
						} 
						else if (button == mySprite[10]) 
						{
							
							url_full = cooperation2.dFullImage[1 + countD2];
							url_project = cooperation2.dProject[1 + countD2];
							description = cooperation2.dWHO[1 + countD2] + " | " + cooperation2.dText[1 + countD2];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[11]) 
						{
							
							url_full = cooperation2.dFullImage[2 + countD2];
							url_project = cooperation2.dProject[2 + countD2];
							description = cooperation2.dWHO[2 + countD2] + " | " + cooperation2.dText[2 + countD2];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[12]) 
						{
							
							url_full = cooperation2.dFullImage[3 + countD2];
							url_project = cooperation2.dProject[3 + countD2];
							description = cooperation2.dWHO[3 + countD2] + " | " + cooperation2.dText[3 + countD2];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[13]) 
						{
							
							url_full = cooperation2.dFullImage[4 + countD2];
							url_project = cooperation2.dProject[4 + countD2];
							description = cooperation2.dWHO[4 + countD2] + " | " + cooperation2.dText[4 + countD2];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[14]) 
						{
							
							url_full = cooperation2.dFullImage[5 + countD2];
							url_project = cooperation2.dProject[5 + countD2];
							description = cooperation2.dWHO[5 + countD2] + " | " + cooperation2.dText[5 + countD2];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[15]) 
						{
							
							url_full = cooperation2.dFullImage[6 + countD2];
							url_project = cooperation2.dProject[6 + countD2];
							description = cooperation2.dWHO[6 + countD2] + " | " + cooperation2.dText[6 + countD2];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[16]) 
						{
							
							url_full = cooperation2.dFullImage[7 + countD2];
							url_project = cooperation2.dProject[7 + countD2];
							description = cooperation2.dWHO[7 + countD2] + " | " + cooperation2.dText[7 + countD2];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						else if (button == mySprite[17]) 
						{
							
							url_full = cooperation2.dFullImage[8 + countD2];
							url_project = cooperation2.dProject[8 + countD2];
							description = cooperation2.dWHO[8 + countD2] + " | " + cooperation2.dText[8 + countD2];
							BmpLoader.loadadres(url_full, url_project,description);
						}
						
						
					} // End function mouseClickHandler

						//функция перерисовки
						function Redriwing():void
						{
							ClearingAll();
							DriwingCurve();
							drawdistortCooperation();
							createBtns();
							pentX = [xn[0]-PentagonWidth,xn[0]-10,xn[10]-10,xn[10]-PentagonWidth,xn[0]-PentagonAngle,xn[20]-10,xn[20]-PentagonWidth,xn[20]-PentagonAngle,xn[30]-10,xn[30]-PentagonWidth,xn[30]-PentagonAngle,xn[40]-10,xn[40]-PentagonWidth,xn[40]-PentagonAngle];
							pentY = [yn[0],yn[0],yn[10],yn[10],yn[0]-(yn[0]-yn[10])/2,yn[20],yn[20],yn[10]-(yn[10]-yn[20])/2,yn[30],yn[30],yn[20]-(yn[20]-yn[30])/2,yn[40],yn[40],yn[30]-(yn[30]-yn[40])/2];
						    createPentagons();
							CooperationStroke.graphics.clear();
							CreateStrokeLine();
							CreateShadow();
						}
				
						//функция перерисовки внешняя
					redrawCooperation = function RedrawCooper():void
						{
							ClearingAll();
							DriwingCurve();
							drawdistortCooperation();
							createBtns();
							pentX = [xn[0]-PentagonWidth,xn[0]-10,xn[10]-10,xn[10]-PentagonWidth,xn[0]-PentagonAngle,xn[20]-10,xn[20]-PentagonWidth,xn[20]-PentagonAngle,xn[30]-10,xn[30]-PentagonWidth,xn[30]-PentagonAngle,xn[40]-10,xn[40]-PentagonWidth,xn[40]-PentagonAngle];
							pentY = [yn[0],yn[0],yn[10],yn[10],yn[0]-(yn[0]-yn[10])/2,yn[20],yn[20],yn[10]-(yn[10]-yn[20])/2,yn[30],yn[30],yn[20]-(yn[20]-yn[30])/2,yn[40],yn[40],yn[30]-(yn[30]-yn[40])/2];
						    createPentagons();
							CooperationStroke.graphics.clear();
							CreateStrokeLine();
							CreateShadow();
						}
						
						// рисуем линию обводки
				function CreateStrokeLine():void 
				{
					
					CooperationStroke.graphics.lineStyle(4, StrokelineColor, 1,false,"normal",CapsStyle.NONE,JointStyle.MITER);
					CooperationStroke.graphics.moveTo(xn[0], yn[0]);
					CooperationStroke.graphics.lineTo(xn[1], yn[1]);
					CooperationStroke.graphics.lineTo(xn[2], yn[2]);
					CooperationStroke.graphics.lineTo(xn[3], yn[3]);
					CooperationStroke.graphics.lineTo(xn[4], yn[4]);
					CooperationStroke.graphics.lineTo(xn[5], yn[5]);
					CooperationStroke.graphics.lineTo(xn[6], yn[6]);
					CooperationStroke.graphics.lineTo(xn[7], yn[7]);
					CooperationStroke.graphics.lineTo(xn[17], yn[17]);
					CooperationStroke.graphics.lineTo(xn[18], yn[18]);
					CooperationStroke.graphics.lineTo(xn[28], yn[28]);
					CooperationStroke.graphics.lineTo(xn[27], yn[27]);
					CooperationStroke.graphics.lineTo(xn[26], yn[26]);
					CooperationStroke.graphics.lineTo(xn[25], yn[25]);
					CooperationStroke.graphics.lineTo(xn[24], yn[24]);
					CooperationStroke.graphics.lineTo(xn[23], yn[23]);
					CooperationStroke.graphics.lineTo(xn[22], yn[22]);
					CooperationStroke.graphics.lineTo(xn[21], yn[21]);
					CooperationStroke.graphics.lineTo(xn[20], yn[20]);
					CooperationStroke.graphics.lineTo(xn[10], yn[10]);
					CooperationStroke.graphics.lineTo(xn[0], yn[0]);
					
					if (!CooperationStroke.stage)
					{
						container.addChild(CooperationStroke);
					}
				} // end function CreateStrokeLine
				
			
			
			}//End public function WithCompany
			
			
					
			
			
   } //End Public Class Main
	
   } //End Package