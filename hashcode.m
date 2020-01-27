% Fri 27 Dec 11:21:38 +08 2019
% function [hash_d,hash_s] = hashcode(str)
function [hash_d,hash_s] = hashcode(str)
	jstr   = javaObject('java.lang.String', str);
	hash_d = int32(jstr.hashCode);
	if (hash_d < 0)
		hash_d = hash_d+2^(31);
	end
	hash_s = sprintf('%010d',hash_d);
end

