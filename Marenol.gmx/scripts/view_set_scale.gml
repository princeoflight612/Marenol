///view_set_scale(targetScale)
var targetScale = argument[0]*800;
var StartX=view_xview[0];
var StartY = view_yview[0];
var StartScale = view_wview[0];
var MaxScale = targetScale - StartScale;

view_wview[0] = StartScale + MaxScale;
view_hview[0] = view_wview[0]*608/800;

view_xview[0] = StartX + (StartScale-view_wview[0])/2;
view_yview[0] = StartY + 608/800*(StartScale-view_wview[0])/2;

/*
var duration = argument[1];
var smoother; 
if( argument_count > 2 ) {
    smoother = argument[2];
} else {
    smoother = tween_sine_inout
}
var command = instance_create( 0, 0, oViewScaleCommand );

command.StartX = view_xview[0];
command.StartY = view_yview[0];
command.StartScale = view_wview[0];
command.MaxScale = targetScale - command.StartScale;
command.Step = 0;
command.Duration = duration;
command.Smoother = smoother;
