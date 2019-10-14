% 2016-05-12 17:25:35.001948416 +0200

% TODO support multi-digit

function y = arabic2roman(x)
	x = round(x);
	switch(x)
		case {1}
			y = 'I';
		case {2}
			y = 'II';
		case {3}
			y = 'III';
		case {4}
			y = 'IV';
		case {5}
			y = 'V';
		case {6}
			y = 'VI';
		case {7}
			y = 'VII';
		case {8}
			y = 'VIII';
		case {9}
			y = 'IX';
	end
end
