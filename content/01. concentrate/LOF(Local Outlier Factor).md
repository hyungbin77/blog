
이상치 스코어를 산출할 때, 주변부 데이터의 밀도를 고려 


각각의 관측치가 데이터 안에서 얼마나 벗어나 있는가에 대한 정도(이상치 정도)를 나타냄
모든 데이터를 전체적으로 고려하는 것이 아니라, 해당 관측치의 주변 데이터(nieghbor)를 이용하여 국소적(local) 관점으로 이상치 정도를 파악.
또한, 주변 데이터를 몇개까지 고려할것인가를 나타내는 k(hyper-parameter)만 결정하면 됨

![[Pasted image 20241128122100.png|350]]
### Notion

#### 2.1 Distance between objects p and q 
$$d(p,q)$$
- 관측치 p와 q의 거리 

#### 2.2 k-distance of an object p 
$$\text{k-distance}(p)$$
- 관측치 p와 가장 가까운 데이터 k개에 대한 거리의 평균 

#### 2.3 k-distance neighborhood of an object p
$$N_{k}(p)$$
- 관측치 p의 k-distance(p) 보다 가까운 이웃의 집합 
- k-distance(p)를 계산할 때 포함된 이웃의 집합 


> k 번째 선택시 동일한 distance의 object가 있는 경우, $N_{k}(P) \neq k$
> 그에따라 또한 k-distance(p) 도 같이 않겠지? 

#### 2.4 reachability distance of an object p w.r.t object o
$$\text{reach-dist}_{k}(p,o) = max\{\text{k-distance}(o),d(o,p)\}$$
- 관측치 p가 o에서 멀다면 : 관측치 p와 o의 실제거리
- 관측치 p가 o에서 가깝다면 : 관측치 o의 k-distance 
![[Pasted image 20241201223805.png]]

#### 2.5 local reachability density(lrd) of an object p 
$$lrd_{k}(p) = \frac{|N_{k}(p)|}{\sum_{o\in N_{k}(p)}\text{reach-dist}_{k}(p,o)}$$
![[Pasted image 20241201224407.png]]
- [예시 1] : 관측치 p의 3-neighbor이 가깝게 있고, 이웃 $O_{i} \; (i = 1,2,3)$의 $\text{reach-dist}_{3}(p,0_{i})$ 도 작기 때문에 $lrd_{3}(p)$ 는 큰 값이 산출 

#### *2.6 local outlier facotr(LOF) of an object p 
$$LOF_{k}(p) = \frac{\sum_{o \in N_{k}(p)}\frac{lrd_{k}(o)}{lrd_{k}(p)}}{|N_{k}(P)|} = \frac{\frac{1}{lrd_{k}(P)}\sum_{o\in N_{k}(p)}lrd_{k}(o)}{|N_{k}(P)|}$$
- 관측치 p의 밀도와 이웃 o의 밀도의 비율을 평균 
	- LOF < 1 : 밀도가 높은 분포
	- LOF = 1  : 이웃 관측치와 비슷한 분포
	- LOF > 1 : 밀도가 낮은 분포, 크면 클수록 이상치 정도가 큼 


![[Pasted image 20241128122100.png|400]]


