package {
  import flash.display.*;
  import flash.events.MouseEvent;

  [SWF(width=550, height=400, backgroundColor=0xFFFFFF)]

  public class DrawingBitmapStrokes extends Sprite {
    public function DrawingBitmapStrokes() {
      stage.addEventListener(MouseEvent.MOUSE_DOWN, onStageMouseDown);
      stage.addEventListener(MouseEvent.MOUSE_UP, onStageMouseUp);
    }

    private function createBrushStroke():void {
      var radius:uint = Math.random() * 10 + 2;
      var diameter:uint = radius * 2;
      var shape:Shape = new Shape();

      shape.graphics.beginFill(Math.random()*0xFFFFFF);
      shape.graphics.drawCircle(radius, radius, radius);
      shape.graphics.endFill();

      var brushStroke:BitmapData = new BitmapData(
        diameter, diameter, true, 0x00000000
      );
      brushStroke.draw(shape);

      graphics.lineStyle(diameter);
      graphics.lineBitmapStyle(brushStroke);
    }

    private function onStageMouseDown(event:MouseEvent):void {
      createBrushStroke();
      graphics.moveTo(stage.mouseX, stage.mouseY);
      stage.addEventListener(MouseEvent.MOUSE_MOVE, onStageMouseMove);
    }

    private function onStageMouseUp(event:MouseEvent):void {
      stage.removeEventListener(MouseEvent.MOUSE_MOVE, onStageMouseMove);
    }

    private function onStageMouseMove(event:MouseEvent):void {
      graphics.lineTo(stage.mouseX, stage.mouseY);
      event.updateAfterEvent();
    }
  }
}
