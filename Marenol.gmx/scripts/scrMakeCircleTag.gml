///scrMakeCircleTag(x,y,angle,numprojectiles,speed,obj,tag)
///spawns a ring of projectiles
///argument0 - spawn X
///argument1 - spawn Y
///argument2 - starting angle
///argument3 - number of projectiles to spawn
///argument4 - speed
///argument5 - projectile to spawn
///argument6 - tag
var spawnX = argument0;
var spawnY = argument1;
var spawnAngle = argument2;
var spawnNum = argument3;
var spawnSpeed = argument4;
var spawnObj = argument5;
var spawnTag = argument6;
var a;
a[spawnNum-1]=0;

for (var i = 0; i < spawnNum; i += 1)
{
    a[i]=0;
    a[@i] = instance_create(spawnX,spawnY,spawnObj);
    a[@i].speed = spawnSpeed;
    a[@i].direction = spawnAngle + i * (360 / spawnNum);
    a[@i].tag=spawnTag;
    
}
return a;
