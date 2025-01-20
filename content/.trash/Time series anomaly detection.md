## 수입액물량지수(scsi)

	2804293000 크립톤
	2825402000 수산화니켈
	3801101000 배터리 음극재
	8112923000 갈륨
	8112993000 갈륨




### 기존 방법:  LST#M-AE 
- encoding으로 데이터의 패턴을 찾고 decoding을 통해 원래 입력데이터와 유사하게 재현하면서 과거 수출입 추세의 특성을 파악 
- 분석자의 경우 hscd 품목별로 독립적으로 encoding 
- 재구성 방법 
- 각각 지수에 대한 이상 탐지 추출 
 ![[Pasted image 20241209011117.png]]

#### 제안 방법 : DCdetector - Dual Attention Contrastive Representation Learning for Time Series Anomaly Detection 

- 정상 시계열 지점이 잠재적 패턴을 공유 
- 즉, 정상 지점은 다른 지점과 강한 상관 관계. 반대로 이상 징후는 X
- 정상 및 비정상 지점의 표현을 구별할 수 있으면 고도로 자격을 갖춘 재구성 모델 없이 이상 징후를 감지할 수 있음 

---
- Recently, some self-supervised learning-based methods have been proposed to enhance the generalization ability in unsupervised anomaly detection
---
[[Differentiable Causal Backdoor Discovery]]

##### 알고리즘 설명
1. 구조 : 정상 지점과 이상 징후 간의 표현 차이를 확대하는 순열 불편 표현을 학습하기 위해 대조 학습 기반 이중 분기 주의 구조 설계. 또한 시계열의 지역적 의미 정보를 향상시키기 위해 채널 독립성 패치가 제안. 패치하는 동안 정보 손실을 줄이기 위해 주의 모듈에 다중 스케일이 제안
2. 최적화 : 두 분기의 유사성을 기반으로 효과적이고 강력한 손실 함수가 설계. 모델은 재구성 손실 없이 순수하게 대조적으로 학습되어 이상 징후로 인한 방해 요소를 줄임
3. 성능 및 정당성 : DCdetector는 6개의 다변량 및 1개의 단변량 시계열 이상 탐지 벤치마크 데이터 세트에서 최첨단 방법과 비교 가능하거나 우수한 성능을 달성. 또한 음수 샘플 없이 모델이 붕괴되는 것을 방지하는 방법을 설명하기 위해 정당성 논의를 제공 


![[Pasted image 20241209020317.png]]
- (b) Anomaly Transformer
	- Anomaly Score = $\alpha \text{*} \text{RNN-score} + (1-\alpha) \text{* Gaussian-score}$
	- 학습 과정에서 최적의 $\alpha$ 값을 찾음
	- 계산된 Anomaly Score가 특정 임계값을 넘으면 anomaly로 판단 
	- 임계값은 validation 데이터를 통해 결정. 


![[Pasted image 20241209031448.png]]
(a) Backbone
(b) Dual Attention Contrastive Structure
(c) Dual Attention

###### Structure
- Forward Process 
	- 정규화 
	- 정규화에 대한 입력은 모두 독립적인 채널 자체에서 옴
	- 이는 전역 정보의 통합 및 조정으로 볼 수 있으며 학습 처리에 대한 보다 안정적인 접근 방식
	- 채널 독립성 가정은 multivariable 시계열 예측 작업에서 매개변수 수를 줄이고 과적합 문제를 줄이는 데 도움이 됨 
	- 각각의 채널에 대해 같은 self-attention으로 개별 처리 
		- 파라미터 수 감소, 메모리 효율성, 학습 속도 향상 

- Dual Attention Contrastive Structure
	- 서로 다른 관점에서 입력의 표현을 학습 
	- *핵심 아이디어*  - 정상 지점의 경우 대부분이 서로 다른 관점에서도 동일한 잠재 패턴을 공유 
				  이상 징후는 다른 지점과의 상관 관계가 약함 
				  서로 다른 관점에서 정상 지점표현의 차이는 작고 이상 징후의 경우 차이가 큼
				  
	- 이상 기준의 경우 두 표현 간의 불일치를 기반으로 이상 점수를 계산하고 이상 탐지에 대한 사전
	  임계값을 사용 
- Representation Discrepancy
- Anomaly Criterion


### Dual Attention Contrastive Structure
- 시계열 데이터를 두 가지 관점으로 봄
- 패치 단위(patch-wise)(패치를 하나의 단위로 보고 처리)와 패치 내부(in-patch)(패치 내부의 시점들을 처리 두 가지 관점으로 같은 데이터를 바라봄)




| 일반 대조학습      | DC detector       |
| ------------ | ----------------- |
| 원본 vs 증강 데이터 | 패치 단위 vs 패치 내부 관점 |


#### Dual Attention Contrastive Structure
##### Dual Attention
1. initialize the query and key
$$Q_{N_{i}},K_{N_{i}} = W_{Q_{i}}X_{N_{i}}, W_{K_{i}}X_{N_{i}} \quad 1\leq i\leq H$$
$Q_{N_{i}},K_{N_{i}}$  
패치의 수N만큼 임베딩(d-model)만큼 학습하니
인베딩 후 차원 N x d-model

Query : 나는 어떤 패치와 관련이 있을까?
Key : 나는 이 feature을 가지고 있어 
Query * Key =  Attention Score
(10,32) * (32,10) = (10,10)
##### Up-sampling and Multi-scale Design
- patch-wise attention ignores the relevance among points in a patch 
- in-patch attention ignores the relevance among patches
-> To compare the results of two representation networks, we need to do up-sampling

- Patch-wise attention : 패치 간의 관계만 봄, 패치 내부 무시
- In-patch attention : 패치 내부만 봄, 패치 간 관계 무시 
- 이 두 결과를 비교하려면 크기를 맞춰야함(Up-sampling 필요)

![[Pasted image 20241209035431.png|500]]
-> 이러면 결국 정보 손실 ->  Multi-scale Design




##### Contrastive Structure
- *Permutation Invariant*
	- 데이터를 어떤 순서로 보더라도 동일한 특성을 찾아낼 수 있어야 함
	- 정상 데이터는 순서를 바꿔도 패턴이 유지됨
	- 이상치는 순서를 바꾸면 패턴이 깨짐

```
patch1 : [20,22,25,23]
patch2 : [21,40,24,22]
patch3 : [20,23,25,22]

- 패치간 : 40이 다른 시점과 매우 다름
- 패치내 : 패치 2의 내부 패턴이 깨짐
```

- 두 관점의 표현이 매우 다른 경우 -> 이상치로 판단
- 두 관점의 표현이 유사한 경우 -> 정상으로 판단 

### Representation Discrepancy

#### Loss function definition 

$$L\{P,N;X\} = \frac{1}{2}D(P,Stopgrad(N)) + \frac{1}{2}D(N,Stopgrad(P))$$

#### Discussion about Model Collapse

- DC detector는 negative sample 없이도 모델 붕괴가 일어나지 않음
- SimSiam과 달리 stop gradient 없이도 동작 가능
- 단, stop gradient 있을 때 최고 성능 달성
- 출력 벡터 Z를 두 부분으로 분해:
	- $o = E[Z] : \text{중심 벡터(전체 표현 공간의 평균)}$
	- $r$  : 잔차 벡터
	- $Z = o + r$ 로 표현 
- 일반적인 모델 붕괴 현상
	- 모든 벡터 $Z$가 중심 벡터 $o$로 수렴
	- o가 $r$을 지배하게 됨
	- 표현력 상실 발생 


$cf)$ 정상 데이터의 경우 
		- patch-wise와 in-patch 표현이 유사함
		- KL divergence 값이 작음
		- 낮은 anomaly score
	이상 데이터의 경우
		- 두 표현 간 큰 차이 발생
		- KL divergence 값이 큼
		- 높은 anomaly score 


### Anomaly Criterion

$$AnomalyScore(X) = \frac{1}{2}D(P,N) + \frac{1}{2}D(N,P)$$
- 임계값에 따라 이상치 판별 

### EXPERIMENTS
#### Benchmark Datasets
- 다변량 dataset
	- MSL - 화성 과학 연구소 데이터 세트
	- SMAP - 토양 수분 능동 수동 데이터 세트
	- PSM - 풀링된 서버 메트릭 데이터 세트
	- SMD - 서버 머신 데이터 세트  
	- NIPS-TS-SWAN - 태양 광구 벡터 자기 측정
	- NIPS-TS-GECCO - 사물 인터넷을 위한 식수 수질 데이터 세트 
- 단변량 dataset
	- UCR

