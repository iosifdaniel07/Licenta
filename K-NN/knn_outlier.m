function outliers = knn_outlier(k,dataSet,number_outliers,dist_k_neighbors)
    n = size(dataSet,1);
    dk = zeros(1,n);
   
    for i = 1:n
      dk(i) = dist_k_neighbors(i,k);
    end  
    [~, index] = sort(dk,"desc");
    outliers = index(1:number_outliers);
    outliers = sort(outliers);
end