/// scrRdrTweenReturnSineInOut( beginValue, totalDelta, step, duration );
var beginValue = argument0;
var totalDelta = argument1;
var step = argument2;
var duration = argument3;

var hDuration = duration / 2;
if( step <= hDuration ) {
    return scrRdrTweenSineInOut( beginValue, totalDelta, step, hDuration );
} else {
    return scrRdrTweenSineInOut( beginValue + totalDelta, -totalDelta, step - hDuration, hDuration );
}
