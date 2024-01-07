% Building and Training ARIMA model

% Splitting the train and test ratio
trainRatio = 0.8;
numTrain = round(trainRatio * numel(timeTable.Var1));

trainSet = timeTable.Var1(1:numTrain);
testSet = timeTable.Var1(numTrain +1:end);

% Building ARIMA and training data

model = arima(3, 0, 1);
estModel = estimate(model, trainSet);

% Forecast future stock prices
numForecastPoints = numel(testSet);
[forecast, ~] = forecast(estModel, numForecastPoints, 'Y0', trainSet);

% Visualizing results
figure;
plot(timeTable.Time, timeTable.Var1, 'b', 'DisplayName', 'Observed');
hold on;
plot(timeTable.Time(numTrain+1:end), forecast, 'r', 'DisplayName', 'Forecast');
xlabel('Time');
ylabel('Stock Price');
title('ARIMA Forecasting');
legend('Location', 'northwest');
hold off;


