///script_execute_delayed(scr,delay,param1,param2...)

var scr=argument[0];
var delay=argument[1];
var numargs=argument_count-2;

var obj=instance_create(0,0,oDelayedExecutionCommand);
obj.scr=scr;
obj.delay=delay;
obj.numargs=numargs;
for(var i=0;i<argument_count;i++){
    obj.args[i]=argument[i];
}
