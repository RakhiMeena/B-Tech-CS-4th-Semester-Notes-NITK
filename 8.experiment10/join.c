#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>
int n = 10;
int arr[10] = {2,3,8,4,6,5,1,9,0,7};

void swap(int* xp, int* yp){
    int temp = *xp;
    *xp = *yp;
    *yp = temp;
}
void printArray(){
    int i;
    for (i = 0; i < n; i++)
        printf("%d ", arr[i]);
    printf("\n");
}
void* accendingSort(void* arg){
    int i, j, min_idx,temp = *(int *)arg;
    for (i = 0; i < n - 1; i++) {
        min_idx = i;
        for (j = i + 1; j < n; j++)
            if (arr[j] < arr[min_idx])
                min_idx = j;
	temp = arr[min_idx];
        arr[min_idx]=arr[i];
	arr[i] = temp;
    }
    printf("Array in accending order : ");
    printArray();
    return 0;
}
void* decendingSort(void* arg) {
    int i,j,temp = *(int *)arg;
    for(i=0;i<n;i++)
	for(j=i+1;j<n;j++)
	    if(arr[i]< arr[j]){
		temp=arr[i];
		arr[i]=arr[j];
		arr[j]=temp;
	    }
    printf("Array in decending order : ");
    printArray();
    return 0;
}

int main(int argc, char* argv[]) {
    pthread_t th1,th2;
    int i = n;
    printf("Original Array : ");
    printArray();
    if (pthread_create(&th1, NULL, &accendingSort, &i) != 0) {
        perror("Failed to create thread 1");
    }
    if (pthread_create(&th2, NULL, &decendingSort, &i) != 0) {
        perror("Failed to create thread 2");
    }
    if (pthread_join(th1, NULL) != 0) {
        perror("Failed to join thread 1");
    }
    if (pthread_join(th2, NULL) != 0) {
        perror("Failed to join thread 2");
    }
    return 0;
}
