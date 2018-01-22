
package{
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
	import flash.text.*;

    public class Name extends Sprite
    {
		private var _output:TextField;
        public function Name()
        {
            initializeOutput();
			loadData();
        }
	
		private function initializeOutput():void
		{
			_output = new TextField();
			_output.width = stage.stageWidth;
			_output.height = stage.stageHeight;
			addChild(_output);
		}
		private function loadData():void
		{
			var loader:URLLoader = new URLLoader();
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			loader.addEventListener(Event.COMPLETE, handleComplete);
			loader.load(new URLRequest("cuba.html"));
		}
		private function handleComplete(event:Event):void
		{
			var loader:URLLoader = URLLoader(event.target);
			_output.htmlText = loader.data;
		}

    }

}