/// view_move_scale( targetX, targetY, targetScale, duration, easingFunc = tween_sine_inout)

var targetX = argument[0];
var targetY = argument[1];
var targetScale = argument[2]*800;
var duration = argument[3];
var smoother; 
if( argument_count > 4 ) {
    smoother = argument[4];
} else {
    smoother = tween_sine_inout
}
var command = instance_create( 0, 0, oViewMoveScaleCommand );

command.StartX = view_xview[0];
command.StartY = view_yview[0];
command.DeltaX = targetX-command.StartX;
command.DeltaY = targetY-command.StartY;
command.StartScale = view_wview[0];
command.MaxScale = targetScale - command.StartScale;
command.Step = 0;
command.Duration = duration;
command.Smoother = smoother;
