##  1 
$$  

- \mu_n^T [(\kappa_0 + n)V] \mu_n + \kappa_0 \mu_0^T V \mu_0 + \sum_{i=1}^n y_i^T V y_i = S + \frac{\kappa_0 n}{\kappa_0 + n} (\bar{y} - \mu_0)(\bar{y} - \mu_0)^T$$
$$where \;\mu_n = \frac{\kappa_0}{\kappa_0 + n} \mu_0 + \frac{n}{\kappa_0 + n} \bar{y} \; and \; S = \sum_{i=1}^n (y_i - \bar{y})(y_i - \bar{y})^T$$

- 첫 번째 항을 $\mu_n$ 의 정의를 이용하여 계산

- 왼쪽 항  $μ_n^T​[(κ_0​+n)V]μ_n$  을 $\mu_n = \frac{k_0}{k_0 + n} + \frac{n}{k_0+n}\bar{y}$ 을 이용하여 전개하면 
$$\mu_n^T [(\kappa_0 + n)V] \mu_n = (\frac{\kappa_0}{\kappa_0 + n} \mu_0 + \frac{n}{\kappa_0 + n} \bar{y})^T [(\kappa_0 + n)V] (\frac{\kappa_0}{\kappa_0 + n} \mu_0 + \frac{n}{\kappa_0 + n} \bar{y})$$
 $$=\frac{\kappa_0^2}{\kappa_0 + n}\mu_0^TV\mu_0 + \frac{\kappa_0n}{\kappa_0 + n}\mu_0^TV\bar{y} + \frac{\kappa_0n}{\kappa_0 + n}\bar{y}^TV\mu_0 + \frac{n^2}{\kappa_0 + n}\bar{y}^TV\bar{y}$$
- S를 전개하면 
$$S = \sum_{i=1}^n (y_i - \bar{y})(y_i - \bar{y})^T = \Sigma_{i =1}^{n}(y_iy_i^T - y_i\bar{y}^T = \bar{y}y_i^T + \bar{y}\bar{y}^T) $$
      $$ = \Sigma_{i = 1}^n y_iy_i^T - n\bar{y}\bar{y}^T$$
- 이므로  $S + n\bar{y}^T V \bar{y} = \Sigma_{i}^ny_iy_i^T$   로 나타낼 수 있음 

- 이를 대입하면 좌변은 아래와 같은 식이 나옵니다
$$-\frac{\kappa_0^2}{\kappa_0 + n}\mu_0^TV\mu_0 -2\frac{\kappa_0n}{\kappa_0 + n}\mu_0^TV\bar{y} - \frac{n^2}{\kappa_0 + n}\bar{y}^TV\bar{y}+ k_0\mu_{0}^TV\mu_{0}+ S + n\bar{y}^TV\bar{y}$$
- $\mu_0^T V \mu_0$ 항들을 정리 하면$$\frac{k_{0}n}{k_{0} + n}\mu_0^TV\mu_0$$
- $\mu_0^TV\bar{y} \text{ 항들을 정리하면:}$$$ -2\frac{k_{0}n}{k_{0} + n}\mu_0^TV\bar{y}$$
- $\bar{y}^TV\bar{y} \text{ 항들을 정리하면:}$ $$\frac{k_{0}n}{k_{0} + n}\bar{y}^TV\bar{y}$$
- 우변 $\frac{k_{0}n}{k_{0} + n}(\bar{y} - \mu_{0})(\bar{y}- \mu_{o})$ 을 전개하면 
$$\frac{k_{0}n}{k_{0} + n}(\bar{y}\bar{y}^T - \bar{y}\mu_{0}^T - \mu_{0}\bar{y}^T + \mu_{0}\mu_{0}^T)$$
- 우변은 
$$S + \frac{k_{0}n}{k_{0} + n}(\bar{y}\bar{y}^T - \bar{y}\mu_{0}^T - \mu_{0}\bar{y}^T + \mu_{0}\mu_{0}^T)$$
- 좌변은 
$$S + \frac{k_{0}n}{k_{0} + n}(\mu_0^TV\mu_0  -2\mu_0^TV\bar{y}+ \bar{y}^TV\bar{y})$$
- V가 대칭 행렬일때 $\bar{y}\bar{y}^T = \bar{y}^TV\bar{y} , \quad \bar{y}\mu_{0}^T + \mu_0\bar{y}^T = 2\mu_{0}^TV\bar{y} \quad \mu_{0}\mu_{0}^T = \mu_{0}^TV\mu_{0}$ 임으로 같음





## 2 
- $\theta_{i}$
- $\mu$
likelihood   $y_i|\theta_{i}$ ~  $N(\mu,η^{2})$ , $i = 1,...,K$
prior           $\theta_i|\mu$  ~  $N(\mu,\sigma^2)$ 
		  $\mu$      ~  $N(\mu_0,\sigma_0^2)$

$p(θ_i|y_i,μ) ∝ p(y_i|θ_i) × p(θ_i|μ)$

$f(x|\mu,\sigma^2) = \frac{1}{\sqrt{2\pi\sigma^2}}exp(-\frac{(x-\mu)^2}{2\sigma^2})$
- 로그를 취해서 계산하면
$$\log{f(x|\mu,\sigma^2)} = -\frac{1}{2}\log(2\pi\sigma^2) - \frac{(x-\mu)^2}{2\sigma^2}$$
- likelihood log
$$\log p(y_i|\theta_i) = -\frac{1}{2}log(2\pi\eta^2) - \frac{(y_i-\theta_i)^2}{2\eta^2}$$
- prior log
$$\log p(\theta_i|\mu) =  -\frac{1}{2}\log (2\pi\sigma^2) - \frac{(\theta_i - \mu)^2}{2\sigma^2}$$
$$\log p(θ_i|y_i,μ) ∝ \log p(y_i|θ_i) + \log p(θ_i|μ)$$
$$= -\frac{1}{2}log(2\pi\eta^2) - \frac{(y_i-\theta_i)^2}{2\eta^2} -\frac{1}{2}\log (2\pi\sigma^2) - \frac{(\theta_i - \mu)^2}{2\sigma^2}$$
$$∝ - \frac{(y_i-\theta_i)^2}{2\eta^2}- \frac{(\theta_i - \mu)^2}{2\sigma^2}$$
$$ \begin{align*} &\propto -\frac{1}{2\eta^2}(y_i^2 - 2y_i\theta_i + \theta_i^2) - \frac{1}{2\sigma^2}(\theta_i^2 - 2\mu\theta_i + \mu^2) \\ &= -\frac{1}{2}\left(\frac{\theta_i^2}{\eta^2} - \frac{2y_i\theta_i}{\eta^2} + \frac{y_i^2}{\eta^2} + \frac{\theta_i^2}{\sigma^2} - \frac{2\mu\theta_i}{\sigma^2} + \frac{\mu^2}{\sigma^2}\right) \end{align*}$$
- 전개 후 $\theta_i$ 에 대한 항을 모으면 
$$ \begin{align*} &\propto -\frac{1}{2}\left(\left(\frac{1}{\eta^2}+\frac{1}{\sigma^2}\right)\theta_i^2 - 2\left(\frac{y_i}{\eta^2}+\frac{\mu}{\sigma^2}\right)\theta_i\right) + C \end{align*} $$
- 이는 정규분포의 로그와 같은 형태임을 확인 
$$ \theta_i|y_i,\mu \sim N\left(\frac{\frac{y_i}{\eta^2}+\frac{\mu}{\sigma^2}}{\frac{1}{\eta^2}+\frac{1}{\sigma^2}}, \frac{1}{\frac{1}{\eta^2}+\frac{1}{\sigma^2}}\right) $$


## 3

(a) Clarify the number of random parameters in the model 
- $\mu_{hrs}$~$\; Normal(0,1)$ - 전체 말들의 평균 능력 수준
- $\mu_{jcky}$ ~ $Normal(0,1)$ - 전체 기수들의 평균 능력 수준 
- $\sigma_{hrs},\sigma_{jcky}\;$ ~ $HalfCauchy(2)$ -  말, 기수 능력의 variability
- 데이터셋에 있는 말의 수를 $N_{hrs}$ 데이터셋에 있는 선수 수를 $N_{jcky}$
- $\Delta_{\text{hrs,i}}$ .  $N(0,1)$   - 각 말 i에 대해 표준 정규 분포에서 추출된 편차
- $\Delta_{\text{jcky,j}}$ ~ $N(0,1)$  - 각 선수 j에 대해 표준 정규 분포에서 추출된 편차 
- $distpref_{hrs,dist_type}$ ~ $Normal(0,1)$   - 말 i와 각 거리 유형 d 에 대한 선호도 
- $surfpref_{hrs,surf_type}$ ~ $Normal(0,1)$  -  말 i와 각 지면 유형 s 에 대한 선호도 

(b) 
![[Pasted image 20241111220247.png]]
(c)
고정된 숫자 대신 HalfNormal분포를 사용,
alpha의 분산을 sigma =2로 설정하여 가중치 부여 
MCMC샘플링으로 계수값 자동 학습
상호작용항 추가 
  
$\text{score} = \alpha \times \left( \text{horse\_skill\_speciality}_i - \text{horse\_skill\_speciality}_j \right) + \beta \times \left( \text{jockey\_power}_i - \text{jockey\_power}_j \right) + \gamma \times \left( \text{horse\_skill\_speciality}_i \times \text{jockey\_power}_i - \text{horse\_skill\_speciality}_j \times \text{jockey\_power}_j \right)$
![[스크린샷 2024-11-11 오후 11.55.59.png]]
(d)

![[스크린샷 2024-11-11 오후 11.56.34.png]]


![[스크린샷 2024-11-12 오전 12.00.07.png]]

![[스크린샷 2024-11-12 오전 12.01.18.png]]
- 말의 능력 추정치 & 특정 트랙과 거리 조합 

![[스크린샷 2024-11-12 오전 12.03.02.png]]

![[스크린샷 2024-11-12 오전 12.03.13.png]]
![[스크린샷 2024-11-12 오전 12.03.22.png]]