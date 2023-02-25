function anomalous = get_n_anomalous_points(n,lof_result)
   n_result = size(lof_result,2);
   anomalous = [];
   for i = 1:n_result
       if length(anomalous) < n
           anomalous = [anomalous,i];
       else
           min = anomalous(1);
           index = 1;
           for j = 2:n
              if lof_result(anomalous(j)) < lof_result(min)
                  min = anomalous(j);
                  index = j;
              end    
           end  
           if lof_result(i) > lof_result(min)
               anomalous(index) = i;
           end    
       end
   end 
   anomalous = sort(anomalous);
end