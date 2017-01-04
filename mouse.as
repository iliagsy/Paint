package {
  import flash.display.*;
  import flash.events.*;

  public class mouse extends Sprite{
    public function mouse() {
      init();
    }
    private function init():void {
      // 绘制一个填充圆作为可视对象，放在舞台中心位置
      var sprite:Sprite = new Sprite();
      addChild(sprite);
      /*sprite.graphics.beginFill(0xff0000);*/
      sprite.graphics.lineStyle(10, 0, 1);
      sprite.graphics.drawCircle(0, 0, 50);
      /*sprite.graphics.endFill();*/
      sprite.x = stage.stageWidth / 2;
      sprite.y = stage.stageHeight / 2;
      // 在圆形对象上注册各种鼠标事件
      sprite.addEventListener(MouseEvent.CLICK, onMouseEvent);
      sprite.addEventListener(MouseEvent.DOUBLE_CLICK, onMouseEvent);
      sprite.addEventListener(MouseEvent.MOUSE_DOWN, onMouseEvent);
      sprite.addEventListener(MouseEvent.MOUSE_MOVE, onMouseEvent);
      sprite.addEventListener(MouseEvent.MOUSE_OUT, onMouseEvent);
      sprite.addEventListener(MouseEvent.MOUSE_OVER, onMouseEvent);
      sprite.addEventListener(MouseEvent.MOUSE_UP, onMouseEvent);
      sprite.addEventListener(MouseEvent.MOUSE_WHEEL, onMouseEvent);
      sprite.addEventListener(MouseEvent.ROLL_OUT, onMouseEvent);
      sprite.addEventListener(MouseEvent.ROLL_OVER, onMouseEvent);
    }

    public function onMouseEvent(event:MouseEvent):void {
      // 在圆形面板上输出鼠标事件类型
      trace(event.type);
    }
  }
}
