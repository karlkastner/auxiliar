% Wed 27 May 12:40:13 +08 2020
function b = int2byte(i,e)
	b(:,1) = floor(i/256^2);
	b(:,2) = floor((i-b(:,1)*256^2)/256);
	b(:,3) = i-b(:,1)*256.^2-b(:,2)*256;
end

