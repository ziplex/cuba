import fl.controls.ProgressBar;
import fl.transitions.Tween;
import fl.transitions.easing.*;
import fl.transitions.TweenEvent;

var columns:Number;
var my_x:Number;
var my_y:Number;
var my_thumb_width:Number;
var my_thumb_height:Number;
var my_images:XMLList;
var my_total:Number;

var container_mc:MovieClip;
var preloaders_mc:MovieClip;
var full_mc:MovieClip;

var x_counter:Number = 0;
var y_counter:Number = 0;

var my_tweens:Array = [];
var container_mc_tween:Tween;
var full_tween:Tween;

var myXMLLoader:URLLoader = new URLLoader();
myXMLLoader.load(new URLRequest("gallery.xml"));
myXMLLoader.addEventListener(Event.COMPLETE, processXML);

function processXML(e:Event):void {
	var myXML:XML = new XML(e.target.data);

	columns = myXML.@COLUMNS;
	my_x = myXML.@XPOSITION;
	my_y = myXML.@YPOSITION;
	my_thumb_width = myXML.@WIDTH;
	my_thumb_height = myXML.@HEIGHT;
	my_images = myXML.IMAGE;
	my_total = my_images.length();

	createContainer();
	callThumbs();

	myXMLLoader.removeEventListener(Event.COMPLETE, processXML);
	myXMLLoader = null;
}

function createContainer():void {
	container_mc = new MovieClip();
	container_mc.x = my_x;
	container_mc.y = my_y;
	addChild(container_mc);

	container_mc.addEventListener(MouseEvent.CLICK, callFull);
	container_mc.addEventListener(MouseEvent.MOUSE_OVER, onOver);
	container_mc.addEventListener(MouseEvent.MOUSE_OUT, onOut);
	container_mc.buttonMode = true;

	preloaders_mc = new MovieClip();
	preloaders_mc.x = container_mc.x;
	preloaders_mc.y = container_mc.y;
	addChild(preloaders_mc);
}

function callThumbs():void {
	for (var i:Number = 0; i < my_total; i++) {

		var thumb_url = my_images[i].@THUMB;

		var thumb_loader = new Loader();
		thumb_loader.load(new URLRequest(thumb_url));
		thumb_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, thumbLoaded);

		thumb_loader.name = i;

		thumb_loader.x = (my_thumb_width+10)*x_counter;
		thumb_loader.y = (my_thumb_height+10)*y_counter;

		if (x_counter+1 < columns) {
			x_counter++;
		} else {
			x_counter = 0;
			y_counter++;
		}
		var preloader_pb:ProgressBar = new ProgressBar();
		preloader_pb.source = thumb_loader.contentLoaderInfo;
		preloader_pb.x = thumb_loader.x;
		preloader_pb.y = thumb_loader.y;
		preloader_pb.width = my_thumb_width;
		preloader_pb.height = my_thumb_height;
		preloaders_mc.addChild(preloader_pb);

		preloader_pb.addEventListener(Event.COMPLETE, donePb);
	}
}

function thumbLoaded(e:Event):void {
	var my_thumb:Loader = Loader(e.target.loader);
	container_mc.addChild(my_thumb);
	my_tweens[Number(my_thumb.name)]=new Tween(my_thumb, "alpha", Strong.easeIn, 0,1,0.5, true);

	my_thumb.contentLoaderInfo.removeEventListener(Event.COMPLETE, thumbLoaded);
}

function callFull(e:MouseEvent):void {
	var full_loader:Loader = new Loader();
	var full_url = my_images[e.target.name].@FULL;
	full_loader.load(new URLRequest(full_url));
	full_loader.contentLoaderInfo.addEventListener(Event.INIT, fullLoaded);

	var full_pb:ProgressBar = new ProgressBar();
	full_pb.source = full_loader.contentLoaderInfo;
	full_pb.x = (stage.stageWidth - full_pb.width)/2;
	full_pb.y = (stage.stageHeight - full_pb.height)/2;
	preloaders_mc.addChild(full_pb);

	full_pb.addEventListener(Event.COMPLETE, donePb);

	container_mc.removeEventListener(MouseEvent.CLICK, callFull);
	container_mc.buttonMode = false;
	container_mc.removeEventListener(MouseEvent.MOUSE_OVER, onOver);
	container_mc.removeEventListener(MouseEvent.MOUSE_OUT, onOut);
	container_mc_tween = new Tween(container_mc, "alpha", Strong.easeIn, 1,0.5,0.5, true);
}
function fullLoaded(e:Event):void {
	full_mc = new MovieClip();
	full_mc.buttonMode = true;
	addChild(full_mc);
	var my_loader:Loader = Loader(e.target.loader);
	full_mc.addChild(my_loader);
	full_tween = new Tween(my_loader, "alpha", Strong.easeIn, 0,1,0.5, true);
	my_loader.x = (stage.stageWidth - my_loader.width)/2;
	my_loader.y = (stage.stageHeight - my_loader.height)/2;
	my_loader.addEventListener(MouseEvent.CLICK,removeFull);

	my_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, fullLoaded);
}
function removeFull(e:MouseEvent):void {
	var my_loader:Loader = Loader (e.currentTarget);
	full_tween = new Tween(my_loader, "alpha", Strong.easeOut, 1,0,0.5, true);
	full_tween.addEventListener(TweenEvent.MOTION_FINISH, tweenFinished);

	container_mc_tween = new Tween(container_mc, "alpha", Strong.easeOut, 0.5,1,0.5, true);
}

function donePb(e:Event):void {
	var my_pb:ProgressBar = ProgressBar(e.target);
	preloaders_mc.removeChild(my_pb);
	my_pb.removeEventListener(Event.COMPLETE, donePb);
}

function tweenFinished(e:TweenEvent):void {
	var my_loader:Loader = Loader (e.target.obj);
	my_loader.unload();
	full_mc.removeChild(my_loader);// This line was removeChid(my_loader), just add full_mc before it.
	removeChild(full_mc);
	full_mc = null;

	container_mc.addEventListener(MouseEvent.CLICK, callFull);
	container_mc.buttonMode = true;
	container_mc.addEventListener(MouseEvent.MOUSE_OVER, onOver);
	container_mc.addEventListener(MouseEvent.MOUSE_OUT, onOut);

	var my_tween:Tween = Tween(e.target);
	my_tween.removeEventListener(TweenEvent.MOTION_FINISH, tweenFinished);
}
function onOver(e:MouseEvent):void {
	var my_thumb:Loader = Loader(e.target);
	my_thumb.alpha = 0.5;
}
function onOut(e:MouseEvent):void {
	var my_thumb:Loader = Loader (e.target);
	my_thumb.alpha = 1;
}