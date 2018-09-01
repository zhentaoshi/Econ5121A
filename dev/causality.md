Unlike physical laws such as $E=mc^2$, economic phenomena can rarely be summarized in a minimalistic style. When using experiments to verify physical laws,
scientists often manage to come up with smart design in which signal-to-noise ratio
is so high that the small disturbances are kept at negligible level.
On the contrary, economic laws do not fit a laboratory for experiment.
What is worse, the subjects in economic studies---human beings---are heterogeneous and
with many features hard to control. People from distinctive cultural and family background respond to the
same issue differently and
researchers can do little to homogenize them.
The signal-to-noise ratio in economic laws are usually significantly lower than that of physical laws,
mainly due to the lack of laboratory setting and the heterogeneous nature of the subjects  

**Example**: Educational return and the demand-supply system are two classical topics in econometrics.
The former faces two major difficulties: (i) learning ability is hard to measure; (ii) people are different.
The trouble plagues the second is (i) no laboratory to allow the research to move keep one side constant
and only manipulate the other side; (ii) markets are different locations are also different.


### Thought Experiment

The mainstream paradigm in econometrics and statistics is setting up a model, and use the data to estimate
some unknown components of the model. The model is written with the purpose of either interpret the
relationship between random variables or predict a variable of interest.
If the purpose is interpretation, the model is viewed as a data generating process, that is, how the
data is generated.

Suppose the DGP is as simple as possible,

Pearl argues that econometrics takes a deterministic view, and the uncontrolled part is the unobservable factors. If the factors are observable, there
is no uncertainty in the economic laws. In this view, the distribution of the error
term is simply the weight of the unobservable factor.
Also, the coefficient can be directly interpreted as the *ceteris paribus*, which is
a Latin phrase meaning "keep all other things constant."
$$y = \beta x + u$$


Ideally, we would like to keep all other things the same can apply different levels of treatment to
the same object. However, this is philosophically impossible since "You cannot step into the same river twice."
(Heraclitus, 553 BC--475 BC)
For physical objects, it is often possible to apply various treatment levels onto the same object as long
as the inner structure of the objects is little altered by the previous treatment.
The *treatment effect* is
$$ TE = TE(x_1, x_2) = \frac{y(x_1) - y(x_2) }{x_1-x_2}
= \frac{ (\beta x_1 + u) - (\beta x_2 + u) }{x_1-x_2} = \beta  $$
at two treatment levels $x_1$ and $x_2$, $x_1 \neq x_2$.
Here we use discrete treatment for simplicity. If the treatment can be specified arbitrarily close, then $x_1 - x_2 \to 0$ and
$$TE(x_1) = \frac{\partial y(x)} { \partial x } \bigg |_{x = x_1}.$$


However, such invariance to treatment is unavailable to living things. A person who receives high school education
cannot be reduced to a person who receives elementary school education. Thus in order to learn the treatment
effect, we need to put different people into at least two groups: a treatment group and a control group.


However, according to the classification of Pearl, we have to distinguish the
statistical model and the causal model. The statistical model are functions of the
observable variables.




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
and the heterogeneous about the subject.

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
