function anomalies = get_n_anomalies_from_result(n,lofScore)
  [~, idx] = sort(lofScore, 'descend');
   anomalies = idx(1:n);
end