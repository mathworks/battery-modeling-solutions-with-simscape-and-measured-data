function switch_battery_data_to_estimated()
%% Copyright 2022 The MathWorks, Inc.
%%
dic_obj = Simulink.data.dictionary.open('bat_param_est_data.sldd');

%%
try
    removeDataSource(dic_obj,'bat_param_before_estimated.sldd');
catch
end

%%
try
    addDataSource(dic_obj,'bat_param_after_estimated.sldd');
catch
end

end
