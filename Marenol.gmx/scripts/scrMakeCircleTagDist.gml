/// scrMakeCircleTagDist(x,y,angle,numprojectiles,speed,dist,obj,tag)
///spawns a ring of projectiles


var spawnX = argument0, spawnY = argument1, spawnAngle = argument2, spawnNum = argument3, spawnSpeed = argument4, spawnDist = argument5, spawnObj = argument6, spawnTag = argument7;

var a;
a[spawnNum-1]=0;

for (var i = 0; i < spawnNum; i += 1)
{
    var newAngle=spawnAngle+360*i/spawnNum;
    a[i]=0;
    a[@i] = instance_create(spawnX+spawnDist*dcos(newAngle),spawnY-spawnDist*dsin(newAngle),spawnObj);
    a[@i].speed = spawnSpeed;
    a[@i].direction = spawnAngle + i * (360 / spawnNum) + 180;
    a[@i].tag=spawnTag;
}
return a;
