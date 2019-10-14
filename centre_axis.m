axis square; ax=axis(); ax0=0.5*[ax(1)+ax(2),ax(3)+ax(4)];  dax=[ax(2)-ax(1),ax(4)-ax(3)], dax=mean(dax)*[1,1];axis([ax0(1)+dax(1)*[-1,1]/2,ax0(2)+dax(2)*[-1,1]/2]); axis off;

