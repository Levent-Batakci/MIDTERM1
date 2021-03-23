function [W, H] = NMF(X, r, tol)
% X approx= WH

[n,p] = size(X);

t = 1;

Wo = rand(n,r);
Ho = rand(r,p);
W = Wo;
H = Ho;

while t==1 || (norm(W - Wo, 'fro')/norm(Wo, 'fro') + norm(H - Ho, 'fro')/norm(Ho, 'fro') < tol)
    %Move forward!
    Wo = W;
    Ho = H;
    
    %Wo is W^(t), same for Ho
    %W is W^(t+1), same for H
    
    %Update W
    Xc = Wo * Ho; %approximation of X
    W = ((X*H') ./  (Xc * H')) .* Wo;
    
    Xc = W * Ho; %approximation of X
    H = ((W'*X) ./ (W'*Xc)) .* Ho';
    
    t=t+1;
end

end

