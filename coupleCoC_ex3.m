clear
clc
close all

% load the data in example 3 (A)
load('data/example3A_T.mat');
load('data/example3A_T_label.mat');
load('data/example3A_S.mat');
load('data/example3A_S_label.mat');

%remove rows and columns with zero-sum
[X, Y, Cx_truth, Cy_truth] = removal_rowcol(X, Y, Cx_truth, Cy_truth);
%%coupleCoC - step 1
%coupleCoCs
iter = 15; lambda = 1.9;nrowclu1 = 2;nrowclu2 = 2;ncolclu = 5;
[Cx, Cy, Cz, cluster_p, cluster_q, obj] = coupleCoCs(X,Y,nrowclu1,nrowclu2,ncolclu,iter,lambda);
%coupleCoCp
%[Cx1, Cy1, Cz1, cluster_p1, cluster_q1, obj1] = coupleCoCp(X,Y,2,2,5,15,1.5,1,1);

%clustering performance
[TAB_X, TAB_Y, Eval_tab] = clu_eval(Cx_truth, Cy_truth, Cx, Cy);
%[TAB_X1, TAB_Y1, Eval_tab1] = clu_eval(Cx_truth, Cy_truth, Cx1, Cy1);

%%coupleCoC - step 2
N_sub = 2;
[ind_X, ind_Y, dis] = swap_label(cluster_p,cluster_q,N_sub);
%[ind_X1, ind_Y1, dis1] = swap_label(cluster_p1,cluster_q1,N_sub);

%%%%%%%%%%%%%%%%%%%%%%%%%
clear
clc
close all

%load data in example 3 (B)
load('data/example3B_T.mat');
load('data/example3B_T_label.mat');
load('data/example3B_S.mat');
load('data/example3B_S_label.mat');

%remove rows and columns with zero-sum
[X, Y, Cx_truth, Cy_truth] = removal_rowcol(X, Y, Cx_truth, Cy_truth);
%%coupleCoC - step 1
%coupleCoCs
iter = 15; lambda = 2;nrowclu1 = 2;nrowclu2 = 3;ncolclu = 8;
[Cx, Cy, Cz, cluster_p, cluster_q, obj] = coupleCoCs(X,Y,nrowclu1,nrowclu2,ncolclu,iter,lambda);

%clustering performance
[TAB_X, TAB_Y, Eval_tab] = clu_eval(Cx_truth, Cy_truth, Cx, Cy);

%%coupleCoC - step 2
N_sub = 2;
[ind_X, ind_Y, dis] = swap_label(cluster_p,cluster_q,N_sub);


