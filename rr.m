function rr1()
n=5;                %no of processes					
btime=[2 4 3 1 3];	%burst time		
q=2;                %quantum time
tatime=zeros(1,n);	%turn around time
wtime=zeros(1,n);   %waiting time
rtime=btime;        %intially remaining time= waiting time
b=0;
t=0;
flag=0;             %this is set if process has burst time left after quantum time is completed
for i=1:1:n         %running the processes for 1 quantum 
    if(rtime(i)>=q)
        fprintf('P%d\n',i);
        for j=1:1:n
            if(j==i)
                rtime(i)=rtime(i)-q;    %setting the remaining time if it is the process scheduled
            else if(rtime(j)>0)
                    wtime(j)=wtime(j)+q;    %incrementing wait time if it is not the process scheduled
                end
            end
        end
    else if(rtime(i)>0)             
            fprintf('P%d\n',i);
            for j=1:1:n
              if(j==i)
                rtime(i)=0;                 %as the remaining time is less than quantum it will run the process and end it
              else if(rtime(j)>0)
                    wtime(j)=wtime(j)+rtime(i);     %incrementing wait time if it is not the process scheduled
                  end 
              end
            end
        end
    end
end
for i=1:1:n
    if(rtime(i)>0)      %if remaining time is left set flag
        flag=1;
    end
end
while(flag==1)          %if flag is set run the above process again
    flag=0;
    for i=1:1:n
        if(rtime(i)>=q)
            fprintf('P%d\n',i);
            for j=1:1:n
                if(j==i)
                    rtime(i)=rtime(i)-q;
                else if(rtime(j)>0)
                        wtime(j)=wtime(j)+q;
                    end
                end
            end
        else if(rtime(i)>0)
                fprintf('P%d\n',i);
                for j=1:1:n
                    if(j==i)
                        rtime(i)=0;
                    else if(rtime(j)>0)
                            wtime(j)=wtime(j)+rtime(i);
                        end 
                    end
                end
            end
        end
    end
    for i=1:1:n
        if(rtime(i)>0)
            flag=1;
        end
    end
end
for i=1:1:n
    tatime(i)=wtime(i)+btime(i);    %calculating turn around time for each process by adding waiting time and burst time
end
disp('Process   Burst time  Waiting time    Turn Around time'); %displaying the final values
for i=1:1:n
    fprintf('P%d\t\t\t%d\t\t\t%d\t\t\t\t%d\n',(i+1),btime(i),wtime(i),tatime(i));
    b=b+wtime(i);
    t=t+tatime(i);
end
fprintf('Average waiting time: %f\n',(b/n));
fprintf('Average turn around time: %f\n',(t/n));
    
