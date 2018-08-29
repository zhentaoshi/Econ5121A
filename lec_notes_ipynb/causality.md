Unlike physical laws such as $E=mc^2$, economic phenomena can rarely be summarized by in a minimalistic manner.

Physical laws has strong signal-to-noise ratio.
Economic laws usually do not have laboratory for experiment.
Moreover, because the subject are human beings. Human beings are heterogenous and hard to control.

**example**: the boiling point of water. is affected by the purity of the water and the air pressure. If the water from different origins are
different, it is still easy to distill and purify.
However, humans from different culture background and family background are heterogenous and their is no way to "purify" them to be homogenous.

These are the difficulties that economists are faced with. If we control only very few factors, the signal-to-noise ratio is quite low.

**example**: educational return. Demand/supply elasticity. Think about experimental context when we have control of price.


### World View

About the DGP. Pearl argues that econometrics takes a deterministic view, and the uncontrolled part is the unobservable factors. If the factors are observable, there
is no uncertainty in the economic law. In this view, the distribution of the error
term is simple the weight of the unobservable factor.

Also under this view, the coefficient can be directly interpreted as the "ceteris paribus" (keep all other things constant.) There should no qualifiers like "on average".


However, according to the classification of Pearl, we have to distinguish the
statistical model and the causal model. The statistical model are functions of the
observable variables.

For physical objects, we can apply different level of treatment onto the same object.
We push a wooden block on a slope of 45 degree, and then put it to a slope of 30 degree.
The temporal order of the experiment does not usually cause any difficulty.

However, the case if different from economics. A person who receive high-school degree cannot be later inject with junior school degree. An object can only receive a treatment once. "A person cannot step into the same river twice."

The *treatment effect* is
$$ \beta_1 = \frac{y(x_1) - y|(x_2) }{x_1-x_2}. $$
When $x_1 - x_2 \to 0$, it becomes the partial effect
$\beta_1 = \partial y(x) / \partial x$.

When one person cannot be treated twice, two different people who received different
level of treatment still have their unobservable factor out of control.
To access the treatment effect in this context, we can only take average in the treatment group and the control group.
$$ \beta_1 = \frac{E[y|x_1] - E[y|x_2]}{x_1-x_2} $$
Notice the first equation obviously implies the second one.


In order for the second one to be interpreted as the treatment effect, the underlying
assumption is $E[e | x_1] = E [ e | x_2 ]$. The is the *exogeneity* assumption
that cannot be verified from the observable variable. Under exogeneity,
we also have
$$\beta_1 = \frac{ E\left[  y(x_1) - y(x_2) \right] }{x_1 - x_2} ,$$
and this is called the *average treatment effect (ATE)*.

additional note: the formal name of exogeneity is *conditional independence assumption (CIA).*

In an observable study, we can no longer control $x$. Instead, we observe
that $x$ comes at different frequency, or probability.
In the statistical model without the idea of treatment,
$$   \frac{E[xy]}{var[x]} = \frac{E[x(x \beta_1 + e )]}{var[x]}
= \beta_1 + \frac{E[xe]}{ var[x] }.$$

?? By the law of iterated expectations, it should be easy to construct an example
$$ E[ex] = E[ x E[e|x] ] .$$
$x \in \{1,2\}$ with probability 2/3 and 1/3, respectively. $E[e|x = 1 ] = 1$ and $E[e | x = 2 ] = -1.$ In this example, $e$ is not mean independent of $x$, but they are uncorrelated.

In the above example, the coefficient $\beta_1$ is merely a statistical coefficient,
or a function of the observable data but no longer maintains the causal interpretation. The treatment effect from $x=1$ to $x=2$ as in the second equation will be
$$\frac{ (-1 + 2\beta) - (1 + \beta ) } { 2-1 } =  \beta -2  $$


Now suppose the causal interpretation is desirable, the next question is how to
establish a causal interpretation.

The idea case is that we can have an experimental setting for a control group
 and the treatment group. If we can argue the "stable condition", then we can
convincingly argue for causality. This is the case of animal subject in medical
study.

Even when there is no genuine laboratory setting, economists seeks "quasi-natural
experiment", which mimics the lab. Then the key is to verify the condition
and the heterogenous about the subject.

There are some other techniques to make the conditional mean independence more plausible.
For example, looking for IV, or add more control variables (to make them
more homogenous. Add air pressure to make the pure water in Hong Kong and in Tibet
more comparable.)

Other than these cases, it seems to me that we cannot argue for causality in the narrow
sense as defined in the second equation. However, the statistical parameter is
not completely useless.

* If the population coefficient is 0, It at least can say that from the observed data at hand,
we have found no evidence.
* If the coefficient is non-zero, we can at least say that we detect
association between $y$ and $x$

If we want to further interpret it to be causal, we will need extra assumptions.
