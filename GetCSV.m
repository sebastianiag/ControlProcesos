
function [filtered_data,t] = getCSV(Fs,fil_l)

%%%% Extract and Plot Comma Delimited Text File
%%%%% Christian J. Colon Ortiz
%%%%%%%% 5/feb/2015
%
% INPUTS:
%%%% Fs: Sampling frequency of CSV file
%%%% fil_l = Length of Averaging Filter 
% Ouputs:
%%%% filtered_data = data filtered with averaging filter of length fil_l
%%%% t = time vector in seconds

%% GET FILE
[filename filepath] = uigetfile('.csv');
mkdir(filepath);
addpath(filepath)
data = csvread(filename);
%% DEFINE TIME VECTOR 
samples = length(data);
Ts = 1/Fs;
t = 0:Ts:(samples-1)*Ts;
%% FILTER DATA WITH AVERAGING FILTER
a = 1;
b = (1/fil_l)*(ones(1,fil_l));
filtered_data = filter(b,a,data);
end