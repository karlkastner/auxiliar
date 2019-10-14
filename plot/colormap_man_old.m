% Mon 18 Jul 13:51:22 CEST 2016

function cm = colormap_man()
% colorbrewer, 6 colors + black, swapped
cm = [0 0 0;
228,26,28
77,175,74
55,126,184
255,127,0
152,78,163
66.0000  150.5000  129.0000
%64,196,64 % 255,255,51
]/255;

cm = [
0,0,0,			% key
227,26,28		% r
51,160,44		% g
31,120,180		% b
255,127,0		% o
106,61,154		% v
177,89,40		% br
251,154,153		% lr
178,223,138		% lg
166,206,227		% lb
253,191,111		% lo
202,178,214		% lv
255,255,153		% y
]/255;

cm_ = [
0 0 0; % black
1 0 0; % red
0 1 0; % green
0 0 1; % blue 
1 1 0; % lilac
1 0 1; % brown
0 1 1; % orange
]*1;

% 7th color was yellow, make colour 2 dark and 7 light green
cm_ = [0 0 0;
228,26,28		% red
0,128,0			% dark green
55,126,184
255,127,0
152,78,163
0,196,0;		% lighter green
]/255;

if (0)


cm_ = [ ...
0 0 0,         0;   	%	K                                                    
1 0 0,         1;       %       R                                       
0 1 0,         3/6;     %       G                                       
0 0 1,         1/6;     %       B                                       
1 0 1,         2/6;     %       M                                       
0 1 1,         4/6;     %       C                                       
...%1 1 0,         1/6]; 	%	Y
1 1 0,         5/6]; 	%	Y


cm__ = [ ...
0 0 0,         0;   	%	K                                                    
1 0 0,         1;       %       R                                       
0 1 0,         1/6;     %       G                                       
0 0 1,         1/6;     %       B                                       
1 0 1,         3/6;     %       M                                       
0 1 1,         3/6;     %       C                                       
...%1 1 0,         1/6]; 	%	Y
1 1 0,         3/6]; 	%	Y


cm = [ ...
0 0 0,         0;   	%	K                                                    
1 0 0,         1;       %       R                                       
0 1 0,         3/12;     %       G                                       
0 0 1,         3/6;     %       B                                       
1 0 1,         3/6;     %       M                                       
0 1 1,         5/12;     %       C                                       
...%1 1 0,         1/6]; 	%	Y
1 1 0,         3/6]; 	%	Y


L = [0.2126, 0.7521, 0.0722];
L = [1/3, 1/3, 1/3];

if (1)
l = cm(:,1:3)*L'
if (0)
cm(:,1:3) = diag(cm(:,4)./l)*cm(:,1:3);
m = max(1,max(cm(:,1:3),[],2))
cm(1,:) = 0;
cm(:,1:3) = diag(1./m)*cm(:,1:3);
l = cm(:,1:3)*L'
cmg = l*L;
end
end
%cm(:,1:3)*L';

x = [0,1];
y = (1:size(cm,1))'*[1 1];
close all
figure(1)
plot(x,y,'linewidth',5)
set(0,'defaultAxesColorOrder',cm(:,1:3))
set(gca,'ColorOrder',cm(:,1:3))
plot(x,y,'linewidth',5)
get(gca,'colororder')
%set(gca,'defaultfigurecolormap',cm(:,1:3))
print -dpdf cmap.pdf


figure(2)
set(0,'defaultAxesColorOrder',cmg)
set(gca,'ColorOrder',cmg)
plot(x,y,'linewidth',5)
get(gca,'colororder')

%
	% hue		luminosity
	% 1 black		0	
	% 2 red		4/6	
	% 3 green		5/6	
	% 4 blue		3/6	
	% 5 orange	2/6	
	% 6 lilac		1/6	
	
end
	
