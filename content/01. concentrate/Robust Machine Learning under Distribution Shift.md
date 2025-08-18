#### Distribution shift 
- 학습 데이터와 테스트 시점의 데이터 분포가 달라지는 현상
- 현실 세계에서는 데이터가 시간이 지남에 따라 변하거나(change over time), 다른 도메인에서 올 수 있으므로(different domains) 성능 및 안정성이 저하될 수 있음
![[Pasted image 20250307092953.png]]
#### types of Distribution shift
##### 1. Covariate Shift
- 입력 데이터의 분포 $P_{train}(x) != P_{test}(x)$ 는 변하지만, 입력 x가 주어졌을 때 출력 y가 나타날 조건부 확률 P(y|x)는 변하지 않음
##### 2. Label Shift
- label의 분포 p(y) 는 변하지만, 출력 y가 주어졌을 때 입력 x가 나타날 조건부 확률 P(x|y)는 동일하게 유지됨
##### 3. Concept Shift
- 입력 x와 출력 y 사이의 관계, p(y|x) 자체가 변화
![[Pasted image 20250307093546.png|400]]
<div style="page-break-after: always"></div>



##### 4. subpopulation shift / Domain Shift
- 학습/테스트 데이터의 특정 하위 그룹 또는 전체적인 환경이 달라지는 경우 

### 문제점 
- Distribution shift는 모델의 일반화 성능을 저해하는 원인 중 하나임 
- 모델이 훈련 데이터에 과적합되어, 실제 환경에서 마주하는 다양한 데이터 분포에 제대로 대응하지 못함 , robust하지못함 


### Optimization-based methods 

- 모델의 parameters는 gradient descent를 통해 업데이트
$$\theta_{t+1} = \theta_{t} -  η \frac{1}{|B|} \sum_{(x_{i}, y_{i})\in B} ∇_{\theta} \;l(f_{\theta_{t}}(x_{i}),y_{i})$$
##### Sharpness and Generalization 
- Sharp Minimum : 손실 함수의 곡률이 큰 지점. 모델 parameter가 조금만 변해도 손실이 크게 증가하여 일반화 성능이 저하될 수 있음 
- Flat Minimum :  손실 함수의 곡률이 작은 지점. 모델 파라미터 변화에 덜 민감하여 일반화 성능이 좋음
![[Pasted image 20250307094203.png]]
##### SAM(Sharpness-Aware Minimization)
- 최악의 경우의 손실을 최소화함으로써 모델이 Flat Minimum을 찾도록 유도함 
- Loss Sharpness 와 일반화 성능 사이에 강한 상관관계가 있음
- SAM은 경사 하강법보다 계산량이 두 배 더 많지만 일반화 성능이 더 좋음 

##### GAM(Gradient-norm Aware Minimization)
- gradient norm을 직접적으로 고려하여 Flatness를 측정하고, 이를 통해 모델의 견고성을 높임 
- First-order flatness는 $\theta$ 주위에서 손실이 얼마나 빨리 증가할 수 있는지를 포착하여 더 강력한 sharpness 측정값을 제공 


#### 중간 요약
-> 주어진 모델 파라미터에 대한 최적화 방법은 robustness에 매우 중요하다
-> gradient 와 Hessian 정보는 모델 파라미터가 주어진 데이터에 어떻게 반응하는지에 대한 다양한 특성을 제공한다


### Weight-averaging methods 

- 여러 모델의 가중치를 평균화하는 방법

개선된 최적화 방법의 단점
- 다양한 hyper-parameters로 모델을 훈련하는 데 시간이 많이 걸림
- validation set에서 가장 좋은 성능을 보이는 개별 모델을 선택하는 데 시간이 많이 걸림
- 각 데이터 세트에 대한 optimal model parameter는 다를 수 있다 

##### SWA(Stochastic Weight Averaging)
- Pretrain the model
- cyclical/constant LR 로 훈련을 계속하여 다양한 가중치를 샘플링하고, captured weights를 평균하여 최종 SWA 모델을 형성
 ~~훈련 후반부에 학습률을 조정하면서 얻은 여러 check point(모델 가중치)를 평균하는 방법~~ 
$$\theta_{SWA} = \frac{1}{k}\sum_{i = 1}^{k}\theta^{(i)}$$
#### SWAD(Variants for SWA for domain generalization)
- Dense Sampling : k epochs 마다 가중치를 수집하는 것이 아니라, 매 반복마다 모델 가중치를 수집 -> 손실 공간의 넓은 영역을 더 잘 포착하기 위해 많은 checkpoints를 얻음
- Overfit-Aware Strategy : when the model first stops improving(start iteration), 언제 과적합되기 시작하는지(end iteration)를 식별하기 위해 validation loss를 모니터링함
- 더 자주 가중치를 평균화하고, 과적합을 피하기 위해 validation loss를 모니터링하여 평균화할 가중치를 선택함
-> 과적합된 파라미터를 잘 생략함
-> standard SWA, SAM보다 더 flatter minimum을 찾아 , 더 강력한 domain generalization
![[Pasted image 20250307095347.png]]
**가중치 평균화 방법은 여러 모델의 가중치를 결합하여 다양성을 확보하고, 이를 통해 robust를 높임, 추가적인 훈련 없이도 기존 모델들을 활용하여 성능을 향상시킴** 





