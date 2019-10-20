function out = alloc(size_, class_)
	switch (class_)
	case {'char'}
		out = char(zeros(size_,'uint8'));
	case {'logical'}
		out = false(size_);
	otherwise
		% numeric type
		out = zeros(size_,class_);
	end % switch
end
	
	
