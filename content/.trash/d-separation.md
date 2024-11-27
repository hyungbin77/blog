
>[!caution]- read 
>2.4 D-separation 인과 관계 모델은 일반적으로 지금까지 살펴본 사례처럼 단순하지 않습니다. 특히, 그래픽 모델이 변수 사이의 단일 경로로 구성되는 경우는 드뭅니다. 대부분의 그래픽 모델에서 변수 쌍은 변수를 연결하는 여러 개의 가능한 경로를 가지며, 각 경로는 다양한 chain, forks, colliders를 통과하게 됩니다. 문제는 해당 그래프에서 생성된 모든 데이터 세트가 공유하는 종속성을 예측하기 위해 어떤 복잡성의 그래픽 Causal 모델에 적용할 수 있는 기준이나 프로세스가 있는지 여부입니다.


> [!PDF|red] [[CAUSAL INFERENCE IN STATISTICS.pdf#page=66&selection=167,1,186,33&color=red|CAUSAL INFERENCE IN STATISTICS, p.66]]
> > he reasoning behind these points goes back to what we learned in Sections 2.2 and 2.3. A collider does not allow dependence to flow between its parents, thus blocking the path. But Rule 3 tells us that when we condition on a collider or its descendants, the parent nodes may become dependent. So a collider whose collision node is not in the conditioning set Z would block dependence from passing through a path, but one whose collision node, or its descendants, is in the conditioning set would not
> 
> ..






