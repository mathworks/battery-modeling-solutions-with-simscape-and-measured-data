function StopTime = get_StopTime(file_name)
%% Copyright 2022 The MathWorks, Inc.
%%
synthData = load(file_name);
StopTime = synthData.pulse_current{1}.Time(end);

end
