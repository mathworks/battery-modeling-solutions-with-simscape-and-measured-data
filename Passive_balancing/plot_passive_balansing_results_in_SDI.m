function plot_passive_balansing_results_in_SDI()
%% Copyright 2022 The MathWorks, Inc.
%%
Simulink.sdi.view;
Simulink.sdi.clearAllSubPlots;
Simulink.sdi.clearPreferences;
Simulink.sdi.setSubPlotLayout(2, 2);

%%
RunIDs = Simulink.sdi.getAllRunIDs;
RunID = Simulink.sdi.getRun(RunIDs(end));

plot_single_signal_in_SubPlot(RunID, 'cell_voltages.cell_V_1', 1, 1);
plot_single_signal_in_SubPlot(RunID, 'cell_voltages.cell_V_2', 1, 1);
plot_single_signal_in_SubPlot(RunID, 'cell_voltages.cell_V_3', 1, 1);

plot_single_signal_in_SubPlot(RunID, 'discharge_signal.s1', 1, 2);
plot_single_signal_in_SubPlot(RunID, 'discharge_signal.s2', 1, 2);
plot_single_signal_in_SubPlot(RunID, 'discharge_signal.s3', 1, 2);

plot_single_signal_in_SubPlot(RunID, ...
    'passive_balancing_system.battery_plant_model.battery_3S_1P.battery_cell_1.battery_cell.Battery_Table_Based.soc', ...
    2, 1);
plot_single_signal_in_SubPlot(RunID, ...
    'passive_balancing_system.battery_plant_model.battery_3S_1P.battery_cell_2.battery_cell.Battery_Table_Based.soc', ...
    2, 1);
plot_single_signal_in_SubPlot(RunID, ...
    'passive_balancing_system.battery_plant_model.battery_3S_1P.battery_cell_3.battery_cell.Battery_Table_Based.soc', ...
    2, 1);

plot_single_signal_in_SubPlot(RunID, 'balancing_logic:ActiveLeaf', 2, 2);


end
