#include<stdio.h>
#include<stdlib.h>
#include<sys/wait.h>
#include<unistd.h>

void waitExample()
{
   int stat;
   
   if(fork()==0)
      exit(1);
   else
       wait(&stat);
   if (WIFEXITED(stat))
       printf("Exit status: %d \n",WEXITSTATUS(stat));
   else if (WIFSIGNALED(stat))
       psignal(WTERMSIG(stat),"Exit signal");
                   
}

//Driver code
int main()
{
  waitExample();
  return 0;
}                   
