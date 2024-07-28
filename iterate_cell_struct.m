% Wed  3 Jan 09:05:22 CET 2024
function iterate_cell_struct(fun,s,name_C,arg_C)
	if (isempty(s))
		s = struct();
	end

	iterate_cell_(s,1,{});

	function iterate_cell_(s,jdx,arg)
		name = name_C{jdx};
		val  = arg_C{jdx};
		for idx=1:length(val)
			s = setfield_deep(s,name,val{idx});
			if (jdx == length(arg_C))
				% terminate recursion
				fun(s);
			else
				iterate_cell_(s,jdx+1,arg);
			end
		end % for idx
	end % iterate_cell_
end % iterate_cell

