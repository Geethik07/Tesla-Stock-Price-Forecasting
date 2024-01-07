% Evaluating Model Performance

figure;
plot(timeTable.Time, timeTable.Var1, 'b', 'DisplayName', 'Historical Prices');
hold on;
plot(timeTable.Time(numTrain+1:end), forecast, 'r', 'DisplayName', 'Forecasted Prices');
xlabel('Time');
ylabel('Stock Price');
title('Stock Price Forecasting');
legend('Location', 'best');
hold off;

% Calculate Mean Absoulte Error
meanAbsErr =  mean(abs(testSet - forecast));
fprintf('Mean Absolute Error (MAE): %.2f\n', meanAbsErr);

% Calculate Mean Absolute Percentage Error
meanAbsPercent = mean(abs((testSet - forecast) ./ testSet)) * 100;
fprintf('Mean Absolute Percentage Error (MAPE): %.2f\n', meanAbsPercent);

% Calculate Accuracy
accuracy = abs(100 - meanAbsPercent);
fprintf('Accuracy of the model: %.2f\n', accuracy);
