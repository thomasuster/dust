package dust.relations.data;

import dust.entities.api.Entity;
import dust.components.Component;

class Relation extends Component
{
    public var agent:Entity;
    public var object:Entity;

    public function new(agent:Entity, object:Entity)
    {
        this.agent = agent;
        this.object = object;
    }
}
