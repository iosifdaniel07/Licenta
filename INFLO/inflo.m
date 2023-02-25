function INFLO_SCORE = inflo(k,dataSet)
  INFLO_SCORE = [];
  n = size(dataSet,1);
  Nk = {};
  RNk = {}; 
  dk = [];
  IS = {}; 

  for p = 1:n
     RNk{end + 1} = [];
  end    

% dk(p) - distance between p and its kth nearest neighbor
   for p = 1:n
      [indexes,distances] = search_knn(k,p,dataSet);
      dk_p = max(distances);
      Nk{end + 1} = indexes;
      dk = [dk, dk_p];
      for q = 1:size(Nk{p},1)
        RNk{Nk{p}(q)} = [RNk{Nk{p}(q)},p];
      end
   end

   for p = 1:n
    IS{end+1} = union(Nk{p}',RNk{p}); % 'este transpusa
    sum = 0;
    for o = 1:size(IS{p},2)
        sum = sum + 1/dk(IS{p}(o));
    end
    sum = sum * dk(p);
    INFLO_SCORE = [INFLO_SCORE,sum/size(IS{p},2)];
   end
end