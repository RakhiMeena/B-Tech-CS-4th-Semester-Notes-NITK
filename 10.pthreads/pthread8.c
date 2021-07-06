#include<pthread.h>
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<unistd.h>

long long int sum=0;
pthread_mutex_t lock; //mutex variable defined

void *runner1(void *param);
void *runner2(void *param);

int main(int argc, char *argv[])
{
   pthread_t tid[2];
   pthread_attr_t attr;
   if(argc !=2 )
   {
      fprintf(stderr, "usage : a.out<integer value>\n");
      return -1;
    }
    if(atoi(argv[1])<0)
    {
      fprintf(stderr, "%d must be >=0\n", atoi(argv[1]));
      return -1;
    }
    if (pthread_mutex_init(&lock, NULL) !=0) { //same mutex initialised
      printf("\n mutex init has failed\n");
      return 1;
    
    pthread_attr_init(&attr);
    pthread_create(&tid[0],&attr,runner1,argv[1]);
    pthread_create(&tid[1],&attr,runner2,argv[1]);
    
    pthread_join(tid[0],NULL);
    pthread_join(tid[1],NULL);
    
    printf("sum= %lld\n",sum);
   }
   void *runner1(void *param)
   {
   pthread_mutex_lock(&lock); //mutex locked
   int i, upper =atoi(param);
   for(i=1; i<=upper/2;i++)
       sum+=i;
 pthread_mutex_unlock(&lock); //mutex unlocked
 pthread_exit(0);
 }
 void *runner2(void *param)
 { 
   pthread_mutex_lock(&lock); //mutex locked again
    int i, upper=atoi(param);
       for(i=upper/2+1;i<=upper;i++)
         sum+=i;
 
 pthread_mutex_unlock(&lock); //mutex unlocked
 
 pthread_exit(0);
 } 
 }
