#include<bits/stdc++.h>
#include<time.h>
#include<limits>
using namespace std;

// process class to store process details
class process
{
	public:
		int pno;
		int size;
		int blockno;
	public:
		process()
		{
			cout<<"Enter the process number: ";
			cin>>pno;
			cout<<"Enter the size of the process: ";
			cin>>size;
		}
		void display()
		{
			cout<<pno<<" \t "<<size;
			if(blockno == -1){
				cout<<"\tNot allocated"<<endl;
			} else {
				cout<<"  \tBlock-"<<blockno<<endl;
			}
		}
};

// to display the disk space status
void displayDisk(int memory[],int n,vector<process> processes)
{
	if(processes.size()!=0)
	cout<<"P.No.\tSize\tBlockNo\n";
	for(int i=0;i<processes.size();i++)
	{
		process a=processes.at(i);
		a.display();
	}
	cout<<endl;
	for(int i=0;i<n;i++)
	{
		if(i%60==0 && i!=0)
			cout<<endl;
		cout<<memory[i]<<" ";
	}
	cout<<endl;
}

void display_b(int n, int block[][4]) {
	printf("\nBlock.No \tSize\n");
	for(int i=0; i<n; i++){
		printf("Block-%d \t%d\n", block[i][3], block[i][0]);
	}
}

int search(int n, int block[][4], int val){
	int m;
	for(int j=0;j<n;j++){
		if(val <= block[j][0]){
			m = j;
			return m;
		}
	}
	return -1;
}

int blocksize_allocation(int n, int blocksize[][4], int temp){
	srand(time(NULL));
	int m =0, max = n;
	for(int i=0; i<temp; i++){
		if(i==0) {
			blocksize[i][0] = rand()%551 + 50;
			max -= blocksize[i][0];
			blocksize[i][1] = 0;
			blocksize[i][2] = blocksize[i][0] - 1;
			m += blocksize[i][0];
			blocksize[i][3] = i+1;
		} else {
			blocksize[i][0] = rand()%551 + 50;
			if(blocksize[i][0] <= max) {
				max -= blocksize[i][0];
				blocksize[i][1] = m;
				blocksize[i][2] = (m + blocksize[i][0]) - 1;
				m += blocksize[i][0];
				blocksize[i][3] = i+1;
				if(max == 0){
					temp = i+1;
				}
			} else {
				if(max > 200){
					if(i==temp-1){
						blocksize[i][0] = max;
					} else {
						blocksize[i][0] = rand()%(max-49) + 50;
					}
				} else {
					blocksize[i][0] = max;
					temp = i+1;
				}
				blocksize[i][1] = m;
				blocksize[i][2] = (m + blocksize[i][0]) - 1;
				m += blocksize[i][0];
				blocksize[i][3] = i+1;
				max -= blocksize[i][0];
			}
		}
	}
	return temp;
}

//function to store each process.
void contiguous(int memory[],int n,int temp, int blocksize[][4], vector<process> &processes)
{
	int len=0;
	process p;
	
	//allocate block to process-size
	int i,index;
	index = search(temp, blocksize, p.size);
	i = index;
	if(i != -1){
		int l = blocksize[i][1] + p.size;
		for(int j=blocksize[i][1]; j<l; j++){
			if(memory[j] == 2) {
				l++;
			} else {
				memory[j] = 1;
			}
		}
		p.blockno = blocksize[i][3];
		blocksize[i][0] -= p.size;
		blocksize[i][1] = p.size;
		cout<<"Process stored successfully.\n";
		processes.push_back(p);
	} else {
		cout<<"\nThere was not enough space in disk. Can't store the process!!!!!\n";
		p.blockno = -1;
		processes.push_back(p);
	}
	
	char ans;
	cout<<"\nWant to store more processes?\n";
	cout<<"Enter your choice ('y' for yes and 'n' for no) : ";
	cin>>ans;
	if(ans=='y')
		contiguous(memory,n,temp,blocksize,processes);
	else 
		return;
}

void fragmentation(int block[][4], int n) {
	int i, internalF = 0, externalF = 0;
	for(i=0;i<n;i++) {
		if(block[i][0] >= (block[i][2] - block[i][1])) {
			externalF += block[i][0];
		}
		if(block[i][0] < (block[i][2] - block[i][1])) {
			internalF += block[i][0];
		}
	}
	
	printf("\nInternal fragmentation : %d", internalF);
	printf("\nExternal fragmentation : %d", externalF);	
}

int main()
{
	srand(time(NULL));
	int mem[3000]={0};
	int start_block=(rand()%100)+(rand()%50)+1;
	int end_block=150+(rand()%50);
	int length;
	
	//allocating random blocks of memory to operating system processes
	for(int i=start_block;i<end_block;i++)
		mem[i]=2;
	
	vector<process> processes;
	int temp = rand()%11 + 5;
	int blocksize[temp][4];
	temp = blocksize_allocation(3000, blocksize, temp);
	
	//system processes storage allocation
	for(int k=0;k<temp;k++){
		length = end_block - start_block;
		if(blocksize[k][1]<start_block) {
			if(length <= (blocksize[k][2] - start_block)) {
				blocksize[k][0] -= length;
				break;
			} else {
				blocksize[k][0] -= length;
				start_block = blocksize[k][2] + 1;
			}
		}
	}
	cout<<"Memory before storage allocation.\n";
	displayDisk(mem,3000,processes);
	display_b(temp, blocksize);
	contiguous(mem,3000,temp,blocksize,processes);
	cout<<"\nMemory after storage allocation.\n";
	displayDisk(mem,3000,processes);
	
	// fragmentation count
	fragmentation(blocksize, temp);
	return 0;
}
