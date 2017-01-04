package {
  import flash.display.*;
  import flash.events.*;
  import flash.net.*;

  [SWF(width=850, height=700, backgroundColor=0xFFFFFF)]


  public class paint extends Sprite {
    private var toolBar:ToolBar;
    private var erase:Boolean;  // 画笔 or 橡皮
    private var bitmap:Bitmap;
    private var color:uint;

    public function paint() {
      init();
      load();  // 加载调色板
    }

    private function init():void {
      var w:Number = stage.stageWidth * 1 / 4;
      var h:Number = stage.stageHeight;
      var y_:Number = (stage.stageHeight - h) / 2;
      var x_:Number = stage.stageWidth - w;

      toolBar = new ToolBar(x_, y_, w, h);
      addChild(toolBar);

      erase = false;
      color = 0xff000000;

      stage.addEventListener(MouseEvent.MOUSE_DOWN, onBoardMouseDown);
      stage.addEventListener(MouseEvent.MOUSE_UP, onBoardMouseUp);
    }

    private function load():void {
      var loader:Loader = new Loader();
      loader.contentLoaderInfo.addEventListener(
        Event.COMPLETE,
        onImageLoaded
      );
      loader.load(new URLRequest('colormap.gif'));
    }

    private function onImageLoaded(event:Event):void {
      var loaderInfo:LoaderInfo = event.target as LoaderInfo;
      var bitmap_:Bitmap = loaderInfo.content as Bitmap;
      var colormapData:BitmapData = bitmap_.bitmapData;
      bitmap = new Bitmap(colormapData);

      var ratio:Number = bitmap.height / bitmap.width;
      bitmap.width = toolBar.width_ * 95 / 100;
      bitmap.height = bitmap.width * ratio;
      bitmap.x = toolBar.x_ + (toolBar.width_ - bitmap.width) / 2;
      bitmap.y = toolBar.y_ + bitmap.x - toolBar.x_;
      addChild(bitmap);
    }

    private function createBrushStroke():void {
      var radius:uint = 3;
      var diameter:uint = radius * 2;
      var shape:Shape = new Shape();
      if(erase) {
        radius = 12;
        diameter = radius * 2;
      }

      var brushStroke:BitmapData = new BitmapData(
        diameter, diameter, false, color
      );
      if(erase) {
        brushStroke = new BitmapData(
          diameter, diameter, false, 0xffffffff
        );
      }

      graphics.lineStyle(diameter);
      graphics.lineBitmapStyle(brushStroke);
    }

    private function onBoardMouseDown(event:MouseEvent):void {
      if(mouseInsideBoarder()) {
        createBrushStroke();
        graphics.moveTo(stage.mouseX, stage.mouseY);
        stage.addEventListener(MouseEvent.MOUSE_MOVE, onBoardMouseMove);
      }
    }

    private function onBoardMouseUp(event:MouseEvent):void {
      stage.removeEventListener(MouseEvent.MOUSE_MOVE, onBoardMouseMove);
      if(mouseOnColormap()) {
        color = bitmap.bitmapData.getPixel32(
          stage.mouseX - bitmap.x,
          stage.mouseY - bitmap.y
        );
        trace(color.toString(16));
      }
    }

    private function onBoardMouseMove(event:MouseEvent):void {
      if(mouseInsideBoarder()) {
        graphics.lineTo(stage.mouseX, stage.mouseY);
        event.updateAfterEvent();
      }
    }

    private function mouseInsideBoarder():Boolean {
      return(
        !(stage.mouseX <= toolBar.x_ + toolBar.width_ &&
          stage.mouseX >= toolBar.x_ &&
          stage.mouseY <= toolBar.y_ + toolBar.height_ &&
          stage.mouseY >= toolBar.y_)
      );
    }

    private function mouseOnColormap():Boolean {
      return(
        stage.mouseX <= bitmap.x + bitmap.width &&
        stage.mouseX >= bitmap.x &&
        stage.mouseY <= bitmap.y + bitmap.height &&
        stage.mouseY >= bitmap.y
      );
    }
  }
}
