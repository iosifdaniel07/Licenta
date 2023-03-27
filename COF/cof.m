function cofScore = cof(k, dataSet, k_neighbors)
   n = size(dataSet,1);
   cofScore = zeros(1,n);
   ANk = zeros(1,n);%average-chaining distance
   
   for p = 1:n
       SBN = zeros(1,k+1);%set-based path
       SBN(1) = p;
       SBTDist = zeros(1,k);%set-based trail 
       
       NN = k_neighbors(p,:);
       i = 1;
       count_SBN = 1;
       while ~isempty(NN)

          % Compute pairwise distances between SBN and NN data points
          distances = pdist2(dataSet(SBN(1:count_SBN),:), dataSet(NN,:));
          % Find the index of the minimum distance for each SBN point
          [min_dist, min_index] = min(distances,[],2);
          % Find the minimum distance and its corresponding NN point for each SBN point
          [dist_ei_min, t] = min(min_dist);
          % Get the indices of the corresponding SBN and NN points
          o = min_index(t);
         % l = t;

          i = i + 1;
          count_SBN = count_SBN + 1;
          SBTDist(i) = dist_ei_min;
          SBN(i) = NN(o);
          NN(o) = [];
       end
       for z = 1:k
        average = SBTDist(k)*2*(k+1-z);
        average = average/((k+1)*k);
        ANk(p) = ANk(p) + average;
       end    
   end
    for p = 1:n
     sum = 0;
     for o = 1:k
         sum = sum + ANk(k_neighbors(p,o));
     end
     cofScore(p) = k*ANk(p)/sum;
    end   
  
end  