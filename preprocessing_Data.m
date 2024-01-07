% Preprocessing Data

% 1. Checking for Duplicates

dates = data.Date;
duplicateDates = dates(diff(sort(dates)) == 0);

if isempty(duplicateDates)
    disp('No duplicate dates found.');
else
    disp('Duplicate dates found:');
    disp(duplicateDates);
end


% 2. Checking Missing Values

% Get the names of all columns in the table
columnNames = data.Properties.VariableNames;

% Check for missing values in each column
for i = 1:numel(columnNames)
    colName = columnNames{i};
    
    % Extract the column data
    columnData = data.(colName);
    
    % Check for missing values in the column
    missingValues = ismissing(columnData);
    
    % Display any missing values in the column
    if any(missingValues)
        fprintf('%s has missing values.\n', colName);
    else
        fprintf('%s has no missing values.\n', colName);
    end
end


% 3. Sorting the data according to timestamp

data = sortrows(data, 'Date');
disp(data(1:10, :));

% 4. Checking for outliers
% Scatter Plot
scatter(data.Date, data.Prices);
xlabel('Date');
ylabel('Prices');
title('Scatter Plot of Prices Over Time');
% IQR (Inter Quartile Range)
q1 = prctile(data.Prices, 25);
q3 = prctile(data.Prices, 75);
iqrValue = iqr(data.Prices);
lowerBound = q1 - 1.5 * iqrValue;
upperBound = q3 + 1.5 * iqrValue;
potentialOutliers = find(data.Prices < lowerBound | data.Prices > upperBound);
if isempty(potentialOutliers)
    fprintf('No outliers in Prices');
else
    fprintf('Outlier: %d\n', potentialOutliers);
end
% Removing outliers
dataWithoutOutliers = data;
dataWithoutOutliers(potentialOutliers, :) = [];
newData = dataWithoutOutliers;
% Again checking for outliers
q1 = prctile(newData.Prices, 25);
q3 = prctile(newData.Prices, 75);
iqrValue = iqr(newData.Prices);
lowerBound = q1 - 1.5 * iqrValue;
upperBound = q3 + 1.5 * iqrValue;
Outliers = find(newData.Prices < lowerBound | newData.Prices > upperBound);
if isempty(Outliers)
    fprintf('No outliers in Prices');
else
    fprintf('Outlier: %d\n', Outliers);
end

% 4. Converting a timetable object

% Create a timetable 
timeTable = timetable(newData.Date, round(newData.Prices));

% visualizing the timetable
plot(timeTable.Time, timeTable.Var1);
xlabel('Time');
ylabel('Stock Prices');
title('Historical Stock Prices');




