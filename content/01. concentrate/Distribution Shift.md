Distribution Shift 
 ->  학습 데이터와 테스트 시점의 데이터 분포가 달라지는 현상

- 현실 세계에서는 데이터가 시간이 지남에 따라 변하거나(change over time) , 다른 도메인에서 올 수 있으므로(different domains), 성능 및 안정성이 저하될 수 있음(drops in performance and stability)


같은 "개" 나 "말" 을 나타내더라도 그림 스타일이나 사진 등 도메인이 다를 수 있음 (머신 러닝의 기본적인 목표인 일반화를 설명)

Quantifying Distribution Shift - 분포가 얼마나 다른지 정량화


이런 문제를 해결하기 위한 방법 
- Optimization-based methods
- Weight-averaging techinques

#### Optimization-based methods
- 모델의 parameters는 gradient descent를 통해 업데이트
$$\theta_{t+1} = \theta_{t} -  η \frac{1}{|B|} \sum_{(x_{i}, y_{i})\in B} ∇_{\theta} \;l(f_{\theta_{t}}(x_{i}),y_{i})$$

why Gradient & Hessian Matter ? 
- 변화하는 분포에서의 위험 최소화
	- $R(\theta = \mathbb{E}_{(x,y) ~~ P}[l(f_{\theta}(x),y)]$  를 주어진 분포 하에서의 예상 손실이라고 함
	- $P_{train}(x) \;\; !=  \;\;P_{test}(x)$  이면 훈련 손실을 최소화하는 지점이 테스트 손실을 최소화하지 않을 수 있음
- Sensitivity via Second-order expansion (based on taylor expansion)
- Robustness & Curvature
	- 더 평평한 영역(낮은 고유값)을 찾으면 작은 분포 변화가 손실을 급격하게 증가시키지 않으므로 변화에 대한 민감도를 줄일 수 있다


Sharpness : Parameter-region based information 
- Sharp Minimum and Flat Minimum


SAM(Sharpness - Aware Minimization)
- 최악의 경우의 손실을 최소화함으로써 모델이 Flat Minimum을 찾도록 유도함

- Loss Sharpness와 일반화 성능 사이에 강한 상관관계가 있음. 즉, Sharpness가 낮을수록 일반화 성능이 좋아진다


#### GAM(Gradient-norm Aware Minimization)
- gradient norm을 직접적으로 고려하여 Flatness를 측정하고, 이를 통해 모델의 견고성을 높임 
- First-order flatness는 $\theta$ 주위에서 손실이 얼마나 빨리 증가할 수 있는지를 포착하여 더 강력한 sharpness 측정값을 제공 


요약
- 주어진 모델 파라미터에 대한 최적화 방법은 robustness에 매우 중요하다
- gradient 와 Hessian 정보는 모델 파라미터가 주어진 데이터에 어떻게 반응하는지에 대한 다양한 특성을 제공한다


### Weight-averaging methods
개선된 최적화 방법의 단점
- 다양한 hyper-parameters로 모델을 훈련하는 데 시간이 많이 걸림
- validation set에서 가장 좋은 성능을 보이는 개별 모델을 선택하는 데 시간이 많이 걸림
- 각 데이터 세트에 대한 optimal model parameter는 다를 수 있다 

#### Overview of weight-averaging
- 서로 다른 데이터 set 또는 다양한 훈련 전략 에서 얻는 여러 모델 parameters 세트를 사용 
- 추가 계산 또는 시간 비용 없이 최종 모델 성능을 향상시키는 방식으로 이러한 가중치를 결합 

#### SWA(Stochastic Weight Averaging)
- Pretrain the model
- cyclical/constant LR 로 훈련을 계속하여 다양한 가중치를 샘플링하고, captured weights를 평균하여 최종 SWA 모델을 형성
$$\theta_{SWA} = \frac{1}{k}\sum_{i = 1}^{k}\theta^{(i)}$$
#### SWAD(Variants for SWA for domain generalization)
- Dense Sampling : k epochs 마다 가중치를 수집하는 것이 아니라, 매 반복마다 모델 가중치를 수집 -> 손실 공간의 넓은 영역을 더 잘 포착하기 위해 많은 checkpoints를 얻음
- Overfit-Aware Strategy : when the model first stops improving(start iteration), 언제 과적합되기 시작하는지(end iteration)를 식별하기 위해 validation loss를 모니터링함
- 더 자주 가중치를 평균화하고, 과적합을 피하기 위해 validation loss를 모니터링하여 평균화할 가중치를 선택함
-> 과적합된 파라미터를 잘 생략함
-> standard SWA, SAM보다 더 flatter minimum을 찾아 , 더 강력한 domain generalization

가중치 평균화 방법은 여러 모델의 가중치를 결합하여 다양성을 확보하고, 이를 통해 robust를 높임, 추가적인 훈련 없이도 기존 모델들을 활용하여 성능을 향상시킴 
