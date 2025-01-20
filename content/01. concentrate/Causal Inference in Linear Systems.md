

causal inference는 모델을 구성하는 방정식의 유형에 관계없이 적용 가능.
즉, 변수 간의 관계가 선형이든 비선형이든 상관없이 인과관계 분석 

- 기존의 통계는 선형 시스템에 익숙하기 때문에 linear system에 causal inference를 적용하는 것은 매우 유용 


정규성 가정의 유용한 속성
	- Efficient representation
	- Substitutability of expectations for probabilities
	- Linearity of expectations
	- Invariance of regression coefficients


![[Pasted image 20241203155552.png|400]]

![[Pasted image 20241203155616.png|400]]

$$\mu_x,\mu_y,\sigma_x,\sigma_y,p_{xy}$$

n개의 변수가 있다면 5*N(N-1)/2 개의 매개변수
실제로는 평균과 분산을 나타내는 2N  + N(N-1)/2

- 다변량 정규 분포의 이러한 특징은 인과 추론을 단순화하는 데 도움이 됨
- 특히, 변수 간의 관계를 선형으로 가정하고 모든 오차 항이 정규 분포를 따른다고 가정하면
  인과 분석 절차가 훨씬 간편 


///

sdasddd
///

For instance, to express the conditional independence of Y and X, given Z
$$P(Y|X,Z) =P(Y|Z)$$
$$E[Y|X,Z] = E[Y|Z]$$

The next useful feature of normal distributions is their linearity
: every conditional expectation $E[Y|X_1,X_2,...,X_n]$ is given by a linear combination of the    condition variables

![[Pasted image 20241203161054.png]]
*정규 분포를 따르는 변수들의 관계에서는 확률 대신 기댓값을 사용할 수 있음*


X_1 * X_2 와 같은 항을 추가하면 변수 간의 상호 작용 또는 효과 수정을 고려 

### Structural VS Regression Coefficients

$\alpha, \beta$   그리고 오차 $U_1$
$r_1,r_2$  그리고 오차  $\epsilon$
![[Pasted image 20241203164301.png|350]]
r_i = 0 인 경우 Y는 다른 모든 회귀 변수를 조건으로 X_i와 독립적 


### The Causal Interpretation of Structural Coefficients

![[Pasted image 20241203164806.png]]

![[Pasted image 20241203164956.png|400]]
- Z가 Y에 미치는 직접 효과를 추정 
X = U_{X}
Z = aX + U_{Z}
W = bX + cZ + U_{W}
Y = dZ + eW + U_{Y}

DE=E[Y∣do(Z=z+1),do(W=w)]−E[Y∣do(Z=z),do(W=w)]

- Z가 Y에 미치는 총 효과 
Y​=dZ+eW+UY​=dZ+e(bX+cZ)+UY​+eUW​=(d+ec)Z+ebX+UY​+eUW​​
- τ 가 Z에서 Y로 가는  두개의 비후향 경로 상의 계수들의 곱의 합임을 알 수 있음 

### Identifying Structural Coefficients and Causal Effect 

![[Pasted image 20241203171613.png]]




![[Pasted image 20241203171231.png|400]]

- 이전에는 경로 계수들이 사전에 알려져 있거나 개입 실험을 통해 추정된다고 가정 
- 이젠 비실험 데이터에서  총 효과와 직접 효과를 추정 (식별 가능성 identifiability)
- 총 효과와 직접효과와 관련된 경로 계수들을 공분산 $sigma_{XY}$ 또는 회귀계수$R_{YX.Z}$ 로 표현
- Backdoor criterion  총효과 식별 


- The Regression Rule for Identification

![[Pasted image 20241203172250.png|500]]


![[Pasted image 20241203172740.png|550]]




### Mediation in Linear Systems


