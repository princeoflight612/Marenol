/// scrRdrInstanceChangeColourVariable( targetId, varName, targetX, duration, easingFunc = scrRdrTweenSineInOut )
// Change the variable given by the string varName to targetX over time
// New instance commands override existing ones.
var targetId = argument[0];
var varName = argument[1];
var targetX = argument[2];
var duration = argument[3];

var easingFunc = scrRdrTweenSineInOut;
if( argument_count > 4 ) {
    easingFunc = argument[4];
}

with( targetId ) {
    var command = instance_create( x, y, oRdrChangeColourVariableCommand );
    command.TargetId = id;
    command.varName=varName;
    command.StartVar=variable_instance_get(id,varName);
    command.targetX = targetX;
    command.Step = 0;
    command.Duration = max( duration, 1 );
    command.Smoother = easingFunc;
    self.Internal_ChangeVariableCommand = command;
}
