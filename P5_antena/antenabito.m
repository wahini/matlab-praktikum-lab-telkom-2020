%% MODUL P5 Antenna
clear all
close all

%% Design Frequency and Array parameters
freq = 1.1e9; % frekuensi
c = physconst('lightspeed');
lambda = c/freq;
N = 10; % n-array
dx= 0.49*lambda;

%% Helix
h = helix;
h.Turns = 10;
h.Radius = 0.025;

%% Linear Array
helix_array = linearArray;
helix_array.Element = h;
helix_array.NumElements = N;
helix_array.ElementSpacing = dx;

freq = 0.5e9:50e6:5e9;
RL = returnLoss(h,freq);
[~,ind1] = max(RL);
figure;
impedance(helix_array,freq);
marker1 = linspace(-500,500,21);
hold on
plot(freq(ind1).*ones(1,21)./1e9,marker1,'m-.','LineWidth',2)
textInfo = [ ' \leftarrow' num2str(freq(ind1)/1e9) 'GHz'];
text(freq(ind1-1)/1e9,300,textInfo,'FontSize',11)
hold off









% figure('Name','Linear Array')
% show(helix_array)
% axis tight

% figure('Name','Dimensi Array')
% layout(helix_array)

% %% Plot 3D Array Pattern
% figure('Name','Radiation Pattern')
% pattern(h,freq)
% figure('Name','Radiation Pattern')
% pattern3Dfig = figure;
% pattern(helix_array,freq)

% %% Impedance
% figure('Name','Impedance')
% impedance (helix_array,freq);
% 
% %% Field Analysis
% figure('Name','Radiation Pattern')
% pattern(helix_array,freq)
% figure('Name','Elevation Pattern')
% patternElevation(helix_array,freq)
% 
% %% Beamwidth
% figure('Name','Beamwidth')
% beamwidth(helix_array,freq,0,1:1:360);
% 
% %% E-plane & H-plane
% figure('Name','E-plane & H-plane')
% patternElevation(helix_array,freq)