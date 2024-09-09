% Fr 22. Mai 14:39:47 CEST 2015
% Karl Kastner, Berlin
function [totSize processed] = memsize(this,processed,leadstr)	
	if (nargin() < 2)
		leadstr = [];
	end
	if (length(this)>1)
		totSize = 0;
		for idx=1:length(this)
			totSize = totSize + memsize(this(idx));
		end
	else
		if (isstruct(this) || (isobject(this) && ~isa(this,'half')))
			if (isobject(this))
				% structs cannot point to the same memory space
				if (nargin() < 2)
					processed = {this};
				else
					for idx=1:length(processed)
						if (this == processed{idx})
							totSize = 0;
							return;
						end
					end
					processed{end+1} = this;
				end
			end
			props = fieldnames(this);
			totSize = 0;
			if (~isempty(this))
				for ii=1:length(props)
					currentProperty = getfield(this, char(props(ii)));
		%			if (isstruct(currentProperty) || isobject(currentProperty))
		%				if (nargin() > 1)
		%					[leadstr ' ' props(ii)]
		%				else
		%					leadstr = props(ii)
		%				end
		%			else
		%				leadstr = [];
		%			end
		%			[leadstr, props(ii)]
					
					% recursion
					[siz, processed] = memsize(currentProperty,processed,[leadstr, props(ii)]);
					totSize = totSize + siz;
					%s = whos('currentProperty');
					%totSize = totSize + s.bytes;
				end % for ii
			end % if (~isempty(this))
		else
			s = whos('this'); %currentProperty');
			totSize = s.bytes;
		end % else of if isstruct
	end % else of length > 1
%	fprintf(1, '%d bytes\n', totSize); 
end

