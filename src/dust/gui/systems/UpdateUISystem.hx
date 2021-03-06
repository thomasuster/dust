package dust.gui.systems;

import flash.geom.Rectangle;
import dust.gui.data.Alignment;
import dust.gui.data.VAlign;
import dust.gui.data.HAlign;
import dust.geom.data.Position;
import dust.gui.data.UIContainer;
import dust.entities.Entity;
import dust.collections.api.Collection;
import dust.systems.System;

class UpdateUISystem implements System
{
    @inject public var collection:Collection;

    var deltaTime:Float;

    public function start() {}
    public function stop() {}

    public function iterate(deltaTime:Float)
    {
        this.deltaTime = deltaTime;
        for (entity in collection)
            updateEntity(entity);
    }

        function updateEntity(entity:Entity)
        {
            var view:UIContainer = entity.get(UIContainer);
            view.refresh(entity, deltaTime);

            var position:Position = entity.get(Position);
            var alignment:Alignment = entity.has(Alignment) ? entity.get(Alignment) : Alignment.DEFAULT();
            var rect:Rectangle = view.display.getRect(view.display);

            view.display.x = position.x + getHOffset(alignment, rect);
            view.display.y = position.y + getVOffset(alignment, rect);
        }

            function getHOffset(alignment:Alignment, rect:Rectangle)
            {
                return switch (alignment.hAlign)
                {
                    case HAlign.LEFT:
                        -rect.left;
                    case HAlign.CENTER:
                        -(rect.left + rect.right) * 0.5;
                    case HAlign.RIGHT:
                        -rect.right;
                }
            }

            function getVOffset(alignment:Alignment, rect:Rectangle)
            {
                return switch (alignment.vAlign)
                {
                    case VAlign.TOP:
                        -rect.top;
                    case VAlign.MIDDLE:
                        -(rect.top + rect.bottom) * 0.5;
                    case VAlign.BOTTOM:
                        -rect.bottom;
                }
            }
}
