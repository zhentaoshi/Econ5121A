Identification is a slippery concept, perhaps because "identification" is such a common word that used and misused in various contexts. In econometrics, identification means, as OP pointed out, "假设我们的模型正确，在这个模型下可以找到一个确定的参数与数据匹配”。那些说identification来自于village fixed effect之类的人，they misunderstand the definition.   


A correctly specified model is the prerequisite for any discussion of identification. In reality, all models are wrong. Thus when talking about identification, we are indulged in an imaginary world. If in such a thought experiment we still cannot unique distinguish the true parameter of the data generating process, then identification fails. In other words, we cannot determine what is the true model no matter how large the sample is.   


On the other hand, in a panel data model with unobservable heterogeneity correlated with the regressors, if we do not control the fixed effect, the model is misspecified. In the misspecified model, the so-called parameter is the coefficient of the linear projection, but that parameter is almost always different from the structural parameter of economic interest.   


Besides the two cases that OP mentioned, we also see, in some applied paper, that people say that identification comes from instrumental variables. Such a claim is valid. There are two requirements for valid IVs: orthogonality and relevance. Orthogonality entails that the model is correctly specified, so that we can focus on relevance. If relevance is violated, meaning that the IVs are not correlated with the endogenous variable, then multiple parameters can generate the observable data. Identification, as in the standard definition in econometrics, breaks down.   
