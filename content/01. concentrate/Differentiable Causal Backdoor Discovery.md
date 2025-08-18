
## Abstract 

- ***gradient-based optimization method***로 적절한 조정(adjustment)을 찾기 위해 
  도구변수와 유사한 보조 변수(**auxiliary variables**)를 활용 
- 전체 causal graph에 대한 지식 없이도 진정한 인과적 효과를 추정하는 데 유용함

## Introduction

![[Pasted image 20241219204907.png|500]]

- 관측된 변수(X)만으로 Y(outcome) 의 값, 변동을 알아내는 건 unobserved variables에 의해 교란(confounded) 될 수 있음
- confounder를 잘 block하면 문제가 풀리지만 어려움
	- ex) causal discovery algorithms을 사용하여 많은 인과 그래프를 식별한 다음 조정 
		- combinatorial optimization problem
		- conditional independences 집합을 암시하는 Markov-equivalent 그래프 집합
		- 차원이 증가함에 따라 검정력(power)이 급격히 감소하는 다중 독립성 제약 조건 
		  테스트의 조합을 필요로 함



