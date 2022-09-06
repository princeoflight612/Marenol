///view_screen_shake(amplitude,duration);

var amplitude=argument0;
var duration=argument1;
with(oViewScreenShakeCommand) {
    view_xview[0]=viewXStart;
    view_yview[0]=viewYStart;
    instance_destroy();

}
var obj=instance_create(0,0,oViewScreenShakeCommand);
obj.amplitude=amplitude;
obj.t=duration;
obj.viewXStart=view_xview[0];
obj.viewYStart=view_yview[0];


