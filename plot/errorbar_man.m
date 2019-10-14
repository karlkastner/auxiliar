% Thu Nov 20 19:03:35 CET 2014
% Karl Kastner, Berlin
function errorbar_man(X,Y,L,U,varargin)
	if (nargin() < 4 | isempty(U))
		U = L;
	end
	m = 'od^*vxh+.';
	c = colormap('lines');
	for idx=1:size(Y,2)
%		bar(bottom.centre.log',h_');
		errorbar(X,Y(:,idx),L(:,idx),U(:,idx),varargin{:},'color',c(idx,:),'marker',m(idx),'markerfacecolor',c(idx,:));
		hold on
	end
end % errorbar_man

