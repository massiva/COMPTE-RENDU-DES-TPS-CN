function[sol,relres,resvec,niter]= richard(A,b,alpha,tol,nmaxit)
     x0=zeros(n,1);
     normb=norm(b);
     resvec=zeros(nmaxit,1);
     res=b-A*x0;
     relres=norm(res)/normb;
       D= alpha;
           niter=0;
           while(relres>tol) &(niter<nmaxit)
               niter=niter+1;
               sol =x0 + D.*res;
               x0=sol;
               res=b-A*x0;
               relres=norm(res)/normb;
               resvec(niter)=relres;
           end
    
endfunction
n=3
A=[2 -1 0;-1 2 -1;0 -1 2]
b=[1; 2; 3]
[sol,relres,resvec,niter]= richard(A,b,1/2,0.01,50)
