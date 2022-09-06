///instance_move_to_polar( targetId, targetX, targetY, targetRadius, targetAngle, duration, easingFunc = tween_sine_inout )
// Rotate an instance around a point by targetAngle degrees.
// New instance commands override existing ones.
var targetId = argument[0];
var targetX = argument[1];
var targetY = argument[2];
var targetRadius = argument[3];
var targetAngle = argument[4];
var duration = argument[5];

var easingFunc = tween_sine_inout;
if( argument_count > 6 ) {
    easingFunc = argument[6];
}

with( targetId ) {
    var command = instance_create( x, y, oMoveToPolarCommand );
    command.TargetId = id;
    command.PointX = targetX
    command.PointY = targetY
    command.StartDist = point_distance(x,y,targetX,targetY);
    command.StartAngle = point_direction(x,y,targetX,targetY)+180;
    command.AngleDelta = targetAngle;
    command.RadiusDelta = targetRadius - command.StartDist;
    command.Step = 0;
    command.Duration = max( duration, 1 );
    command.Smoother = easingFunc;
    self.Internal_MoveToPolarCommand = command;
}
