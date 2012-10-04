% Computes the Kullback-Leibler divergence
% between two Gaussian distributions of D dimensions,
% or between two mixtures of N Gaussians.
%
% d = N1 x N2 matrix of divergence
%
% mu1 = D x N1 matrix of centers
% sigma1 = D x D x N1 covariance matrices
% mu2, sigma2 = ...

function d = kld(mu1, sigma1, mu2, sigma2)

% addpath('GMM-GMR');

SAMPLES = 1000;
% eps = 0.000001;
% d = zeros(size(mu1,2), size(mu2,2));

% for i = 1:size(mu1,2)
% 	for j = 1:size(mu2,2)
% 		d(i,j) = 0.5 .* (log(det(sigma2(:,:,j))./det(sigma1(:,:,i))) + trace(inv(sigma2(:,:,j))*sigma1(:,:,i)) + (mu2(:,j)-mu1(:,i))'*inv(sigma2(:,:,j))*(mu2(:,j)-mu1(:,i)) - size(mu1(:,i),1));
% 	end
% end
% d = mean(mean(d));
pts = zeros(size(mu1,1), size(mu1,2).*SAMPLES);

% Generate a bunch of samples for each
% cluster in the first mixture.
% This is assuming uniform prior probability
% for each Gaussian in the mixture.
start_ind = 1;
for i = 1:size(mu1,2)
	pts(:,start_ind:start_ind+SAMPLES-1) = mgd(SAMPLES, size(mu1,1), mu1(:,i), sigma1(:,:,i))';
	start_ind = start_ind + SAMPLES;
end

prob_f = zeros(size(pts,2), 1);
prob_g = zeros(size(pts,2), 1);
for i = 1:size(mu1,2)
	prob_f = prob_f + gaussPDF(pts, mu1(:,i), sigma1(:,:,i));
end
for i = 1:size(mu2,2)
	prob_g = prob_g + gaussPDF(pts, mu2(:,i), sigma2(:,:,i));
end

%prob_f = gaussPDF(pts, mu1, sigma1);
%prob_g = gaussPDF(pts, mu2, sigma2);

d = mean(log(prob_f ./ prob_g));


