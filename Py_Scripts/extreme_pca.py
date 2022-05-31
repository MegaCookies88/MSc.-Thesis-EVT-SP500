import random
import pandas as pd
import numpy as np
import plotly.io as pio
import plotly.express as px
import plotly.graph_objects as go
from plotly.subplots import make_subplots
pio.templates.default = 'plotly_white'
px.defaults.width = 1500
px.defaults.height = 500

random.seed(5)

## Load data

ll = pd.read_csv('../data/data1.csv')
ll = ll.set_index('Date')
ll = -100*(np.log(ll)-np.log(ll.shift(1)))
ll = ll.iloc[1:]
ll = ll.rename_axis('Loss', axis=1)
ll.columns = [x[4:] for x in ll.columns]
ll = ll.iloc[:,1:]
ll = ll.applymap(lambda x: max(x,0))

## Functions

def rv2_transform(x):
    y = np.log(1+np.exp(x))
    y = -1/np.log(y.rank()/(len(y)+1))
    y = np.sqrt(y)
    return y

def tail_mx(df):
    z = df.apply(rv2_transform, axis=0)
    r = z.apply(lambda x: np.linalg.norm(x,2), axis=1)
    w = z.div(r, axis=0)
    n   = len(r)
    r0  = np.quantile(r,0.95)
    nr0 = len(r[r>r0])
    m = (r0**2)*nr0/n
    S = (m/nr0) * w[r>r0].transpose().dot(w[r>r0])
    return S

def plot_mx(S):
    M = np.array(S.round(2))
    M[np.triu_indices(len(S),1)] = np.nan
    M = pd.DataFrame(M, index=S.index, columns=S.columns)
    fig = px.imshow(M, color_continuous_scale='Blues', text_auto=True, aspect='auto')
    fig.update_layout(xaxis_title='', yaxis_title='', width=700)
    return fig

def plot_loadings(u):
    fig = px.imshow(u.round(2), color_continuous_scale='RdBu', range_color=[-1,1], text_auto=True, aspect='auto')
    fig.update_layout(xaxis_title='', yaxis_title='', width=700)
    return fig

def plot_scores(v):
    fig = make_subplots(rows=3, cols=1)
    for i in range(3):
        fig.add_trace(
            go.Scatter(x=v.index, y=v.iloc[:,i]),
            row=i+1, col=1
        )
        fig.update_yaxes(title_text='v'+str(i+1), row=i+1, col=1)
    fig.update_layout(showlegend=False, height=1000, width=1500)
    return fig

def plot_scores_pairs(v):
    fig = make_subplots(rows=1, cols=3)
    for i in range(3):
        for j in range(i+1,3):
            fig.add_trace(
                go.Scatter(x=v.iloc[:,i], y=v.iloc[:,j], mode='markers'),
                row=1, col=i+j
            )
            fig.update_xaxes(title_text='v'+str(i+1), row=1, col=i+j)
            fig.update_yaxes(title_text='v'+str(j+1), row=1, col=i+j)
    a = v.iloc[:,:3].min().min()-1
    b = v.iloc[:,:3].max().max()+1
    fig.update_xaxes(range=(a,b), row=1, col=1)
    fig.update_yaxes(range=(a,b), row=1, col=1)
    fig.update_xaxes(range=(a,b), row=1, col=2)
    fig.update_yaxes(range=(a,b), row=1, col=2)
    fig.update_xaxes(range=(a,b), row=1, col=3)
    fig.update_yaxes(range=(a,b), row=1, col=3)
    fig.update_layout(showlegend=False, height=500, width=1500)
    return fig
    
## Framework
                        
S = tail_mx(ll)
                        
fig = plot_mx(S)
fig.write_image('../figures/tail_matrix_nom.jpeg', scale=2)
                        
e,u = np.linalg.eig(S)
e = e[:5]
u = pd.DataFrame(u[:,:5], index=ll.columns, columns=['u'+str(i) for i in range(1,6)])
u.iloc[:,0] *= np.sign(u.iloc[:,0].sum())

v = ll.applymap(lambda x: max(x,0)).dot(u)
v.columns = ['v'+str(i) for i in range(1,6)]
                        
fig = plot_loadings(u)
fig.write_image('../figures/tail_loadings_nom.jpeg', scale=2)
                        
fig = plot_scores(v)
fig.write_image('../figures/tail_scores_nom.jpeg', scale=2)
                        
fig = plot_scores_pairs(v)
fig.write_image('../figures/tail_scores_scatter_nom.jpeg', scale=2)