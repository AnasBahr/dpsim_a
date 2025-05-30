% Compare DP VBR, EMT Classical and Reference stator currents for ABCFault
% or LoadChange Simulation

clc
clear

SimulationType = 'LoadChange';
abs_on = 1;
shift_on = 0;
%% read PLECS results

Results_Reference = csvread(['../../../vsa/Results/',SimulationType,'/Simulink/Voltages_and_currents.csv']);

%% time step 0.000050

% Read values from CSV files
Log_SynGen_VBR = csvread(['../../../vsa/Results/',SimulationType,'/DPsim/DP/VBR/SynGen_DP_VBR_0.000050.csv'],1);
currentDP_VBR = Log_SynGen_VBR(:,1:7);
compOffsetDP_VBR = (size(currentDP_VBR,2) - 1) / 2;

% Calculate Current DP absolute value
currentAbsDP_VBR = currentDP_VBR(:,1);
for col = 2:( compOffsetDP_VBR + 1 )
    for row = 1:size(currentDP_VBR,1)
        currentAbsDP_VBR(row,col) = sqrt(currentDP_VBR(row,col)^2 + ...
            currentDP_VBR(row,col+compOffsetDP_VBR)^2);
    end
end

% Current Shift DP values
currentShiftDP_VBR = currentDP_VBR(:,1);
for col = 2:(compOffsetDP_VBR + 1)
    for row = 1:size(currentDP_VBR,1)
        currentShiftDP_VBR(row,col) = currentDP_VBR(row,col)*cos(2*pi*60*currentDP_VBR(row,1)) - ...
            currentDP_VBR(row,col+compOffsetDP_VBR)*sin(2*pi*60*currentDP_VBR(row,1));
    end
end


%% Read data from DP simulation and calculate absolute value and phase - Dq

% Read values from CSV files
Log_SynGen_Dq = csvread(['../../../vsa/Results/',SimulationType,'/DPsim/DP/Dq/SynGen_DP_Dq_0.000050.csv'],1);
currentDP_Dq = Log_SynGen_Dq(:,1:7);
compOffsetDP_Dq = (size(currentDP_Dq,2) - 1) / 2;

% Calculate Current DP absolute value
currentAbsDP_Dq = currentDP_Dq(:,1);
for col = 2:( compOffsetDP_Dq + 1 )
    for row = 1:size(currentDP_Dq,1)
        currentAbsDP_Dq(row,col) = sqrt(currentDP_Dq(row,col)^2 + ...
            currentDP_Dq(row,col+compOffsetDP_Dq)^2);
    end
end

% Current Shift DP values
currentShiftDP_Dq = currentDP_Dq(:,1);
for col = 2:(compOffsetDP_Dq + 1)
    for row = 1:size(currentDP_Dq,1)
        currentShiftDP_Dq(row,col) = currentDP_Dq(row,col)*cos(2*pi*60*currentDP_Dq(row,1)) - ...
            currentDP_Dq(row,col+compOffsetDP_Dq)*sin(2*pi*60*currentDP_Dq(row,1));
    end
end


%% Plot Current

% Phase A
h1 = figure(1);
hold off
Refplot = plot(Results_Reference(:,1), Results_Reference(:,5));
hold on
if shift_on == 1
VBRplotShift = plot(currentShiftDP_VBR(:,1),-currentShiftDP_VBR(:,2), '--');
DqplotShift = plot(currentShiftDP_Dq(:,1),currentShiftDP_Dq(:,2), '--');
end
if abs_on == 1
VBRplotABS = plot(currentAbsDP_VBR(:,1),currentAbsDP_VBR(:,2));
DqplotABS = plot(currentAbsDP_Dq(:,1),currentAbsDP_Dq(:,2));
end



set(Refplot,'LineWidth',2);
if shift_on == 1
set(VBRplotShift,'LineWidth',2);
set(DqplotShift,'LineWidth',2);
end
if abs_on == 1
set(VBRplotABS,'LineWidth',2);
set(DqplotABS,'LineWidth',2);
end

set(h1,'Units','centimeters');
set(h1,'pos',[5 5 24 13])
pos = get(h1,'Position');
set(h1,'PaperPositionMode','Auto','PaperUnits','centimeters','PaperSize',[pos(3), pos(4)])
xlim([0 0.3])

if abs_on == 1 && shift_on == 1
legend({'Reference', 'DP shift VBR', 'DP abs VBR', 'DP shift Classical', 'DP abs Classical'},'FontSize',12)
elseif abs_on == 1 && shift_on == 0
legend({'Reference', 'DP abs VBR', 'DP abs Classical'},'FontSize',12)
elseif abs_on == 0 && shift_on == 1
legend({'Reference', 'DP shift VBR', 'DP shift Classical'},'FontSize',12)
end

xlabel('time [s]','FontSize',12)
ylabel('current [A]','FontSize',12)


%% time step 0.000500

% Read values from CSV files
Log_SynGen_VBR = csvread(['../../../vsa/Results/',SimulationType,'/DPsim/DP/VBR/SynGen_DP_VBR_0.000500.csv'],1);
currentDP_VBR = Log_SynGen_VBR(:,1:7);
compOffsetDP_VBR = (size(currentDP_VBR,2) - 1) / 2;

% Calculate Current DP absolute value
currentAbsDP_VBR = currentDP_VBR(:,1);
for col = 2:( compOffsetDP_VBR + 1 )
    for row = 1:size(currentDP_VBR,1)
        currentAbsDP_VBR(row,col) = sqrt(currentDP_VBR(row,col)^2 + ...
            currentDP_VBR(row,col+compOffsetDP_VBR)^2);
    end
end

% Current Shift DP values
currentShiftDP_VBR = currentDP_VBR(:,1);
for col = 2:(compOffsetDP_VBR + 1)
    for row = 1:size(currentDP_VBR,1)
        currentShiftDP_VBR(row,col) = currentDP_VBR(row,col)*cos(2*pi*60*currentDP_VBR(row,1)) - ...
            currentDP_VBR(row,col+compOffsetDP_VBR)*sin(2*pi*60*currentDP_VBR(row,1));
    end
end


%% Read data from DP simulation and calculate absolute value and phase - Dq

% Read values from CSV files
Log_SynGen_Dq = csvread(['../../../vsa/Results/',SimulationType,'/DPsim/DP/Dq/SynGen_DP_Dq_0.000500.csv'],1);
currentDP_Dq = Log_SynGen_Dq(:,1:7);
compOffsetDP_Dq = (size(currentDP_Dq,2) - 1) / 2;

% Calculate Current DP absolute value
currentAbsDP_Dq = currentDP_Dq(:,1);
for col = 2:( compOffsetDP_Dq + 1 )
    for row = 1:size(currentDP_Dq,1)
        currentAbsDP_Dq(row,col) = sqrt(currentDP_Dq(row,col)^2 + ...
            currentDP_Dq(row,col+compOffsetDP_Dq)^2);
    end
end

% Current Shift DP values
currentShiftDP_Dq = currentDP_Dq(:,1);
for col = 2:(compOffsetDP_Dq + 1)
    for row = 1:size(currentDP_Dq,1)
        currentShiftDP_Dq(row,col) = currentDP_Dq(row,col)*cos(2*pi*60*currentDP_Dq(row,1)) - ...
            currentDP_Dq(row,col+compOffsetDP_Dq)*sin(2*pi*60*currentDP_Dq(row,1));
    end
end


%% Plot Current

% Phase A
h2 = figure(2);
hold off
Refplot = plot(Results_Reference(:,1), Results_Reference(:,5));
hold on
if shift_on == 1
VBRplotShift = plot(currentShiftDP_VBR(:,1),-currentShiftDP_VBR(:,2), '--');
DqplotShift = plot(currentShiftDP_Dq(:,1),currentShiftDP_Dq(:,2), '--');
end
if abs_on == 1
VBRplotABS = plot(currentAbsDP_VBR(:,1),currentAbsDP_VBR(:,2));
DqplotABS = plot(currentAbsDP_Dq(:,1),currentAbsDP_Dq(:,2));
end



set(Refplot,'LineWidth',2);
if shift_on == 1
set(VBRplotShift,'LineWidth',2);
set(DqplotShift,'LineWidth',2);
end
if abs_on == 1
set(VBRplotABS,'LineWidth',2);
set(DqplotABS,'LineWidth',2);
end

set(h2,'Units','centimeters');
set(h2,'pos',[5 5 24 13])
pos = get(h2,'Position');
set(h2,'PaperPositionMode','Auto','PaperUnits','centimeters','PaperSize',[pos(3), pos(4)])
xlim([0 0.3])

if abs_on == 1 && shift_on == 1
legend({'Reference', 'DP shift VBR', 'DP abs VBR', 'DP shift Classical', 'DP abs Classical'},'FontSize',12)
elseif abs_on == 1 && shift_on == 0
legend({'Reference', 'DP abs VBR', 'DP abs Classical'},'FontSize',12)
elseif abs_on == 0 && shift_on == 1
legend({'Reference', 'DP shift VBR', 'DP shift Classical'},'FontSize',12)
end

xlabel('time [s]','FontSize',12)
ylabel('current [A]','FontSize',12)
