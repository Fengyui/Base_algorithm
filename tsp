# 回溯法求解旅行商问题
import math
import time
start_time = time.time()
def tsp_train(cost, n, s):
    global nowcost, bestcost#设置全局变量
    #递归出口
    if(s == n):
        if (cost[x[n-1]][x[0]] != 0 and (nowcost +cost[x[n-1]][x[0]]<bestcost)):
            print('best way:', x)
            bestcost = nowcost + cost[x[n-1]][x[0]]
            print('bestcost', bestcost)
            
    else:
        for i in range(s, n): 
            x[i], x[s] = x[s], x[i]    # 交换
            # 如果下一节点能够通过,而且求得的值小于当前最佳值，则递归调用
            if (cost[x[i-1]][x[i]] != 0 and nowcost+cost[x[i-1]][i] < bestcost):     
                nowcost += cost[x[s - 1]][x[s]]    # 将花费加入
                tsp_train(cost, n, s+1)
                nowcost -= cost[x[s-1]][x[s]]    # 回溯上去还需要减去
            x[i], x[s] = x[s], x[i]    # 再交换回来
            
    
if __name__ == "__main__":
    n = 4
    x = [0, 1, 2, 3]##有几个城市

# 定义每个城市到另一个城市的所需要的花费的数组形式
cost = [
    [0, 8, 6, 7],
    [80, 0, 3, 1],
    [4, 9, 0 , math.inf],
    [20, 6, 2, 0]
]
bestway = ''
bestcost = math.inf #设置初始距离为无穷大
nowcost = 0    # 全局变量，现在的花费


tsp_train(cost, n, 1)

end_time = time.time()
print("所需的总时间为："+str(end_time-start_time))
