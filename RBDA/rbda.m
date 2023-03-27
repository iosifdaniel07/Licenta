function rbdaScore = rbda(k,dataSet,k_neighbors,k_distance)
    n = size(dataSet,1);
    rbdaScore = zeros(1,n);

    for p = 1:n
        fprintf("%d\n",p);
        distances_neighbors_dataSet = pdist2(dataSet(k_neighbors(p,:),:),dataSet);
        suma_rq = 0;
       for q = 1:k
            q_neighbors = distances_neighbors_dataSet(q,:);
            dist_p_q = k_distance(p,q);
            rq = sum(q_neighbors < dist_p_q);
            suma_rq = suma_rq + rq;
        end
        rbdaScore(p) = suma_rq/k;
    end    
end