
Fully Fine-Tuning이 힘든 이유 
- LLM의 weight은 최소 1.5 ~ 3B


*Main Goal*
- LoRA for training large size model by rank decomposition metrics.
- 어떻게 large size 모델을 학습할 수 있는지? 

기존 문제들 
- fine-tuning 은 보통 적은 데이터로 하고, overfitting 등 일반화 성능을 떨어트릴 수 있다 
- 많은 양의 labeling 된 데이터가 필요함
- 복잡도가 높음 (complexcity)
- 어댑터는 순차... 병렬 처리 GPU 비효율적 
- parameter가 많아지면 (layer가 많아지면)
- 