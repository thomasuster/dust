package;

import dust.console.ConsoleConfig;
import dust.context.Config;
import dust.interactive.eg.ReflectionDragExample;
import dust.quadtree.eg.QuadTreeVisualizationExample;
import dust.interactive.eg.OffsetDragExample;
import dust.camera.eg.MoveCameraExample;
import dust.interactive.eg.DragExample;
import dust.mainmenu.MainMenu;
import dust.context.Context;

import minject.Injector;
import nme.Assets;
import nme.display.DisplayObjectContainer;
import nme.display.MovieClip;
import nme.display.Sprite;
import nme.display.Stage;
import nme.events.KeyboardEvent;
import nme.events.MouseEvent;
import nme.ui.Keyboard;
import nme.text.TextField;
import nme.text.TextFormat;

class DustExamples
{
    static var context:Context;

    public static function main()
    {
        var mainMenu = new MainMenu()
            .add("1", "Drag Example", DragExample)
            .add("2", "OffsetDrag Example", OffsetDragExample)
            .add("3", "ReflectionDrag Example", ReflectionDragExample)
            .add("5", "QuadTreeVisualization Example", QuadTreeVisualizationExample);

        mainMenu.reset.bind(onReset);
        mainMenu.selected.bind(onSelection);
        mainMenu.enable();
    }

    static function onReset()
    {
        if (context != null)
            context.stop();
        context = null;
    }

    static function onSelection(config:Class<Config>)
    {
        var root = new Sprite();
        var injector = new Injector();
        context = new Context(injector)
            .configure(MoveCameraExample)
            .configure(ConsoleConfig)
            .configure(config)
            .start(root);
    }
}