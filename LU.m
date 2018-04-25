%rudra aiyar
A=[6 1 7 7 6 1 8;
    7 5 5 2 7 8 7;
    9 5 3 4 4 4 3;
    9 8 1 6 -1 8 2;
    1 4 5 3 3 3 7;
    1 3 2 7 4 7 9;
    6 6 -2 3 2 3 3]
%Matrix B

B=[6;4;8;7;1;8;9]

[L,U] = LU_factorization(A)
[y] = forward_substitution(L, B)
[x] = backward_substitution(U,y)

%we need x
x0=A\B
% err is ge - mat div abs value 
Err=abs(x-x0)

x0=A\B
% err is ge - mat div
Err=abs(x-x0)

function [L,U] = LU_factorization(A)
    [m n] = size(A);
    assert(m == n);
    U = A;
    L = eye(n);
    for i = 1:m-1
        for j = i+1:m
            L(j,i) = U(j,i)/U(i,i);
            U(j,i:m) = U(j,i:m) - L(j,i)*U(i,i:m);
        end
    end
    
    if A==U
    end
end

function y = forward_substitution(L, B)
    [m n] = size(L);
    assert(m == n);
    y = zeros(n,1);
    for k = 1:n
        y(k) = B(k);
        for j = 1:(k-1)
            y(k) = y(k) - L(k,j)*y(j);
        end
        y(k) = y(k)/L(k,k);
    end
end

function x = backward_substitution(U,y)
    [m,n] = size(U);
    assert(m == n);
    x = zeros(n,1);
    for k = n:-1:1
        x(k) = y(k);
        for j = (k+1):n
            x(k) = x(k) - U(k,j)*x(j);
        end
        x(k) = x(k)/U(k,k);
    end
end