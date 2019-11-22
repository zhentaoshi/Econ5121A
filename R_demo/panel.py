

# this exampe is modified based on
#  https://medium.com/pew-research-center-decoded/...
# using-fixed-and-random-effects-models-for-panel-data-in-python-a795865736ab

# import data 
import numpy as np
import pandas as pd
from linearmodels import PanelOLS
from linearmodels import RandomEffects


from linearmodels.datasets import jobtraining
data = jobtraining.load()
year = pd.Categorical(data.year)
data = data.set_index(['fcode', 'year'])
data['year'] = year

# random effect
exog_vars = ['grant', 'employ']
exog = sm.add_constant(data[exog_vars])
mod = RandomEffects(data.clscrap, exog)
re_res = mod.fit()
print(re_res)

mod = PanelOLS(data.clscrap, exog)
re_res = mod.fit()
print(re_res)