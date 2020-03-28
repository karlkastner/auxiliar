function catXML(a,leader)
	if (nargin()<2)
		leader = '';
	else
		leader = [leader,'.'];
	end
	if (isempty(a.Children))%~isfield(a,'Childdren'))
		disp([leader,a.Name]);
		disp(a.Attributes);
		disp(a.Data);
	else
	for idx=1:length(a.Children)
		catXML(a.Children(idx),[leader,a.Name]);
	end
	end
end



