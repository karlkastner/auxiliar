x = linspace(0,1,256)';
o = 0*ones(256,1);
% three colour maps
map{1} = min(1,max(0,[3*x,3*x-1,3*x-2]));
map{2} = min(1,max(0,[3*x,3*x-2,3*x-1]));
map{3} = min(1,max(0,[3*x-1,3*x,3*x-2]));
map{4} = min(1,max(0,[3*x-1,3*x-2,3*x]));
map{5} = min(1,max(0,[3*x-2,3*x,3*x-1]));
map{6} = min(1,max(0,[3*x-2,3*x-1,3*x]));
% two colour maps
map{11} = min(1,max(0,[2*x,2*x-1,o]));
map{12} = min(1,max(0,[2*x,o,2*x-1]));
map{13} = min(1,max(0,[2*x-1,2*x,o]));
map{14} = min(1,max(0,[2*x-1,o,2*x]));
map{15} = min(1,max(0,[o,2*x,2*x-1]));
map{16} = min(1,max(0,[o,2*x-1,2*x]));

if (0)
% non-linear maps (cubic spline s-curve)
A = [1 0 0 0;
     0 1 0 0;
     1 1 1 1;
     0 1 2 3];
b = [0 0 1 0]';
c = A\b;
A = [x.^0 x x.^2 x.^3];
x = A*c;

% three colour maps
map{1} = min(1,max(0,[3*x,3*x-1,3*x-2]));
map{2} = min(1,max(0,[3*x,3*x-2,3*x-1]));
map{3} = min(1,max(0,[3*x-1,3*x,3*x-2]));
map{4} = min(1,max(0,[3*x-1,3*x-2,3*x]));
map{5} = min(1,max(0,[3*x-2,3*x,3*x-1]));
map{6} = min(1,max(0,[3*x-2,3*x-1,3*x]));
% two colour maps
map{11} = min(1,max(0,[2*x,2*x-1,o]));
map{12} = min(1,max(0,[2*x,o,2*x-1]));
map{13} = min(1,max(0,[2*x-1,2*x,o]));
map{14} = min(1,max(0,[2*x-1,o,2*x]));
map{15} = min(1,max(0,[o,2*x,2*x-1]));
map{16} = min(1,max(0,[o,2*x-1,2*x]));
end
