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
	 
	
	/**
	 * ...
	 * @author ziplex
	 */
		
	 public class CubeXML extends Object 
	{
		 
		 //переменные для параметров куба
			
			//Цвет заливки кнопок
			/**
			 * цвет заливки для кнопки 1
			 */
			public var FillButton1:uint;
			/**
			 * цвет заливки для кнопки 2
			 */
			public var FillButton2:uint;
			/**
			 * цвет заливки для кнопки 3
			 */
			public var FillButton3:uint;
			/**
			 * цвет заливки для кнопки 4
			 */
			public var FillButton4:uint;
			/**
			 * цвет заливки для кнопки 5
			 */
			public var FillButton5:uint;
			/**
			 * цвет заливки для кнопки 6
			 */
			public var FillButton6:uint;
			// прозрачность заливки кнопок
			public var AlphaButton1:Number
			public var AlphaButton2:Number
			public var AlphaButton3:Number
			public var AlphaButton4:Number
			public var AlphaButton5:Number
			public var AlphaButton6:Number
			//грани
			//цвет начала градиента
			public var Gran1Fill1:uint
			public var Gran2Fill1:uint
			public var Gran3Fill1:uint
			public var Gran4Fill1:uint
			public var Gran5Fill1:uint
			public var Gran6Fill1:uint
			//цвет окончания градиента
			public var Gran1Fill2:uint
			public var Gran2Fill2:uint
			public var Gran3Fill2:uint
			public var Gran4Fill2:uint
			public var Gran5Fill2:uint
			public var Gran6Fill2:uint
			//Линии граней
			public var GranThicknessLine:Number;
			public var GranColorLine:uint; 
			public var GranAlphaLine:Number;
			//внешний контур
			public var OutSideThicknessLine:Number; 
			public var OutSideColorLine:uint; 
			public var OutSideAlphaLine:Number;
			//внутренний контур
			public var InSideThicknessLine:Number;
			public var InSideColorLine:uint;
			public var InSideAlphaLine:Number;
			//Тень от куба
			public var ShadowCubeColor:uint;  
			public var ShadowCubeAlpha:Number;
			//Подписи к кнопкам(всплывающие подсказки)
			//tooltip1
			public var TOOLTIPTHICKNESSLINE1:Number; 
			public var TOOLTIPCOLORLINE1:uint   
			public var TOOLTIPFILL1:uint;   
			public var TOOLTIPALPHALINE1 :Number;
			public var TOOLTIPALPHA1 :Number;
			public var TOOLTIPTEXT1:TextField=new TextField(); 
			//tooltip2
			public var TOOLTIPTHICKNESSLINE2:Number;
			public var TOOLTIPCOLORLINE2:uint;
			public var TOOLTIPFILL2:uint;   
			public var TOOLTIPALPHALINE2:Number;
			public var TOOLTIPALPHA2:Number;
			public var TOOLTIPTEXT2:TextField=new TextField(); 
			//tooltip3
			public var TOOLTIPTHICKNESSLINE3:Number;
			public var TOOLTIPCOLORLINE3:uint;
			public var TOOLTIPFILL3:uint;
			public var TOOLTIPALPHALINE3:Number;
			public var TOOLTIPALPHA3:Number;
			public var TOOLTIPTEXT3:TextField=new TextField(); 
			//tooltip4
			public var TOOLTIPTHICKNESSLINE4:Number;
			public var TOOLTIPCOLORLINE4:uint;
			public var TOOLTIPFILL4:uint;
			public var TOOLTIPALPHALINE4:Number;
			public var TOOLTIPALPHA4:Number;
			public var TOOLTIPTEXT4 :TextField=new TextField();
			//tooltip5
			public var TOOLTIPTHICKNESSLINE5:Number
			public var TOOLTIPCOLORLINE5:uint;
			public var TOOLTIPFILL5:uint;
			public var TOOLTIPALPHALINE5:Number;
			public var TOOLTIPALPHA5:Number;
			public var TOOLTIPTEXT5:TextField=new TextField(); 
			//tooltip6
			public var TOOLTIPTHICKNESSLINE6:Number;
			public var TOOLTIPCOLORLINE6:uint;
			public var TOOLTIPFILL6:uint;
			public var TOOLTIPALPHALINE6:Number;
			public var TOOLTIPALPHA6:Number;
			public var TOOLTIPTEXT6:TextField = new TextField(); 
			
			//параметры для пожсказок на кнопках листалках 
			public var PREVBUTTONTHIKNESLINE:Number;
			public var PREVBUTTONCOLORLINE:uint;
			public var PREVBUTTONFILL:uint;
			public var PREVBUTTONALPHALINE:Number;
			public var PREVBUTTONALPHA:Number;
			public var PREVBUTTONTEXT:TextField = new TextField();
			
			public var NEXTBUTTONTHIKNESLINE:Number;
			public var NEXTBUTTONCOLORLINE:uint;
			public var NEXTBUTTONFILL:uint;
			public var NEXTBUTTONALPHALINE:Number;
			public var NEXTBUTTONALPHA:Number;
			public var NEXTBUTTONTEXT:TextField = new TextField();
			/**
			 *  текст для отправки сообщения
			 */
			public var SENDMESSAGETEXT:TextField = new TextField();
			//Цвет подсветки 
			public var PLATO1LIGHT:uint;
			public var PLATO2LIGHT:uint;
			public var PLATO3LIGHT:uint;

			//Текстовые поля
			public var TextContainerColor1:uint;
			public var TextContainerColor2:uint;
            public var TextContainerAlpha:Number;
            public var TextContainerGradientColor:uint;
			/**
			 * цвет текста
			 */
			public var TextColor:uint;
			
			//глобальные параметры для портянок
			/**
			 * цвет обводки для всех линий
			 */
			public var LineColor:uint;
			/**
			 * цвет заливки для портянки 1
			 */
			public var FillColor1:uint;
			/**
			 * цвет заливки для портянки 2
			 */
			public var FillColor2:uint;
			/**
			 * цвет заливки для портянки 3
			 */
			public var FillColor3:uint;
			/**
			 * цвет кнопок листалок
			 */
			public var NavigationButtonColor:uint;
			/**
			 * цвет заливки для канвы от которого начинаем градиент
			 */
			public var CanvaFill1:uint;
			/**
			 * цвет заливки для канвы  которым заканчиваем градиент
			 */
			public var CanvaFill2:uint;
			/**
			 * цвет линии обводки для портянки1
			 */
			public var StrokeLine1:uint;
			/**
			 * цвет линии обводки для портянки2
			 */
			public var StrokeLine2:uint;
			/**
			 * цвет линии обводки для портянки3
			 */
			public var StrokeLine3:uint;
			/**
			 *  цвет тени для всех объектов
			 */
			public var SHADOW:uint;
			/**
			 * счетчик
			 */
			public var count:int = 0;
			/**
			 * текст ошибки загрузки
			 */
			public var ErrorText:String;
		
		
		
		
	
			public function loadMainXml(url:String,func:Function,err:Function=null):void
						{
							trace("Loade cubeXML");
							
							var MainXMLLoader:URLLoader = new URLLoader();
							var ToolTipFormat:TextFormat = new TextFormat();
							ToolTipFormat.font = "MyriadPro-Regular";
							
							MainXMLLoader.addEventListener(Event.COMPLETE, processMainXML);
			                MainXMLLoader.addEventListener(IOErrorEvent.IO_ERROR, MainXmlIOerror);
							MainXMLLoader.addEventListener(IOErrorEvent.VERIFY_ERROR, MainXMLVeryfyIOerror);	
							MainXMLLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onCecrErr);
							MainXMLLoader.load(new URLRequest(url));
						
							function onCecrErr(event:Event):void
							{
								ErrorText= event.toString()+url;
								trace ("Error Secure config.xml ", ErrorText);
								err();
							}
								function MainXMLVeryfyIOerror(event:Event):void
								{
									ErrorText = event.toString()+url;
									trace("Error verify main.xml")
									err();
								}
								function MainXmlIOerror(event:Event):void
								{
									ErrorText = event.toString()+url;
									trace("Error main.xml")
									err();
								}
								function processMainXML(event:Event):void 
								{
									trace("Process mainXML");
									
									var myXML:XML = new XML(event.target.data);
									
									
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
									 
									 TOOLTIPTEXT1.text = myXML.TOOLTIPTEXT.@TOOLTIPTEXT1;
									 TOOLTIPTEXT2.text = myXML.TOOLTIPTEXT.@TOOLTIPTEXT2;
									 TOOLTIPTEXT3.text = myXML.TOOLTIPTEXT.@TOOLTIPTEXT3;
									 TOOLTIPTEXT4.text = myXML.TOOLTIPTEXT.@TOOLTIPTEXT4;
									 TOOLTIPTEXT5.text = myXML.TOOLTIPTEXT.@TOOLTIPTEXT5;
									 TOOLTIPTEXT6.text = myXML.TOOLTIPTEXT.@TOOLTIPTEXT6;
									 
									 TOOLTIPTEXT1.embedFonts = true;
									 TOOLTIPTEXT2.embedFonts = true;
									 TOOLTIPTEXT3.embedFonts = true;
									 TOOLTIPTEXT4.embedFonts = true;
									 TOOLTIPTEXT5.embedFonts = true;
									 TOOLTIPTEXT6.embedFonts = true;
									 
									 TOOLTIPTEXT1.setTextFormat(ToolTipFormat);
									 TOOLTIPTEXT2.setTextFormat(ToolTipFormat);
									 TOOLTIPTEXT3.setTextFormat(ToolTipFormat);
									 TOOLTIPTEXT4.setTextFormat(ToolTipFormat);
									 TOOLTIPTEXT5.setTextFormat(ToolTipFormat);
									 TOOLTIPTEXT6.setTextFormat(ToolTipFormat);
									 
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
									 
									 PREVBUTTONTEXT.text = myXML.CONTROLBUTTON.@PREVBUTTONTEXT;
									 NEXTBUTTONTEXT.text = myXML.CONTROLBUTTON.@NEXTBUTTONTEXT;
									 SENDMESSAGETEXT.text = "Отправить сообщение";
									 
									 PREVBUTTONTEXT.embedFonts = true;
									 NEXTBUTTONTEXT.embedFonts = true;
									 SENDMESSAGETEXT.embedFonts = true;
									 
									 PREVBUTTONTEXT.setTextFormat(ToolTipFormat);
									 NEXTBUTTONTEXT.setTextFormat(ToolTipFormat);
									 SENDMESSAGETEXT.setTextFormat(ToolTipFormat);
									 
									 PREVBUTTONTHIKNESLINE = myXML.CONTROLTHIKNESSLINE.@PREVBUTTONTHIKNESS;
									 NEXTBUTTONTHIKNESLINE = myXML.CONTROLTHIKNESSLINE.@NEXTBUTTONTHIKNESS;
									 
									 PREVBUTTONCOLORLINE = myXML.CONTROLCOLORLINE.@PREVCOLORLINE;
									 NEXTBUTTONCOLORLINE = myXML.CONTROLCOLORLINE.@NEXTCOLORLINE;
									 
									 PREVBUTTONALPHALINE = myXML.CONTROLALPHALINE.@PREVALPHALINE;
									 NEXTBUTTONALPHALINE = myXML.CONTROLALPHALINE.@NEXTALPHALINE;
									 
									 PREVBUTTONFILL = myXML.CONTROLFILL.@PREVFILL;
									 NEXTBUTTONFILL = myXML.CONTROLFILL.@NEXTFILL;
									 
									 PREVBUTTONALPHA = myXML.CONTROLALPHA.@PREVALPHA;
									 NEXTBUTTONALPHA = myXML.CONTROLALPHA.@NEXTALPHA;
									 
									 PLATO1LIGHT = myXML.PLATOLIGHT.@PLATO1LIGHT;
									 PLATO2LIGHT = myXML.PLATOLIGHT.@PLATO2LIGHT;
									 PLATO3LIGHT = myXML.PLATOLIGHT.@PLATO3LIGHT;
									
									 TextContainerColor1 = myXML.TEXTCONTAINER.@CONTAINER1COLOR;
									 TextContainerColor2 = myXML.TEXTCONTAINER.@CONTAINER2COLOR;
									 TextContainerAlpha = myXML.TEXTCONTAINER.@ALPHA;
									 TextContainerGradientColor = myXML.TEXTCONTAINER.@GRADIENTCOLOR;
									 TextColor= myXML.TEXTCONTAINER.@TEXTCOLOR;
									 
									 LineColor = myXML.GLOBAL.@LINECOLOR;
									 FillColor1 = myXML.GLOBAL.@FILLCOLOR1;
									 FillColor2 = myXML.GLOBAL.@FILLCOLOR2;
									 FillColor3 = myXML.GLOBAL.@FILLCOLOR3;
									 NavigationButtonColor = myXML.GLOBAL.@NAVIGATIONBUTTONCOLOR;
									 
									 CanvaFill1 = myXML.CANVA.@FILLCOLOR1;
									 CanvaFill2 = myXML.CANVA.@FILLCOLOR2;
									 
									 StrokeLine1 = myXML.STROKELINES.@STROKELINE1;
									 StrokeLine2 = myXML.STROKELINES.@STROKELINE2;
									 StrokeLine3 = myXML.STROKELINES.@STROKELINE3;
									 
									 SHADOW =myXML.GLOBAL.@SHADOW;
									 
									 //DesignerGlow= new GlowFilter(PLATO1LIGHT, 0.3, 10, 10,5); 
									 //WithCompanyGlow= new GlowFilter(PLATO2LIGHT, 0.3, 10, 10,5); 
									 //WithDesignersGlow= new GlowFilter(PLATO3LIGHT, 0.3, 10, 10,5,2); 
									
									MainXMLLoader.removeEventListener(Event.COMPLETE, processMainXML);
			                        MainXMLLoader.removeEventListener(IOErrorEvent.IO_ERROR, MainXmlIOerror);
									MainXMLLoader.removeEventListener(IOErrorEvent.VERIFY_ERROR, MainXMLVeryfyIOerror);
									MainXMLLoader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, onCecrErr);
									MainXMLLoader = null;
									
									func();
									
					    		}
						}	
								
	}//end public class DesignerItem
	
}