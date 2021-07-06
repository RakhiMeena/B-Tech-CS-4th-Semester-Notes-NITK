#include<bits/stdc++.h>
#include<vector>

using namespace std;

//for single instance
int main()
{
	int res,pro,allo_res,x,y,req_res;
	
	cout<<"Enter the number of resources"<<endl;
	cin>>res;
	
	cout<<"Enter the number of processes"<<endl;
	cin>>pro;
	
	int res_all[pro][res] = {0};
	
	for(int i=0;i<pro;i++)
	{
		for(int j=0;j<res;j++)
		{
			res_all[i][j] = 0;
		}
	}
	
	cout<<"Enter the number of resources allocated"<<endl;
	cin>>allo_res;
	
	cout<<"Enter the resource number and process number"<<endl;
	for(int i=0;i<allo_res;i++)
	{
		cin>>x>>y;
		res_all[y][x] = 1;//res x is allocated to pro y
	}
	
	
	cout<<"Enter the number of requests"<<endl;
	cin>>req_res;
	
	cout<<"Enter the resource number and process number"<<endl;
	for(int i=0;i<req_res;i++)
	{
		cin>>x>>y;
		res_all[y][x] = 2;//res x is requested by pro y
	}
/*	
	cout<<"The following graph is "<<endl;
	cout<<"  ";
	for(int i=0;i<res;i++)
		cout<<"R"<<i<<" " ;
	cout<<endl;	
	for(int i=0;i<pro;i++)
	{
		cout<<"P"<<i<<" ";
		for(int j=0;j<res;j++)
		{
			cout<<res_all[i][j]<<" ";
		}
		cout<<endl;
	}*/
	
	int wait_for[pro][pro];
	
	
	for(int i=0;i<pro;i++)
	{
		for(int j=0;j<pro;j++)
		{
			wait_for[i][j] = 0;
			
		}
	}
	int store_one ;
	for(int j=0;j<res;j++)
	{
		vector<int> store_two;
		for(int i=0;i<pro;i++)
		{
			if(res_all[i][j]==2)
			{
				store_two.push_back(i);
			}
			
			if(res_all[i][j]==1)
			{
				store_one = i;
			}
			
		}
		
		for(int k=0;k<store_two.size();k++)
		{
			wait_for[store_two[k]][store_one] = 1;
		}
		
	}
	
	cout<<"The following graph is "<<endl;
	cout<<"   ";
	for(int i=0;i<pro;i++)
		cout<<"P"<<i<<" " ;
	cout<<endl;	
	for(int i=0;i<pro;i++)
	{
		cout<<"P"<<i<<" ";
		for(int j=0;j<pro;j++)
		{
			cout<<wait_for[i][j]<<"  ";
		}
		cout<<endl;
	}
	
}
