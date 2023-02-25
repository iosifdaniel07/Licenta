function Np = find_Np(p,r,dataset2table)
   %find Np(r) = {q, d(p,q) <=r}
   n = size(dataset2table,1);%number of data points
   Np = [];
   for q = 1:n
      dist = norm(dataset2table(p,:) - dataset2table(q,:));
      if dist <= r
        Np = [Np; q];
      end     
   end
end