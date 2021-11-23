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


df1 = pd.read_csv("/Users/georgiarichards/Desktop/Python/OTC/data_otc_long.csv")
df1.head()


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


# doseage units sold per 1000 of the population in 31 countries - adjusted using IQVIA coverage
fig1a = sns.lineplot(data=df1, 
                    x='year', y='countpopadj', 
                    hue='Country',
                    palette="bright",
                    marker='o') 
plt.xlabel(" ")
plt.ylabel("Adjusted dosage units per 1000 population", fontsize= 12)
plt.legend(loc='upper right', bbox_to_anchor=(1.2, 1))
plt.savefig('fig1a.png')
fig1a


# In[7]:


# Now I drop countries ranked 9-31 to graph the top 8 countries for sales volumes
df2 = df1
df2 = df2.set_index("country2")
df2 = df2.drop("Serbia")
df2 = df2.drop("Switzerland")
df2 = df2.drop("Estonia")
df2 = df2.drop("Netherlands")
df2 = df2.drop("Finland")
df2 = df2.drop("Romania")
df2 = df2.drop("Bulgaria")
df2 = df2.drop("Slovakia")
df2 = df2.drop("Slovenia")
df2 = df2.drop("Lithuania")
df2 = df2.drop("Belgium")
df2 = df2.drop("Mexico")
df2 = df2.drop("Russia")
df2 = df2.drop("Canada")
df2 = df2.drop("USA")
df2 = df2.drop("Greece")
df2 = df2.drop("Thailand")
df2 = df2.drop("Germany")
df2 = df2.drop("Argentina")
df2 = df2.drop("Italy")
df2 = df2.drop("Portugal")
df2 = df2.drop("Brazil")
df2 = df2.drop("Spain")
df2.head()


# In[8]:


# graphing the top 8 countries [by mean sales of OTC codeine] - adjusted using IQVIA coverage

plt.figure(figsize=(10,6))

fig2a = sns.lineplot(data=df2, 
                    x="year", y="countpopadj", 
                    hue="Country", palette="bright",
                    style="Country",
                    markers=True, dashes=False) 


plt.xlabel(" ")
plt.ylabel("Adjusted dosage units per 1000 population", fontsize= 15)
plt.legend(loc='upper right', bbox_to_anchor=(1.2, 1))
plt.savefig('fig2a.png')
fig2a


# In[9]:


# Now I drop countries ranked 1-8 and 17-31 to graph the next 8 countries for sales volumes
df3 = df1 
df3 = df3.set_index("country2")
df3 = df3.drop("South Africa")
df3 = df3.drop("Ireland")
df3 = df3.drop("France")
df3 = df3.drop("UK")
df3 = df3.drop("Latvia")
df3 = df3.drop("Japan")
df3 = df3.drop("Croatia")
df3 = df3.drop("Poland")
df3 = df3.drop("Slovenia")
df3 = df3.drop("Lithuania")
df3 = df3.drop("Belgium")
df3 = df3.drop("Mexico")
df3 = df3.drop("Russia")
df3 = df3.drop("Canada")
df3 = df3.drop("USA")
df3 = df3.drop("Greece")
df3 = df3.drop("Thailand")
df3 = df3.drop("Germany")
df3 = df3.drop("Argentina")
df3 = df3.drop("Italy")
df3 = df3.drop("Portugal")
df3 = df3.drop("Brazil")
df3 = df3.drop("Spain")
df3.head()


# In[10]:


# graphing countries ranked 9-16 for mean volume sales of OTC codeine - adjusted with IQVIA coverage
fig2b = sns.lineplot(data=df3, 
                    x="year", y="countpopadj", 
                    hue="Country", palette="bright",
                    style="Country",
                    markers=True, dashes=False) 
plt.xlabel(" ")
plt.ylabel("Adjusted dosage units per 1000 population", fontsize= 15)
plt.legend(loc='upper right', bbox_to_anchor=(1.2, 1))
plt.savefig('fig2b.png')
fig2b


# In[11]:


# Now I drop countries ranked 1-16 and -31 to graph the next 8 countries for sales volumes
df4 = df1 
df4 = df4.set_index("country2")
df4 = df4.drop("South Africa")
df4 = df4.drop("Ireland")
df4 = df4.drop("France")
df4 = df4.drop("UK")
df4 = df4.drop("Latvia")
df4 = df4.drop("Japan")
df4 = df4.drop("Croatia")
df4 = df4.drop("Poland")
df4 = df4.drop("Serbia")
df4 = df4.drop("Switzerland")
df4 = df4.drop("Estonia")
df4 = df4.drop("Netherlands")
df4 = df4.drop("Finland")
df4 = df4.drop("Romania")
df4 = df4.drop("Bulgaria")
df4 = df4.drop("Slovakia")
df4 = df4.drop("Thailand")
df4 = df4.drop("Germany")
df4 = df4.drop("Argentina")
df4 = df4.drop("Italy")
df4 = df4.drop("Portugal")
df4 = df4.drop("Brazil")
df4 = df4.drop("Spain")
df4.head()


# In[12]:


# graphing countries ranked 17-25 for mean volume sales of OTC codeine 
fig3 = sns.lineplot(data=df4, 
                    x="year", y="countpop", 
                    hue="Country", palette="bright",
                    style="Country",
                    markers=True, dashes=False) 
plt.xlabel(" ")
plt.ylabel("Adjusted dosage units per 1000 population", fontsize= 15)
plt.legend(loc='upper right', bbox_to_anchor=(1.2, 1))
plt.savefig('fig3.png')
fig3


# In[13]:


# Now I drop countries for the last 8
df5 = df1 
df5 = df5.set_index("country2")
df5 = df5.drop("South Africa")
df5 = df5.drop("Ireland")
df5 = df5.drop("France")
df5 = df5.drop("UK")
df5 = df5.drop("Latvia")
df5 = df5.drop("Japan")
df5 = df5.drop("Croatia")
df5 = df5.drop("Poland")
df5 = df5.drop("Serbia")
df5 = df5.drop("Switzerland")
df5 = df5.drop("Estonia")
df5 = df5.drop("Netherlands")
df5 = df5.drop("Finland")
df5 = df5.drop("Romania")
df5 = df5.drop("Bulgaria")
df5 = df5.drop("Slovakia")
df5 = df5.drop("Slovenia")
df5 = df5.drop("Lithuania")
df5 = df5.drop("Belgium")
df5 = df5.drop("Mexico")
df5 = df5.drop("Russia")
df5 = df5.drop("Canada")
df5 = df5.drop("USA")
df5 = df5.drop("Greece")
df5.head()


# In[14]:


# graphing countries ranked 9-16 for mean volume sales of OTC codeine 
fig4 = sns.lineplot(data=df5, 
                    x="year", y="countpop", 
                    hue="Country", palette="bright",
                    style="Country",
                    markers=True, dashes=False) 
plt.xlabel(" ")
plt.ylabel("Adjusted doseage units per 1000 population", fontsize= 15)
plt.legend(loc='upper right', bbox_to_anchor=(1.2, 1))
plt.savefig('fig4.png')
fig4


# # Public expenditure 

# In[15]:


# this graphs the public expenditure for all 31 countries - adjusted with IQVIA coverage
fig5 = sns.lineplot(data=df1, 
                    x='year', y='costpopadj', 
                    hue='Country',
                    palette="bright",
                    marker="o") 
plt.xlabel(" ")
plt.ylabel("Adjusted public expenditure (£) per 1,000 population", fontsize= 12)
plt.legend(loc='upper right', bbox_to_anchor=(1.2, 1))
plt.savefig('fig5.png')
fig5


# In[ ]:




