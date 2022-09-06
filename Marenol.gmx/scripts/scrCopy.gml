/// scrCopy(obj)
//Copies the instance and its default variables
var obj = argument0;

var ind = instance_create(x,y,obj);

ind.sprite_index=sprite_index;
ind.image_index=image_index;

ind.image_xscale=image_xscale;
ind.image_yscale=image_yscale;
ind.image_angle=image_angle;

ind.image_alpha=image_alpha;
ind.image_blend=image_blend;


ind.tag=tag;

return ind;
