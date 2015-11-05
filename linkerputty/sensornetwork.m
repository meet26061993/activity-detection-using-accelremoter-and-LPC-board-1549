%close open ports

    clear all;clc;close all;

    delete(instrfindall)

    

    %redundant clear ports

    sens1='com4'; %sensor port

    s1 = serial(sens1);

    

    fclose(s1);

    delete(s1);

    clear s1;

    

    %open all ports
    display('Collecting Samples')

    sens1='com4'; 

    s1 = serial(sens1);

   

    fopen(s1);

    w1=[];x1=[];y1=[];z1=[];

    t=10; %time to run
    
    

    for k=(1:1:4)    

    for m = (1:t) 

    [w1(m) x1(m) y1(m) z1(m)] = strread(fgets(s1));
    
        
    end

   
    A(1,k)=(max(w1)*100)-(min(w1)*100);

      end

    
B=mean(A);
disp(B)

if(B>25 && B<90)
    
    display('Activity detected: Brisk Walking')
    
else if(B>90)
        display('Activity detected: Running')
        
    else if (B<25)
            display('Activity detected: Stationary')
        else
            dis = 1;
    
        end
    end
end

    %close open ports

    fclose(s1);

    delete(s1);

    clear s1;