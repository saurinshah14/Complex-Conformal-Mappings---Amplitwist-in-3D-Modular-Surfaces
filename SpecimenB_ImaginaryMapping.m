% --- Specimen B: Mapping Horizontal Lines (Inversion) ---
x = linspace(-5, 5, 1000); % Large range for x to ensure circles close at the origin
y_values = [-1.5, -1, -0.5, 0.5, 1, 1.5]; % Constant height values (avoiding y=0)

figure; hold on;
colors = lines(length(y_values)); % Or use lines(length(y_values))
idx = 1;

for y = y_values
    z = x + 1i*y;           % Define horizontal lines in z
    w = 1./z;               % Apply the mapping w = 1/z
    plot(real(w), imag(w), 'LineWidth', 1.5, 'Color', colors(idx,:));
    idx = idx + 1;
end

% Unit Circle Reference (The Inversion Boundary)
th = linspace(0, 2*pi, 100);
plot(cos(th), sin(th), 'k--', 'LineWidth', 1.2); 

axis equal;
grid on;
title('Horizontal Lines (y=c) Mapping to Circles on the Imaginary Axis');
xlabel('u (Real)');
ylabel('v (Imaginary)');
legend('y = -1.5', 'y = -1', 'y = -0.5', 'y = 0.5', 'y = 1', 'y = 1.5', 'Unit Circle');

% Export for LaTeX
exportgraphics(gcf, 'SpecimenB_ImaginaryMapping.pdf', 'ContentType', 'vector')