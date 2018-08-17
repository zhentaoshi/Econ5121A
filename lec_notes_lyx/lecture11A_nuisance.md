In a regression \\(y = x\beta + \epsilon \\), the asymptotic distribution is jointly normal. 
\\[
\hat{\beta} \sim  N(0, \Omega).
\\]

If we only want to test \\(H_0: \beta_1 = 0 \\), we can simply use use \\( \hat{\beta_1} \sim N(0, \sigma_{11} ) \\). The marginal distribution of a component in the joint normal is simple the corresponding part.

In the $t$ test, the statistic is
\\[
t = (\hat{\beta_1} - \beta_{01})/ se(\hat{\beta}_1).
\\]
No other (nuisance) parameter is involved.

In the Wald test,
\\[
W(\sigma) = (R \hat{\beta} - \beta_{10})^2 / (\sigma^2 R (X'X)^{-1} R' ),
\\]
so that we have a *nuisance* parameter \\(\sigma\\). Fortunately, by the **Slutsky Theorem**, 
\\[
W(\hat{\sigma}) = (R \hat{\beta} - \beta_{10})^2 / (\hat{\sigma}^2 R (X'X)^{-1} R' ) = W(\sigma) \times (\sigma^2 / \hat{\sigma}^2).
\\]
As long as  \\(\sigma^2 / \hat{\sigma}^2 \to_{p} = 1 \\), we have \\(W(\sigma) \sim W(\hat{\sigma})\\).

However, if the nuisance parameter enters the test statistic in a more complicated manner, then the asymptotic distribution is not that easy. Simply replacing the unknown nuisance parameter by a consistent estimator is not enough. 

The ultimate technique is to use the partitioned information matrix. We partition the parameter into two components, one for the parameter of interest, and the other for the nuisance parameter. Accordingly, the entire information matrix is partitioned into four blocks. To test the parameter of interest, we need to estimate the nuisance parameter given the parameter of interest, and then the information matrix argument follows. 

In the special case that the parameter of interest and the nuisance parameter are asymptotic independent, which means that the off-block parts of the covariance matrix are all zeros, then the inverse of the information matrix is the inverse of each diagonal block. In this case we do not have to worry about the asymptotic variance of the nuisance parameter. We simply substitute the estimate nuisance parameter.


