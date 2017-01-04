package {
  import flash.display.*;
  import flash.events.*;

  public class MouseMoveDrag extends Sprite {
    private var ball:Ball;

    public function MouseMoveDrag() {
      init();
    }

    private function init():void {
      ball = new Ball();
      trace(stage);
      ball.x = stage.stageWidth / 2;
      ball.y = stage.stageHeight / 2;
      addChild(ball);
      // 在小球上监听鼠标事件
      ball.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
    }

    private function onMouseDown(event:MouseEvent):void {
      // 在舞台上监听鼠标事件
      stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
      stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
      trace('lalala');
    }

    private function onMouseUp(event:MouseEvent):void {
      // 移除mouseUp, mouseMove监听器
      stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
      stage.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
    }

    private function onMouseMove(event:MouseEvent):void {
      // 小球随鼠标移动
      ball.x = mouseX;
      ball.y = mouseY;
    }

  }
}
