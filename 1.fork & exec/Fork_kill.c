#include<stdio.h>
#include<unistd.h>
#include<signal.h>

void catch_int(int sig_num) {
  
   signal(SIGINT,catch_int);
   printf("Don't do that \n");
   fflush(stdout);
   
}

int main(int argc, char * argv[]) {

     printf("PID OF THIS PROCESS IS %d ",getpid());
     signal(SIGINT,catch_int);
     for( ; ; )
         pause() ;
  return 0;
 }        
 
// kill -STOP pidOfProcess
 //kill -CONT pidOfProcess
 //kill -TERM pidOfProcess
 //kill -CONT pidOfProcess
 // bash: kill:(pidOfProcess) - No such process
