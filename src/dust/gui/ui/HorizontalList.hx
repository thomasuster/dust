package dust.gui.ui;

import dust.gui.data.UIContainer;
import dust.entities.api.Entity;

import nme.display.DisplayObject;
import nme.display.Sprite;
import nme.text.Font;
import nme.text.TextField;
import nme.text.TextFormat;

class HorizontalList extends Sprite
{
    var items:Array<DisplayObject>;
    var tail:DisplayObject;
    var padding:Int;

    public function new(items:Array<DisplayObject>, padding:Int)
    {
        super();
        this.items = new Array<DisplayObject>();
        this.padding = padding;
        setItems(items);
    }

    public function clearItems()
    {
        for (item in items)
            removeChild(item);
    }

    public function setItems(items:Array<DisplayObject>)
    {
        clearItems();
        for (item in items)
            addItem(item);
    }

    public function addItem(item:DisplayObject)
    {
        addChild(item);
        items.push(item);
        if (tail != null)
            layoutItem(item);
        tail = item;
    }

        function layoutItem(item:DisplayObject)
        {
            var tailRect = tail.getRect(this);
            var itemRect = item.getRect(item);
            item.x = padding + tailRect.right - itemRect.left;
        }

    public function removeItem(item:DisplayObject)
    {
        removeChild(item);
        items.remove(item);
    }
}