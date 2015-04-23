function [aPad]=pad2(a,M);


% pads a with one zero in front and trailing zeros in the back to obtain a
% vector of length M
%
% aPad=[0 a 0 0 0 0 0 ...]

if length(a)+1 > M
    disp('M too small to pad vector')
    stop
end

if iscolumn(a)
    aPad=zeros(M,1);
else
    aPad=zeros(1,M);
end

n=length(a);

aPad(1)=0;
aPad(2:n+1)=a;


return