function unpack_stuckt(s)
    for n = fieldnames(s)'
        name = n{1};
        value = s.(name);
        assignin('caller',name,value);
    end
