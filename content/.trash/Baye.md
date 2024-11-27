

compute likelihood hard at high-dimensional data
Simulation-Based Inference (SBI)

Classical apporach : ABC

 +SMC - ABC

ML Approach : Generatre Data - Parameter pairs$(X^{(j)},\theta^{(j)})$
	- *NPE*
	- NLE
	- NRE
	- Other Techniques
		- SBI with quantile regresion

- Amortization of inference
	- Ability to conduct infe



### Example

The Ornstein-Uhlenbeck(OU) process
$$dX_t = k(\beta - X_k) ~~$$

- Conformal Prediction
	- constructs a distribution-free and finite-sample prediction interval
- Exchangibility of Residuals
- Construction of Interval
- Limitations
	- There is no non-trivial finite-sample, distribution-free conditional converage
	  guarantee
- Construct the prediction interval
- Here, h plays the same role as $\epsilon$  the rejection threshold in ABC
- This C_mu satisfies asymptotic conditional converage


earning posterior with out using likelihood

- A good performance measure in SBI


---
Challenge 1 : when prior knowledge of the weights is not available , choosing a priori is a challenging task
Challenge 2: computing the posterior distribution is generally intractable.




