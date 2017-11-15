%Inclass 20

%In this folder you will find a .mat file with x and y data

% For all of the questions below, use any options as necessary to get a
% good fit - starting points, lower bounds etc. 
data=load('data.mat');

plot(data.xx, data.yy, 'r.', 'MarkerSize', 24);

data_table=zeros(101, 2);
data_table(:,1)=data.xx;
data_table(:,2)=data.yy;
% 1. Define a custom model and try to fit the data to a Michaelis function 
% y = V*x/(K+x). 
y='V*x/(K+x)';
fitmodel=fittype(y);

[fit_out, fit_metric]=fit(data_table(:,1), data_table(:,2), fitmodel);

plot(fit_out, data_table(:,1), data_table(:,2));

% 2. Use a custom model to try to fit the data to a Hill function with
% exponent 2: y = V*x^2/(K^2+x^2)
y = 'V*x^2/(K^2+x^2)';
fitmodel2=fittype(y);

[fit_out2, fit_metric2]=fit(data_table(:,1), data_table(:,2), fitmodel2);

plot(fit_out2, data_table(:,1), data_table(:,2));

% 3. Now treat the exponent as a free parameter and perform the fit again,
% that is fit to the model y = V*x^n/(K^n+x^n)
y = 'V*x^n/(K^n+x^n)';

fitmodel3=fittype(y);

[fit_out3, fit_metric3]=fit(data_table(:,1), data_table(:,2), fitmodel3, 'Lower', [0, 0, 0]);

plot(fit_out3, data_table(:,1), data_table(:,2));
% 4. Redo parts 1 and 2, but using your model from 3 and fixing the value of
% n to either 1 or 2.

y = 'V*x^n/(K^n+x^n)';

fitmodel4=fittype(y, 'problem', 'n');

[fit_out4, fit_metric4]=fit(data_table(:,1), data_table(:,2), fitmodel4, 'problem', 2);

plot(fit_out3, data_table(:,1), data_table(:,2));


[fit_out4, fit_metric4]=fit(data_table(:,1), data_table(:,2), fitmodel4, 'problem', 1);

plot(fit_out3, data_table(:,1), data_table(:,2));