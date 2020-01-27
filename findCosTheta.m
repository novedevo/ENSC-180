function[cosTheta] = findCosTheta(u,v)
    dot=sum(u.*v);
    normu=norm(u);
    normv=norm(v);
    cosTheta=dot/(normu*normv);
end
