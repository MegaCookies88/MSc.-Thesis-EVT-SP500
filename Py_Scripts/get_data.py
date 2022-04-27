import pandas as pd
import numpy as np
import yfinance as yf

## Tickers

sp_sectors = {
    'S&P Market': '^GSPC',
    'S&P Communication Services': '^SP500-50',
    'S&P Consumer Discretionary': '^SP500-25',
    'S&P Consumer Staples': '^SP500-30',
    'S&P Energy': '^GSPE',
    'S&P Financial': '^SP500-40',
    'S&P Health Care': '^SP500-35',
    'S&P Industrial': '^SP500-20',
    'S&P Materials': '^SP500-15',
    'S&P Real Estate': '^SP500-60',
    'S&P Technology': '^SP500-45',
    'S&P Utilities': '^SP500-55'
}

## Download

df = yf.download(tickers=list(sp_sectors.values()), period='max', group_by='ticker')
df = df.T.xs('Adj Close', level=1, drop_level=True).T
df = df.rename(columns=dict(map(reversed, sp_sectors.items())))


## Clean

df = df[df.Date>'2002-02-08']

df = df[['Date','S&P Market','S&P Communication Services','S&P Technology',
         'S&P Industrial','S&P Materials','S&P Consumer Discretionary','S&P Financial',
         'S&P Health Care','S&P Consumer Staples',
         'S&P Utilities','S&P Real Estate','S&P Energy']]

df = df.fillna(method='ffill')

## Errors

if df.isna().sum().sum()>0:
    print('Missing Values!')

## Save

df.to_csv('data/data1.csv', index=False)