#include<stdio.h>
#include<sys/wait.h>
#include<unistd.h>

int main()
{
  if(fork()==0)
     printf("HELLO CHILD \n");
  else {
     printf("HELLO PARENT \n");
     wait(NULL);
     printf("Child Process has terminated \n ");
     }
     
  printf("End \n");
  return 0;
  }   
     
