#include<stdio.h>
#include<malloc.h>
#include<stdlib.h>  //包含随机数的库
#define N 512
typedef struct PCB_Node{
    int PID;    //程序ID
    int Status;     //进程状态，运行就绪1和等待0,运行为2
    int priority;   //进程优先级，一共有5个等级，从[1，5]间分配
    int Time_Slice; //进程所需时间片，从（0，200）间分配
    struct PCB_Node *next;
    }PCB_Node,*PCB_List;

void ShowN(PCB_Node *p){
    printf("--此进程的PID为%d\n",p->PID);
    printf("--此进程的当前状态为%d\n",p->Status);
    printf("--此进程的优先级为%d\n",p->priority);
    printf("--此进程的当前所需时间片为%d\n",p->Time_Slice);
    }

PCB_List CreateN(int n)          //创建一个节点
{
    PCB_List p;
    p=(PCB_List)malloc(sizeof(PCB_Node));
    p->PID=n;
    p->Status=rand()%2;
    p->priority=rand()%5+1;
    p->Time_Slice=rand()%200+1;
    p->next=NULL;
    ShowN(p);
    return p;
}


PCB_List CreateList(){       //生成新链表
    PCB_List head;
    head=(PCB_List)malloc(sizeof(PCB_Node));
    head->next=NULL;
    return head;
    }

void Sort_Insert(PCB_List &L,PCB_List p){     //按优先度插入链表
    if(L->next==NULL){
        L->next=p;
        }
    else if(L->next!=NULL){
        //printf("%d %d\n",p->priority,L->next->priority);
        if(p->priority>=L->next->priority){
            p->next=L->next;
            L->next=p;
            }
        else Sort_Insert(L->next,p);
    }


}


void Traversal(PCB_List head)
{
    int i=1;
    PCB_List p = head->next;                            //将头节点的指针给予临时节点p
    while(NULL != p)                                //节点p不为空，循环
    {
        printf("%4d ",p->PID);
        p = p->next;
        if(i%10==0)
            printf("\n");
        i++;
    }
    printf("\n");
    return ;
}

int main(){
    int i;
    PCB_List ready,wait,run;
    ready=CreateList();      //创建就绪链表
    wait=CreateList();       //创建等待链表
    run=CreateList();        //创建运行链表
    PCB_List r;
    r=CreateN(i=0);
    r->Status=2;
    Sort_Insert(run,r);     //使第一个进程运行
    printf("*此进程开始运行\n");
    for(i=1;i<N;i++){
        PCB_List a;
        a=CreateN(i);
        if(a->Status==1){
            Sort_Insert(ready,a);       //将状态为1就绪的进程按优先级插入就绪队列
            printf("*此进程进入就绪队列\n");
            }
        else {
            Sort_Insert(wait,a);        //将状态为0等待的进程按优先级插入等待队列
            printf("*此进程进入等待队列\n");
        }
        }
    printf("\n\n就绪队列中的进程的PID为：\n");     //遍历3个队列
    Traversal(ready);
    printf("等待队列中的进程的PID为：\n");
    Traversal(wait);
    printf("运行中的进程的PID为：");
    Traversal(run);
    }
