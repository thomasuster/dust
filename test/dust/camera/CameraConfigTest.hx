package dust.camera;

import dust.context.Context;
import flash.display.Sprite;
import dust.camera.config.CameraDecorator;
import dust.entities.EntitiesConfig;
import dust.entities.Entities;
import dust.camera.data.Camera;
import dust.context.Config;
import dust.context.DependentConfig;

import dust.Injector;

class CameraConfigTest
{
    @Test public function canBeConfigured()
    {
        var context = new Context()
            .configure(CameraConfig)
            .start(new Sprite());
    }
}
