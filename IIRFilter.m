function [ filtered_data ] = IIRFilter(y,Fs,gains)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
filter1 = lowpass(Fs,1);
filter2 = IIRgenerate(170,310,Fs,1);
filter3 = IIRgenerate(310,600,Fs,1);
filter4 = IIRgenerate(600,1000,Fs,1);
filter5 = IIRgenerate(1000,3000,Fs,1);
filter6 = IIRgenerate(3000,6000,Fs,1);
filter7 = IIRgenerate(6000,12000,Fs,1);
filter8 = IIRgenerate(12000,14000,Fs,1);
filter9 = IIRgenerate(14000,16000,Fs,1);
data1 = filter(filter1,y);
data2 = filter(filter2,y);
data3 = filter(filter3,y);
data4 = filter(filter4,y);
data5 = filter(filter5,y);
data6 = filter(filter6,y);
data7 = filter(filter7,y);
data8 = filter(filter8,y);
data9 = filter(filter9,y);
filtered_data = data1+data2+data3+data4+data5+data6+data7+data8+data9;


end

