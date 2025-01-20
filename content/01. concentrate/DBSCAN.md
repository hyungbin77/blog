## Density-based clustering
- Conduct a clustering by considering the density of data points
	- Can find an arbitrary shape of cluster
	- Can remove noise from clustering result 
![[Pasted image 20241211203501.png|500]]
- DBSCAN
	- Most popular density-based clustering algorithm
- Idea
	- Clusters are the collections of data points with high density
	- Density around a noise point is very low
- Purpose
	- Quantify the features of clusters and noise points to find a set of valid clusters

## DBSCAN
### Definition 1 : $\epsilon$- neighborhood of a point
- The $\epsilon$-neighborhood of a point, denoted by $N_{\epsilon}(p)$, is defined by
$$N_{\epsilon}(p) = \{q\in D | dist(p,q) \leq \epsilon \}$$
![[Pasted image 20241211204309.png]]
- ***Naive Apporach*** : require for each point in a cluster that there are at least a minimum
  number(MinPts) of points in an $\epsilon$-neighborhood of that point 
- $\epsilon$ 안에 일정 개수 이상 data가 있으면 군집이 되지 않을까?

- Problem of Naive Approach
	- There are two kinds of points in a cluster
		- Points inside of the cluster (core points)
		- Points on the border of the cluster (border points)
	- An $\epsilon$-neighborhood of a border point contains significantly less points than an 
	  $\epsilon$- neighborhood of a core point
->  즉 바깥쪽 data 같은 경우 항상 적기 때문에 다른 군집, 혹은 이상치로 판단 할 여지가 있음 
 
- Better idea
	- For every point p in a cluster C, there is a point q in C so that p is inside of the $\epsilon$-neighborhood of q (<font color="#b2a2c7">Border points are connected to core point</font>)
	- $N_{\epsilon}(q)$ contains at least MinPts points(<font color="#b2a2c7">Core points = high density</font>)

### Definition 2 : directly density-reachable
- A point p is directly density-reachable from a point q with regard to the parameters $\epsilon$ and MinPts, if 
$$1) \quad p \in N_{\epsilon(q)} \;\quad (\text{reachability})$$
$$2) \quad |N_{\epsilon}(q) \geq MinPts | \;\quad (core \;\; point\;\; condiiton)$$
- Property
	- Directly density-reachable if symmetric for <font color="#548dd4">pairs of core points</font>
	- It is not symmetric if <font color="#548dd4">one core point</font> and <font color="#c3d69b">one border point</font> are involved

![[Pasted image 20241211211019.png]]


### Definition 3 : density-reachable
- A point p is <u>density-reachable</u> from a point q with regard to the parameters $\epsilon$ and MinPts, if there is a chain of points p1,p2,...,$p_{s}$ with $p_1 = q$ and $p_s = p$ such that $p_{i+1}$ is directly density-reachable from $p_1$ for all $| \leq | \leq s-|$ 
![[Pasted image 20241211211730.png]]
$p_1$ 은 $q$ 로부터 directly density-reachable
$p$는 $p_1$ 로부터 directly density-reachable
$p$는 $q$로부터 directly density-reachable??? (X) 그러나 p는 q로부터<font color="#c3d69b"> density reachable</font>

### Definition 4 : density-connected 

- A point p is <u>density-connected</u> to a pint q with regard to the parameters $\epsilon$ and MinPts
  if there is a <font color="#fac08f">point v</font> such that <font color="#fac08f">both p and q are density-reachable from v</font>
- 즉 계속 이어가

### Definition 5 : Cluster

- A cluster with regard to the parameters $\epsilon$ and MinPts is a non-empty subset C of the database D with 
	- (1) For all p,q $\in$ D : If p $\in$ C and q is density-reachable from p with regard to the parameters $\epsilon$ and MinPts, them q $\in$ C (<font color="#d99694">Maximality</font>)
	- (2) For all p,q $\in$ C : The point p is density-connected to q with regard to the parameters $\epsilon$ and MinPts (<font color="#d99694">Connectivity</font>)

### Definition 6: Noise
- Let $C_1,...,C_k$ be the clusters of the database D with regard to the parameters $\epsilon$ and MinPts
- The set of points in the database D not belonging to any cluster $C_1,...,C_k$ is called noise 
![[Pasted image 20241211214004.png|450]]

### Summary
- DBSCAN : Algorithm
	- Input : N objects to be clustered and global parameter. $\epsilon$ and MinPts
	- Output : Cluster of objects

- Algorithm
	- Arbitrary select a point p
	- Retrieve all points density-reachable from p w.r.t. $\epsilon$  and MinPts
	- If p is a core points, a cluster is formed
	- If p is a border point, no points are density reachable from p and DBSCAN visits the next point of the database
	- Continue the process until all of the points have been processed 


## DBSCAN in time series anomaly detection

일변량 시계열의 경우 


## paper 
[reference](https://arxiv.org/pdf/2004.00433)

