package {
import com.greensock.data.TransformAroundPointVars;
import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.display.Loader;
import flash.display.LoaderInfo;
import flash.display.BlendMode;
import flash.text.TextField;
import flash.text.*;
import flash.net.URLRequest;
import flash.events.*;
import silin.filters.ColorAdjust;
import XmlParser;
import PicLoader;
import com.greensock.*;
import com.greensock.easing.*;
import flash.filters.*;
import silin.utils.Preloader;

//******импортируем все, что нужно
public class RootClass extends Sprite {   //наш класс
 public function RootClass():void{  
  //функция возникает при запуске на проигрывание флэш ролика, должна называтся так же, как и класс
  
  //loadadres('pic.jpg');    //загружаем две  картинки
   //loadadres('pic2.jpg');
 }

/**
 * 
 * @param	url ссылка на большую картинку проекта
 * @param	url_project ссылка на проект
 * @param	descript подпись к изображению
 */
public function loadadres(url:String,url_project:String=null,descript:String=null) :void {  //вот она, функция  - загрузчик
/**
 *  хранимм ссылку на проект
 */
var urlProject:String = url_project;//"data/designer1/projects/project1/project1.xml";
/**
 *  храним ссылки на фото проекта
 */
var Project:XmlParser = new XmlParser;

/**
 * контейнер содержит лоадер подпись и все остальное
 */
var LoaderContainer:MovieClip = new MovieClip();  
/**
 * положение прелоадера текста по X
 */
var text_x:uint=20;
/**
 * положение прелоадера текста по Y
 */
var text_y:uint=20;
/**
 * расположение картинки по X
 */
var img_x:uint = 13;//12
/**
 * расположение картинки по Y
 */
var img_y:uint=13;//12
/**
 * ширина картинки
 */
var img_width:uint=999;//1000
/**
 * высота картинки
 */
var img_height:uint=743; //744
/**
 * поле для подписи картинки
 */
var description:Sprite = new Sprite();
/**
 * подпись для картинки
 */
var DescriptionText:TextField = new TextField();
/**
 * общий контейнер для всего что связано с миниатюрами
 */
var ThumbinalsContainer:MovieClip = new MovieClip();
/**
 * контейнер для миниатюр
 */
var PicContainer:MovieClip = new MovieClip();
/**
 * подложка для миниатюр
 */
var BackThumbinals:Sprite = new Sprite();
/**
 *  ширина подложки
 */
var back_width:uint = 1000;
/**
 * высота подложки
 */
var back_height:uint = 85;
/**
 * массив миниатюр
 */
var thumbinals:Array = [];
/**
 * миниатюра
 */
var thmb:Sprite = new Sprite();
/**
 * ширина миниатюры
 */
var thmb_height:uint = 75;
/**
 *  высота миниатюры
 */
var thmb_width:uint = 75;
/**
 * расстояние между миниатюрами;
 */
var space:uint = 5;
/**
 * Отступ с левого края 
 */

var left:Number = 22.5;

/**
 * кнопка предыдущая картинка 
 */
var prevButton:Sprite = new Sprite();
/**
 * кнопка следущаяя картинка 
 */
var nextButton:Sprite = new Sprite();
/**
 * подпись к изображениям
 */
var subj:String = descript;//"Проверка подписи.. больших размеров не входящих в экран и прочее и прочее ...."
/**
 * задаем формат подписи
 */
	var DescriptionFormat:TextFormat = new TextFormat();
/**
 *  текст прогресс загрузки
 */
var progress_tf:TextField = new TextField();//тексовое поле, в которое будем записывать прогрес
/**
 * счетчик для ограничения контейнеров не больше 12
 */
var total:int;
/**
   * на какую картинку нажали
   */
var WhatClipIsClicked:int = 0;
/**
 * счетчик для смещения 
 */
var cnt:int = 0;
  /**
   * храним количество нажатий
   */
var offsetCount:int = 0;
/**
 * текущее положение миниатюры по Х
 */
var currentX:Number = 0;

/**
 *  область для нажатия на большую картинку
 */
var plane:Sprite = new Sprite();
/**
 * таймлайн для панели
 */
var thmbTimeline:TimelineLite = new TimelineLite();
/**
 *  чернобелый фильтр
 */
var fltr:ColorMatrixFilter = new ColorMatrixFilter([0.3086, 0.6094, 0.082, 0, 0, 
														 0.3086, 0.6094, 0.082, 0, 0,
														 0.3086, 0.6094, 0.082, 0, 0, 
														 0, 0, 0, 1, 0]); 


//*******распологаем где надо подпись процента загрузки
  //progress_tf.x = img_width/2;  
  //progress_tf.y = (img_height/2)+10;
  
  /*var CirclePreload:Preloader = new Preloader (50, 0x80FF00, 1, 60);
	  CirclePreload.x = img_width/ 2;
	  CirclePreload.y = img_height / 2;
	  addChild(CirclePreload);*/
  /**
	*  полоска прелоадера
	*/
	var preload:Sprite = new Sprite();
		preload.graphics.beginFill(0xFFFFFF, 0.8);
		preload.graphics.drawRect(0, 0, img_width, img_height);
		preload.graphics.endFill();
		addChild(preload)
		preload.x = img_x;
		preload.y = img_y;
		preload.scaleX = 0;
  //***********
  //addChild(progress_tf);  //помещаем его на сцену
  var picURL:URLRequest = new URLRequest(url);//адрес картинки
  var picLoader:Loader = new Loader();   //создаем объект - загрузчик
  //контейнер для лоадера
  var FullImageContainer:MovieClip = new MovieClip(); 
  picLoader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,onLoadProgress);
  picLoader.contentLoaderInfo.addEventListener(Event.INIT,onLoadComplete);
 //*********добавляем события прогрес загрузки и её завершение
  picLoader.load(picURL);//начинаем загрузку
 
  function onLoadProgress(evt:ProgressEvent):void
  {//прогресс загрузки
		var cntload:int;
		cntload = Math.round(100 * (evt.bytesLoaded / evt.bytesTotal));
		var v:Number = cntload * 0.01;
		preload.scaleX = v;  
		//CirclePreload.label = String(Math.round(100*(evt.bytesLoaded/evt.bytesTotal)))+"%";
  }
 function onLoadComplete(evt:Event):void
 {//окончание загрузки
 // removeChild(progress_tf);
  removeChild(preload);
  //по окончанию выводим картинку на экран(она загрузилась в picLoader)
  addChild(LoaderContainer);
  FullImageContainer.addChild(picLoader.content);
  LoaderContainer.addChild(FullImageContainer);//показыываем только что загруженное на сцене
  //****изменяем координаты и размер изображения
  picLoader.content.x = img_x;
  picLoader.content.y = img_y;
  picLoader.content.width = img_width;
  picLoader.content.height = img_height;
  
  //загружаем XML проекта после создаем все остальное
    Project.loadXML(urlProject,CreateAll);
  
  
 }
 /**
  *  создаем весь контейнер
  */
 function CreateAll():void 
 {
	//создаем подписи
  createDescript();
  //создаем полоску с миниатюрами
  CreateThumb(); 
 }
 /**
  *  функция создания подписи к изображению
  */
 function createDescript():void 
 {
	
	DescriptionFormat.font = "MyriadPro-Regular";
	DescriptionFormat.align = TextFormatAlign.LEFT;
	DescriptionFormat.bold = true;
	DescriptionFormat.size = 12;
	DescriptionFormat.color = 0x353535;
	
	DescriptionText.antiAliasType = AntiAliasType.ADVANCED;
	DescriptionText.embedFonts = true;
	// текст подписи к картинке
	DescriptionText.text = subj;
	DescriptionText.setTextFormat(DescriptionFormat);
	DescriptionText.selectable = false;
	DescriptionText.x = img_x+left;
	DescriptionText.y = img_height - 3;
    DescriptionText.autoSize = TextFieldAutoSize.LEFT; 
	 description.graphics.beginFill(0xFFFFFF, 0.8);
	 description.graphics.drawRect(img_x, img_height - 2, img_width, 15)
	 description.graphics.endFill();
	 description.addChild(DescriptionText);
	 //добавляем подпись
	 LoaderContainer.addChild(description);
 }
 /**
  * функция создания контейнера для миниатюр
  * @param	obj Мувиклип в который нарисум рамку
  * @param	line_color - цвет линни
  * @param	fill_color - цвет заливки
  * @param  alpha_cont - прозрачность заливки
  */
 
  function CreateContain(obj:MovieClip,line_color:uint=0x8196EB,fill_color:uint=0x2C2C2C,alpha_cont:Number=1):void 
 {
	//рисуем контейнеры для миниатюр
	 obj.graphics.lineStyle(0.5, line_color, 1);
	 obj.graphics.beginFill(fill_color,alpha_cont);
	 obj.graphics.drawRect(0, 0, thmb_width, thmb_height);
	 obj.graphics.endFill();
	 addChild(obj);
 }
 //функция для создания кнопок листалок
 /**
  * 
  * @param	obj спрайт в который поместим нарисованное
  * @param	btn_alpha прозрачность заливки
  * @param	line_alpha прозрачность линии
  */
 function createButtons(obj:Sprite,btn_alpha:Number=1,line_alpha:Number=0):void 
 {
	 var btn_width:Number = 12.5;
	 var btn_height:Number = thmb_height;
	 obj.graphics.lineStyle(0.5, 0xFFFFFF, line_alpha);
	 obj.graphics.beginFill(0xFFFFFF, btn_alpha);
	 obj.graphics.drawRect(0, 0, btn_width, btn_height);
	 obj.graphics.endFill();
	 obj.buttonMode = true;
	 //addChild(obj);
 }
 //создаем маску
 function CreateMask(obj:Sprite):void 
 {
	obj.graphics.lineStyle(0.5, 0xFFFC33, 1);
	obj.graphics.beginFill(0xFFFCCC, 1);
	obj.graphics.drawRect(0, 0, img_width, 85)
	obj.graphics.endFill();
	//obj.x = 17.5;
 
 }
 /**
  * создание подложки с миниатюрами
  */ 
 
  function CreateThumb():void 
 {
	 // рисуем бекграунд подложки
	 BackThumbinals.graphics.beginFill(0x000000, 0.5);
	 BackThumbinals.graphics.drawRect(0, 0, back_width, back_height);
	 BackThumbinals.graphics.endFill();
	 //BackThumbinals.blendMode = BlendMode.MULTIPLY;
	
	 
	
	//добавляем бекграунд в контейнер с миниатюрами 
	ThumbinalsContainer.addChild(BackThumbinals);
	
	//размещаем контейнер внизу 
	ThumbinalsContainer.x = img_x;
	ThumbinalsContainer.y = img_height-88;
	
	
	
	//создаем маску для панели с миниатюрами
	var PicMask:MovieClip = new MovieClip();
    CreateMask(PicMask);
	PicMask.x=img_x
	PicMask.y = img_height - 88;
	LoaderContainer.addChild(PicMask);
	//наложим маску на контейнер с миниатюрами
	ThumbinalsContainer.mask = PicMask;
	 
    thmbTimeline.stop();
	thmbTimeline.append(TweenLite.to(ThumbinalsContainer, 0.5, { y:img_height-7} ),2);
	thmbTimeline.reverse();
	//создаем не больше 12 контейнеров чтобы не забивать память
	if (Project.TotalListIndex < 12)
	{
		total = Project.TotalListIndex
		
	}
	else
	{
		total = 12;
	}
	 for (var i:int = 0; i < total; i++) 
	 {
		/*var cb:MovieClip = new MovieClip();
		CreateContain(cb, 0xFFFFFF, 0xFFFFFF,0);
		cb.x = left + i * (thmb_width + space);
		cb.y = 5;
		
		//добавляем в контейнер миниатюр статическую подложку белого цвета
		ThumbinalsContainer.addChild(cb);*/
		
		//пихаем в массив новый мувик
		thumbinals[i] = new MovieClip();
		//присваиваем каждому спрайту ID номер
		thumbinals[i].value = i;
		thumbinals[i].name = i;
       
		//создаем новый пустой котейнер
		CreateContain(thumbinals[i]);
		//размещаем контейнеры на сцене в подложке слева left=20 растояние друг от друга space=5
		thumbinals[i].x = left + i * (thmb_width + space);
		thumbinals[i].y = 5
	    //добавляем в контейнер миниатюр каждую миниатюру
		PicContainer.addChild(thumbinals[i]);
		//режим кнопки для каждой миниатюры
		thumbinals[i].buttonMode = true;
		//накладываем на все миниатюры ЧБ фильтры 
		thumbinals[i].filters = [fltr];
		//все не нажаты 
		thumbinals[i].pressed = false;
	    //добавляем слушатели на каждую кнопку
		thumbinals[i].addEventListener(MouseEvent.CLICK, onClickThmb);
		thumbinals[i].addEventListener(MouseEvent.MOUSE_OVER, onOverThmb);
		thumbinals[i].addEventListener(MouseEvent.MOUSE_OUT, onOutThmb);
		trace(thumbinals[i].value);
	 }
	 
	 
	 
	 
	 //добавляем контейнер с миниатюрами в основной контейнер
	 ThumbinalsContainer.addChild(PicContainer); 
	 //создаем кнопки листалки если изображений больше 12
	  if (Project.TotalListIndex > 12)
	  {  
	     //создаем рамки для кнопок
		 var p:Sprite = new Sprite();
		 var n:Sprite = new Sprite();
		 createButtons(p, 0, 1);
		 createButtons(n, 0, 1);
		 //создаем кнопки
		 createButtons(prevButton);
	     createButtons(nextButton);
	  
	  //размещаем кнопки листалки и рамки по высоте и ширине 
	  prevButton.x = space;
	  prevButton.y = space;
	  p.x = prevButton.x;
	  p.y = prevButton.y;
	  nextButton.x = 982.5;
	  nextButton.y = space;
	  n.x = nextButton.x;
	  n.y = nextButton.y;
	  
	  // рисуем стрелку >
	  var archn:Sprite = new Sprite();
	  archn.graphics.beginFill(0x000000, 1);
	  archn.graphics.moveTo(0, 0);
	  archn.graphics.lineTo(5, 5);
	  archn.graphics.lineTo(0, 10);
	  archn.graphics.lineTo(0, 0);
      archn.graphics.endFill();
      archn.x = 3;
	  archn.y = nextButton.height - 14;
	  nextButton.addChild(archn);
 
	  // рисуем стрелку <
	  var archp:Sprite = new Sprite();
	  archp.graphics.beginFill(0x000000, 1);
	  archp.graphics.moveTo(0, 0);
	  archp.graphics.lineTo(-5, 5);
	  archp.graphics.lineTo(0, 10);
	  archp.graphics.lineTo(0, 0);
      archp.graphics.endFill();
      archp.x = 8;
	  archp.y = prevButton.height - 14;
	  prevButton.addChild(archp);
	  
	  //добавляем слушатели на кнопки листалки
	  nextButton.addEventListener(MouseEvent.CLICK, onNextClick);
	  prevButton.addEventListener(MouseEvent.CLICK, onPrevClick);
	  //делаем предыдущую кнопку не активной и прозрачной потому что изначально нет картинок слева 
	  prevButton.mouseEnabled = false;
	  prevButton.alpha = 0;
	  //добавляем сначала рамки затем кнопки в контейнер 
	  ThumbinalsContainer.addChild(p);
	  ThumbinalsContainer.addChild(n);
	  ThumbinalsContainer.addChild(prevButton);
	  ThumbinalsContainer.addChild(nextButton);
	 } 
	  // добавляем в основной контейнер, контейнер с миниатюрами
	 LoaderContainer.addChild(ThumbinalsContainer);
	 
	 //создаем область нажатия на большое изображение
	 plane.graphics.beginFill(0x000000, 0);
	 plane.graphics.drawRect(img_x, img_y, img_width, img_height - 105)
	 plane.graphics.endFill();
	 plane.buttonMode = true;
	 //добавляем область в контейнер
	 LoaderContainer.addChild(plane);
	 //добавляем слушателей на область
	 plane.addEventListener(MouseEvent.CLICK, onLoadContenerClick);
	 //добавляем слушателей на панель
	 plane.addEventListener(MouseEvent.MOUSE_OVER,onPanelOut);
	 description.addEventListener(MouseEvent.MOUSE_OVER,onPanelOver);
	 ThumbinalsContainer.addEventListener(MouseEvent.MOUSE_OVER,onPanelOver);
	 //создаем миниатюры загруженных изображений
	 createPic();
 }
 function createPic():void 
  {
    
	//загружаем изображения по ссылке из Project в массив thumbinals количеством из Project.TotalListIndex
	var pc:PicLoader = new PicLoader();
	//если картинок меньше 12 то грузим их столько сколько есть иначе загружаем только первые 12 
	if(Project.TotalListIndex<12)
	{ 
		pc.LoadPictures(Project.ThumbImage, thumbinals, Project.TotalListIndex, thmb_width, thmb_height);
	}
	else 
	{
	   pc.LoadPictures(Project.ThumbImage, thumbinals, 12, thmb_width, thmb_height);
	}
		
	
  }//end function createPic()
   //ушли с панели
  function onPanelOut(event:MouseEvent):void 
  {
	  //thmbTimeline.play();
  }
  //навели на панель
  function onPanelOver(event:MouseEvent):void 
  {
	  thmbTimeline.reverse();
  }
  /**
   *  переменная для проверки смещения вправо
   */
  var con:int = 0;
  /**
   * количество кликов
   */
   var totalclick:int = 0;
   /**
    * текущее положение клипа
    */
   var currentClipPosition:int = 0;
  
 //нажали на контейнер с изображениями
 function onLoadContenerClick(event:MouseEvent):void 
 {
	  for (var i:int = 0; i < total; i++) 
	 {
	    //все не нажаты 
		thumbinals[i].pressed = false;
		
	 }
	  totalclick++;
	  WhatClipIsClicked++;
	  //если нажатая кнопа больше чем нужно оставляем ее по максимуму из проекта
	  if (WhatClipIsClicked > Project.TotalListIndex-1)
	  {
		  WhatClipIsClicked = Project.TotalListIndex-1;
	  }
	  var id:int = WhatClipIsClicked;
	  // текст подписи к картинке
	  DescriptionText.text = subj + " |" + Project.Description[id];
	  DescriptionText.setTextFormat(DescriptionFormat);
	  
	 
	  //запоминаем путь к изображению 
	  var url:String = Project.FullImage[id];
	   // создаем новый загрузчик изображения
	  var pic:PicLoader = new PicLoader();
	  //закгружаем картинку задаем ей размер
	  pic.LoadPic(url, img_width, img_height,"linear",onLoad,description);
 	  //размещаем изображение по X и Y
	  pic.x = img_x;
	  pic.y = img_y;
	  //добавим фильтр на картинку
	  FullImageContainer.filters=[fltr]
	  function onLoad():void 
	  {
		FullImageContainer.filters = null;
		//добавляем то что только что загрузили
		FullImageContainer.addChild(pic);  
		// удаляем из контейнера с картинками предыдущую картинку
		FullImageContainer.removeChildAt(0);  
	  }
	  var tempClicks:int = (11 +offsetCount ) - currentClipPosition;
	  trace("tempClicks=",tempClicks)
	  //если картинка с самого права то добавляем миниатюрку как по нажатию на кнопку next
	  
	 if (id > 11)
	  {
		 id = con;
		 con++;
		 if (con > 11)
			{
				con = 0;
			}
	      
		 }// окончание условия проверки смещения
		 
			trace("текущая картинка имеет X=", thumbinals[id].x," id=",id);	  
			
		//если следущая картинка угловая тогда смещаем все и загружаем еще одну миниатюру
		//if(thumbinals[id].x==22.5)
		if(totalclick==tempClicks+1)
		
		{
		   trace("whatclipis", WhatClipIsClicked);
		   trace("currentClip", currentClipPosition);
		   trace("totalclick", totalclick);
		   trace("id", id);
		   trace("con", con);
		   trace("tempclick", tempClicks);
			offsetCount++;
			trace("offsetcount", offsetCount);
			
			//закгружаем картинку задаем ей размер
			var pic1:PicLoader = new PicLoader();
	 
			thumbinals[id].removeChildAt(0);
			pic1.LoadPic(Project.ThumbImage[WhatClipIsClicked], thmb_width, thmb_height,"circle");
			thumbinals[id].addChild(pic1);
			thumbinals[id].value = WhatClipIsClicked;
			
			
			//переменная для временного хранения предыдущего мувика
			var temp:MovieClip = new MovieClip();
			//смещаем все влево
			for (i = total-1; i >= 1; i--) 
			{
				temp.x = thumbinals[i].x;
				thumbinals[i].x = thumbinals[i-1].x;
				thumbinals[i-1].x = temp.x;
			//trace(thumbinals[i].x)
			}
		}   
	 
	  
	  //следущаая кнопка стала нажатой и без фильтра
	   trace("_ID_=",id)
	   thumbinals[id].pressed = true;
	   thumbinals[id].filters = null;
	  for (i = 0; i < total; i++) 
		{
			//обратно фильтры возвращаем для тех кто не нажат
			if(!thumbinals[i].pressed)
			{
				thumbinals[i].filters = [fltr]; 
			}	
		}
	  
	 trace("кликнули на картинку....",WhatClipIsClicked);
 
  }// end function onLoadContenerClick
  
  
  
  
  //=============================================================================================
 
  
  
   //кликнули по следущей кнопке
 function onNextClick(event:MouseEvent):void 
 {
	 //если предыдущая кнопка была залочена разлочим ее
	 if (!(prevButton.mouseEnabled));
	  {
		  prevButton.mouseEnabled = true;
		  prevButton.alpha = 1;
	  }
	  //прибавляем кол-во кликов
	  totalclick++;
	  //закгружаем картинку задаем ей размер
	  var pic:PicLoader = new PicLoader();
	 
	  thumbinals[cnt].removeChildAt(0);
  	  pic.LoadPic(Project.ThumbImage[12+offsetCount], thmb_width, thmb_height,"circle");
	  thumbinals[cnt].addChild(pic);
	  thumbinals[cnt].value = 12 + offsetCount;
	  cnt++;
	  offsetCount++;
	  if (cnt > 11)
	  {
		  cnt = 0;
	  }
	 if (offsetCount > Project.TotalListIndex-13)
	 {
	    offsetCount = Project.TotalListIndex - 12;
		trace("OFFSET=", offsetCount);
		nextButton.mouseEnabled = false;
		nextButton.alpha = 0;
	 }
	 trace("OFFSET=", offsetCount);
	
	 //переменная для временного хранения предыдущего мувика
	var temp:MovieClip = new MovieClip();
	 //смещаем все влево
	for (var i:int = total-1; i >= 1; i--) 
	{
	  temp.x = thumbinals[i].x;
	  thumbinals[i].x = thumbinals[i-1].x;
	  thumbinals[i-1].x = temp.x;
	  //trace(thumbinals[i].x)
	}
	
	
 } //end function nextClick
 
 //кликнули по предыдущей кнопке
 function onPrevClick(event:MouseEvent):void 
 {
	 //если следущая кнопка была залочена разлочим ее
	 if (!(nextButton.mouseEnabled));
	  {
		  nextButton.mouseEnabled = true;
		  nextButton.alpha = 1;
	  }
	   cnt--;
	   if (cnt < 0)
	  {
		  cnt = 11;
	  }
	  offsetCount--;
	  trace("OFFSET=", offsetCount);
	  
	  if (offsetCount < 1)
	 {  
	    offsetCount = 0;
		trace("OFFSET=", offsetCount);
		 prevButton.mouseEnabled = false;
		 prevButton.alpha = 0;
	 }
	 
	 //убавляем кол-во кликов
	  totalclick--;
	 //закгружаем картинку задаем ей размер
	  var pic:PicLoader = new PicLoader();
	  //удаляем предыдущую картинку
	  thumbinals[cnt].removeChildAt(0);
  	  pic.LoadPic(Project.ThumbImage[offsetCount], thmb_width, thmb_height,"circle");
	  thumbinals[cnt].addChild(pic);
	  thumbinals[cnt].value = offsetCount;
	 
	 
	 trace("OFFSET=", offsetCount);
	 
	 
	 //переменная для временного хранения предыдущего мувика
	var temp:MovieClip = new MovieClip();
	//смещаем все вправо
	for (var i:int = 0; i < total-1; i++) 
	{
	  temp.x = thumbinals[i].x;
	  thumbinals[i].x = thumbinals[i+1].x;
	  thumbinals[i+1].x = temp.x;
	  trace(thumbinals[i].x)
	}
	
 }
 //навели на мувик с миниатюрой
 function onOverThmb(event:MouseEvent):void 
 {
	 //разыминовываем  клип как мувик
	  var button:MovieClip = (event.currentTarget as MovieClip);
	  trace("id=", button.value)
	  trace("Положение по X =", button.x)
	  trace("name=", button.name);
	  //запоминаем значение мувика
	  var id:int = button.value;
	  //button.alpha = 1;
	  //убиоаем фильтр с мувика
	  button.filters = null;
 }
 //убрали курсор от мувика с миниатюрой
 function onOutThmb(event:MouseEvent):void 
 {
	 for (var i:int = 0; i < total; i++) 
	 {
	    //обратно фильтры возвращаем для тех кто не нажат
		if(!thumbinals[i].pressed)
		{
			thumbinals[i].filters = [fltr]; 
		}	
	 }
 }
 
 //нажали на мувик  
 function onClickThmb(event:MouseEvent):void 
  {
	  
	  for (var i:int = 0; i < total; i++) 
	 {
	    //все не нажаты 
		thumbinals[i].pressed = false;
		
	 }
	  //разыминовываем нажатый клип как мувик
	  var button:MovieClip = (event.currentTarget as MovieClip);
	  //запоминаем значение мувика
	  var id:int = button.value;
	  //определяем какой клип у нас сейчас нажат
	  WhatClipIsClicked = id;
	  currentClipPosition = id;
	  con = 0;
	  //текущее положение клипа в ноль
	  totalclick = 0;
	  // задаем текущее положение по Х для нажатого мувика
	  currentX = button.x;
	  trace("текущее положение по Х=", currentX);
	  // текст подписи к картинке
	  DescriptionText.text = subj + " |" + Project.Description[id];
	  DescriptionText.setTextFormat(DescriptionFormat);
	  //говорим что кнопка нажата
	  button.pressed = true;
	  
	  for (i = 0; i < total; i++) 
	 {
	    //обратно фильтры возвращаем для тех кто не нажат
		if(!thumbinals[i].pressed)
		{
			thumbinals[i].filters = [fltr]; 
		}	
	 }
	  //запоминаем путь к изображению 
	  var url:String = Project.FullImage[id];
	   // создаем новый загрузчик изображения
	  var pic:PicLoader = new PicLoader();
	  //закгружаем картинку задаем ей размер
	  pic.LoadPic(url, img_width, img_height,"linear",onLoad,description);
 	  //размещаем изображение по X и Y
	  pic.x = img_x;
	  pic.y = img_y;
	  /*var fltr:ColorMatrixFilter = new ColorMatrixFilter([0.3086, 0.6094, 0.082, 0, 0, 
														 0.3086, 0.6094, 0.082, 0, 0,
														 0.3086, 0.6094, 0.082, 0, 0, 
														 0, 0, 0, 1, 0]); */
	  FullImageContainer.filters=[fltr]
	  function onLoad():void 
	  {
		FullImageContainer.filters = null;
		//добавляем то что только что загрузили
		FullImageContainer.addChild(pic);  
		// удаляем из контейнера с картинками предыдущую картинку
		FullImageContainer.removeChildAt(0);  
	  }
	  
	  
  }
}
}
}