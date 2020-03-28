% Thu Nov 21 11:20:08 UTC 2013
% Karl Kästner

function tokenC = strsplit(str, delim)
	tokenC = regexp(str, ['(' delim ')'], 'split');
end % strsplit

