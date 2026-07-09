% --- Specimen B: 3D Mapping of the Reciprocal Function (Complex Modulus Surface) ---
clear; clc; close all;

% Create a fine grid in the z-plane
[X, Y] = meshgrid(linspace(-2, 2, 400), linspace(-2, 2, 400));
Z = X + 1i*Y;

% Apply the mapping w = 1/z
W = 1./Z;

% Calculate magnitude (Height) and Phase/Argument (Color mapping)
Magnitude = abs(W);
Phase = angle(W);

% Set a threshold for the magnitude to avoid an infinite peak at z=0
max_height = 5;
Magnitude(Magnitude > max_height) = NaN; % Cut off the pole cleanly for visualization

% Initialize 3D figure
figure('Position', [100, 100, 800, 600]);
hold on;

% Plot the 3D surface
surf_plot = surf(X, Y, Magnitude, Phase, 'EdgeColor', 'none', 'FaceColor', 'interp');

% Add a shaded unit cylinder to represent the Unit Circle Invariance boundary
[cx, cy, cz] = cylinder(1, 100);
cz = cz * max_height;
mesh(cx, cy, cz, 'FaceColor', 'none', 'EdgeColor', [0.5 0.5 0.5], 'EdgeAlpha', 0.15, 'HandleVisibility', 'off');

% Professional Styling
view(-35, 30); % Adjust the 3D perspective camera position
grid on;
box on;
colormap(jet); % Color spectrum correlates to the complex argument (0 to 2pi)
colorbar_handle = colorbar;
ylabel(colorbar_handle, 'Phase / Argument (Arg(w))', 'FontSize', 11);

% Labels and Limits
title('3D Modular Surface of f(z) = 1/z', 'FontSize', 13);
xlabel('x (Real Axis)', 'FontSize', 11);
ylabel('y (Imaginary Axis)', 'FontSize', 11);
zlabel('|w| (Magnitude Scale)', 'FontSize', 11);

xlim([-2, 2]);
ylim([-2, 2]);
zlim([0, max_height]);

% Export for LaTeX
exportgraphics(gcf, 'SpecimenB_3DModularSurface.pdf', 'ContentType', 'vector');