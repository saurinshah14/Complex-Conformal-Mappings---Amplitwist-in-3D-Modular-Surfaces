% 1. Create the grid based on your Specimen A range
[X, Y] = meshgrid(linspace(-1, 1.5, 100), linspace(-pi, pi, 100));
Z_input = X + 1i*Y;
W_output = exp(Z_input);

% 2. Define Height (Magnitude) and Color (Phase)
Magnitude = abs(W_output);
Phase = angle(W_output);

% 3. Plot the Surface
figure;
surf(X, Y, Magnitude, Phase, 'EdgeColor', 'none');

% 4. Formatting
colormap hsv; % HSV captures the cyclic nature of the phase
colorbar;
shading interp; % Smooths the color transitions
view(-35, 30);  % Sets a perspective that shows both axes clearly

xlabel('Real (x)');
ylabel('Imaginary (iy)');
zlabel('|f(z)| Magnitude');
title('3D Modular Surface of f(z) = e^z');

% Export for LaTeX
exportgraphics(gcf, 'SpecimenA_3DModularSurface.pdf', 'ContentType', 'vector')