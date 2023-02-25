function COF = cof(k,dataSet)
 COF = [];
 n = size(dataSet,1);
 ANk = [];%average-chaining distance
 Nk = {};%k-neighbors
 for p = 1:n
    ANk = [ANk,0];
    SBN = [];%set-based path
    SBN = [SBN,p];
    SBTDist = [];%set-based trail 
    [NN,~] = search_knn(k,p,dataSet);
    Nk{end + 1} = NN;
    
    while ~isempty(NN)
        dist_e = norm(dataSet(SBN(1),:) - dataSet(NN(1),:));
        index_t = 1;
        for s = 1:size(SBN,2)
            for t = 1:size(NN,1)
                dist_s_t = norm(dataSet(SBN(s),:) - dataSet(NN(t),:));
                if dist_s_t < dist_e
                    dist_e = dist_s_t;
                    index_t = t;
                end    
            end    
        end  
        SBN = [SBN,NN(index_t)];
        NN(index_t) = [];
        SBTDist = [SBTDist,dist_e];
    end   
    
    for i = 1:k
        average = SBTDist(k)*2*(k+1-i);
        average = average/((k+1)*k);
        ANk(p) = ANk(p) + average;
    end    
 end 
 for p = 1:n
     sum = 0;
     for o = 1:size(Nk{p},1)
         sum = sum + ANk(Nk{p}(o));
     end
     COF = [COF,(size(Nk{p},1)*ANk(p))/sum];
 end   
end

