package alg;

import java.util.InputMismatchException;
import java.util.Scanner;
import java.util.Stack;
 
public class astar
{
    private int numberOfNodes;
    private Stack<Integer> stack;
    public int T, tnow;
    public int time_windows[][];
    public int adjacency_matrix[][];
   
    public int time, cost;
    
    public void setTime(int time)
    {
    	this.time = time;
    }
    
    public void setCost(int cost)
    {
    	this.cost = cost;
    }
    public astar()
    {
        stack = new Stack<Integer>();
        
        //initial data
        
        int adjacency_matrix[][] = new int[1][1];
        adjacency_matrix[1][1]=time;//--> set according to the from-to time
        int time_windows[][]= new int[1][1];
        time_windows[1][1] = 0;
        time_windows[1][2] = 1040;
        T = 540; // starting time;
        //call the dijkstra
        System.out.println("Testing entering from jsp");
        tsp(adjacency_matrix,time_windows, T);
    }
    /*public static void main(String... arg)
    {
        int number_of_nodes;
        Scanner scanner = null;
        try
        {
            System.out.println("Enter the number of nodes in the graph");
            scanner = new Scanner(System.in);    // 노드 입력하려고 하는 것
            number_of_nodes = scanner.nextInt();   
            int adjacency_matrix[][] = new int[number_of_nodes + 1][number_of_nodes + 1];
            System.out.println("Enter Departure Time in your schedule");
            int T = scanner.nextInt();
            int time_windows[][]= new int[number_of_nodes+1][2+1];     // size...
            System.out.println("Enter the time windows");
        
            for (int x = 1; x <= number_of_nodes; x++)
            {
                  
                for (int y = 1; y <= 2; y++)
                {
                   time_windows[x][y] = scanner.nextInt();
                }
           
            }   for (int x = 1; x <= number_of_nodes; x++)
            {
                  
                for (int y = 1; y <= 2; y++)
                {
                   System.out.print(time_windows[x][y]) ;
                   
                }
                System.out.println();     
            }

            
         
            System.out.println("Enter the adjacency matrix");
            
            for (int i = 1; i <= number_of_nodes; i++)
            {
                for (int j = 1; j <= number_of_nodes; j++)
                {
                    adjacency_matrix[i][j] = scanner.nextInt();
                }
            }
               for (int i = 1; i <= number_of_nodes; i++)
              {
                for (int j = 1; j <= number_of_nodes; j++)
                {
                    if (adjacency_matrix[i][j] == 1 && adjacency_matrix[j][i] == 0)
                    {
                        adjacency_matrix[j][i] = 1;          // 돌아가지 않기 위한 식.( 갔다가 돌아올 수도 있음)
                    }
                }
            }                      // matrix 입력 값
            
            System.out.println("The citys are visited as follows");
           
    
            astar travel = new astar();
            travel.tsp(adjacency_matrix,time_windows, T);
      
            }
         catch (InputMismatchException inputMismatch)
         {
             System.out.println("Wrong Input format");   // 숫자가 아닌 다른 값을 입력하면, 프로그램이 정지 됨.
         }
        scanner.close();
    }        */     
 
    public void tsp(int adjacencyMatrix[][], int timewindow[][], int tnow)
    {
       this.time_windows = timewindow;
       this.tnow = tnow;
        numberOfNodes = adjacencyMatrix[1].length - 1;
        
        int[] visited = new int[numberOfNodes + 1];
        visited[1] = 1;
        stack.push(1);
        int element, dst = 0, i;
        int min = Integer.MAX_VALUE;
        int Sum =-(adjacencyMatrix[numberOfNodes][numberOfNodes]) , t, S;
        boolean minFlag = false;
        System.out.print(1 + "\t");
        
        while (!stack.isEmpty())
        {   
            element = stack.peek();
            i = 1;
            min = Integer.MAX_VALUE;
            while (i <= numberOfNodes)
            {                       
               /* System.out.println("adj : "+adjacencyMatrix[element][i]);
                System.out.println("tnow : "+tnow);
                System.out.println("timewindow1: "+time_windows[i][1]);
                System.out.println("timewindow2: "+time_windows[i][2]);*/
                if (adjacencyMatrix[element][i] > 1 && tnow >= time_windows[i][1] && tnow <= time_windows[i][2] && visited[i] == 0 )
                {
                    if (min > (adjacencyMatrix[element][i]+adjacencyMatrix[i][numberOfNodes]))
                    {
                        min = (adjacencyMatrix[element][i]+adjacencyMatrix[i][numberOfNodes]);
                        dst = i;
                        minFlag = true;

                        
                    } 

                }       // 1번 노드로부터 7번 노드까지 갈 때, 가장 적은 값으로 적은 edge를 선택.
               
                i++;
                
            } 
            if (minFlag)
            {   int Min=min-adjacencyMatrix[dst][numberOfNodes];
                visited[dst] = 1;
                stack.push(dst);
                System.out.print(dst + "\t");
                t= Min + tnow;
                S = Min + Sum;
                tnow = t;
                Sum = S;
                minFlag = false;
                continue;
                // sum 
            } 
            stack.pop();   //stack을 없애는 것 
        } 
        System.out.print("\n");
        System.out.print("\n");
        System.out.print("Total distance is : ");
        System.out.print(Sum);

    }
    
  
}