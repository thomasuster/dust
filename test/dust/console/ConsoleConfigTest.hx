package dust.console;

import dust.console.control.HideConfigSignal;
import dust.console.impl.Console;
import dust.console.control.ShowConfigSignal;
import dust.console.impl.ConsoleMap;
import minject.Injector;
import nme.display.Sprite;
import dust.context.Context;

class ConsoleConfigTest
{
    var injector:Injector;

    @Before public function before()
    {
        injector = new Injector();
        var context = new Context(injector)
            .configure(ConsoleConfig)
            .start(new Sprite());
    }

    @Test public function consoleMapIsInjected()
    {
        Assert.isTrue(injector.hasMapping(ConsoleMap));
    }

    @Test public function consoleIsInjected()
    {
        Assert.isTrue(injector.hasMapping(Console));
    }

    @Test public function canEnableConsoleViaSignal()
    {
        injector.getInstance(ShowConfigSignal).dispatch();
        Assert.isTrue(injector.getInstance(Console).isEnabled);
    }

    @Test public function canDisableConsoleViaSignal()
    {
        injector.getInstance(ShowConfigSignal).dispatch();
        injector.getInstance(HideConfigSignal).dispatch();
        Assert.isFalse(injector.getInstance(Console).isEnabled);
    }
}