% Thu 27 Jun 13:28:22 CEST 2019
% Karl Kästner, Berlin
%% recursively add a directory and sub-directories to the Matlab search path
%% call restoredefaultpath to undo this
function d_ = addpath_recursive(d)
	d_ = dir(d);
	addpath(d);
	for id = 1:length(d_)
		if (d_(id).isdir)
		d_id = d_(id).name;
		if ( ~strcmp(d_id(1),'.') ...
		     && ~(d_id(1) == '@') )
			d__ = [d,filesep,d_id];
			addpath_recursive(d__);
			addpath(d__);
		end
		end
	end % for id
end % addpath_recursive

