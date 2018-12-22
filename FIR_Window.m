function [ filtered_data,data1,data2,data3,data4,data5,data6,data7,data8,data9] = FIR_Window(y,Fs, gains)

filter1 = low_band_window(Fs,1);
filter2 = band_pass_window(170,310,Fs);
filter3 = band_pass_window(310,600,Fs);
filter4 = band_pass_window(600,1000,Fs);
filter5 = band_pass_window(1000,3000,Fs);
filter6 = band_pass_window(3000,6000,Fs);
filter7 = band_pass_window(6000,12000,Fs);
filter8 = band_pass_window(12000,14000,Fs);
filter9 = band_pass_window(14000,16000,Fs);
data1 = filter(filter1,y);
data2 = filter(filter2,y);
data3 = filter(filter3,y); 
data4 = filter(filter4,y);
data5 = filter(filter5,y);
data6 = filter(filter6,y);
data7 = filter(filter7,y);
data8 = filter(filter8,y);
data9 = filter(filter9,y);
data1*gains(1)+data2*gains(2)+data3*gains(3)+data4*gains(4)+data5*gains(5)+data6*gains(6)+data7*gains(7)+data8*gains(8)+data9*gains(9);
