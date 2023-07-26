import h2d.col.Point;

class Enemy extends Entity { 

   var speed : Float = 100;


    public function update(dt: Float, heroPoint: Point) {
    recalculate(dt,heroPoint);
    bmp.x = x;
    bmp.y = y;


   }
function recalculate(dt:Float, heroPoint: Point) {
    var point = new Point(x, y);

    var distance = point.distance(heroPoint);

    var sin = (heroPoint.y-y) / distance;
    var cos = (heroPoint.x-x) / distance;


    x = x + dt*speed* cos;
    y = y + dt*speed* sin;


   }
}