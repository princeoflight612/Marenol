/// scrRdrInstanceScale( targetId, targetScale, duration, easingFunc = scrRdrTweenSineInOut )
// Change the X and Y scale of an instance or all instances of an object.
// New instance commands override existing ones.
var targetId = argument[0];
var targetScale = argument[1];
var duration = argument[2];

var easingFunc = scrRdrTweenSineInOut;
if( argument_count > 3 ) {
    easingFunc = argument[3];
}

with( targetId ) {
    var command = instance_create( x, y, oRdrScaleCommand );
    command.TargetId = id;
    command.StartScale = image_xscale;
    command.ScaleDelta = targetScale - image_xscale;
    command.Step = 0;
    command.Duration = max( duration, 1 );
    command.Smoother = easingFunc;
    self.Internal_ScaleChangeCommand = command;
}
