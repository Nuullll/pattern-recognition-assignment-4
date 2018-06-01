% assignment 4
%% input

w1 = [2, 3;
    2, 2;
    2, 4;
    3, 3;
    3, 4;
    2.5, 3;
    1.5, 2;
    3.5, 2.5;
    4, 4;
    0.5, 0.5];

w2 = [0, 2.5;
    -2, 2;
    -1, -1;
    1, -2;
    3, 0;
    -2, -2;
    -3, -4;
    -5, -2;
    4, -1;];

%% scatter plot
figure;
plotRange = [-6 6 -6 6];
scatter(w1(:,1),w1(:,2),100,'b^','filled');
hold on;
scatter(w2(:,1),w2(:,2),100,'r','filled');
hold off;
axis(plotRange);
axis equal;
legend('\omega_1','\omega_2');
xlabel('x');
ylabel('y');

%% recognition functions
m1 = mean(w1);
m2 = mean(w2);

N = 100;
x = linspace(plotRange(1),plotRange(2),N);
y = linspace(plotRange(3),plotRange(4),N);
[X,Y] = meshgrid(x,y);

figure;
levels = linspace(-40,30,50);   % contour levels
% category 1
F1 = m1(1) * X + m1(2) * Y - sum(m1.^2)/2;
contour(X,Y,F1,levels);
% category 2
F2 = m2(1) * X + m2(2) * Y - sum(m2.^2)/2;
hold on;
contour(X,Y,F2,levels);
hold off;

%% recognition boundary
boundary = ((m2(1)-m1(1))*x + (sum(m1.^2)+sum(m2.^2))/2)/(m1(2)-m2(2));
figure(1);
hold on;
plot(x,boundary);
legend('\omega_1','\omega_2','boundary');