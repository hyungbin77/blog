# DeepAnT : Unsupervised Anomaly Detection

## ABSTRACT
### 기존 모델의 문제점
- 기존의 거리 및 밀도 기반 anomaly detection은 streaming data에서 흔히 발생하는 주기성 및 계절성 관련 이상 지점을 탐지할 수 없다는 한계가 있음 
### 구성 및 장점 
- 두 가지 모듈로 구성됨
	- time series forecast
	- Anomaly detection
- 비지도 학습으로 모델 생성 시 이상 레비르에 의존하지 않음 
- 주어진 데이터 세트에서 이상을 제거하지 않고도 훈련 할 수 있음
- CNN의 효과적인 매개변수 공유 덕분에 상대적으로 작은 데이터 세트에서 모델을 훈련 

## INTRODUCTION
- 전통적인 거리 기반 이상 탐지 기법은 시계열의 맥락(context)을 포함하지 않기 때문에 주기(cycles)에서 발생하는 이상 지점(point anomalies)을 찾을 수 없음
- DeepAnT는 context, seasonality, trend를 고려 -> 서로 다른 영역(domains)의 데이터에 적용될 수 있음 
- DeepAnT
	- 원본 시계열 데이터를 활용
	- 비지도학습 
	- 예측 모듈(forecasting module)로 CNN을 사용함 
	- 주어진 시계열 window의 다음 타임 스탬프를 예측. 그 후,  예측된 값은 탐지기 모듈(detector module)로 전달되어 해당 값을 실제 데이터 포인트와 비교하여 실시간으로 이상치를 탐지 
	- 특징 추출(feature extraction) 중 효과적인 매개변수 공유(parameter sharing) 덕분에 적은 수의 훈련 샘플만으로도 예측 모델을 구축하기에 충분 
	- DeepAnT는 전체 시계열을 정상 또는 비정상으로 분류하는 대신, point anomalies을 robust하게 탐지하는 데 중점을 둠 

## LITERATURE REVIEW OF ANOMALY DETECTION METHODS

***여러 이상치 탐지 알고리즘  설명***

### Statistical anomaly detection techniques
- K-NN 
- LOF
- Cluster-Based Local Outlier Factor(CBLOF)
- Histogram-Based Outlier Score(HBOS)
- One-class Support Vector Machine
- PCA 
- RPCA
- ARMA
- LSTM
- Autoencoder

## THE STATE-OF-THE-ART METHODS USED FOR COMPARISON

***딥러닝 기반 알고리즘 설명***

## DeepAnT : THE PROPOSED APPROACH FOR ANOMALY DETECTION IN TIME SERIES

- 딥러닝은 주로 도메인 지식(domain knowledge) 없이도 복잡한 특징을 자동으로 발견
- CNN이 매개변수 효율성으로 인해 단변량,다변량 시계열 데이터에 대한 좋은 대안이 될 수 있음 
- 매개변수(parameters)(weights)(biases) 조정  -> Stochastic Gradient Descent를 사용하여 최적화 
- 신경망 훈련 또는 학습의 아이디어는 비용 함수(cost function) $C$를 줄이는 것 
- 가중치(weights,$w$)와 편향(biases,$b$)을 조정하는 데 필요한 기울기(gradient)를 계산하는 과정을 역전파(backpropagation)
$$\{x_0,x_1,...,x_{t-1},x_{t},x_{t+1},...\}$$
- $w = 5$이고 $p$_ $w$ = 1$ 인 경우 , index t의 sequence는
$$x_{t-4},x_{t-3},x_{t-2},x_{t-1},x_{t} \;\; -> \;\; x_{t+1}$$
	 - 이와 같은 경우를 many_to_one 예측 

### Two module

#### 시계열 예측기(Time Series Predictor)
- 주어진 기간(horizon)에 대한 time stamps를 예측
- CNN을 사용 
- CNN
	- 합성곱 계층(convolutional layers)
		1. 계층(layer)은 선형 활성화(linear activations)를 생성하는 합성곱 연산(convolution operation)을 수행 
		2. 비선형 활성화 함수(non-linear activation function)가 각 선형 활성화(each linear activation)에 적용됨
		3. 실수 값 인수(real valued arguments)의 두 함수에 대한 수학적 연산으로 세 번째 함수를 생성 
			$$s(t) = (x*w)(t)$$
			- One dimensional convolution
			$$s(t) = \int x(\tau)w(t-\tau)d\tau = \sum_{\tau = -\infty}^{\infty} x(\tau)w(t-\tau)$$
	- 풀링 계층(pooling layers)
		- convolutional layer의 출력이 풀링 계층(pooling layer)의 pooling function에 의해 추가로 수정 
		- pooling function는 합성곱 계층의 출력을 특정위치에서 neighbors을 기반으로 통계적으로 요약 
		- 특징 맵(feature maps)이 두 개 이상이므로, 풀링 함수(pooling function)는 이러한 모든 특징 맵(feature maps)에 개별적으로 적용
		- DeepAnT에서는 max-pooling layer 를 사용 
	- 완전 연결 계층(fully connected layers)

![[Pasted image 20241213005209.png]]
- 그림에선 point forecast이므로 1개 출력 

- 손실함수
	- 평균 절대 오차(Mean Absolute Error, MAE)
	$$ MAE = \frac{1}{n}\sum_{j=1}^{n}|y_j - \hat{y_j}|$$
	- 훈련 데이터(training data)를 기반으로 각 시계열(time series)을 정규화 



#### 이상치 탐지기(Anomaly Detector)
- 주어진 시계열 데이터 포인트를 normal/abnormal로 태깅(tagging)하는 역할 
- 위에서 $x_{t+1}$ 의 예측이 시계열 예측기에 의해 이루어지면, 이 모듈은 주어진 시계열에서 이상 징후를 탐지 
- 실제 값과 예측된 값 사이의 차이가 계산
- Euclidean distance는 불일치(discrepancy)의 척도로 사용됨
- $$(y_t,\hat{y_{t}}) = \sqrt{(y_t - \hat{y_t})^{2}}$$
- 임계값(threshold) 정해야 함 




## EXPERIMENTAL SETUPS

### 평가 지표 및 실험 설정(EVALUATION METRIC AND EXPERIMENTAL SETUP)

- F-score은 모델의 성능을 나타내는 지표(indicator)을 하는 가장 일반적으로 사용되는 단일 항목 메트릭
- $$F-score = 2 * \frac{Precision*Recall}{Precision + Recall}$$
#### DeepAnT PARAMETERS
- 각 시계열(time series)의 40%만 훈련 세트(training set)로 사용하고 나머지 60%의 데이터는 테스트 세트(test set)로 사용 
- 훈련 세트(training set)를 더 분할하고 그 중 10%를 검증(validation)에 사용 
- 자동 임계값(automatic threshold)
	- parametric approach- $K\sigma$ deviation
	- non-parametric approach - density distribution
- History Window(w)는 DeepAnT의 예측 모델을 개선하는 데 중요한 역할을 하는 또 다른 hyperparameter
![[Pasted image 20241213013218.png|700]]
#### Twitter ANOMALY DETECTION PARAMETERS


#### YAHOO EGADS PARAMETERS

#### RESULTS

![[Pasted image 20241213013948.png]]



### EXPERIMENTAL SETTING 2 : NAB DATA SET

- 58 data streams, each with 1,000 - 22,000 instances