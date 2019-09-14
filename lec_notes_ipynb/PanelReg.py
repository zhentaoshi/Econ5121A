


#%%
import numpy as np
from statsmodels.datasets import grunfeld

data = grunfeld.load_pandas().data
data.year = data.year.astype(np.int64)
# MultiIndex, entity - time
data = data.set_index(['firm','year'])
from linearmodels import PanelOLS
mod = PanelOLS(data.invest, data[['value','capital']], entity_effects=True)
res = mod.fit(cov_type='clustered', cluster_entity=True)


#%%
from linearmodels import PanelOLS
mod = PanelOLS.from_formula('invest ~ value + capital + EntityEffects', data)
res = mod.fit(cov_type='clustered', cluster_entity=True)


#%%
