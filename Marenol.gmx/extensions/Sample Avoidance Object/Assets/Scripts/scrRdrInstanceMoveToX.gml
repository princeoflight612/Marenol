/// scrRdrInstanceMoveToX( targetId, targetX, duration, easingFunc = scrRdrTweenSineInOut )
// Move an instance or all instances of an object to a given X position.
// New instance commands override existing ones.
var targetId = argument[0];
var targetX = argument[1];
var duration = argument[2];

var easingFunc = scrRdrTweenSineInOut;
if( argument_count > 3 ) {
    easingFunc = argument[3];
}

with( targetId ) {
    var command = instance_create( x, y, oRdrMoveXCommand );
    command.TargetId = id;
    command.DeltaX = targetX - x;
    command.Step = 0;
    command.Duration = max( duration, 1 );
    command.Smoother = easingFunc;
    self.Internal_MoveXCommand = command;
}
