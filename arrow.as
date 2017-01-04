package {  // 包定义：首先本程序需用到的内建类
  import flash.display.*;

  public class arrow extends Sprite {  // 自定义arrow类，实现相关操作
    public function arrow() {
      init();
    }
    public function init():void {  // 画线并填充
      graphics.lineStyle(1, 0, 1);
      graphics.beginFill(0xffff00);
      graphics.moveTo(0, 25);
      graphics.lineTo(50, 25);
      graphics.lineTo(50, 0);
      graphics.lineTo(100, 50);
      graphics.lineTo(50, 100);
      graphics.lineTo(50, 75);
      graphics.lineTo(0, 75);
      graphics.lineTo(0, 25);
      graphics.endFill();
    }
  }
}
