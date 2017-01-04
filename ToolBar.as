package {
  import flash.display.*;

  public class ToolBar extends Sprite {
    public var x_:Number;
    public var y_:Number;
    public var width_:Number;
    public var height_:Number;

    public function ToolBar(x__:Number, y__:Number, w:Number, h:Number) {
      x_ = x__; y_ = y__; width_ = w; height_ = h;
      init();
    }

    private function init():void {
      var sprite:Sprite = new Sprite();
      addChild(sprite);

      sprite.graphics.lineStyle(0, 0, 1);
      sprite.graphics.moveTo(x_, y_);
      sprite.graphics.lineTo(x_, y_+height_);
    }
  }
}
