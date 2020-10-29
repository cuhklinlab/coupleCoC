clear
clc
close all

%load the data
load('data/example4_T.mat');
load('data/example4_T_label.mat');
load('data/example4_S.mat');
load('data/example4_S_label.mat');

%remove rows and columns with zero-sum
[X, Y, Cx_truth, Cy_truth] = removal_rowcol(X, Y, Cx_truth, Cy_truth);
%%coupleCoC 
%tuning parameters
iter = 15; lambda = 1;nrowcluster1 = 8;nrowcluster2 = 7;ncolcluster = 15;
%coupleCoC - step 1
[Cx, Cy, Cz, cluster_p, cluster_q, obj] = coupleCoCs(X,Y,nrowcluster1,nrowcluster2,ncolcluster,iter,lambda);
%clustering performance
[TAB_X, TAB_Y, Eval_tab] = clu_eval(Cx_truth, Cy_truth, Cx, Cy);
%coupleCoC - step 2
N_sub = 3; %N_sub=1,2,4,5
[ind_X, ind_Y, dis] = swap_label(cluster_p,cluster_q,N_sub);
