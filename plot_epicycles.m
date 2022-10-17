function [] = plot_epicycles(cn0, cn, W, T, axes, frames, duration, speed, window, circle_shift, t_shift)

figure(1)
hold on
subplot(2,2,[1 3])
hold on
%plot_trace(cn0, cn, frames, W, T);

subplot(2,2,2)
hold on
%plot_trace(cn0, cn, frames, W, T);

M = height(cn);
circles = zeros(2*M + 1, 1);
circles(2) = cn0;
dt = T/frames;

subplot(2,2,[1 3])
hold on
circl1 = plot (cn0, 'b-');

subplot(2,2,2)
hold on
circl2 = plot (cn0, 'b-');
fram = 1;
trac1 = plot(0);
trac2 = plot(0);

for t = (linspace(0, duration, duration * frames /T) + t_shift * frames * 100/T )
    
    sum = cn0;
    for k = 1: M
        sum = sum + cn(k, 1) * exp(t * W * k * 1j);
        circles(2*k + 1) = sum;
        sum = sum + cn(k, 2) * exp(-t * W * k * 1j);
        circles(2*k + 2) = sum;
    end
    
    if (fram == frames)
        clear trace;
        fram = 1;
    end
    trace(fram) = circles(2 * M + 2);
    delete(circl1)
    delete(circl2)
    delete(trac1)
    delete(trac2)
    
    subplot(2,2,[1 3])
    hold on
    circl1 = plot (circles, 'k-');
    circl1.Color = [1 1 1] * 64 / 255;
    trac1 = plot (trace, 'b-');
    axis([-axes axes -axes axes]);
    
    subplot(2,2,2)
    hold on
    circl2 = plot (circles, 'k-');
    circl2.MarkerFaceColor = [1 1 1];
    axis([real(circles(2*M - circle_shift)) - window, real(circles(2*M - circle_shift)) + window, imag(circles(2*M - circle_shift)) - window, imag(circles(2*M - circle_shift)) + window]);
    trac2 = plot (trace, 'b-');
    
    pause(dt *speed)
    fram = fram + 1; 
end