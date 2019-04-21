function complete = makeGif(x_nodes,y_nodes,sol_vec,times)

% Initialize some stuff
h = figure;
axis tight manual % this ensures that getframe() returns a consistent size
filename = 'testAnimated.gif';

% Initialize stuff for graph making
x_lin = linspace(0,1,x_nodes); % 0 to 1 with x_nodes nodes
y_lin = linspace(0,2,y_nodes); % 0 to 2 with y_nodes nodes
[soln_X,soln_Y] = meshgrid(x_lin,y_lin); % X and Y points used in plotting

% need to do at each time step
% rn, thw sol_vec has each time step.
% need to separate it into the soln for one time instance
% so that I can use my vector2matrix function
T_at_t_mat = vector2matrix(T_at_t,x_nodes); % turns the solution vector into a 2D matrix


for time = 1:0.5:5 % for each time...
    % Draw plot for y = x.^n
    % Make the plot for that time...
    x = 0:0.01:1;
    y = x.^n;
    plot(x,y) 
    
    
    
    drawnow
      % Capture the plot as an image 
      frame = getframe(h); 
      im = frame2im(frame); 
      [imind,cm] = rgb2ind(im,256); 
      % Write to the GIF File 
      if n == 1 
          imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
      else 
          imwrite(imind,cm,filename,'gif','WriteMode','append'); 
      end 
end
  

complete = true;
end