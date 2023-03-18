function lofScore = lof(k,dataSet,Nk,dist_k_neighbors)
    n = size(dataSet,1);
    lofScore = zeros(1,n);
    dk = zeros(1, n);
    lk = zeros(1,n);
    
    for i = 1:n
      dk(i) = dist_k_neighbors(i,k);
    end    

 %local reachability
    parfor p = 1:n
        average_reachability_distance = 0;
        for q = 1:k
          dist_p_q = pdist2(dataSet(p,:),dataSet(Nk(p,q),:));
          d_reach_p_q = max(dk(Nk(p,q)),dist_p_q);
          average_reachability_distance = average_reachability_distance + d_reach_p_q;
        end    
        average_reachability_distance = average_reachability_distance/k;
        lk(p) = 1/average_reachability_distance;
    end

    %lof score
    parfor p = 1:n
        lfScore = 0;
        for q = 1:k
          lfScore = lfScore + lk(Nk(p,q))/lk(p);
        end
        lofScore(p) = lfScore/k;
    end    
  
end