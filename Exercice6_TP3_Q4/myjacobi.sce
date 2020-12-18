function[sol,relres,resvecJ,niter]= myjacobi(A,b,tol,nmaxit)
     x0=zeros(n,1);
     normb=norm(b);
     resvecJ=zeros(nmaxit,1);
   
     res=b-A*x0;
     relres=norm(res)/normb;
     D=(1.)./diag(A);
           niter=0;
           while(relres>tol) &(niter<nmaxit)
               niter=niter+1;
               sol =x0 + D.*res;
               x0=sol;
               res=b-A*x0;
               relres=norm(res)/normb;
               resvecJ(niter)=relres;
           end
    
endfunction
function[sol,relres,resvecG,niter]= myseidel(A,b,tol,nmaxit)
     x0=zeros(n,1);
     normb=norm(b);
     resvecG=zeros(nmaxit,1);
   
     res=b-A*x0;
     relres=norm(res)/normb;
     D= tril(A);
     
           niter=0;
           while(relres>tol) &(niter<nmaxit)
               niter=niter+1;
               sol =D\res;
               sol=sol+x0;
               x0 = sol;
               res=b-A*x0;
               relres=norm(res)/normb;
               resvecG(niter)=relres;
           end
    
endfunction
n=3
A=[2 -1 0;-1 2 -1;0 -1 2]
b=[1; 2; 3]
[sol,relresJ,resvecJ,niter]= myjacobi(A,b,0.01,50)
[sol,relresG,resvecG,niter]= myseidel(A,b,0.01,50)

figure;
plot(1:50,log10(resvecJ),'r');
plot(1:50,log10(resvecG));




