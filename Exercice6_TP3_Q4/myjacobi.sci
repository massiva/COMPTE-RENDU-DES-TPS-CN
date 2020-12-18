function[sol,niter,info]= myjacobi(A,b,nmaxit,tol)
    //vérification aucun terme de la diagonal de A n'est nul
    if ~and(diag(A)) then
        error('erreur:diagonale est nulle')
    end
    //décomposition de A=D-E-F
     D=diag(diag(A))
     E=-triu(A)+D
     F=-tril(A)+D
     x=inv(A)*b
     sol=b
     niter=0 
     info=0 
     err=[]     
           for k=1:nmaxit
               sol =(eye(n,n)-inv(D)*A)*sol+inv(D)*b
               err=[err,norm(x-sol)];
                if max(abs(A*sol-b))< tol 
                    info = 1;
                    niter= k;
                    break
                 end
            end
 plot(1:niter,log(err))    
endfunction
n=3
A=[2 -1 0;-1 2 -1;0 -1 2]
b=[4; 3; 1]
[sol,niter,info]=myjacobi(A,b,100,0.01)
x=inv(A)*b
b=A*x;
