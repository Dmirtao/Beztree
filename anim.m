axis square equal;
grid on;
h = gcf;
az = 0;
el = 30;
g = true;
while g
    view(round(az),round(el))
    az = az + (1/10);
    pause(1./200);
end
