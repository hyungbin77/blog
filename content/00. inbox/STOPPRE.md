---
title: STOPPRE
tags:
  - paper-review
  - nlp
  - llm
---

- Roberta -  더 많이 학습, betch 사이즈가 큼 
-  NLP classification 관련 4개의 domain, 8개의 task에서 Domain- and Task-adaptive pretraining에 대한 철저한 분석을 진행함
- Domain 및 Task 전반에 걸쳐 adapted language model의 tranferability 에 대한 연구 수행
- Task adaptive pretraining 수행시 사람이 직접 augmentatioin 하는 방식과 , kNN을 활용해 자동적으로 augmentation하는 방법의 효과 강조 
#### Dataset 
Figure 2. 각 도메인 별로 상위 10K 단어를 가지고 voca overlap을 표시한 단어 
Table3.    DAPt가 Baseline보다 대부분 성능이 좋음 ,MLM Loss 변화에서 시사했던 것처럼 BM과 CS domain에서 효과가 가장 두드러짐. Target domain과 dissimilar한 domain으로 확인한 결과, 오히려 baseline보다 성능이 떨어짐, 이는 DAPT 수행시, 단순히 더 많은 데이터에 노출 시키는 것보다, domain-relevant가 중요하다는것을 시사함, CHemPROt : 화학물질- 단백질 관계 분류 작업 , RCT : 의학 초록에서 문장의 역학 분류 작업 

Table4. Domain간 유사도가 높다면, 긍정적인 transfer 효과를 보일 수 있음, News로 추가 사전학습한 DAPT 모델을 REVIEW에서 괜찮은 성능을 보임 

TAPT 각 domain 별로 2개의 task에서 추가 사전학습을 진행하여 task 당 1개의 language model 생성. DAPT보다 데이터 수가 적지만, task-specific하기 때문에 효율적 
table5. task data가 적음 CS  ,
Table 6.같은 domain안에서 특정 task를 가지고 pretraining을 해서 결과를 확인했는데 ,t는 같은 domain이지만, 다른 task 정보 전달이 잘되나? 를 확인하는 실험 , task2를 가지고 train를하고, task1으로 확인. 같은 domain이라도 task 별로 데이터 분포가 다를 수 있음 5.AUGMENTING TAPT가 데이터가 적은 문제가 있음, 성능을 높이기위해, 효율적, HUMAN CURated-TAPT, 사람이 직접 unlabeled corpus에서 task 관련 corpus를 선별하여 data augmentation을 진행  
Table7  180k -> 500examples로  
table 10. downstream target domain과 유사한 corpus로 pretrainin을 추가하면 도움이 되는가? , pretrain 에서 비슷한 task를 본적이 있으면 도움이 되는가.

Figure 3. Task data와 가까운 데이터를 인간 X 뽑아줌(비용,어려움) , task 주변에 있는 데이터를 선별하는  task distribution과 관련된 데이터를 샘플링하는 방법 , 합리적인 시간내에 모든 문장들을 embedding할 수 있을 정도로 가벼운 모델이 필요함, 
unlabeled text ->  text의 Word Frequencie를 input과 target으로 설정하여 VAE를 학습함, 학습된 VAE의 encoder로 text embedding을 진행함, task와 domain corpus가 같은 공간에 embedding 될 수 있도록 학습시킴 
결론. 여러 실험 결과, LM은 도메인 특성에 따른 complexity(복잡도)를 인코딩하는 것에 어려움이 존재함. 특정 domain 또는 task에 대해 모델을 추가 pretraining하면 성능을 향상 시킬 수 있음 , Language model을 고도화하기 위해, domain 및 task에 적합한 corpus를 추가 사용하는 것이 중요함 , pretraiinng 설계 발전 


