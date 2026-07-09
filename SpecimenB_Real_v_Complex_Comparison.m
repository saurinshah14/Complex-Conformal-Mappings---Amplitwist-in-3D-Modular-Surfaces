% --- Specimen B: Global Verification of the Amplitwist with Orthogonality Arrows ---
clear; clc; close all;

% Define grid parameters in the z-plane
x_values = [-1.5, -1, -0.5, 0.5, 1, 1.5];
y_values = [-1.5, -1, -0.5, 0.5, 1, 1.5];
t = linspace(-4, 4, 1000); % Grid line parameter

% Choose an intersection point to verify local orthogonality (z0 = 1 + 1i)
z0 = 1 + 1i; 
w0 = 1 / z0;

% Define a display scale factor to make the arrows clearly visible on the axes
display_scale = 0.6; 

% Initialize figure 
figure('Position', [100, 100, 1050, 480]);

% =========================================================================
% PANEL 1: THE Z-PLANE (Domain Grid with Basis Vectors)
% =========================================================================
subplot(1, 2, 1); hold on;
colors_x = lines(length(x_values));
colors_y = jet(length(y_values));

% Plot vertical lines
for i = 1:length(x_values)
    z_vert = x_values(i) + 1i*t;
    plot(real(z_vert), imag(z_vert), 'LineWidth', 1.2, 'Color', colors_x(i,:));
end

% Plot horizontal lines
for j = 1:length(y_values)
    z_horiz = t + 1i*y_values(j);
    plot(real(z_horiz), imag(z_horiz), 'LineWidth', 1.2, 'Color', colors_y(j,:));
end

% Plot Unit Circle Reference
th = linspace(0, 2*pi, 200);
plot(cos(th), sin(th), 'k--', 'LineWidth', 1.2);

% --- Plot Orthogonality Arrows in z-plane ---
% Tangent to horizontal line at z0 (points right: 1 + 0i)
% Tangent to vertical line at z0 (points up: 0 + 1i)
plot(real(z0), imag(z0), 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 6);
quiver(real(z0), imag(z0), display_scale*1, display_scale*0, 0.9, 'r', 'LineWidth', 1.5, 'MaxHeadSize', 1.2);
quiver(real(z0), imag(z0), display_scale*0, display_scale*1, 0.9, 'b', 'LineWidth', 1.5, 'MaxHeadSize', 1.2);

text(real(z0)+0.1, imag(z0)-0.15, 'z_0 = 1+i', 'FontSize', 10, 'FontWeight', 'bold');

axis equal; grid on; box on;
xlim([-2.5, 2.5]); ylim([-2.5, 2.5]);
title('z-Plane: Orthogonal Intersection');
xlabel('x (Real)'); ylabel('y (Imaginary)');

% =========================================================================
% PANEL 2: THE W-PLANE (Codomain Grid with Transformed Tangent Vectors)
% =========================================================================
subplot(1, 2, 2); hold on;

% Map and plot vertical lines -> Circles on Real Axis
for i = 1:length(x_values)
    z_vert = x_values(i) + 1i*t;
    w_vert = 1./z_vert; 
    plot(real(w_vert), imag(w_vert), 'LineWidth', 1.2, 'Color', colors_x(i,:));
end

% Map and plot horizontal lines -> Circles on Imaginary Axis
for j = 1:length(y_values)
    z_horiz = t + 1i*y_values(j);
    w_horiz = 1./z_horiz; 
    plot(real(w_horiz), imag(w_horiz), 'LineWidth', 1.2, 'Color', colors_y(j,:));
end

% Plot Unit Circle Reference
plot(cos(th), sin(th), 'k--', 'LineWidth', 1.2);

% --- Plot Transformed Orthogonality Arrows in w-plane ---
% Using the complex derivative: dw = f'(z) * dz = (-1 / z^2) * dz
dw_horizontal = -1 / (z0^2) * 1;  % Mapping of the horizontal basis vector
dw_vertical = -1 / (z0^2) * 1i; % Mapping of the vertical basis vector

plot(real(w0), imag(w0), 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 6);
% Transformed Horizontal Tangent Vector (Red)
quiver(real(w0), imag(w0), display_scale*real(dw_horizontal), display_scale*imag(dw_horizontal), 0/9, 'r', 'LineWidth', 1.5, 'MaxHeadSize', 1.2);
% Transformed Vertical Tangent Vector (Blue)
quiver(real(w0), imag(w0), display_scale*real(dw_vertical), display_scale*imag(dw_vertical), 0.9, 'b', 'LineWidth', 1.5, 'MaxHeadSize', 1.2);

text(real(w0)+0.1, imag(w0)-0.15, 'w_0 = 0.5-0.5i', 'FontSize', 10, 'FontWeight', 'bold');

axis equal; grid on; box on;
xlim([-2, 2]); ylim([-2, 2]);
title('w-Plane: Preserved Orthogonality (1/z)');
xlabel('u (Real)'); ylabel('v (Imaginary)');

% Export for LaTeX
exportgraphics(gcf, 'SpecimenB_Real_v_Complex_Comparison.pdf', 'ContentType', 'vector');