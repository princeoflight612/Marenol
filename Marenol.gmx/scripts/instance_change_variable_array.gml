/// instance_change_variable_array( targetId, varName, varIndex, targetX, duration, easingFunc = tween_sine_inout )
// Change the variable given by the string varName to targetX over time
// New instance commands override existing ones.
var targetId = argument[0];
var varName = argument[1];
var varIndex = argument[2]
var targetX = argument[3];
var duration = argument[4];

var easingFunc = tween_sine_inout;
if( argument_count > 5 ) {
    easingFunc = argument[5];
}

with( targetId ) {
    var command = instance_create( x, y, oRdrChangeVariableArrayCommand );
    command.TargetId = id;
    command.varName=varName;
    command.varIndex=varIndex;
    command.currVar=variable_instance_get(id,varName); //get the array
    command.StartVar=command.currVar[varIndex];
    command.DeltaX = targetX - command.StartVar;
    command.Step = 0;
    command.Duration = max( duration, 1 );
    command.Smoother = easingFunc;
    self.Internal_ChangeVariableCommand = command;
}
