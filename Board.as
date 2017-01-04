package {
  import flash.display.*;

  public class Board extends Sprite {
    public var x:Number;
    public var y:Number;
    public var width:Number;
    public var height:Number;

    public function Board() {
      init();
    }

    private function init():void {
      var sprite:Sprite = new Sprite();
      addChild(sprite);

      sprite.graphics.lineStyle(0, 0, 1);
      sprite.graphics.moveTo(x, y);
      sprite.graphics.lineTo(x+width, y+height);
      /*sprite.graphics.beginFill(0x00ffffff);
      sprite.graphics.drawRect(0 ,0, 50, 50);
      sprite.graphics.endFill();*/
    }
  }
}
