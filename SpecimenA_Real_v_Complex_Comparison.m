% Set up the grid
x_lines = [-1, -0.5, 0, 0.5, 1];
y_lines = [-pi, -3*pi/4, -pi/2, -pi/4,  0, pi/4, pi/2, 3*pi/4, pi];
x_fine = linspace(-1, 1.5, 200);

figure('Position', [100, 100, 1200, 500]);

% --- LEFT PANEL: Z-PLANE with 1D Real Function Overlay ---
subplot(1, 2, 1); hold on;
% 1. Plot the standard Grid
for x = x_lines, plot([x, x], [-pi, pi], 'b:', 'LineWidth', 0.5); end
for y = y_lines, plot([-1, 1.5], [y, y], 'r:', 'LineWidth', 0.5); end

% 2. Overlay the Real Exponential Curve on the Real Axis (y=0)
% We use the y-axis of the plot to represent the "output" magnitude for the 1D case
plot(x_fine, exp(x_fine), 'k', 'LineWidth', 2.5); 
text(0.5, 3, 'f(x)=e^x', 'FontSize', 12, 'FontWeight', 'bold');

grid on; axis([-1.2 1.7 -pi-0.5 5]);
xlabel('Real (x)'); ylabel('iy / f(x)');
title('Z-Plane with 1D Real Exponential Overlay');

% --- RIGHT PANEL: W-PLANE (The Complex Expansion) ---
subplot(1, 2, 2); hold on;
y_circ = linspace(-pi, pi, 500);
for x = x_lines
    w = exp(x + 1i*y_circ);
    plot(real(w), imag(w), 'b', 'LineWidth', 1.2);
end
for y = y_lines
    w = exp(x_fine + 1i*y);
    plot(real(w), imag(w), 'r', 'LineWidth', 1.2);
end

grid on; axis equal;
xlabel('u (Real)'); ylabel('v (Imaginary)');
title('W-Plane: The Complex Conformal Mapping');

% Define your 3 points
z_points = [1 + 1i*pi/4, 0.5 + 1i*3*pi/4, -0.5 - 1i*3*pi/4];
sq_size = 0.15; % Size of the right-angle square

for i = 1:length(z_points)
    z0 = z_points(i);
    w0 = exp(z0);
    
    % 1. Plot the points and quivers as before
    plot(real(w0), imag(w0), 'ko', 'MarkerFaceColor', 'w', 'MarkerSize', 5);
    
    % 2. Calculate the "Right Angle Square" points
    % Direction vectors for the ray and the circle
    v_ray = exp(z0) / abs(exp(z0));       % Normalized radial vector
    v_circ = (1i * exp(z0)) / abs(exp(z0)); % Normalized tangential vector
    
    % Square corners
    p1 = w0 + sq_size * v_ray;            % Move out along ray
    p2 = w0 + sq_size * v_ray + sq_size * v_circ; % Move "corner"
    p3 = w0 + sq_size * v_circ;           % Move up along circle
    
    % Plot the square notation
    plot([real(p1), real(p2), real(p3)], [imag(p1), imag(p2), imag(p3)], 'k-', 'LineWidth', 1);
end

% 1. Pick an intersection point in the Z-plane
z_points = [1 + 1i*pi/4, 0.5 + 3i*pi/4, -0.5 - 3i*pi/4];
colors = {'k', 'm', 'g'}; % Black for outer, magenta for middle, green for inner
w0 = exp(z_points); % The point in the W-plane

for i = 1:length(z_points)
    z0 = z_points(i);
    w0 = exp(z0);
    
    % Tangent vectors
    t_ray = exp(z0);
    t_circ = 1i * exp(z0);
    
    % Plot intersection point
    plot(real(w0), imag(w0), 'o', 'MarkerFaceColor', colors{i}, 'MarkerEdgeColor', 'k');
    
    % Plot quivers (scaled relative to their position to stay visible)
    scale = 0.3;
    quiver(real(w0), imag(w0), real(t_ray), imag(t_ray), 0.9, 'r', 'LineWidth', 1.5, 'MaxHeadSize', 1.2);
    quiver(real(w0), imag(w0), real(t_circ), imag(t_circ), 0.9, 'b', 'LineWidth', 1.5, 'MaxHeadSize', 1.2);
end



% Export for LaTeX
exportgraphics(gcf, 'SpecimenA_Real_v_Complex_Comparison.pdf', 'ContentType', 'vector')