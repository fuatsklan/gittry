clc
clear all

x(1)=0;
y(1)=0;
radius_array(1)=0;
x_total(1)=0;
y_total(1)=0;
step_size = 10;
for i = 1:10000
    
        x = [];
        y = [];
        radius_array = [];
        x(1)=0;
        y(1)=0;
        radius_array(1)=0;
        x_c = 0;
        y_c = 0;
        c = 60;
        for j=1:c
           

            theta = floor(360 * rand);
            x_c = x_c + cosd(theta);
            x = [x x_c];
            y_c = y_c + sind(theta);
            y = [y  y_c];
            radius = sqrt(x_c^2+y_c^2);
            radius_array = [radius_array radius];
            
            if radius_array(end)>sqrt(2)
                radius_array(end) = [];
                x(end) = [];
                y(end) = [];
                
            end
            
            
            

                
        end
        
            x_total = [x_total x(end)];
            y_total = [y_total y(end)];
        

end


%%Probabilities found by calculating number of particles in between
%%circles.
counter = zeros(1,30);

for i = 1:30
    
    for j = 1:1000
        if (x_total(j)^2 + y_total(j)^2) <= (sqrt(2)/30*i)^2
        
         counter(i) = counter(i) + 1;
        
        end
    end
end

r_include = zeros(1,30);

r_include(1) = counter(1);

for i = 2:30
    
    r_include(i) = counter(i) - counter(i-1);

end



probabilities = r_include /1000;
rad = [];
for i=1:30
    a = i*sqrt(2)/30;
    rad = [rad a];
end
figure
plot(rad,probabilities);

hold on
    
plot(x_total,y_total)
