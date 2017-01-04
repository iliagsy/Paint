package {
  import flash.display.*;

  public class Ball extends Sprite {
    public function Ball() {
      init();
    }
    public function init():void {
      var sprite:Sprite = new Sprite();
      addChild(sprite);
      /*sprite.graphics.beginFill(0xff0000);*/
      sprite.graphics.beginFill(0xff0000);
      sprite.graphics.drawCircle(0, 0, 50);
      sprite.graphics.endFill();
    }
  }
}
