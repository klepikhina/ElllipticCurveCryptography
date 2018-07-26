clear;
close;
clc;

% y^2 = x^3+ax+b
syms x

aVector = linspace(-10,10,201);
bVector = linspace(-10,10,201);


% aVector = linspace(-5,5,11);
% bVector = linspace(-5,5,11);

threeRootsA = [];
threeRootsB = [];

twoRootsA = [];
twoRootsB = [];

oneRootA = [];
oneRootB = [];

for a = 1:length(aVector)
    for b = 1:length(bVector)
        eqn= sqrt(x^3+aVector(a)*x+bVector(b))==0;
        soln = solve(eqn, x);
        true_roots=vpa(soln);
        real_soln=soln(imag(true_roots)==0);
%         real_soln=soln(abs(imag(soln))<1e-9);
        if length(real_soln) == 3
%             disp('3')
%             true_roots
            threeRootsA = [threeRootsA; aVector(a)];
            threeRootsB = [threeRootsB; bVector(b)];
            
        elseif length(real_soln) == 2
%             disp('2')
%             true_roots
            twoRootsA = [twoRootsA; aVector(a)];
            twoRootsB = [twoRootsB; bVector(b)];
        elseif length(real_soln) == 1
%             disp('1')
%             true_roots
            oneRootA = [oneRootA; aVector(a)];
            oneRootB = [oneRootB; bVector(b)];
        else
            disp('No real roots')
%             true_roots
        end
        disp([aVector(a),bVector(b)])
        
    end
end
figure(1)
scatter(threeRootsA, threeRootsB)
xlabel('a')
ylabel('b')
title('Three roots')
figure(2)
scatter(twoRootsA, twoRootsB)
xlabel('a')
ylabel('b')
title('Two roots')
figure(3)
scatter(oneRootA, oneRootB)
xlabel('a')
ylabel('b')
title('One root')

