function [idx,dist] = searchKnn(k,dataSet)
  tree = KDTreeSearcher(dataSet);
  [idx, dist] = knnsearch(tree, dataSet, 'k', k+1);
  idx = idx(:,2:end);
  dist = dist(:,2:end);
end