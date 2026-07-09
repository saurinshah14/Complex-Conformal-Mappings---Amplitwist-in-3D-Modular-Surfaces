% --- Specimen C: Codomain Transformation of Vertical Grid Lines ---
clear; clc; close all;

% Define constant x-values (vertical lines in the z-plane)
x_constants = [-pi/3, -pi/6, 0, pi/6, pi/3]; 
y_fluid = linspace(-2.5, 2.5, 1000); % y varies smoothly to trace curves

% Initialize single-panel figure
figure('Position', [100, 100, 550, 450]);
hold on;

% Generate a distinct color palette for each trajectory
colors = lines(length(x_constants));

for i = 1:length(x_constants)
    c1 = x_constants(i);
    
    % Direct parameterization using the split complex identity:
    % u = sin(c1)*cosh(y), v = cos(c1)*sinh(y)
    u = sin(c1) .* cosh(y_fluid);
    v = cos(c1) .* sinh(y_fluid);
    
    % Plot the individual hyperbolic branch
    plot(u, v, 'LineWidth', 2, 'Color', colors(i,:));
end

% Mark and label the focal points (vertices where u = -1 and u = 1)
plot([-1, 1], [0, 0], 'kx', 'MarkerSize', 8, 'LineWidth', 1.5);
text(1.3, 0.0, 'u = 1', 'FontSize', 9, 'FontWeight', 'bold');
text(-1.8, 0.0, 'u = -1', 'FontSize', 9, 'FontWeight', 'bold');

% Structural formatting for a clean, professional look
grid on; box on; axis equal;
xlim([-3, 3]); ylim([-3, 3]);

title('w-Plane: Transformed Vertical Grid Lines (x = c_1)');
xlabel('Real Axis (u)'); 
ylabel('Imaginary Axis (v)');

% Export for LaTeX as a high-quality vector PDF
exportgraphics(gcf, 'SpecimenC_RealMapping.pdf', 'ContentType', 'vector');