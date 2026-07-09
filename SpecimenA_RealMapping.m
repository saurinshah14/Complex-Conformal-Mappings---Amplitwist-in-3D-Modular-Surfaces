% --- Mapping Vertical Lines to Circles ---
y = linspace(0, 2*pi, 200); % y varies to complete the circle. values on y-axis start from the value of 0 and go till 2*pi (full circle) in 200 steps
x_values = [-1, -0.5, 0, 0.5, 1]; % Constant x values (radii will be e^x). the 5 vertical lines that are being mapped are listed in this array.

figure; hold on;
for x = x_values
    z = x + 1i*y;           % Define the vertical line in z
    w = exp(z);             % Apply the mapping w = e^z
    plot(real(w), imag(w), 'LineWidth', 2);
end

axis equal;
grid on;
title('Vertical Lines (x=c) Mapping to Concentric Circles');
xlabel('u (Real)');
ylabel('v (Imaginary)');
legend('x = -1', 'x = -0.5', 'x = 0', 'x = 0.5', 'x = 1');

% Export for LaTeX
exportgraphics(gcf, 'SpecimenA_RealMapping.pdf', 'ContentType', 'vector')
