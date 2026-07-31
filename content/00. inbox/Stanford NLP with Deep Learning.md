---
title: Stanford NLP with Deep Learning
tags:
  - nlp
  - deep-learning
  - lecture-note
---

## Lecture 1 : Introduction and Word Vectors

### Human language and word meaning 
- Languages aren't static 

- GPT-2(2019) : An early step towards foundation models 
	- that could just generate fluent text , That really, until then, NLP systems had done a decent job at understanding certain facts out of text 

- Recent models
	- They are multimodal and can operate across modes

#### How do we represent the meaning of a word?
	Definition : meaning(Webster dictionary)
		- the idea that is represented by a word,phrase, etc.
		- the idea that a person wants to express by using words, signs, etc.
		- the idea that is expressed in a work of writing, art, etc.

		 Commonest linguistic way of thinking of meaning 
		    signifier (symbol) <=> signified (idea or thing)
			    = denotational semantics
		




이전엔  WordNet을 사용하여 단어 관계 학습 
- missing nuance, correct in some contexts, 
- Missing new meanings of words
- Subejctive
- Requires human labor to create and adapt
- Can't be used to accurately compute word similarity

#### Problem with words as discrete symbols
	In traditional NLP, we regard words as discrete symbols :
			hotel, conference, motel -  a localist representation
	Such symbols for words can be represented by **one-hot vectors

$$motel = [00001000] $$
$$hotel = [00001000]$$
Vector dimension = number of words in vocabulary (e.g., 5000,000+)
- 이들은 그냥 두 개의 다른 기호일 뿐, 관련성을 찾기가 힘들다 
- These two vectors are orthogonal(직교)
- There is no natural notion of similarity for one-hot vectors

"그래서 주변 의미를 같이 살펴보자!"

#### Representing words by their context
- Distributional semantics : A word's meaning is given by the words that frequently appear close-by
	- "You shall know a word by the company it keeps"
	- One of the most successful ideas of modern statistical NLP
- When a word w appears in a text, its context is the set of words that appear nearby 
- We use the many contexts of w to build up a representation of w 
![[Pasted image 20250320144050.png]]

#### Word vectors
- we will build a dense vector for each word, chosen so that it is similar to vectors of words that appear in similar contexts, measuring similarity as the vector dot(scalar)
  product
![[Pasted image 20250320152239.png]]
Note : <font color="#4f81bd">word vectors</font> are also called <font color="#4f81bd">(word) embeddings</font> or <font color="#4f81bd">(neural) word representations</font>
	    They are a <font color="#4f81bd">distributed</font> representation

임베딩 : ~ They know which words are similar to other words in meaning. we refer to them as embeddings because we can think of this as a vector in a high dimensional space, and so that we're embedding each word as a position in that high dimensional space.

#### Word meaning as a neural word vector - visualization
![[Pasted image 20250320153213.png]]
-> 일단 이해하기 쉽게 2차원에 임베딩 

이런것들을 어떻게 얻을 수 있냐? 이제 공부 

### Word2vec 
- is a framework for learning word vectors
idea 
- We have a large corpus("body") of text : a long list of words
- Every word in a fixed vocabulary is represented by a vector
- Go through each position t in the text, which has a center word c and context("outside") words o 
- Use the similarity of the word vectors for c and o to calculate the probability of o
  given c (or vice versa)
- Keep adjusting the word vectors to maximize this probability
![[Pasted image 20250320154831.png|250]]
- Example windows and process for computing $P(w_{t+j}|w_{t})$ 
![[Pasted image 20250320155559.png]]
#### Word2vec : objective function
- For each position t = 1,...,T , predict context words within a window of fixed size m, given center word $w_t$ . Data likelihood :
$$Likelihood = L(\theta) = \prod^{T}_{t=1} \prod_{-m\leq j \leq m , j != 0}P(w_{t+j} | w_{t}; \theta)$$
(계산 비용 , 최대값보단 최솟값을 구하는게 편함 등을 위한 trick)
The objective function $J(\theta)$ is the (average) negative log likelihood :
$$J(\theta) = -\frac{1}{T} logL(\theta) = -\frac{1}{T} \sum^{T}_{t=1}\sum_{-m\leq j \leq m  , j != 0} logP(w_{t+j} | w_{t} ; \theta)$$
<center>Minimizing objective function  ==  Maximizing predictive </center>

-> How to calculate $P(w_{t+j} | w_{t} ; \theta)$ ? 
	- We will use two vectors per word w :
		- $v_w$ when $w$ is a center word
		- $u_w$ when $w$ is a context word.       --> These word vectors are subparts of the 
											big vector of all parameters $\theta$
	- Then for a center word c and a context word o : 
$$P(o|c) = \frac{exp(u^{T}_{o}v_c)}{\sum_{w\in V}exp(u^T_w v_c)}$$







### Optimization basics 



### Looking at word vectors
