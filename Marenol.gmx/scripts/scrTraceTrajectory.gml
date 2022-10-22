///scrTraceTrajectory(obj,steps,dist,tag)

var spawnObj=argument[0];
var steps=argument[1];
var dist=argument[2];
var spawnTag=argument[3];

var cx=x;
var cy=y;


for(var i=0;i<steps;i++){
    
    event_perform(ev_step,ev_step_normal);    
    hspeed+=gravity*dcos(gravity_direction);
    vspeed-=gravity*dsin(gravity_direction);
    x+=hspeed;
    y+=vspeed;
    
    var cr=point_distance(cx,cy,x,y);
    var ca=point_direction(cx,cy,x,y);
    while(cr>dist){
        cx+=dist*dcos(ca);
        cy-=dist*dsin(ca);
        cr-=dist;
        var obj=instance_create(cx,cy,spawnObj);
        obj.tag=spawnTag;
        obj.image_xscale=image_xscale;
        obj.image_yscale=image_yscale;
        image_xscale-=0.01;
        image_yscale-=0.01;
        
    }   
}
