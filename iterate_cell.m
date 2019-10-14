% Sun  8 Oct 12:06:40 CEST 2017

function iterate_cell(fun,arg_C)

	iterate_cell_(1,{});

	function iterate_cell_(jdx,arg)
		val = arg_C{jdx};
		for idx=1:length(val)
			arg{jdx} = val(idx);
			if (jdx == length(arg_C))
				% terminate recursion
				fun(arg{:});
			else
				iterate_cell_(jdx+1,arg);
			end
		end % for idx
	end % iterate_cell_
end % iterate_cell

