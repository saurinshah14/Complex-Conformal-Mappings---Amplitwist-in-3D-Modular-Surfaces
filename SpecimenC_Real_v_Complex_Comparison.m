% --- Specimen C: 4-Quadrant Orthogonality & Tracing Direction Verification ---
clear; clc; close all;

% 1. PERFECTLY EQUIDISTANT GRID LINES (Constant step size of 0.5)
neg_lines_x = [-2.5, -2.0, -1.5, -1.0, -0.5];
pos_lines_x = [0.5, 1.0, 1.5, 2.0, 2.5];
neg_lines_y = [-2.0, -1.5, -1.0, -0.5];
pos_lines_y = [0.5, 1.0, 1.5, 2.0];

fluid_param = linspace(-3, 3, 2000); 
x_domain = linspace(-pi, pi, 1000);  

% Define EXACT Grid Intersection Points (Symmetric 4-Quadrant Setup)
z1 =  0.5 + 1.0i;   % Q1: Upper Half-Plane -> Anti-Clockwise (ACW)
z2 = -0.5 + 1.0i;   % Q2: Upper Half-Plane -> Anti-Clockwise (ACW)
z3 = -0.5 - 1.0i;   % Q3: Lower Half-Plane -> Clockwise (CW)
z4 =  0.5 - 1.0i;   % Q4: Lower Half-Plane -> Clockwise (CW)

% Map points to the w-plane
w1 = sin(z1); w2 = sin(z2); w3 = sin(z3); w4 = sin(z4);

% Define Professional, Distinct Colors for each quadrant family
color_neg_x = [0.0, 0.5, 0.8];  % Deep Sky Blue
color_pos_x = [0.0, 0.7, 0.4];  % Emerald Green
color_neg_y = [0.9, 0.6, 0.0];  % Dark Amber
color_pos_y = [0.6, 0.2, 0.8];  % Deep Purple

figure('Position', [50, 50, 1100, 520]);

% =========================================================================
% PANEL 1: THE Z-PLANE (Equidistant Domain Mesh with 4 Points)
% =========================================================================
subplot(1, 2, 1); hold on;

% Plot Uniform Grid Lines
for c = neg_lines_x
    plot(c*ones(size(fluid_param)), fluid_param, 'Color', color_neg_x, 'LineWidth', 1.1);
end
for c = pos_lines_x
    plot(c*ones(size(fluid_param)), fluid_param, 'Color', color_pos_x, 'LineWidth', 1.1);
end
for c = neg_lines_y
    plot(fluid_param, c*ones(size(fluid_param)), 'Color', color_neg_y, 'LineWidth', 1.1);
end
for c = pos_lines_y
    plot(fluid_param, c*ones(size(fluid_param)), 'Color', color_pos_y, 'LineWidth', 1.1);
end

% Thicken and Bold the Principal Axes
plot([-4, 4], [0, 0], 'k-', 'LineWidth', 2.0); 
plot([0, 0], [-4, 4], 'k-', 'LineWidth', 2.0); 

% Real Sine Function Overlay
p1 = plot(x_domain, sin(x_domain), 'r--', 'LineWidth', 3.0, 'DisplayName', 'Real f(x) = sin(x)');

% --- PLOT LOCAL BASIS VECTORS IN Z-PLANE ---
pts = {z1, z2, z3, z4};
labels = {'z_1', 'z_2', 'z_3', 'z_4'};
offsets_x = [0.15, -0.35, -0.35, 0.15];
offsets_y = [0.15, 0.15, -0.3, -0.3];

for i = 1:4
    zp = pts{i};
    quiver(real(zp), imag(zp), 1, 0, 0.4, 'LineWidth', 2.5, 'Color', 'r', 'MaxHeadSize', 0.5);
    quiver(real(zp), imag(zp), 0, 1, 0.4, 'LineWidth', 2.5, 'Color', 'b', 'MaxHeadSize', 0.5);
    plot(real(zp), imag(zp), 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 6);
    text(real(zp)+offsets_x(i), imag(zp)+offsets_y(i), labels{i}, 'FontSize', 10, 'FontWeight', 'bold');
end

% Structural formatting for Panel 1
grid on; box on; axis equal;
xlim([-pi, pi]); ylim([-2.5, 2.5]);
title('z-Plane: Equidistant Mesh (\Delta = 0.5)');
xlabel('Real Axis (x)'); ylabel('Imaginary Axis (y)');
legend(p1, 'Location', 'northeast');

% =========================================================================
% PANEL 2: THE W-PLANE (Populated Net with 4-Quadrant Verifications)
% =========================================================================
subplot(1, 2, 2); hold on;

% Map and Plot Uniform Grid Lines
for c = neg_lines_x
    z = c + 1i*fluid_param; w = sin(z);
    plot(real(w), imag(w), 'Color', color_neg_x, 'LineWidth', 1.1);
end
for c = pos_lines_x
    z = c + 1i*fluid_param; w = sin(z);
    plot(real(w), imag(w), 'Color', color_pos_x, 'LineWidth', 1.1);
end
for c = neg_lines_y
    z = fluid_param + 1i*c; w = sin(z);
    plot(real(w), imag(w), 'Color', color_neg_y, 'LineWidth', 1.1);
end
for c = pos_lines_y
    z = fluid_param + 1i*c; w = sin(z);
    plot(real(w), imag(w), 'Color', color_pos_y, 'LineWidth', 1.1);
end

% Thicken and Bold the Principal Axes
plot([-8, 8], [0, 0], 'k-', 'LineWidth', 2.0); 
plot([0, 0], [-8, 8], 'k-', 'LineWidth', 2.0); 

% --- TRANSFORM AND PLOT QUIVERS IN W-PLANE via f'(z) = cos(z) ---
w_pts = {w1, w2, w3, w4};
w_labels = {'w_1 = f(z_1)', 'w_2 = f(z_2)', 'w_3 = f(z_3)', 'w_4 = f(z_4)'};
w_off_x = [1, -2, -2, 1];
w_off_y = [1, 1, -1, -1];

for i = 1:4
    zp = pts{i};
    wp = w_pts{i};
    
    dw_dz = cos(zp); 
    dw_horiz = dw_dz * 1;   
    dw_vert  = dw_dz * 1i;  
    
    quiver(real(wp), imag(wp), real(dw_horiz), imag(dw_horiz), 0.4, 'LineWidth', 2.5, 'Color', 'r', 'MaxHeadSize', 0.5);
    quiver(real(wp), imag(wp), real(dw_vert), imag(dw_vert), 0.4, 'LineWidth', 2.5, 'Color', 'b', 'MaxHeadSize', 0.5);
    plot(real(wp), imag(wp), 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 6);
    text(real(wp)+w_off_x(i), real(wp)*0+imag(wp)+w_off_y(i), w_labels{i}, 'FontSize', 10, 'FontWeight', 'bold');
end

% Structural formatting for Panel 2
grid on; box on; axis equal;
xlim([-7, 7]); ylim([-6, 6]);
title('w-Plane: 4-Quadrant Tracking & Orientation Analysis');
xlabel('Real Axis (u)'); ylabel('Imaginary Axis (v)');

% Export for LaTeX as high-quality vector PDF
exportgraphics(gcf, 'SpecimenC_Real_v_Complex_Comparison.pdf', 'ContentType', 'vector');