% --- Specimen C: Vibrant 3D Complex Sine Mapping Surface ---
clear; clc; close all;

% 1. Create a Dense Grid in the z-Plane
x = linspace(-pi, pi, 300);
y = linspace(-2, 2, 300);
[X, Y] = meshgrid(x, y);
Z_domain = X + 1i*Y;

% 2. Compute the Complex Sine Mapping
W = sin(Z_domain);

% 3. Extract Geometric Attributes for 3D Plotting
W_magnitude = abs(W);  % Determines the surface height (Z-axis)
W_phase = angle(W);    % Determines the vivid surface color mapping

% 4. Generate the 3D Visualization
figure('Position', [100, 100, 950, 700], 'Color', [1, 1, 1]);
hold on;

% Plot the surface with thin, subtle grid lines to see the warped mesh
surf_handle = surf(X, Y, W_magnitude, W_phase, ...
    'FaceColor', 'interp', ...
    'EdgeColor', [0.1, 0.1, 0.1], ...
    'EdgeAlpha', 0.12, ...
    'LineWidth', 0.5);

% Smooth shading and high-contrast professional lighting setup
shading interp;
lighting gouraud;
camlight('headlight');
material shiny; % Boosts specular highlights for brighter appearance

% 5. Add Crisp Contours along the Slopes (Ellipses/Hyperbolas)
[~, hContour] = contour3(X, Y, W_magnitude, 25, 'k-');
hContour.LineWidth = 1.0;
hContour.EdgeAlpha = 0.4;

% 6. Apply an Ultra-Bright, High-Contrast Custom Colormap (Hsv-based)
% This matches vibrant multi-specimen phase mapping conventions
vibrant_map = hsv(256); 
colormap(vibrant_map);
caxis([-pi, pi]); % Bind colors exactly to phase boundaries

% Colorbar Configuration
c_bar = colorbar;
ylabel(c_bar, 'Phase / Argument of sin(z) (radians)', 'FontSize', 11, 'FontWeight', 'bold');
set(c_bar, 'LineWidth', 1.0);

% Set viewing angle to capture the 3D relief structure and valleys clearly
view(-15, 20); 

% Labels and Architecture Formatting
grid on; box on;
ax = gca;
ax.GridAlpha = 0.3;
ax.LineWidth = 1.2;

title('3D Magnitude Surface of w = sin(z) [Vibrant Phase Mapping]', 'FontSize', 13, 'FontWeight', 'bold');
xlabel('Real Axis (x)', 'FontSize', 11, 'FontWeight', 'bold');
ylabel('Imaginary Axis (y)', 'FontSize', 11, 'FontWeight', 'bold');
zlabel('Magnitude |sin(z)|', 'FontSize', 11, 'FontWeight', 'bold');

% Fix aspect ratio to keep physical geometric scaling proportional
pbaspect([1.5, 1, 0.9]); 

% Export for LaTeX document integration as an uncompressed high-res raster
exportgraphics(gcf, 'SpecimenC_Vibrant_3D_Sine.png', 'Resolution', 300);