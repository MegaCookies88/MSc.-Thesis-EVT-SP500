import pandas as pd
import numpy as np
import plotly.io as pio
import plotly.express as px
import plotly.graph_objects as go
from plotly.subplots import make_subplots
pio.templates.default = 'plotly_white'
px.defaults.width = 1500
px.defaults.height = 500


## Data

ll = pd.read_csv('../data/data1.csv')
ll = ll.set_index('Date')
ll = -100*(np.log(ll)-np.log(ll.shift(1)))
ll = ll.iloc[1:]
ll = ll.rename_axis('Loss', axis=1)
ll.columns = [x[4:] for x in ll.columns]
ll = ll.iloc[:,1:]

## Polar Transformation
z = ll.apply(lambda x: 1/(1-x.rank()/(len(x)+1)), axis=0)
r = z.apply(lambda x: np.linalg.norm(x,2), axis=1)
w = z.div(r, axis=0)
r0 = np.quantile(r,0.95)

## Functions

def R_kmeans(k):
    centers = pd.read_csv('../data/skmeans'+str(k)+'_centers.csv').iloc[:,1:]
    centers.columns = ll.columns[1:]
    centers.index = ['C'+str(i) for i in range(1,k+1)]
    labels = pd.read_csv('../data/skmeans'+str(k)+'_labels.csv').iloc[:,1]
    labels.index = w[r>r0].index
    labels = labels.apply(lambda x: 'C'+str(x))
    return plot_kmeans(centers,labels)

def plot_kmeans(centers, labels):
    fig1 = px.imshow(centers.round(2), color_continuous_scale='Blues', text_auto=True, aspect='auto')
    fig1.update_layout(xaxis_title='', yaxis_title='Cluster Centers')
    fig2 = px.scatter(labels)
    fig2.update_layout(showlegend=False, xaxis_title='Date', yaxis_title='Cluster Label')
    fig2.update_yaxes(categoryorder='array', categoryarray=centers.index[::-1])
    return fig1, fig2

## Framework
for k in range(4,8):
    fig1, fig2 = R_kmeans(k)
    fig1.write_image('../figures/skmeans_centers_'+str(k)+'.jpeg', scale=2)
    if k==7:
        fig2.write_image('../figures/skmeans_labels_'+str(k)+'.jpeg', scale=2)