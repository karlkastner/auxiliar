% Wed 27 Sep 11:08:17 CEST 2023
function touch(filename)
	% TODO This does not update the time stamp if the file exists!	
	fid = fopen(filename,'a');
	fclose(fid);
end

