///scrBlockBreak(layer);
var layer = argument0;
with(objBlock){
    for(var i=0;i<2;i++) 
        for(var j=0;j<2;j++)
            instance_create(x+8+16*i,y+8+16*j,objPrince_BrokenTile)
    instance_destroy();
}
tile_layer_hide(layer);
