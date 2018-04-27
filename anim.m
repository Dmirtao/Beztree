axis square equal;
grid on;
h = gcf;
az = 0;
el = 30;
g = true;
disp('Please press Ctrl+c to stop the script.')
while g
    view(round(az),round(el))
    az = az + (1/10);
    pause(1./200);
end
