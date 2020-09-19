
%--------------------------------------------------------------------------
%--------------------------------Plotting----------------------------------
%--------------------------------------------------------------------------

%COLORING:
%Specify that the first six colors used will be red, blue, green, black,
%yellow, and magenta.
colorMatrix(1:6, 1:3)=[1, 0, 0;
                       0, 0, 1;
                       0, 1, 0;
                       0, 0, 0;
                       1, 1, 0;
                       1, 0, 1];
%For maore than six bodies the plot will be a mess anyway, but fill in the
%rest of the colors with the 'hot' command
colorMatrix(7:N+2, 1:3)=hot((N+2-6));


%% Plotting observables

plot(t(1:timeMax),I5(1:timeMax))
grid on
title('Moment of Inertia vs. time')
xlabel('time axis'), ylabel ('I')

figure
plot(t(1:timeMax),E(1:timeMax))
grid on
title('Energy vs. Time')
xlabel('time axis'), ylabel ('Energy')

figure
plot3(CM1(1:timeMax), CM2(1:timeMax), CM3(1:timeMax))
grid on
title('Path of the center of Mass')
xlabel('x coor CM'), ylabel('y coor CM'), zlabel('z coor CM')

figure
plot(t(1:timeMax), deltaE(1:timeMax))
grid on
title('delta energy as a function of time')
xlabel('time'), ylabel('delta energy')


%% PLOTS OF TRAJECTORIES
figure
hold on
for k=1:N
    plot3(y(:, 3*k-2), y(:, 3*k-1), y(:, 3*k), 'Color', colorMatrix(k,:))
    plot3(y(1, 3*k-2), y(1, 3*k-1), y(1, 3*k), 'o' ,'Color', colorMatrix(k,:))
    plot3(y(timeMax, 3*k-2), y(timeMax, 3*k-1), y(timeMax, 3*k), '*','Color', colorMatrix(k,:))
end
grid on
title('The trajectories of the bodies (o is start, * is end)')
xlabel('x axis'), ylabel('y axis'), zlabel('z axis');
axis equal;

%%
figure
CM = [CM1' CM2' CM3'];
hold on
for k=1:N
    plot3(y(:, 3*k-2)-CM(:,1), y(:, 3*k-1)-CM(:,2), y(:, 3*k)-CM(:,3),'Color', colorMatrix(k,:))
    plot3(y(1, 3*k-2)-CM(1,1), y(1, 3*k-1)-CM(1,2), y(1, 3*k)-CM(1,3), 'o' ,'Color', colorMatrix(k,:))
    plot3(y(timeMax, 3*k-2)-CM(timeMax,1), y(timeMax, 3*k-1)-CM(timeMax,2), y(timeMax, 3*k)-CM(timeMax,3), '*' ,'Color', colorMatrix(k,:))
end
grid on
title('The trajectories of the bodies in center of mass coordinates (o is start, * is end)')
xlabel('x axis'), ylabel('y axis'), zlabel('z axis');
axis equal;