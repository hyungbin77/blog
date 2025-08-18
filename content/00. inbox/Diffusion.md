### 큰그림

프로세스 확장  차원은 상관없지만 1차원에서 확장한다

DDPM

$$dX_{t} = f(t,X_{t})dt + \sigma tdW_{t}$$

$W_{t}$ 는 random process 
$E[dW_{t}] = 0$
$Var(dW_{t}) = (\sigma t)$

여기서 t는 시간 , 즉, 증가하는 process 
현재를 보고 미래를 보고, 현재를 보고 어제를 예측

$t \in R^{+}$
backward
잡음으로 부터 signal을 만드는게 가능 

diffusion 확산 

$0,1,...,T$
- 본 강의에서는 정규분포 가정 
$$X_{t} = \sqrt{\alpha_{t}}X_{t-1} + \sqrt{1- \alpha_{t}} \varepsilon_{t} ,  \;\;  \epsilon_{t}  \;\; \textasciitilde  \;\; N(0,1)$$

1 시그널 2 노이즈 
proof 대상
$$X_{t} = \sqrt{\bar{\alpha_{t}}}X_{0} + \sqrt{1-\bar{\alpha_{t}}}\varepsilon_{t}$$
- 증명 
1. $t = 1$
2. if Eg holds when t ,
     Eg holds  t + 1
$X_{t+1} = \sqrt{\alpha_{t+1}}X_{t} + \sqrt{1-\alpha_{t+1}} \varepsilon_{t+1}$
$\;\;\;   = \sqrt{\alpha_{t-n}}(\sqrt{\bar{\alpha_{t}}}X_{0} + \sqrt{1-\bar{\alpha_{t}}}\varepsilon_{t}) + \sqrt{1- \alpha_{t+1}} \varepsilon_{t+1}$
쭉쭉 전개  = proof

---

$$X_{0} ->  -> -> -> X_{t}$$
- 확률이 의존하는 형태 
$X_{t} = \sqrt{\bar{\alpha_{t}}}X_{0} + \sqrt{1 - \bar{\alpha_{t}}}\varepsilon$

groundtruth = $X_{0}$
$X_{t}$는 가정된 값

$X_{0} = \frac{1}{\sqrt{\bar{\alpha_{t}}}}(X_{t} - \sqrt{1 - \bar{\alpha_{t}}} \varepsilon_{t})$

그냥 현재 값(t)를 대입해서 값을 구하면 되는거 아님? 
값은 forward에서 나왔음 

backward forward not exchangable

$X_{t} = X_{t-1} + \varepsilon$
$X_{t-1} = X_{t} +- \varepsilon$


$q = forward$
$p = backward$

forward process를 가지고 backward 형태를 알아보는 과정
$q(X_{t-1} | X_{t}, X_{0}) = \frac{q(X_{t}|X_{t-1},X) q(X_{t-1} |X_{0})}{q(X_{t}|X_{0})}$

- $X_{t}$ 항 무시
$exp(- \frac{1}{2}(1- \alpha t)^{-1}(X_{t} - \sqrt{\alpha t}X_{t-1})^{2})$
$exp(- \frac{1}{2}(1- \bar{\alpha_{t-1}})^{-1})(x_{t-1} - \sqrt{\bar{\alpha}_{t-1}}x_{0})^{2}$

~~~
엄준식
~~~
~~~
사진1
~~~


$$(\frac{\alpha_{t}}{1- \alpha_{t}} + \frac{1}{1-\bar{\alpha}_{t-1}})^{-1}$$
$$\frac{\sqrt{\bar{\alpha}_{t-1}}}{1- \bar{\alpha}_{t-1}}x_{0}  + \frac{\sqrt{\alpha}_{t}}{1- \alpha_{t}}x_{t}$$

~~~
사진3
~~~

---

### ELBO



둘을 가깝게 만드는 과정
VAE

$\log p(x) \quad (x, z)$
$\quad = \int \log p(x) q(z|x)dz$
$\quad= \int log \frac{p(x,z)}{p(z|x)}q(z|x)dz$
$\quad = \int \log \frac{p(x,z)}{p(z|x)}\frac{q(z|x)}{q(z|x)} q(z|x) dz$
$\quad = $



관측이 된 x의 확률

q가 모수에 대한 추정 posterior



---
### ELBO 분해 


$\int \log \frac{p(x,z)}{q(z|x)}q(z|x) dz$
$\quad = \int \log \frac{p(x|z)p(z)}{q(z|x)}q(z|x)dz$
$\quad \log p(x|z)q(z|x)dz - \int \log \frac{p(z)}{q(z|x)}q(z|x) dx$
뒷항 $Kh(q(z|x)p(z))$


$q(x_{0}) \prod_{t=1}^{T} q(x_{t}| x_{t-1})$
$p_{0}(x_{0:T} = p(x_{T}))\prod_{t=1}^{T} p(x_{t-1}|x_{t})$
$Kh(q|x_{1:T}|x_{0}) ~~~~$




---
뭘 하는가
$\int \log \frac{q(x_{1:T} | x_{0})}{p_{0}(x_{1:T}| x_{0})} q(x_{1:T} | x_{0}) dq$
$blabla$
$+++++. \quad =  ~~  +. ~~~~~$  

뒷항을 줄이자


$\int \log \frac{q(x_{1:T} | x_{0})}{p_{0}(x_{0:T})} q(x_{1:T}|x_{0})dq$
$\quad = \int \log \frac{q(x_{1:T} | x_{0})}{p_{0}(x_{0:T-1})p_{0}(x_{T})} q(--) dq$
$\quad =  ummmmm$









관련 논문 search 방향성을 확인

논문이 없는 이유

언제 어떻게 어떤 prompt로 만들었다

동향 파악, 이미 하고 있나? 

학술적 연구 explor


$$\begin{bmatrix}1&2&3 
\\ 2&4&6 \end{bmatrix}$$
$$\begin{bmatrix}1&2&0 \\ 0&0&1\end {bmatrix}$$




$$ Var(\sqrt{\alpha_t(1-\alpha_{t-1})} \varepsilon_{t-2}) = \alpha_t(1-\alpha_{t-1})$$
$$- Var(\sqrt{1-\alpha_t} \varepsilon_{t-1}) = 1-\alpha_t$$

$$Var(\text{두 노이즈 항의 합}) = \alpha_t(1-\alpha_{t-1}) + (1-\alpha_t) = \alpha_t - \alpha_t\alpha_{t-1} + 1 - \alpha_t = 1 - \alpha_t\alpha_{t-1}$$



we analyze --> we use

such as ~. lexical density  , + LDA   다 써 특성 

This leads to our primary research questions. 에서 

measurable set  XX. --> set으로 작성 

This lead X -> 그냥 our primary 

The novelty  ~. 에서    defined 사용 X   
-> work has two keys.  ,   contributions(X)
the novelty of this work has two keys that  ~~

==
boxplot 추가 







































