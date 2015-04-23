function [frequencydomain,a,Sjs] = JONSWAPspectrum(obj,df,fHighCut)
if (obj.Tp/sqrt(obj.Hs)) <= 3.6
    gama=5;
elseif 3.6 <=(obj.Tp/sqrt(obj.Hs)) <= 5
    gama=exp(5.75-1.15*obj.Tp/(sqrt(obj.Hs)));
else
    gama=1;
end
fp=1/obj.Tp;
frequencydomain=df:df:fHighCut;
sigma = (frequencydomain<=fp)*0.07 + (frequencydomain>fp)*0.09;
taf = (exp(-0.5.*(((frequencydomain./fp)-1)./sigma).^2));
Sjs=0.3125*(obj.Hs^2)*obj.Tp.*((frequencydomain./fp).^(-5)).*exp(-1.25.*(frequencydomain./fp).^(-4)).*(1-0.287*log(gama)).*gama.^taf;
a = sqrt(2.*Sjs.*df);