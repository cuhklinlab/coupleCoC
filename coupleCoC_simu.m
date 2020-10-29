clear
clc
close all

% load the simulated data
load('data/simu_rna.mat');
load('data/simu_atac.mat');
load('data/simu_rna_label.mat');
load('data/simu_atac_label.mat');

% extract the i-th sample, i \in [1,50];
i = 4;ind = ((i-1)*100+1):(i*100); 
X = atac_simu(:,ind); Cx_truth = atac_clu_simu(:,i); % source data
Y = rna_simu(:,ind); Cy_truth = rna_clu_simu(:,i);  % target data

%remove rows and columns with zero-sum
[X, Y, Cx_truth, Cy_truth] = removal_rowcol(X, Y, Cx_truth, Cy_truth);

%%coupleCoC - step 1
%coupleCoCs
iter = 20; lambda = 1.5;nrowclu1 = 2;nrowclu2 = 2;ncolclu = 3;
[Cx, Cy, Cz, cluster_p, cluster_q, obj] = coupleCoCs(X,Y,nrowclu1,nrowclu2,ncolclu,iter,lambda);
%coupleCoCp
[Cx1, Cy1, Cz1, cluster_p1, cluster_q1, obj1] = coupleCoCp(X,Y,2,2,3,20,3,1,1);

%clustering performance
[TAB_X, TAB_Y, Eval_tab] = clu_eval(Cx_truth, Cy_truth, Cx, Cy);
[TAB_X1, TAB_Y1, Eval_tab1] = clu_eval(Cx_truth, Cy_truth, Cx1, Cy1);

%%coupleCoC - step 2
N_sub = 2;
[ind_X, ind_Y, dis] = swap_label(cluster_p,cluster_q,N_sub);
[ind_X1, ind_Y1, dis1] = swap_label(cluster_p1,cluster_q1,N_sub);

