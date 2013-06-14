package dust.graphics.data;

import nme.display.Graphics;
import dust.entities.api.Entity;

interface Painter
{
    public function draw(entity:Entity, graphics:Graphics):Void;
}