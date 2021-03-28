function [Z, Ur] = PCA_r(X, r)
%Returns the results of the PCA on X
%Centers X.

[~,p] = size(X);

Xc = X - sum(X,2) / p;

[U,V,~] = svd(Xc);

Ur = U(:,1:r);

SVs = diag(V);
Z = Ur' * Xc;

end

