%% Field Analysis

% Radiation Pattern

h = circularArray('Element',helix,'NumElements',12)
% h.Turns = 13;
% h.Radius = 0.025;
pattern(h,2.1e9)