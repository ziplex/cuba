package {
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.display.Loader;
import flash.display.LoaderInfo;
import flash.text.TextField;
import flash.net.URLRequest;
import flash.events.*;
//******импортируем все, что нужно
public class RootClass extends Sprite {   //наш класс
 public function RootClass():void{  
  //функция возникает при запуске на проигрывание флэш ролика, должна называтся так же, как и класс
  
  //loadadres('pic.jpg');    //загружаем две  картинки
   //loadadres('pic2.jpg');
 }
//******* расположение изображений, подписи к ним и размеров самого изображения

//**********
public function loadadres(url:String) :void {  //вот она, функция  - загрузчик
  trace("загрузка.... битмапа")
var text_x:uint=20;
var img_x:uint=20;
var img_width:uint=200;
var img_height:uint=200; 
var progress_tf:TextField = new TextField();//тексовое поле, в которое будем записывать прогрес
  //*******распологаем где надо подпись процента загрузки
  progress_tf.x = text_x;  
  text_x+=img_width+10;
  progress_tf.y = 50;
  //***********
  addChild(progress_tf);  //помещаем его на сцену
  var picURL:URLRequest = new URLRequest(url);//адрес картинки
  var picLoader:Loader = new Loader();   //создаем объект - загрузчик
  picLoader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,onLoadProgress);
  picLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoadComplete);
 //*********добавляем события прогрес загрузки и её завершение
 picLoader.load(picURL);//начинаем загрузку
 function onLoadProgress(evt:ProgressEvent):void{//прогресс загрузки
  progress_tf.text = String(Math.round(100*(evt.bytesLoaded/evt.bytesTotal)))+"%";
 }
 function onLoadComplete(evt:Event):void{//окончание загрузки
  progress_tf.text = "Load complete";
  //по окончанию выводим картинку на экран(она загрузилась в picLoader)
  addChild(picLoader.content);     //показыываем только что загруженное на сцене
  //****изменяем координаты и размер изображения
  //picLoader.content.x = img_x;
  //img_x+= img_width+10;
  //picLoader.content.width=img_width;
  //picLoader.content.height=img_height;
  //picLoader.content.y = 70;
  //***********
 }
}
}
}