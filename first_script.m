clear all;
clc;

tic
A=zeros(2000,2000);
for ii=1:size(A,1)
    for jj=1:size(A,2)
        A(ii,jj)=ii+jj;
    end
end
toc


%%intriguingly, my computer is ~4x as fast as the one he ran his demos on