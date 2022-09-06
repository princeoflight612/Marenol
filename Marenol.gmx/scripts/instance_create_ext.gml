///instance_create_ext(x,y,obj,speed,direction,scale,tag);

var X=argument0;
var Y=argument1;
var obj=argument2;
var spd=argument3;
var dir=argument4;
var scale=argument5;
var tag=argument6;

inst=instance_create(X,Y,obj);
inst.speed=spd;
inst.direction=dir;
inst.tag=tag;
inst.image_xscale=argument5;
inst.image_yscale=argument5;
return inst;
