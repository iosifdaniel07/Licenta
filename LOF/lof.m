function lofScore = lof(k,dataSet)
    lofScore=[];

    n = size(dataSet,1);
    Nk = {};%empty cell array
    dk=[];
    %Nk(p)={qεD-{p}: d(p,q) <= dk(p)}
    %dk(p) - distance between p and its kth nearest neighbor
    for p = 1:n
       [indexes,distances] = search_knn(k,p,dataSet);
       dk_p = max(distances);
       Nk{end + 1} = indexes;
       dk = [dk, dk_p];
    end

    %compute lk
    lk = [];
    for p = 1:n
       number_Nk = size(Nk{p},1);
       sum = 0;
       for q = 1: number_Nk
         sum = sum + compute_d_reach(p,Nk{p}(q),dk(p),dataSet);
       end
       lk=[lk,number_Nk/sum];
    end   

    %compute local outlier factor
    for p = 1:n
        number_Nk = size(Nk{p},1);
        sum = 0;
        for i = 1:number_Nk
           sum = sum + lk(i)/lk(p);
        end   
        lofScore = [lofScore,sum/number_Nk];
    end    
end