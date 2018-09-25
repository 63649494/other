#include<stdio.h>
#include<malloc.h>
#include<stdlib.h>  //包含随机数的库
#define N 512
#define T 50
typedef struct {
    int PID;    //程序ID
    int Status;     //进程状态，运行就绪1和等待0
    int priority;   //进程优先级，一共有5个等级，从[1，5]间分配
    int Time_Slice; //进程所需时间片，从（0，200）间分配
    }PCB_Node;

typedef struct {
    PCB_Node *Node;     //进程组
    int rear;           //队尾
    int front;          //队头
    }PQueue;

void ShowN(PCB_Node *p){        //输出进程的信息
    printf("此进程的PID为%d\n",p->PID);
    printf("此进程的当前状态为%d\n",p->Status);
    printf("此进程的优先级为%d\n",p->priority);
    printf("此进程的当前所需时间片为%d\n",p->Time_Slice);
    }

PCB_Node CreateN(int n)        //创建一个进程
{
    PCB_Node p;
    p.PID=n;
    p.Status=1;
    p.priority=rand()%5+1;
    p.Time_Slice=rand()%200+1;
    ShowN(&p);
    return p;
}

void InitQueue(PQueue &Q){      //初始化队列
    Q.Node = (PCB_Node*)malloc(N*sizeof(PCB_Node));
    if(!Q.Node) return;
    Q.front=Q.rear=0;
    }

void AddQ(PQueue &PtrQ,PCB_Node item){          //将新进程加入队尾
    if((PtrQ.rear+1)%N==PtrQ.front)
        {
            printf("队列已满\n");
            return;
            }
    PtrQ.rear=(PtrQ.rear+1)%N;
    PtrQ.Node[PtrQ.rear]=item;
    }

int QueueLength(PQueue Q){          //返回队列的长度
    return (Q.rear-Q.front+N)%N;
    }

void DeQueue(PQueue &Q,PCB_Node &e){        //将第一个进程出队
    if(Q.front == Q.rear){
        printf("出列错误，队列为空!\n");
        return;
    }
    e=Q.Node[Q.front];
    Q.front=(Q.front+1)%N;
    }

void run(PQueue &wait,PCB_Node p){          //运行接受的进程
    printf("PID为%d的进程开始运行\n",p.PID);
    int i=rand()%100;
    if(i<3){                               //3%几率发生异常
        AddQ(wait,p);                       //加入等待队列
        printf("PID为%d的进程进入等待\n",p.PID);
    }
    if(p.Time_Slice>T){                     //若进程所需的时间片大于预设的50
        p.Time_Slice=p.Time_Slice-T;        //原有时间片减去50
        AddQ(wait,p);                       //加入等待队列
        printf("PID为%d的进程进入等待\n",p.PID);
        }
    else printf("PID为%d的进程运行完毕\n",p.PID);       //进程所需时间片小于50，直接执行完毕
    }

int main(){
    PQueue ready;       //创建就绪队列
    InitQueue(ready);   //初始化就绪队列
    for(int i=1;i<=N;i++){       //创建N个进程，并加入就绪队列
        PCB_Node a=CreateN(i);
        AddQ(ready,a);
        }
    PQueue wait;        //创建等待队列
    InitQueue(wait);    //初始化等待队列
    for(int j=0;QueueLength(ready)!=0||QueueLength(wait)!=0;j++){     //判断就绪队列和等待队列是否还有未执行的进程，有则运行，无则程序结束
        if(QueueLength(wait)==0){       //判断等待队列是否有进程
            PCB_Node e;                 //等待队列中没有进程
            DeQueue(ready,e);           //将就绪队列的第一个进程出队
            run(wait,e);                //运行进程
            }
        else {
                PCB_Node e;             //等待队列中有进程，先执行等待队列中的进程
                DeQueue(wait,e);        //将等待队列的第一个进程出队
                run(wait,e);            //运行进程
            }
        }
    return 0;
    }
