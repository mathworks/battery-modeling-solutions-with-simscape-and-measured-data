function plot_battery_pack_results_in_SDI()
% Copyright 2022 The MathWorks, Inc.
%%
Simulink.sdi.view;
Simulink.sdi.clearAllSubPlots;
Simulink.sdi.clearPreferences;
Simulink.sdi.setSubPlotLayout(2, 2);

%%
RunIDs = Simulink.sdi.getAllRunIDs;
RunID = Simulink.sdi.getRun(RunIDs(end));

plot_single_signal_in_SubPlot(RunID, ...
    'battery_pack_model.Load.Resistor.v', 1, 1);

plot_single_signal_in_SubPlot(RunID, ...
    'battery_pack_model.Load.Resistor.i', 2, 1);

plot_single_signal_in_SubPlot(RunID, ...
    'battery_pack_model.battery_pack.Cell_Module_with_Monitoring1.Battery_Module.Battery_Cell1.Battery_Table_Based.soc', ...
    1, 2);

plot_single_signal_in_SubPlot(RunID, ...
    'cell_temperatures:1.Module1.cell_T_1', 2, 2);

plot_single_signal_in_SubPlot(RunID, ...
    'cell_temperatures:1.Module1.cell_T_6', 2, 2);

end
