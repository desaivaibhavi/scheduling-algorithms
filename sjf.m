function sjf()
n=4;				%no of processes
ptime=[3 1 3 2 ];   %process time or burst time
process=[1 2 3 4];  %process id
wtime=zeros(1,n);   %waiting time
tatime=zeros(1,n);  %turn around time
total=0;			%total waiting time
total2=0;           %total turn around time
  
for i=1:1:n-1   %sorting the processes in terms of process times
   for j=i+1:1:n
       if(ptime(i)>ptime(j))
           temp=ptime(i);
           ptime(i) = ptime(j);
           ptime(j) = temp;
           temp = process(i);
           process(i) = process(j);
           process(j) = temp;
       end
   end
end
 wtime(1) = 0;
 for i=2:1:n
    wtime(i) = wtime(i-1)+ptime(i-1);   %wait time of a process is sum of wait time of process before it and process time of process before it
    total = total + wtime(i);           %finding total waiting time
end
for i=1:1:n
    tatime(i)=ptime(i)+wtime(i);    %turn around time=burst time +wait time
    total2=total2+tatime(i);                %total turn around time
end
        avg = total/n;                          %finding average time
        avg1 = total2/n;
        fprintf('P_ID\tP_TIME\tW_TIME\tTA_TIME\n');      %display of final values
        for i=1:1:n
            fprintf('%d\t\t%d\t\t%d\t\t%d\n',process(i),ptime(i),wtime(i),tatime(i));
            %fprintf('waiting time is:''%d',wtime(i));
        end
fprintf('Total Waiting Time:%d\n',total);
fprintf('Average Waiting Time:%f\n',avg);
fprintf('Total Turn Around Time:%d\n',total2);
fprintf('Average Turn Around Time:%f\n',avg1);