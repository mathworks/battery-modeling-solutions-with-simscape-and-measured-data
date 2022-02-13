function plot_battery_param_est_results_in_SDI()
% Copyright 2022 The MathWorks, Inc.
%%
Simulink.sdi.view;
Simulink.sdi.clearAllSubPlots;
Simulink.sdi.clearPreferences;
Simulink.sdi.setSubPlotLayout(3, 1);

%%
RunIDs = Simulink.sdi.getAllRunIDs;
RunID = Simulink.sdi.getRun(RunIDs(end));

plot_single_signal_in_SubPlot(RunID, 'I_in', 1, 1);
plot_single_signal_in_SubPlot(RunID, 'voltage_sim', 2, 1);
plot_single_signal_in_SubPlot(RunID, 'voltage_exp', 2, 1);
plot_single_signal_in_SubPlot(RunID, 'SOC', 3, 1);

end
