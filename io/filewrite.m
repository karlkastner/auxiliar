% 2015-03-01 12:51:26.887385001 +0100
% function filewrite(filename,s)
function filewrite(filename,s)
	fid=fopen(filename,'w');
	fprintf(fid,'%s\n',s);
	fclose(fid);
end

