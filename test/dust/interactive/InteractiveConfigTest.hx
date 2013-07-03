package dust.interactive;

import flash.display.Sprite;
import flash.display.DisplayObjectContainer;
import dust.context.Context;

import dust.Injector;

class InteractiveConfigTest
{
    var root:DisplayObjectContainer;
    var injector:Injector;
    var context:Context;

    @Before public function before()
    {
        root = new Sprite();
        context = new Context()
            .configure(InteractiveConfig)
            .start(root);
        injector = context.injector;
    }

    @Test public function tmp()
    {

    }
}
