%rudra aiyar
%Matrix A
A=[6 1 7 7 6 1 8;
    7 5 5 2 7 8 7;
    9 5 3 4 4 4 3;
    9 8 1 6 -1 8 2;
    1 4 5 3 3 3 7;
    1 3 2 7 4 7 9;
    6 6 -2 3 2 3 3]
%Matrix B
B=[6;4;8;7;1;8;9]
[U,f]=gaussian_elimination(A,B);
x=backward_substitution(U,f)
%we need x
x0=A\B
% err is ge - mat div
Err=abs(x-x0)

%%%%%%%% ge
function [U,f] = gaussian_elimination(A,b)
    pickrow = size(A,1);
    for i = 1:pickrow-1
        if A(i,i) == 0
           t = min(find(A(i+1:pickrow,i) ~= 0) + i);
           hold = A(i,:);     tb = b(i);
           A(i,:) = A(t,:);   b(i) = b(t);
           A(t,:) = hold;     b(t) = tb;
        end
        for j = i+1:pickrow
            m = -A(j,i) / A(i,i);
            A(j,i) = 0;
            A(j, i+1:pickrow) = A(j, i+1:pickrow) + m*A(i, i+1:pickrow);
            b(j) = b(j) + m*b(i);
        end
    end
    U = A
    f = b
end



%%%%%%%%%%%%%%% backwards sub

function X=backward_substitution(A,B)
    size=length(B);
    X=zeros(size,1);
    X(size)=B(size)/A(size,size);
    for i=size-1:-1:1
        X(i)=(B(i)-A(i,i+1:size)*X(i+1:size))/A(i,i);
    end
end