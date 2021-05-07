clear all
close all

%% Antena Single
% hx = helix('Radius',55e-3,'Width',3e-4,'Turns',3.7) %1.1 GHz
h = helix('Radius',55e-3,'Width',3e-4,'Turns',3.7) %1.1 GHz

frq = 1.1e9;
% freq = 1.05e9:25e4:1.15e9; % untuk N=1
freq = 1.05e9:25e7:1.15e9; % untuk N>1
c = physconst('lightspeed');
lambda = c/frq;
N = 12;
dx= 0.49*lambda;

% Antena Array
hx = linearArray;
hx.Element = h;
hx.NumElements = N;
hx.ElementSpacing = dx;

%% Field Analysis
figure('Name','Radiation Pattern Antena Helix Tunggal');
pattern(hx,frq);