
- 비슷한것은 가깝게 다른것은 멀게 가능한한 평면상에 눌러 배치하려면
	- 얼마 비슷하고/가깝고  다른지/먼지 유사도(similarity)의 정의가 필요
	- 가까운것과 먼것을 얼마나 동질적으로 다룰지 무차별도(perplexity)를 설정 
		- 한 점에서 다른 모든 점으로의 거리를 확률분포로 나타내면 

ex) 확률로 나타낸다? 삼성전자와 다른 종목과의 확률분포 

초기값을 뿌려놓고 유사

적당한 perplexity 가 필요함  


#### 세부사항
- 유사도/거리 측정방법이 중요함
	- 유클리디안 거리 : 차원마다 값차이의 제곱합, 공간상에 실제거리측정(지도상 거리측정)
	- 코사인 유사도 : 빈도나 비율의 연관도를 측정, 주로 문서간 유사도로 사용 
- 이름이 t-distributed로 시작하는 이유
	- 결과 유사도로부터 결과확률분포를 계산시 스튜던트 t분포를 가정하기 때문
	- 스튜던트 t분포의 두터운 꼬리 덕분에 오류 수정의 단위가 크고 그렇게 때문에 학습시간을 단축할 수 있음 

### The curse of Dimensionality 차원의 저주 
- High-dimensional datasets are at risk of being very sparse : most training data points are likely to be far away from each other
- One solution to the curse of dimensionality could be to increase the size of the training set to reach a sufficient density of training data points 

![[스크린샷 2024-11-08 오후 5.29.03.png]]
-> 빈 단위 공간 , 모델이 해당 공간들의 정보를 다 배울 수가 없다, 3차원이면 $n^3$이 있어야 잘 learning시켜줄 수 있다, 차원이 증가할수록 모델을 building하기위해서 데이터의 수가 exp로 증가한다 

- Many machine learning problems involve thousands of even millions of features for each training data point
	- It makes training extremely slow
	- It makes it much harder to find a good solution
	- Much more training data is needed
- In real-world problems, it is often possible to reduce the number of features considerably, turning an intractable problem into a tractable one without losing much information


- Projection (e.g., PCA,...)
	- *Assumption*  : The data lie within (or close to) a much lower-dimensional subspace(linear 한 ) of the high-dimensional space. Training data points are not spread out uniformly across all dimensions : Many features are almost constant, while others are highly correlated.
	- Projection algorithms choose an "interesting" linear projection of the data. These methods can be powerful, but often miss important non-linear structures in the data
	- project 안된건 덜 즁요하다 
- Manifold Learning (e.g, t-SNE,...)
	- *Assumption* : The data lie within (or close to) a much lower-dimensional manifold. This assumption is very often empirically observed.
	- Manifold learning algorithms work by modeling the manifold on which the training data points lie.
	- They allow for much more complex mappings, and often provide better visualizations, especially for non-linear structures of the data. 
	- 복잡한, 비선형적인 subspace 

![[스크린샷 2024-11-08 오후 6.19.24.png]]
manifold -unrolling 

- Notes on Manifold learning 
	- Manifold learning algorithms are mainly aimed at visualization, and so are rarely used to generate more than two or three new features
	- Manifold learning can be useful for exploratory data analysis but is rarely used if the final goal is supervised learning
	- The typical manifold learning problems are unsupervised : they learn the high-dimensional structure of the data from the data ifself without the use of class labels.


### t-Distributed stocahstic Neighbor Embedding
- t-SNE reduces dimensionality while trying to keep similar data points close and dissimilar data points apart, based solely on how close points are in the original space.
- The idea behind t-SNE is to find a low-dimensional representation of the data that preserves the distances between points as best as possible
	- t-SNE starts with a random representation for each data point
	- Then, it tries to make...
		- points that are close in the original feature space closer (more emphasis on this)
		- points that are far apart in the original feature space farther apart 
	- t-SNE is mostly used for visualization, in particular to visualize clusters of data points in high-dimensional space. It dosen't allow transformations of new data 

원래 거리를 가우시안 분포로 표현하게 됨 

거리에 대한 distribution  t-분포  저차원 

반복에 사용되는 cost function C : $$\Sigma_iKL(P_i|Q_i) = \Sigma_i\Sigma_{j}p_{j|i}log$$

-> 원래 차원에서의 거리의 분포와 저차원 projected 거리의 분포 distance를 costfunction이를 감소시키는 








