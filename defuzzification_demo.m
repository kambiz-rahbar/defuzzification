clc
clear
close all

w = 0:0.01:1;
mu = abs(sin(4*pi*w));
plot(w,mu);
xlabel('w');
ylabel('mu');

defuzzification_name = {'Center_of_gravity','Smallest_of_Maximum','Middle_of_Maximum','Largest_of_Maximum','Bisector'};

for k = 1:length(defuzzification_name)
    w_star = defuzzification(w,mu,defuzzification_name{k});
    fprintf('%20s:\t%.4f\n',defuzzification_name{k},w_star);
end

