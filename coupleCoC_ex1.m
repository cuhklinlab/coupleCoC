%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% example 1 (A)
clear
clc
close all
% load the data
load('data/example1A_T.mat');
load('data/example1A_T_label.mat');
load('data/example1A_S.mat');
load('data/example1A_S_label.mat');

%remove rows and columns with zero-sum
[X, Y, Cx_truth, Cy_truth] = removal_rowcol(X, Y, Cx_truth, Cy_truth);
%%coupleCoC - step 1
%coupleCoCs
iter = 15; lambda = 2;nrowclu1 = 2;nrowclu2 = 2;ncolclu = 5;
[Cx, Cy, Cz, cluster_p, cluster_q, obj] = coupleCoCs(X,Y,nrowclu1,nrowclu2,ncolclu,iter,lambda);
%coupleCoCp
%[Cx1, Cy1, Cz1, cluster_p1, cluster_q1, obj1] = coupleCoCp(X,Y,2,2,5,15,2,1,1);

%clustering performance
[TAB_X, TAB_Y, Eval_tab] = clu_eval(Cx_truth, Cy_truth, Cx, Cy);
%[TAB_X1, TAB_Y1, Eval_tab1] = clu_eval(Cx_truth, Cy_truth, Cx1, Cy1);

%%coupleCoC - step 2
 N_sub = 2;
[ind_X, ind_Y, dis] = swap_label(cluster_p,cluster_q,N_sub);
%[ind_X1, ind_Y1, dis1] = swap_label(cluster_p1,cluster_q1,N_sub);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% example 1 (B)
clear
clc
close all
% load the data
load('data/example1B_T.mat');
load('data/example1B_T_label.mat');
load('data/example1B_S.mat');
load('data/example1B_S_label.mat');

%remove rows and columns with zero-sum
[X, Y, Cx_truth, Cy_truth] = removal_rowcol(X, Y, Cx_truth, Cy_truth);

%%coupleCoC - step 1
%coupleCoCs
iter = 15; lambda = 2;nrowclu1 = 2;nrowclu2 = 2;ncolclu = 5;
[Cx, Cy, Cz, cluster_p, cluster_q, obj] = coupleCoCs(X,Y,nrowclu1,nrowclu2,ncolclu,iter,lambda);
%coupleCoCp
%[Cx1, Cy1, Cz1, cluster_p1, cluster_q1, obj1] = coupleCoCp(X,Y,2,2,5,15,2,1,1);

%clustering performance
[TAB_X, TAB_Y, Eval_tab] = clu_eval(Cx_truth, Cy_truth, Cx, Cy);
%[TAB_X1, TAB_Y1, Eval_tab1] = clu_eval(Cx_truth, Cy_truth, Cx1, Cy1);

%%coupleCoC - step 2
N_sub = 2;
[ind_X, ind_Y, dis] = swap_label(cluster_p,cluster_q,N_sub);
%[ind_X1, ind_Y1, dis1] = swap_label(cluster_p1,cluster_q1,N_sub);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% example 1 (C)
%Please integrate the data from example 1 (A) and (B)

