% 2015-08-15 10:52:50.849199094 +0200
% Karl Kastner, Berlin
function defprint(fid,namestr,formatstr,val,unitstr)
	if (nargin < 5)
		fprintf(fid,['\\def\\',namestr,'{',formatstr,'}\n'],val);
	else
		fprintf(fid,['\\def\\%s{',formatstr,'\\mathrm{%s}}\n'],namestr,val,unitstr);
	end
end

