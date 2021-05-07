clear all
close all

%% Antena Single
% hx = helix('Radius',55e-3,'Width',3e-4,'Turns',3.7) %1.1 GHz
h = helix('Radius',55e-3,'Width',3e-4,'Turns',3.7) %1.1 GHz

frq = 1.1e9;
% freq = 1.05e9:25e4:1.15e9; % untuk N=1
freq = 1.05e9:25e6:1.15e9; % untuk N>1
c = physconst('lightspeed');
lambda = c/frq;
N = 4;
dx= 0.49*lambda;

% Antena Array
hx = linearArray;
hx.Element = h;
hx.NumElements = N;
hx.ElementSpacing = dx;

% %% Plot 2D
% figure('Name','Desain 2D Pattern Antena Helix Array');
% az_angle = 1:0.25:180;
% pattern(hx,freq,az_angle,0,'CoordinateSystem','rectangular')

% %% Desain, Layout, Pattern Antena Single
figure('Name','Desain Antena Helix Tunggal');
show(hx);
% figure('Name','Layout Antena Helix Tunggal');
% layout(hx);
% 
% % Impedance
% RL = returnLoss(hx,freq);
% [~,ind1] = max(RL);
% figure('Name','Impedance');
% Z = impedance(hx,freq);
% marker1 = linspace(-500,500,21);
% hold on
% plot(freq(ind1).*ones(1,21)./1e9,marker1,'m-.','LineWidth',2)
% textInfo = [ ' \leftarrow' num2str(freq(ind1)/1e9) 'GHz'];
% text(freq(ind1-1)/1e9,300,textInfo,'FontSize',11)
% hold off

% % Return Loss
% figure('Name','Return Loss');
% returnLoss(hx,freq);
% % marker2 = linspace(0,12,21);
% % hold on
% % plot(freq(ind1).*ones(1,21)./1e9,marker2,'m-.','LineWidth',2)
% % hold off
% 
% % S-parameter
% figure('Name','S-parameter');
% S=sparameters(hx,freq);
% rfplot(S)
% % marker2 = linspace(0,-12,21);
% % hold on
% % title('S-parameter')
% % plot(freq(ind1).*ones(1,21)./1e9,marker2,'m-.','LineWidth',2)
% % hold off
% 
% % Voltage Standing Wave Ratio
% figure('Name','Voltage Standing Wave Ratio');
% vswr(hx,freq);
% axis([20 120 1 20])
% 
% % Field Analysis
% figure('Name','Radiation Pattern Antena Helix Tunggal');
% pattern(hx,frq);
% p = PatternPlotOptions
% p.Transparency = 0.65;
% pattern(hx,frq,'patternOptions',p);
% 
% %% Lobes
% figure('Name','Lobes Pattern Antena Helix Tunggal');
% patternElevation(hx,frq);
% %% Beamwidth
% figure('Name','Beamwidth Antena Helix Tunggal');
% beamwidth(hx,frq,0,1:1:360);

% %% E-Plane dan H-Plane
% % % figure('Name','E-Plane H-Plane Antena Helix Tunggal');
% % % EHfields(hx,frq)
% 
% figure('Name','E-Plane Antena Helix Tunggal');
% patternElevation(hx,frq);
% 
% figure('Name','H-Plane Antena Helix Tunggal');
% patternAzimuth(hx,frq);

% % % 3D Plot
% % figure('Name','Horizontal Polarization Antena Helix Tunggal');
% % pattern(hx,frq,'Polarization','H')
% % figure('Name','Vertical Polarization Antena Helix Tunggal');
% % pattern(hx,frq,'Polarization','V')
% % figure('Name','Right-Hand Circularly Polarized Antena Helix Tunggal');
% % pattern(hx,frq,'Polarization','RHCP')
% % figure('Name','Left-Hand circularly polarized Antena Helix Tunggal');
% % pattern(hx,frq,'Polarization','LHCP')