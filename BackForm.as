package 
{
	import flash.display.*;
	import flash.net.*;
	import flash.text.*;
	import flash.events.*;
	import com.greensock.*;
	import com.greensock.easing.*;
	/**
	 * форма обратной связи
	 * @author ziplex
	 */
	public class BackForm extends Sprite 
	{
		public function BackForm():void 
		{
			//MailForm("ziplex@scm.ru");
		}
		/**
		 * 
		 * @param	mail - майл куда отправим данные формы
		 */
		public function MailForm(mail:String):void 
		{
			/**
			 * подложка для формы
			 */
			var BackSide:Sprite = new Sprite();
			/**
			 * форма обратной связи
			 */
			var MailForm:Sprite = new Sprite
			/**
			 * поле ввода имени
			 */
			var name:TextField = new TextField();
			/**
			 * подпись для имени
			 */
			var nameSubj:TextField = new TextField();
			/**
			 * поле ввода e-mail
			 */
			var mailField:TextField = new TextField();
			/**
			 * подпись для емайл
			 */
			var mailSubj:TextField = new TextField();
			/**
			 * поле ввода сообщения
			 */
			var message:TextField =  new TextField();
			/**
			 * подпись поле ввода сообщения
			 */
			var messageSubj:TextField =  new TextField();
			
			/**
			 * кнопка отправки сообщения
			 */
			var submitButton:Sprite = new Sprite();
			/**
			 * подпись на кнопке отправки сообщения
			 */
			var submitText:TextField = new TextField();
			/**
			 * кнопка закрытия формы
			 */
			var CloseForm:Sprite = new Sprite();
			/**
			 * ширина формы
			 */
			var wdth:Number = 360;
			/**
			 * высота формы
			 */
			var hght:Number = 500;
			/**
			 * подпись заголовка окна
			 */
			var FormHeader:TextField = new TextField();
			/**
			 * статус отправки сообщения 
			 */
			var MessageStatus:TextField = new TextField();
			/**
			 * формат текста подписей
			 */
			var NameTextFormat:TextFormat = new TextFormat();
			/**
			 * формат текста полей ввода
			 */
			var InputTextFormat:TextFormat = new TextFormat();
			/**
			 * urlRequest на скрипт который обработает данные формы
			 */
			var request:URLRequest = new URLRequest("sender.php");
			// var request:URLRequest = new URLRequest("http://cub-a.su/test/sender.php");
			/**
			 * переменные для передачи в запрос скрипту
			 */
			var variables:URLVariables = new URLVariables();
			/**
			 * urlLoader для отправки данных и получения ответа
			 */
			var loader:URLLoader = new URLLoader();
			/**
			 * подложка для ввода имени
			 */
			var NamePlain:Sprite = new Sprite();
			/**
			 * подложка для ввода email
			 */
			var MailPlane:Sprite = new Sprite();
			/**
			 * подложка для ввода сообщения
			 */
			var MessagePlane:Sprite = new Sprite();
			/**
			 * содержит все поля для анимации появления
			 */
			var ContainForm:Sprite = new Sprite();
			
			/**
			 * таймлайн для анимации появления формы
			 */
			var timelineForm:TimelineLite = new TimelineLite( {onComplete:onCompletePlay, onReverseComplete:onFormComplete } );
			function onFormComplete():void 
			{
				removeChild(BackSide);
				removeChild(MailForm);
			}
			function onCompletePlay():void 
			{
				//установим фокус на поле ввода имени
				stage.focus = name;	
			}
			//рисуем плахи под текстом
			//для имени
			NamePlain.graphics.beginFill(0xFFFFFF, 0.5);
			NamePlain.graphics.drawRect(0, 0, 320, 20);
			NamePlain.graphics.endFill();
			//для мыла
			MailPlane.graphics.beginFill(0xFFFFFF, 0.5);
			MailPlane.graphics.drawRect(0, 0, 320, 20);
			MailPlane.graphics.endFill();
			//для сообщения
			MessagePlane.graphics.beginFill(0xFFFFFF, 0.5);
			MessagePlane.graphics.drawRect(0, 0, 320, 290);
			MessagePlane.graphics.endFill();
			
			
			//задаем формат текста подписей
			NameTextFormat.font = "MyriadPro-Semibold";
			NameTextFormat.size = 14;
			NameTextFormat.color = 0xFFFFFF;
			NameTextFormat.align = TextFormatAlign.LEFT;
			
			InputTextFormat.font = "MyriadPro-Regular";
			InputTextFormat.size = 14;
			InputTextFormat.color = 0x000000;
			InputTextFormat.align = TextFormatAlign.LEFT;
			
				
			
			//задаем параметры для подписи имени
			nameSubj.embedFonts = true;
			nameSubj.autoSize = TextFieldAutoSize.LEFT;
			nameSubj.text = "Ваше имя:";
			nameSubj.selectable = false;
			nameSubj.setTextFormat(NameTextFormat);
			nameSubj.x = 20;
			nameSubj.y = 40-nameSubj.textHeight-7;
			trace("nameY=",nameSubj.y);
			//задаем параметры для поля ввода имени
			name.embedFonts = true;
			name.width = 300;
			name.height = 20; 
			name.type = TextFieldType.INPUT;
			name.defaultTextFormat=InputTextFormat;
			name.x = 10;
			
			NamePlain.addChild(name);
			NamePlain.x = 20;
			NamePlain.y = 40;
			
			//задаем параметры для подписи мыла
			mailSubj.embedFonts = true;
			mailSubj.autoSize = TextFieldAutoSize.LEFT;
			mailSubj.text = "Обратный e-mail:";
			mailSubj.selectable = false;
			mailSubj.setTextFormat(NameTextFormat);
			mailSubj.x = 20;
			mailSubj.y = 90 - mailSubj.textHeight - 7;
			
			
			
			//задаем параметры для поля ввода мыла
			mailField.embedFonts = true;
			mailField.width = 300;
			mailField.height = 20;
			mailField.type = TextFieldType.INPUT;
			mailField.defaultTextFormat=InputTextFormat;
			mailField.x = 10;
			
			MailPlane.addChild(mailField);
			MailPlane.x = 20;
			MailPlane.y = 90;
			
			//задаем параметры для поля сообщения
			messageSubj.embedFonts = true;
			messageSubj.autoSize = TextFieldAutoSize.LEFT;
			messageSubj.text = "Сообщение:";
			messageSubj.selectable = false;
			messageSubj.setTextFormat(NameTextFormat);
			messageSubj.x = 20;
			messageSubj.y = 140-messageSubj.textHeight-7;
			
			//задаем параметры для поля ввода сообщения
			message.embedFonts = true;
			message.width = 300;
			message.height = 270;
			message.type = TextFieldType.INPUT;
			message.wordWrap = true;
			message.multiline = true;
			message.defaultTextFormat=InputTextFormat;
			message.x = 10;
			message.y = 10;
			MessagePlane.addChild(message);
			MessagePlane.x = 20;
			MessagePlane.y = 140;
			
			//задаем параметры для статуса сообщения
			MessageStatus.embedFonts = true;
			MessageStatus.autoSize = TextFieldAutoSize.LEFT;
			MessageStatus.text = "";
			MessageStatus.selectable = false;
			MessageStatus.setTextFormat(NameTextFormat);
			MessageStatus.x = 20;
			MessageStatus.y = 437;
			
			//задаем параметры для кнопки
			submitText.embedFonts = true;
			submitText.autoSize = TextFieldAutoSize.RIGHT;
			submitText.text = "Отправить";
			submitText.selectable = false;
			submitText.setTextFormat(NameTextFormat);
			
			
			//рисуем кнопку
			submitButton.graphics.beginFill(0xA2BBCC, 1);
			submitButton.graphics.drawRect(0, 0, 320, 20);
			submitButton.graphics.endFill();
			submitButton.addChild(submitText);
			submitButton.x = wdth / 2 - submitButton.width / 2;
			submitButton.y = 460;
			submitText.x = submitButton.width-submitText.width-10;
			
			//рисуем кнопку закрытия формы
			/**
			 * размеры крестика
			 */
			var s:Number = 6.25;
			CloseForm.graphics.lineStyle(2, 0xFFFFFF, 1,false,"normal",CapsStyle.NONE,JointStyle.MITER);
			CloseForm.graphics.moveTo( -s, s);
			CloseForm.graphics.lineTo( s,-s);
			CloseForm.graphics.moveTo( s, s);
			CloseForm.graphics.lineTo( -s, -s);
			CloseForm.graphics.endFill();
			
			var closePlane:Sprite=new Sprite()
			closePlane.graphics.beginFill(0xFFFFFF, 0);
			closePlane.graphics.moveTo( -s, s);
			closePlane.graphics.lineTo(s, s);
			closePlane.graphics.lineTo(s, -s);
			closePlane.graphics.lineTo( -s, -s);
			closePlane.graphics.lineTo( -s, s);
			closePlane.graphics.endFill();
			
			CloseForm.addChild(closePlane);
			CloseForm.x = wdth-CloseForm.width;
			CloseForm.y = 12.5;
			CloseForm.alpha = 0.5;
			//рисуем подложку
			BackSide.graphics.beginFill(0x000000, 0.8);
			BackSide.graphics.drawRect(12, 12, 1001, 746);
			BackSide.graphics.endFill();
			BackSide.alpha = 0;
			//добавляем подложку на сцену			
			addChild(BackSide);
			//добавляем слушателей на подложку
			BackSide.addEventListener(MouseEvent.MOUSE_DOWN, onCloseMouseClick);
			//анимируем появление подложки
			timelineForm.append(TweenLite.to(BackSide, 1, { alpha:1 } ) );
			
			//рисуем форму обратной связи
			MailForm.graphics.lineStyle(1, 0xFFFFFF, 1);
			MailForm.graphics.beginFill(0xFFFFFF, 0.3);
			MailForm.graphics.drawRect(0, 0, wdth, hght);
			MailForm.graphics.endFill();
			
			//добавляем форму на сцену
			addChild(MailForm);
			
			//добавим в форму все остальное
			ContainForm.addChild(nameSubj);
			ContainForm.addChild(NamePlain);
			ContainForm.addChild(mailSubj);
			ContainForm.addChild(MailPlane);
			ContainForm.addChild(messageSubj);
			ContainForm.addChild(MessagePlane);
			ContainForm.addChild(MessageStatus);
			ContainForm.addChild(submitButton);
			ContainForm.addChild(CloseForm);
			MailForm.addChild(ContainForm);
			MailForm.x = 1024 / 2-MailForm.width/2;
			MailForm.y = 768 / 2-MailForm.height/2;
			
			ContainForm.alpha = 0;
			MailForm.scaleY = 0;
			//анимируем появление 
			timelineForm.append(TweenLite.to(MailForm, 1, { scaleY:1 } ) );
			timelineForm.append(TweenLite.to(ContainForm, 1, { alpha:1 } ) );
			
			//добавляем слушателей на кнопку закрытия формы
			CloseForm.addEventListener(MouseEvent.MOUSE_OVER, onCloseMouseOver);
			CloseForm.addEventListener(MouseEvent.MOUSE_OUT, onCloseMouseOut);
			CloseForm.addEventListener(MouseEvent.MOUSE_DOWN, onCloseMouseClick);
			//навели мышь
			function onCloseMouseOver(event:Event):void 
			{
				CloseForm.alpha = 1;
			}
			//убрали мышь
			function onCloseMouseOut(event:Event):void 
			{
				CloseForm.alpha = 0.5;
			}
			//нажали на кнопку
			function onCloseMouseClick(event:Event):void 
			{
				timelineForm.reverse()
				//removeChild(BackSide);
				//removeChild(MailForm);
			}
			
			//добавляем слушателей на кнопку отправки
			submitButton.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			submitButton.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			submitButton.addEventListener(MouseEvent.MOUSE_DOWN, onMouseClick);
			
			submitButton.alpha = 0.5;
			
			//навели мышь
			function onMouseOver(event:Event):void 
			{
				submitButton.alpha = 1;
			}
			//убрали мышь
			function onMouseOut(event:Event):void 
			{
				submitButton.alpha = 0.5;
			}
			//нажали на кнопку
			function onMouseClick(event:Event):void 
			{
				submitButton.removeEventListener(MouseEvent.MOUSE_DOWN, onMouseClick);
				MessageStatus.text = "";
				submitButton.alpha = 0.5;
				//если поля формы пусты, выводим пусто иначе делаем отправку данных
				if (name.text == "" || mailField.text == "" || message.text == "")
				{
					MessageStatus.text = "Не все поля заполнены";
					MessageStatus.setTextFormat(NameTextFormat);
					submitButton.addEventListener(MouseEvent.MOUSE_DOWN, onMouseClick);
				}
				else if (!validate_email(mailField.text))
				{
					MessageStatus.text = "Вы ввели неверный e-mail адрес";
					MessageStatus.setTextFormat(NameTextFormat);
					submitButton.addEventListener(MouseEvent.MOUSE_DOWN, onMouseClick);
				}
				else
				{
					//var email_data:String = "sendmail=" + mail + "&name=" + name.text + "&email=" + mailField.text + "&message=" + message.text;
					//variables = new URLVariables(email_data);
					//variables.dataFormat = URLLoaderDataFormat.TEXT;
					
					variables.sendmail = mail;
					variables.name = name.text;
					variables.email = mailField.text;
					variables.message = message.text;
					
					
					//передаем данные 
					request.data = variables;
					//задаем метод запроса
					request.method = URLRequestMethod.POST;
					
					//ожидаем что сценарий возвратит url кодированные переменные
					loader.dataFormat = URLLoaderDataFormat.TEXT;
					//слушаем событие complete чтобы прочитать ответ сервера
					loader.addEventListener(Event.COMPLETE, onHandleComplete);
					loader.load(request);
					MessageStatus.text = "Отправка";
					MessageStatus.setTextFormat(NameTextFormat);
					
					trace("sending");
				}
			}// end function onMouseClick
			function onHandleComplete(e:Event):void 
			{
				MessageStatus.text = "Ожидание ответа от сервера";
				MessageStatus.setTextFormat(NameTextFormat);
				
				var ldr:URLLoader =  URLLoader(e.target);
				ldr.dataFormat = URLLoaderDataFormat.TEXT;
				var vars:URLVariables = new URLVariables(ldr.data);
				var email_status:String = vars.success;
				var err:String = vars.error;
				MessageStatus.text = email_status;
				MessageStatus.setTextFormat(NameTextFormat);
				
				if (email_status == "yes")
				{
					MessageStatus.x = MailForm.width / 2 - MessageStatus.width;
					MessageStatus.y = MailForm.height / 2;
					MessageStatus.text = "Сообщение отправлено";
					MessageStatus.setTextFormat(NameTextFormat);
					nameSubj.visible = false;
					name.visible = false;
					mailSubj.visible = false;
					mailField.visible = false;
					messageSubj.visible = false;
					message.visible = false;
					submitText.x = submitButton.width/2-submitText.width/2;
					submitText.text = "OK";
					submitText.setTextFormat(NameTextFormat);
					submitButton.addEventListener(MouseEvent.MOUSE_DOWN, onCloseMouseClick);
					timelineForm.reverse();
				}
				else
				{
					MessageStatus.x = MailForm.width / 2 - MessageStatus.width;
					MessageStatus.y = MailForm.height / 2;
					MessageStatus.text = "Сообщение отправлено";
					MessageStatus.setTextFormat(NameTextFormat);
					nameSubj.visible = false;
					name.visible = false;
					mailSubj.visible = false;
					mailField.visible = false;
					messageSubj.visible = false;
					message.visible = false;
					submitText.x = submitButton.width/2-submitText.width/2;
					submitText.text = "OK";
					submitText.setTextFormat(NameTextFormat);
					submitButton.addEventListener(MouseEvent.MOUSE_DOWN, onCloseMouseClick);
					timelineForm.reverse();
					/*MessageStatus.text = "Ошибка отправки \n"+err+"\n"+request.data;
					MessageStatus.setTextFormat(NameTextFormat);
					message.text = "\n" + request.data;*/
				}
			}
			
			//проверка введенного адреса e-mail
			function validate_email(s:String):Boolean 
			{
				//рег. выр. для проверки их наличия в адресе
				var p:RegExp = /(\w|[_.\-])+@((\w|-)+\.)+\w{2,4}+/;
				//собственно сама проверка
				var r:Object = p.exec(s);
					if ( r == null ) 
					{
						return false;
					}
					else
					{
						return true;
					}
			}// end function validate_email
			
		}// end public function MailForm
		
	}// end public class BackForm
	
	}//end package