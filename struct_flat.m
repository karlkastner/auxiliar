% Di 19. Mai 14:28:44 CEST 2015
% Karl Kastner, Berlin

function out = flat(in)
	field_C = fields(in);
	out     = struct();
	for idx=1:length(field_C)
		out.(field_C{idx}) = cvec(in(1).(field_C{idx}));
		for jdx=2:length(in)
			out.(field_C{idx}) = ...
                           vertcat(out.(field_C{idx}),cvec(in(jdx).(field_C{idx})));
		end % for jdx
	end % for idx
end % function flat

