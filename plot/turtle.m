function [X Y I] = turtle(P,n)
	n = size(P,1);
	X = [];
	Y = [];
	I = [];
	for idx=1:n-1
		X = [X; linspace(P(idx,1),P(idx+1,1),n)'];
		Y = [Y; linspace(P(idx,2),P(idx+1,2),n)'];
		I = [I; idx*ones(n,1)];
	end
end
%XY = [       (0:n)' zeros(n+1,1);
%       n*ones(n-1,1)  (1:n-1)';
%        (n:-1:0)' n*ones(n+1,1);
%        zeros(n,1), (n-1:-1:0)'];

