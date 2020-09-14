#!/usr/bin/env python
# coding: utf-8

# # This notebook graphs the sales and expenditure data of OTC codeine for 31 countries

# In[1]:


import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
 
#and make the plots appear in the notebook
get_ipython().run_line_magic('matplotlib', 'inline')


# # Import data

# In[2]:


df1 = pd.read_csv("/Users/georgiarichards/Desktop/Python/OTC/otc_sales_long2.csv")
df1


# In[3]:


df1.info()


# In[4]:


df1.describe()


# # Graphing data

# In[5]:


# this code increases the size of the figures  
fig_size = plt.rcParams["figure.figsize"]
fig_size[0] = 10
fig_size[1] = 6
plt.rcParams["figure.figsize"] = fig_size


# # COUNTS - all items sold 

# In[6]:


# this graphs the total number of items sold in all 31 countries 
fig1 = sns.lineplot(data=df1, 
                    x='year', y='countpop', 
                    hue='Country',
                    palette="bright",
                    marker='o') 
plt.xlabel(" ")
plt.ylabel("No. of items per 1,000 population", fontsize= 12)
plt.legend(loc='upper right', bbox_to_anchor=(1.2, 1))
plt.savefig('fig1.png')
fig1


# In[7]:


# Now I drop countries ranked 9-31 to graph the top 8 countries for sales volumes
df2 = df1 
df2 = df2.set_index("Country2")
df2 = df2.drop("Japan")
df2 = df2.drop("Estonia")
df2 = df2.drop("Switzerland")
df2 = df2.drop("Finland")
df2 = df2.drop("Romania")
df2 = df2.drop("Netherlands")
df2 = df2.drop("Bulgaria")
df2 = df2.drop("Slovenia")
df2 = df2.drop("Slovakia")
df2 = df2.drop("Lithuania")
df2 = df2.drop("Belgium")
df2 = df2.drop("Mexico")
df2 = df2.drop("Canada")
df2 = df2.drop("Russia")
df2 = df2.drop("USA")
df2 = df2.drop("Greece")
df2 = df2.drop("Thailand")
df2 = df2.drop("Germany")
df2 = df2.drop("Argentina")
df2 = df2.drop("Portugal")
df2 = df2.drop("Italy")
df2 = df2.drop("Brazil")
df2 = df2.drop("Spain")
df2


# In[8]:


# graphing the top 8 countries for volume sales [all counts] of OTC codeine 
fig2 = sns.lineplot(data=df2, 
                    x="year", y="countpop", 
                    hue="Country", palette="bright",
                    style="Country",
                    markers=True, dashes=False) 
plt.xlabel(" ")
plt.ylabel("No. of items per 1,000 population", fontsize= 12)
plt.legend(loc='upper right', bbox_to_anchor=(1.2, 1))
plt.savefig('fig2.png')
fig2


# # Public expenditure 

# In[9]:


# this graphs the public expenditure for all 31 countries  
fig3 = sns.lineplot(data=df1, 
                    x='year', y='costpop', 
                    hue='Country',
                    palette="bright",
                    marker="o") 
plt.xlabel(" ")
plt.ylabel("Public expenditure (£) per 1,000 population", fontsize= 12)
plt.legend(loc='upper right', bbox_to_anchor=(1.2, 1))
plt.savefig('fig3.png')
fig3


# In[10]:


# removing Ireland to see spread of other countries 
df3 = df1 
df3 = df3.set_index("Country2")
df3 = df3.drop("Ireland")

fig4 = sns.lineplot(data=df3, 
                    x='year', y='costpop', 
                    hue='Country',
                    palette="bright",
                    marker="o") 
plt.xlabel(" ")
plt.ylabel("Public expenditure (£) per 1,000 population", fontsize= 12)
plt.legend(loc='upper right', bbox_to_anchor=(1.2, 1))
plt.savefig('fig4.png')
fig4


# In[11]:


# this graphs the public expenditure in countries ranked 1-8  
fig5 = sns.lineplot(data=df2, 
                    x='year', y='costpop', 
                    hue='Country', palette="bright",
                    style="Country",
                    markers=True, dashes=False) 
plt.xlabel(" ")
plt.ylabel("Public expenditure (£) per 1,000 population", fontsize= 12)
plt.legend(loc='upper right', bbox_to_anchor=(1.2, 1))
plt.savefig('fig5.png')
fig5


# # BY FORMULATIONS 

# # TABLETS - counts 

# In[39]:


dftab = pd.read_csv("/Users/georgiarichards/Desktop/Python/OTC/otc_tabs.csv")
dftab


# In[40]:


# drop countries that don't sell tablets 
dftab = dftab.set_index("Country2")
dftab = dftab.drop("Italy")
dftab = dftab.drop("Netherlands")
dftab = dftab.drop("Mexico")
dftab = dftab.drop("Greece")
dftab = dftab.drop("USA")
dftab = dftab.drop("Finland")
dftab = dftab.drop("Argentina")
dftab


# In[41]:


# graphing sales for all countries selling tablets  
fig9 = sns.lineplot(data=dftab, 
                    x='year', y='countpoptab', 
                    hue='Country',
                    palette="bright",
                    marker="o") 
plt.xlabel(" ")
plt.ylabel("No. of tablets per 1,000 population", fontsize= 12)
plt.legend(loc='upper right', bbox_to_anchor=(1.2, 1))
plt.savefig('fig9.png')
fig9
# redo graph with diff colors for countries after 10 (or use different markers??)


# In[ ]:




