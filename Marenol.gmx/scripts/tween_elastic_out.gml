/// tween_elastic_out( beginValue, totalDelta, step, duration );
//https://easings.net/#easeOutElastic
var beginValue = argument0;
var totalDelta = argument1;
var step = argument2;
var duration = argument3;
var ct=step/duration;
var c4 = 2*pi/3;

if(step==0) return beginValue+totalDelta;
else return beginValue+totalDelta*(power(2,-10*ct)*sin((ct * 10 - 0.75) * c4) + 1)

