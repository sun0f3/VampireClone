import haxe.io.Float32Array;
import hxd.FloatBuffer;
import hxd.Key;

using Lambda;

class Main extends hxd.App{
    var hero : h2d.Bitmap;

    var velocity : Float = 0;
    var gravity : Float = 10;
    var speed : Float = 100;
    
    var chunkSize : Float = 100;

    var windowsizex : Int = 800;
    var windowsizey : Int = 768;

    var herosizex : Int = 100;
    var herosizey : Int = 100;

    var enemies : Array<Enemy> = [];

    override function init (){
       // create a white box + create 100x100 tile from it
        var tile = h2d.Tile.fromColor(0xFFFFFF, herosizex, herosizey);
        tile.dx = -tile.width * 0.5;
        tile.dy = -tile.height * 0.5;
        
       //create a bitmap jbject and add it to the default 2d scene (s2d)
        hero = new h2d.Bitmap(tile, s2d);

        enemies.push(new Enemy(0,0));
        enemies.push(new Enemy(0,400));
        enemies.push(new Enemy(400,0));
        enemies.push(new Enemy(400,400));

        
        enemies.iter(function(enemy) enemy.init(s2d));


       //modify the display position of bitmap
       hero.x = s2d.width * 0.5;
       hero.y = s2d.height * 0.5;
    }

    override function update(dt:Float) {
        
        recalculate_enemies(dt);

        MoveHero(dt);
    
    }

    function recalculate_enemies(dt:Float) {

        var heroPosition : h2d.col.Point = new h2d.col.Point(hero.x,hero.y);
        enemies.iter(function(enemy) enemy.update(dt, heroPosition));
    }

    //Передвижения персонажа
    function MoveHero(dt : Float) {
        //WASD
        if(Key.isDown(Key.A)&&(hero.x >= (herosizex/2)))
            hero.x = hero.x - dt * speed;
        if(Key.isDown(Key.D)&&(hero.x <= (windowsizex-(herosizex/2))))
            hero.x = hero.x + dt * speed;
        if(Key.isDown(Key.W)&&(hero.y >= (herosizex/2)))
            hero.y = hero.y - dt * speed;
        if(Key.isDown(Key.S)&&(hero.y <= (windowsizey-(herosizey/2))))
            hero.y = hero.y + dt * speed;

        //Стрелочки
        if(Key.isDown(Key.LEFT)&&(hero.x >= (herosizex/2)))
            hero.x = hero.x - dt * speed;
        if(Key.isDown(Key.RIGHT)&&(hero.x <= (windowsizex-(herosizex/2))))
            hero.x = hero.x + dt * speed;
        if(Key.isDown(Key.UP)&&(hero.y >= (herosizex/2)))
            hero.y = hero.y - dt * speed;
        if(Key.isDown(Key.DOWN)&&(hero.y <= (windowsizey-(herosizey/2))))
            hero.y = hero.y + dt * speed;


    }



    static function main() {
        new Main();
    }




}
