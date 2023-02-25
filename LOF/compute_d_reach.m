function d_reach = compute_d_reach(p,q,dk,dataSet)
 distance_p_q = norm(dataSet(p,:)-dataSet(q,:));
 aux = [distance_p_q, dk];
 d_reach = max(aux);
end