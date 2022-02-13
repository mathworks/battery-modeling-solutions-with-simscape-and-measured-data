function [xTable, y] = helperGetFeatures(batch)
%% Copyright 2022 The MathWorks, Inc.
%%
% HELPERGETFEATURES function accepts the raw measurement data and computes
% the following feature:
%
% Q_{100-10}(V) variance [DeltaQ_var]
% Q_{100-10}(V) minimum [DeltaQ_min]
% Slope of linear fit to the capacity fade curve cycles 2 to 100 [CapFadeCycle2Slope]
% Intercept of linear fit to capacity fade curve, cycles 2 to 100 [CapFadeCycle2Intercept]
% Discharge capacity at cycle 2 [Qd2]
% Average charge time over first 5 cycles [AvgChargeTime]
% Minimum Internal Resistance, cycles 2 to 100 [MinIR]
% Internal Resistance difference between cycles 2 and 100 [IRDiff2And100]

N = size(batch,2); % Number of batteries

% Preallocation of variables
y = zeros(N, 1);
DeltaQ_var = zeros(N,1);
DeltaQ_min = zeros(N,1);
CapFadeCycle2Slope = zeros(N,1);
CapFadeCycle2Intercept = zeros(N,1);
Qd2 = zeros(N,1);
AvgChargeTime = zeros(N,1);
IntegralTemp = zeros(N,1);
MinIR = zeros(N,1);
IRDiff2And100 = zeros(N,1);

for i = 1:N
    % cycle life
    y(i,1) = size(batch(i).cycles,2) + 1;
    
    % Identify cycles with time gaps
    numCycles = size(batch(i).cycles, 2);
    timeGapCycleIdx = [];
    jBadCycle = 0;
    for jCycle = 2: numCycles
        dt = diff(batch(i).cycles(jCycle).t);
        if max(dt) > 5*mean(dt)
            jBadCycle = jBadCycle + 1;
            timeGapCycleIdx(jBadCycle) = jCycle;
        end
    end
    
    % Remove cycles with time gaps
    batch(i).cycles(timeGapCycleIdx) = [];
    batch(i).summary.QDischarge(timeGapCycleIdx) = [];
    batch(i).summary.IR(timeGapCycleIdx) = [];
    batch(i).summary.chargetime(timeGapCycleIdx) = [];
    
    % compute Q_100_10 stats
    DeltaQ = batch(i).cycles(100).Qdlin - batch(i).cycles(10).Qdlin;
    DeltaQ_var(i) = log10(abs(var(DeltaQ)));
    DeltaQ_min(i) = log10(abs(min(DeltaQ)));
    
    % Slope and intercept of linear fit for capacity fade curve from cycle
    % 2 to cycle 100
    coeff2 = polyfit(batch(i).summary.cycle(2:100), batch(i).summary.QDischarge(2:100),1);
    CapFadeCycle2Slope(i) = coeff2(1);
    CapFadeCycle2Intercept(i) = coeff2(2);
    
    %  Discharge capacity at cycle 2
    Qd2(i) = batch(i).summary.QDischarge(2);
    
    % Avg charge time, first 5 cycles (2 to 6)
    AvgChargeTime(i) = mean(batch(i).summary.chargetime(2:6));
    
    % Integral of temperature from cycles 2 to 100
    tempIntT = 0;
    for jCycle = 2:100
        tempIntT = tempIntT + trapz(batch(i).cycles(jCycle).t, batch(i).cycles(jCycle).T);
    end
    IntegralTemp(i) = tempIntT;
    
    % Minimum internal resistance, cycles 2 to 100
    temp = batch(i).summary.IR(2:100);
    MinIR(i) = min(temp(temp~=0));
    IRDiff2And100(i) = batch(i).summary.IR(100) - batch(i).summary.IR(2);
end

xTable = table(DeltaQ_var, DeltaQ_min, ...
    CapFadeCycle2Slope, CapFadeCycle2Intercept,...
    Qd2, AvgChargeTime, MinIR, IRDiff2And100);

end