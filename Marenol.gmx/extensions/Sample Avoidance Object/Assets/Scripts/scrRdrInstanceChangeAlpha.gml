/// scrRdrInstanceChangeAlpha( targetId, targetAlpha, duration, easingFunc = scrRdrTweenLinear )
// Change the alpha of an instance or all instances of an object.
// New instance commands override existing ones.
var targetId = argument[0];
var targetAlpha = argument[1];
var duration = argument[2];

var easingFunc = scrRdrTweenLinear;
if( argument_count > 3 ) {
    easingFunc = argument[3];
}

with( targetId ) {
    var command = instance_create( x, y, oRdrChangeAlphaCommand );
    command.TargetId = id;
    command.StartAlpha = image_alpha;
    command.DeltaAlpha = targetAlpha - image_alpha;
    command.Step = 0;
    command.Duration = max( duration, 1 );
    command.Smoother = easingFunc;
    self.Internal_AlphaChangeCommand = command;
}
