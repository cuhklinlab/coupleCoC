#This is the coupleCoC algorithm in the paper "Coupled Co-clustering-based Unsupervised Transfer Learning for the Integrative Analysis of Single-Cell Genomic Data" 
by Pengcheng Zeng, Jiaxuan Wangwu and Zhixiang Lin. It has two steps. We provide two options in step 1 of coupleCoC, including coupleCoCs and coupleCoCp. Note that the 
step 1 of coupleCoCs is equivalent to STC algorithm, please also refer to the paper "Self-taught Clustering" by Wenyuan Dai, Qiang Yang, Gui-Rong Xue and Yong Yu, 
as well as the code at https://github.com/sykim122/STC.

(1) Please run "coupleCoC_simu.m" for simulation study

(2) Please run "coupleCoC_ex1.m"/"coupleCoC_ex2.m"/"coupleCoC_ex3.m"/"coupleCoC_ex4.m" for the real data analysis

Note that because the coupleCoC algorithm requires the random initialization, the clustering results might be a little different from those presented in the paper.
