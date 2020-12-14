function [mat]=tridiag(A)
  for i=1:n
     mat(i,i)=A(i,i);
    end
    for (i=2:n)
            mat(i-1,i)=A(i-1,i);
            mat(i,i-1)=A(i,i-1);
    end
 // facto

endfunction

function [L,U]=fact(mat)
    [mat]=tridiag(A);
  for k=1:n-1
i=k+1:n;
mat(i,k)=mat(i,k)/mat(k,k);
j=k+1:n;
mat(i,j)=mat(i,j)-mat(i,k)*mat(k,j)
end
//expression de U
U=triu(mat);
// expression de L
L=tril(mat)

L(1:n+1:$)=1;
endfunction
n=3;
A=rand(n,n);
[mat]=tridiag(A);

[L,U]=fact(mat);

