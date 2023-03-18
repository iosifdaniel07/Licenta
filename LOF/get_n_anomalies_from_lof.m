function anomalies = get_n_anomalies_from_lof(n,lofScore)
  [~, idx] = sort(lofScore, 'descend');
 %[~, idx] = sort(lofScore, 'ascend');//for negative_outlier_score
   anomalies = idx(1:n);
end