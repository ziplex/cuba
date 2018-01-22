package 
{
	
	import flash.display.*;
	import fl.transitions.easing.*;
	import flash.errors.IOError;
	import flash.text.*;
	import flash.events.*;
	import flash.geom.Matrix;
	import flash.display.StageScaleMode;
	import flash.net.* 
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.text.TextField; 
	import flash.display.DisplayObject;
	
	/**
	 * ...
	 * @author ...
	 */
		
	 public class ConfigXML extends Object 
	{
		 
		 //переменные для Config XML
			
			public var Designer1Url:String;
			public var Designer2Url:String;
			public var Designer3Url:String;
			public var Designer4Url:String;
			public var Cooperation1Url:String;
			public var Cooperation2Url:String;
			public var Teamwork1Url:String;
			public var Teamwork2Url:String;
			public var MainUrl:String;
			public var ErrorText:TextField=new TextField;	
		
			public function loadMain(url:String,func:Function,err:Function=null):void
					{
						
						var MainXml:URLLoader = new URLLoader();
						
						
						MainXml.addEventListener(Event.COMPLETE, processMain);
			            MainXml.addEventListener(IOErrorEvent.IO_ERROR, MainIOerror);
						MainXml.addEventListener(IOErrorEvent.VERIFY_ERROR, MainVeryfyIOerror);
						MainXml.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onCecrErr);
						MainXml.load(new URLRequest(url));
						function onCecrErr(event:Event):void
						{
							ErrorText.text= event.toString()+url;
							trace ("Error Secure config.xml ", ErrorText);
							err();
						}
						function MainVeryfyIOerror(event:Event):void
								{
									
									ErrorText.text= event.toString()+url;
									trace ("\n \n \n \n \n \n \n Error Veryfy config.xml ", ErrorText);
									err();
								}
						function MainIOerror(event:Event):void
								{
									
									ErrorText.text = event.toString()+url;
									trace( "\n \n \n \n \n \n \n Error config.xml ", ErrorText);
									err();
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
									 
									 MainXml.removeEventListener(Event.COMPLETE, processMain);
									 MainXml.removeEventListener(IOErrorEvent.IO_ERROR, MainIOerror);
									 MainXml.removeEventListener(IOErrorEvent.VERIFY_ERROR, MainVeryfyIOerror);
									 MainXml.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, onCecrErr);
									 MainXml = null;
									 
									 func();
									 
									
					    		}
					}//	  end function loadMain;	
	
	
								
	}//end public class DesignerItem
	
}