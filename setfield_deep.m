% Sat Jan 10 15:59:22 CET 2015
% Karl Kastner, Berlin
%
%%function s = setfield_deep(s,fieldname,value)
%%
%% set values of a struct or object, fieldnames can have sub-fields indicated by dots
%
function s = setfield_deep(s,fieldname,value)
	field_A = strsplit(fieldname,'.');
	% set recursively
	if (length(field_A) > 1)
		fieldname = strjoin(field_A(2:end),'.');
		if (~isfield(s,field_A{1}) && ~isprop(s,field_A{1}))
			s.(field_A{1}) = struct();
		end
		s.(field_A{1}) = setfield_deep(s.(field_A{1}),fieldname,value);
	else
		s.(field_A{1}) = value;
	end
%	S = [];
%	for idx=1:length(fields)-1
%		S(idx) = s.field_A(idx);
%	end
%	S(end).field_A(end) = value;
%	for idx=length(field)-1:-1:1
%		S(idx) = S(idx+1);
%	end
end

