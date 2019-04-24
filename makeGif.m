function completed = makeGif(x_nodes,y_nodes,T_at_ts,times)

% initiallize for plotting
font_size = 13;
line_size = 15;
line_width = 2;

%levels = 100;
levels = [370: 0.1 :384];
colormap_setting = 'jet';


% Initialize some stuff
h = figure;
axis tight manual % this ensures that getframe() returns a consistent size
filename = 'testAnimated.gif';

% Initialize stuff for graph making
x_lin = linspace(0,1,x_nodes); % 0 to 1 with x_nodes nodes
y_lin = linspace(0,2,y_nodes); % 0 to 2 with y_nodes nodes
[soln_X,soln_Y] = meshgrid(x_lin,y_lin); % X and Y points used in plotting

for n = 1:100:size(times,2) % second dimension of times matrix
    % gets solution vector from matrix, at a specific time
    soln_vec = T_at_ts(:,n);
    
    % turns the solution vector into a 2D matrix
    % need to do this for graphing purposes
    T_at_t_mat = vector2matrix(soln_vec,x_nodes);
    
    
    %need to fix
    contourf(soln_X,soln_Y,T_at_t_mat,levels,'edgecolor','none');
    colormap(colormap_setting);
    caxis([370,384]);
    c = colorbar;
    %c.Label.String = 'Temperature (K)';
    title('Temperature Distribution (K)','fontsize',font_size,'Interpreter','latex')
    xlabel('x (cm)','fontsize',font_size,'Interpreter','latex');
    ylabel('y (cm)','fontsize',font_size,'Interpreter','latex');
    pbaspect([1 2 1]);
    
    
    
    % old
    %x = 0:0.01:1;
    %y = x.^n;
    %plot(x,y) 
    
    
    % Gif magic ???
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
  

completed = true;
end