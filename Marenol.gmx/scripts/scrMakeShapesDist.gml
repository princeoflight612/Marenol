///scrMakeShapesDist(x,y,angle,edges,numprojectiles,speed,dist,obj,tag)
///spawns a custom shape
///argument0 - spawn X
///argument1 - spawn Y
///argument2 - starting angle
///argument3 - number of edges (3=triangle, 4=square, etc.)
///argument4 - projectile spawns per edge
///argument5 - speed
///argument6 - distance
///argument7 - projectile to spawn
///argument8 - tag

var spawnX = argument0;
var spawnY = argument1;
var spawnAngle = argument2;
var spawnEdges = argument3;
var spawnNum = argument4;
var spawnSpeed = argument5;
var spawnDist = argument6;
var spawnObj = argument7;
var spawnTag = argument8;
var th, xx, yy, ddx, ddy, dx, dy;
var array;
array[spawnNum*spawnEdges-1]=0;

th = degtorad(spawnAngle);

for (var i = 0; i < spawnEdges; i += 1)
{
    xx[i] = cos(th + 2*pi * i/spawnEdges);
    yy[i] = sin(th + 2*pi * i/spawnEdges);
}

xx[spawnEdges] = xx[0];
yy[spawnEdges] = yy[0];

for (var i = 0; i < spawnEdges; i += 1)
{
    ddx = xx[i+1]-xx[i];
    ddy = yy[i+1]-yy[i];
    
    for(var j = 0; j < spawnNum; j += 1)
    {
        dx = xx[i]+ddx*j/spawnNum;
        dy = yy[i]+ddy*j/spawnNum;
        
        array[@(i*spawnNum+j)] = instance_create(spawnX+spawnDist*dx,spawnY+spawnDist*dy,spawnObj);
        array[@(i*spawnNum+j)].tag = spawnTag;
        
        array[@(i*spawnNum+j)].direction = point_direction(0,0,dx,dy);
        array[@(i*spawnNum+j)].speed = spawnSpeed*point_distance(0,0,dx,dy);
    }
}

return array;
