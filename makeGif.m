function complete = makeGif(x_nodes,y_nodes,sol_vec,times)

h = figure;
axis tight manual % this ensures that getframe() returns a consistent size
filename = 'testAnimated.gif';

for n = 1:0.5:5 % for each time...
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