# Tesla Stock Price Forecasting with timeseries analysis
Build this project in MATLAB.

-> Collected data of tesla stock price listed on Nasdaq. The data contains over 10 years (2010 - 2020).
-> Preprocessed data by handling missing values, null values and outliers in stock prices using InterQuartile Range method.
-> Converted data into timeTable object for timeseries analysis and further steps.
-> Divided data into 80/20 train/test ratio.
-> Built an Arima (AutoRegressive Integrated Moving Average) and trained the model with train data.
-> Estimated forecast prices based on the trained model with test data while also plotting the forecast prices against test data.
-> The Evaluated model performance resulted with an accuracy about 80%.
