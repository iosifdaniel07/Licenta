function infloScore = inflo(k,dataSet,k_neigbors,distance_k_neighbors)
     n = size(dataSet,1);
     dk = zeros(1,n);
     RNk = cell(n,1);
     infloScore = zeros(1,n);

     for p = 1:n
         dk(p) = distance_k_neighbors(p,k);
         for q = 1:k
            RNk{k_neigbors(p,q)} = [RNk{k_neigbors(p,q)},p];
         end    
     end

     parfor p = 1:n
         IS = [k_neigbors(p,:),RNk{p}];
         IS =  unique(IS);
         nr_IS = size(IS,2);
         sum = 0;
         for q = 1:nr_IS
            sum = sum + 1/dk(IS(q));
         end
         infloScore(p) = dk(p)*sum/nr_IS;
     end    
end