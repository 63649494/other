#include<stdio.h>
#include<malloc.h>
#include<stdlib.h>  //����������Ŀ�
#define N 512
#define T 50
typedef struct {
    int PID;    //����ID
    int Status;     //����״̬�����о���1�͵ȴ�0
    int priority;   //�������ȼ���һ����5���ȼ�����[1��5]�����
    int Time_Slice; //��������ʱ��Ƭ���ӣ�0��200�������
    }PCB_Node;

typedef struct {
    PCB_Node *Node;     //������
    int rear;           //��β
    int front;          //��ͷ
    }PQueue;

void ShowN(PCB_Node *p){        //������̵���Ϣ
    printf("�˽��̵�PIDΪ%d\n",p->PID);
    printf("�˽��̵ĵ�ǰ״̬Ϊ%d\n",p->Status);
    printf("�˽��̵����ȼ�Ϊ%d\n",p->priority);
    printf("�˽��̵ĵ�ǰ����ʱ��ƬΪ%d\n",p->Time_Slice);
    }

PCB_Node CreateN(int n)        //����һ������
{
    PCB_Node p;
    p.PID=n;
    p.Status=1;
    p.priority=rand()%5+1;
    p.Time_Slice=rand()%200+1;
    ShowN(&p);
    return p;
}

void InitQueue(PQueue &Q){      //��ʼ������
    Q.Node = (PCB_Node*)malloc(N*sizeof(PCB_Node));
    if(!Q.Node) return;
    Q.front=Q.rear=0;
    }

void AddQ(PQueue &PtrQ,PCB_Node item){          //���½��̼����β
    if((PtrQ.rear+1)%N==PtrQ.front)
        {
            printf("��������\n");
            return;
            }
    PtrQ.rear=(PtrQ.rear+1)%N;
    PtrQ.Node[PtrQ.rear]=item;
    }

int QueueLength(PQueue Q){          //���ض��еĳ���
    return (Q.rear-Q.front+N)%N;
    }

void DeQueue(PQueue &Q,PCB_Node &e){        //����һ�����̳���
    if(Q.front == Q.rear){
        printf("���д��󣬶���Ϊ��!\n");
        return;
    }
    e=Q.Node[Q.front];
    Q.front=(Q.front+1)%N;
    }

void run(PQueue &wait,PCB_Node p){          //���н��ܵĽ���
    printf("PIDΪ%d�Ľ��̿�ʼ����\n",p.PID);
    int i=rand()%100;
    if(i<3){                               //3%���ʷ����쳣
        AddQ(wait,p);                       //����ȴ�����
        printf("PIDΪ%d�Ľ��̽���ȴ�\n",p.PID);
    }
    if(p.Time_Slice>T){                     //�����������ʱ��Ƭ����Ԥ���50
        p.Time_Slice=p.Time_Slice-T;        //ԭ��ʱ��Ƭ��ȥ50
        AddQ(wait,p);                       //����ȴ�����
        printf("PIDΪ%d�Ľ��̽���ȴ�\n",p.PID);
        }
    else printf("PIDΪ%d�Ľ����������\n",p.PID);       //��������ʱ��ƬС��50��ֱ��ִ�����
    }

int main(){
    PQueue ready;       //������������
    InitQueue(ready);   //��ʼ����������
    for(int i=1;i<=N;i++){       //����N�����̣��������������
        PCB_Node a=CreateN(i);
        AddQ(ready,a);
        }
    PQueue wait;        //�����ȴ�����
    InitQueue(wait);    //��ʼ���ȴ�����
    for(int j=0;QueueLength(ready)!=0||QueueLength(wait)!=0;j++){     //�жϾ������к͵ȴ������Ƿ���δִ�еĽ��̣��������У�����������
        if(QueueLength(wait)==0){       //�жϵȴ������Ƿ��н���
            PCB_Node e;                 //�ȴ�������û�н���
            DeQueue(ready,e);           //���������еĵ�һ�����̳���
            run(wait,e);                //���н���
            }
        else {
                PCB_Node e;             //�ȴ��������н��̣���ִ�еȴ������еĽ���
                DeQueue(wait,e);        //���ȴ����еĵ�һ�����̳���
                run(wait,e);            //���н���
            }
        }
    return 0;
    }
