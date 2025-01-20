## ABSTRACT

- Gibbs Sampling 을 사용한 베이지안 추론(Bayesian inference Using Gibbs Sampling,BUGS)을 활용한 전염병 모델링에서 베이지안 추론은 컴퓨팅 및 모델 개발의 발전..
- BUGS가 MCMC 방법을 쉽게 구현할 수 있는 능력은 베이지안 분석을 전염병 모델링의 주류로 이끌었음
- 계산 복잡도의 증가 
	- parameters 수의 증가
	- large datasets 
	- spatial & temporal 

## Introduction

### BUGS
- graphical modelling theory을 사용하여 MCMC 알고리즘인 Gibbs sampling을 구현 

### JAGS 를 선택한 이유
- JAGS에서 공간적 변형(spatial variations)을 베이지안 모델에 통합할 수 있도록 하는 주요 구성 요소는 GeoJAGS라는 확장 모듈 
- 모델 텍스트라는 스크립트를 통해 사용자로부터 모델 설명을 가져오며, 이 스크립트는 back-end 에서 계산을 실행하기 전에 방향성 비순환 그래프(directed acyclic graph,DAG)로 변환 
- 전염병 모델에 공간적 및 시간적 구성 요소가 있는 경우 모델 텍스트에서 for-loop을 설정하는 방법
	1. 중첩 인덱싱(nested indexing)을 사용하여 공간적 구성 요소를 관측치와 연결하는 1차원(1-Dimension,1D) for-loop를 사용하는 것 
	2. 시간 및 공간 요소를 반복하기 위해 중첩 인덱싱 없이 2차원(2-Diemnsion,2D)에서 두 개의 for-loop를 사용하는 것 
	- 1D 인덱싱에서는 관측치를 공간 및 시간 구성 요소에 연결하기 위한 추가 정보가 필요하여 DAG의 크기가 증가
- 이전 연구들은 Nimble과 같은 새로운 소프트웨어를 도입하거나 , 새로운 알고리즘을 도입 
- BUGS 계열의 계산 복잡성을 개선하기 위한 인덱싱 전략의 효과를 조사하지 않음 
***두 전략의 효율성 차이를 파악하고 실무자에게 보다 효율적이고 시기 적절한 모델 구현을 안내***
***GeoJAGS 사용법 설명 & ifelse()문의 사용을 통해 JAGS에서 1D 및 2D 인덱싱이 DAG의 전체 크기와 그에 따른 실행 시간에 미치는 영향을 분석***


![[Pasted image 20241218162808.png]]

![[Pasted image 20241218162825.png|500]]

![[Pasted image 20241218162848.png|600]]


 또 다른 고려 사항
	 - 사전 분포(prior distributions)가 실행 시간에 미치는 영향 
		 1. 만약 사전 분포가 다른 수의 매개변수(parameters)를 가진 다른 분포로 대체되면
		    전체 DAG의 크기, 알고리즘 복잡성 및 실행 시간이 그에 따라 변경됨
		 2. 새 사전 분포가 난수 생성(random number generation)에 다른 알고리즘 복잡성을 요구하는 조건부 분포(conditional distribution)로 이어진다면, 각 노드에서 소요되는 시간과 전체 실행 시간이 그에 따라 바뀜  



ifelse() 문 