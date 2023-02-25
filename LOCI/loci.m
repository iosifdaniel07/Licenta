function outliers = loci(k,alfa,dataSet)
 n = size(dataSet,1);
 outliers = [];
 for p = 1:n
     [k_neighbors,distances2Kneighbors] = search_knn(k,p,dataSet);
     %Critical Distances
     Di = [];
     Di = [Di,distances2Kneighbors(size(k_neighbors,1))];
     for i = 1:size(k_neighbors,1)
         crititc_alfa = distances2Kneighbors(i)/alfa;
         Di = [Di,crititc_alfa];
     end    
     Di = sort(Di);
     for i = 1:size(Di,2)
        Np_alfa_r = find_Np(p,alfa*Di(i),dataSet); %Np(r) = {q, d(p,q) <=r}
        number_r_neighbors = size(Np_alfa_r,2);
       
        Np_r = find_Np(p,Di(i),dataSet);
        sum = 0;
        for j = 1:size(Np_r,1)
            q = Np_r(j);
           sum = sum + size(find_Np(q,alfa*Di(i),dataSet),1);
        end 
        average_n = sum/ size(Np_r,1);

        MDEF = 1 - number_r_neighbors/average_n;
        
        %standard deviation
        sum_stdv = 0;
        for j = 1:size(Np_r,1)
            q = Np_r(j);
            sum_stdv = sum_stdv + (size(find_Np(q,alfa*Di(i),dataSet),1)-average_n)^2;
        end 
        standard_deviation = sqrt(sum_stdv/number_r_neighbors);
        normalized_standard_deviation = standard_deviation/average_n;
        
        if MDEF > 3*normalized_standard_deviation
            outliers = [outliers,p];
            break;
        end    
     end 
 end    
end