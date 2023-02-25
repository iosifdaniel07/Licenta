function outliers = knn_outlier(k,n_outliers,dataset2table)
% Initialize variables
outliers = [];
n = size(dataset2table, 1);
NN = zeros(n, 1);% will store the maximum distance between each point and its k-nearest neighbors.

% Identify the k-nearest neighbors for each point
 for p = 1:n % for each point in dataset
   Np =[]; % will store the k nearest neighbors of p
   for q = 1:n
      if p ~= q % ensure that the distance between a point and itself is not calculated
        dist = norm(dataset2table(p,:) - dataset2table(q,:));% calculates the Euclidean distance between the pth and qth rows of the dataSet
        if length(Np) < k
          Np = [Np; q];
        else
           index = 1;  
           max_dist = norm(dataset2table(p,:) - dataset2table(Np(1),:));
           for i = 2:size(Np,1)
               dist_p_i = norm(dataset2table(p,:) - dataset2table(Np(i),:));
               if dist_p_i > max_dist
                   max_dist = dist_p_i;
                   index = i;
               end    
           end    
          if  max_dist > dist 
               Np(index) = q;
          end    
        end %end |Np| < k for    
      end %end p != q for    
   end %end second for
  NN(p) = max(norm(dataset2table(p,:) - dataset2table(Np,:))); 
 end % end first for
% Identify the anomalous points
 for p = 1:n
     if length(outliers) < n_outliers
         outliers = [outliers,p];
     else
         min = outliers(1);
         index = 1;
         for i = 2:size(outliers,2)
             if NN(outliers(i)) < NN(min)
                 min = outliers(i);
                 index = i;
             end    
         end    
         if NN(min) < NN(p)
             outliers(index) = p;
         end    
     end    
 end %for    
 outliers = sort(outliers);
end % end function