//méthode de jaccobi pour résoudre Ax=b

function[sol,niter,info]= myjacobi(A,b,nmaxit,tol)
    //vérification aucun terme de la diagonal de A n'est nul
    if ~and(diag(A)) then
        error('erreur:diagonale est nulle')
    end
    //décomposition de A=D-E-F
     D=diag(diag(A))
     E=-triu(A)+D
     F=-tril(A)+D
     sol=b
     niter=0 
     info=0 
           for k=1:nmaxit
                 sol =(eye(n,n)-inv(D)*A)*sol+inv(D)*b
                if max(abs(A*sol-b))< tol
                    info = 1
                    niter= k
                    break
                 end
            end
          
endfunction
n=3;
A=[2 -1 0;-1 2 -1;0 -1 2]
b=[4; 3; 1]
[sol,niter,info]= myjacobi(A,b,100,0.01)
x=inv(A)*b

