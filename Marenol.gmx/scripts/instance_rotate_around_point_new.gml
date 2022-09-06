///instance_rotate_around_point( targetId, targetX, targetY, targetAngle, duration, easingFunc = tween_sine_inout )
// Rotate an instance around a point by targetAngle degrees.
// New instance commands override existing ones.
var targetId = argument[0];
var targetX = argument[1];
var targetY = argument[2];
var targetAngle = argument[3];
var duration = argument[4];

var easingFunc = tween_sine_inout;
if( argument_count > 5 ) {
    easingFunc = argument[5];
}

with( targetId ) {
    var command = instance_create( x, y, oRotateAroundCommand );
    command.TargetId = id;
    command.PointX = targetX
    command.PointY = targetY
    command.StartDist = point_distance(x,y,targetX,targetY);
    command.StartAngle = point_direction(x,y,targetX,targetY)+180;
    command.AngleDelta = targetAngle;
    command.Step = 0;
    command.Duration = max( duration, 1 );
    command.Smoother = easingFunc;
    self.Internal_RotateAroundCommand = command;
}
