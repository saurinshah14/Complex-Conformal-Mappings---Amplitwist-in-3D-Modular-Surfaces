% --- Mapping Horizontal Lines to Rays ---
x = linspace(-1, 1.5, 100); % x varies to extend the ray. values on x-axis that start from -1 ending at 1.5 (ray length) going in 100 steps.
y_values = [-pi, -3*pi/4, -pi/2, -pi/4,  0, pi/4, pi/2, 3*pi/4, pi]; % Constant angles. The 9 horizontal lines representing the angles that are being mapped are listed in the array.

figure; hold on;
for y = y_values
    z = x + 1i*y;           % Define the horizontal line in z
    w = exp(z);             % Apply the mapping w = e^z
    plot(real(w), imag(w), 'LineWidth', 1.5);
end

axis equal; grid on;
title('Horizontal Lines (y=c) Mapping to Radial Rays');
xlabel('u (Real)'); ylabel('v (Imaginary)');
legend('y = -\pi', 'y = -3\pi/4', 'y = -\pi/2', 'y = -\pi/4', 'y = 0', 'y = \pi/4', 'y = \pi/2', 'y = 3\pi/4', 'y = \pi');

% Export for LaTeX
exportgraphics(gcf, 'SpecimenA_ImaginaryMapping.pdf', 'ContentType', 'vector')