function dist=JSDiv_pc(P0,Q0,rc,indicator)
%  dist = JSDiv_pc(P,Q) Jensen-Shannon divergence of two discrete probability
%  distributions
%  P and Q  are automatically normalised to have the sum of one on rows
% have the length of one at each 
% P =  n x nbins
% Q =  1 x nbins or n x nbins(one to one)
% dist = n x 1
if indicator == 0
    dist = 0;
else
    O = 0.5 * (P0(rc,:) + Q0(rc,:));
    dist = 0.5 * KLDiv(P0(rc,:),O) + 0.5 * KLDiv(Q0(rc,:),O);
end

