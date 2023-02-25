function [indexes,distances] = search_knn(k,p,dataset2table)
 n = size(dataset2table,1);
 Np =[]; % will store the k nearest neighbors of p
 distances = [];
 for q = 1:n
   if p ~= q 
        dist = norm(dataset2table(p,:) - dataset2table(q,:));
        if length(Np) < k
          Np = [Np; q];
          distances = [distances; dist];
        else
          max_dist = norm(dataset2table(p,:) - dataset2table(Np(1),:));
          index = 1;
          for i = 2:size(Np)
             dist_Np = norm(dataset2table(p,:) - dataset2table(Np(i),:));
             if dist_Np > max_dist
                 max_dist = dist_Np;
                 index = i;
             end    
          end    
          if dist < max_dist 
            Np(index) = q;
            distances(index) = dist;
          end    
        end %end |Np| < k for      
   end    
 end  
 indexes = Np;
end