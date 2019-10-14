% this does not seem to be complete, singular matrix is missing for example
%Warning: Struct field assignment overwrites a value with class "int16". See
%MATLAB R14SP2 Release Notes, Assigning Nonstructure Variables As Structures


allMsgs = mlint('-allmsg', '../startup.m');
message_str = [allMsgs.message];

fid = fopen('matlab_messages.txt','w');
fprintf(fid,'%s\n',message_str);
fclose(fid);
%save('matlab_messages.txt','-ascii','message_str');

