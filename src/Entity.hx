import h2d.Scene;

class Entity {
    var x : Int;
    var y : Int;

    var size : Int;

    var scene : Scene;

    var bmp : h2d.Bitmap;
    var speed : Float = 5;

   

    public function new(x, y) {

        this.x = x;
        this.y = y;
    }


    public function init(scene: Scene) {
      this.scene = scene;

      var tile = h2d.Tile.fromColor(0xFFFFFF, 100, 100);
      tile.dx = -tile.width * 0.5;
      tile.dy = -tile.height * 0.5;
      
     //create a bitmap jbject and add it to the default 2d scene (s2d)
      bmp = new h2d.Bitmap(tile, scene);
    }

    public function update(dt:Float) {

       x++;
      bmp.x = x; 

    }

}