function anomalies = extractAnomaliesPointsFromDataSet(dataSet)
    n = size(dataSet,1);
    anomalies = [];
    for i = 1:n
        if(dataSet(i,end) == 1)
            anomalies = [anomalies,i];
        end    
    end    
end