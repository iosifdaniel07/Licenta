function anomalous = get_n_anomalous_points(n,cof_result)
   n_result = size(cof_result,2);
   anomalous = [];
   for i = 1:n_result
       if length(anomalous) < n
           anomalous = [anomalous,i];
       else
           min = anomalous(1);
           index = 1;
           for j = 2:n
              if cof_result(anomalous(j)) < cof_result(min)
                  min = anomalous(j);
                  index = j;
              end    
           end  
           if cof_result(i) > cof_result(min)
               anomalous(index) = i;
           end    
       end
   end
end