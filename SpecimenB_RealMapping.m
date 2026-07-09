% --- Specimen B: Mapping Vertical Lines (Inversion) ---
y = linspace(-5, 5, 1000); % Large range for y to see the circles close at the origin
x_values = [-1.5, -1, -0.5, 0.5, 1, 1.5]; % Constant x values (avoiding x=0)

figure; hold on;
colors = lines(length(x_values)); % Get distinct colors for clarity
idx = 1;

for x = x_values
    z = x + 1i*y;           % Define vertical lines in z
    w = 1./z;               % Apply the mapping w = 1/z
    plot(real(w), imag(w), 'LineWidth', 2, 'Color', colors(idx,:));
    idx = idx + 1;
end

% Drawing the Unit Circle for reference (Inversion threshold)
th = linspace(0, 2*pi, 100);
plot(cos(th), sin(th), 'k--', 'LineWidth', 1.5); 

axis equal;
grid on;
title('Vertical Lines (x=c) Mapping to Circles through the Origin');
xlabel('u (Real)');
ylabel('v (Imaginary)');
legend('x = -1.5', 'x = -1', 'x = -0.5', 'x = 0.5', 'x = 1', 'x = 1.5', 'Unit Circle');

% Export for LaTeX
exportgraphics(gcf, 'SpecimenB_RealMapping.pdf', 'ContentType', 'vector')