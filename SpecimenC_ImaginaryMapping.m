% --- Specimen C: Codomain Transformation of Horizontal Grid Lines ---
clear; clc; close all;

% Define constant y-values (horizontal lines in the z-plane)
% Avoiding y = 0 exactly to prevent a degenerate flat line segment
y_constants = [-1.5, -1.0, -0.5, 0.5, 1.0, 1.5]; 
x_fluid = linspace(-pi, pi, 1000); % x varies smoothly across a full period

% Initialize single-panel figure
figure('Position', [100, 100, 550, 450]);
hold on;

% Generate a distinct color palette for each ellipse
colors = lines(length(y_constants));

for i = 1:length(y_constants)
    c2 = y_constants(i);
    
    % Direct parameterization using the split complex identity:
    % u = sin(x)*cosh(c2), v = cos(x)*sinh(c2)
    u = sin(x_fluid) .* cosh(c2);
    v = cos(x_fluid) .* sinh(c2);
    
    % Plot the individual elliptical trajectory
    plot(u, v, 'LineWidth', 2, 'Color', colors(i,:));
end

% Mark and label the shared focal points (vertices at u = -1 and u = 1)
plot([-1, 1], [0, 0], 'kx', 'MarkerSize', 8, 'LineWidth', 1.5);
text(1.1, 0.2, 'u = 1', 'FontSize', 9, 'FontWeight', 'bold');
text(-1.4, 0.2, 'u = -1', 'FontSize', 9, 'FontWeight', 'bold');

% Structural formatting matching your project specifications
grid on; box on; axis equal;
xlim([-3, 3]); ylim([-3, 3]);

title('w-Plane: Transformed Horizontal Grid Lines (y = c_2)');
xlabel('Real Axis (u)'); 
ylabel('Imaginary Axis (v)');

% Export for LaTeX as a high-quality vector PDF
exportgraphics(gcf, 'SpecimenC_ImaginaryMapping.pdf', 'ContentType', 'vector');