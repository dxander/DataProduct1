ProjectPresentationFile
========================================================
author: Don Alexander Eckford
date: 25 July 2015

First Slide  Introduction
========================================================

Starting with the code for the shiny app stockVis I modify the app
to finish it by adjusting the data for inflation and fixing other bugs.
In addition, I further modify it to compute the mean of the stock price series shown. 
Reference: http://shiny.rstudio.com/tutorial/lesson6/
           http://www.quantmod.com/

-I fixed preassigned bug in the program.
BUG 1: Each time renderPlot re-runs

It re-fetches the data from Yahoo finance with getSymbols, and
It re-draws the chart with the correct axis.
This is not good, because you do not need to re-fetch the data to re-draw the plot. In fact, Yahoo finance will cut you off if you re-fetch your data too often (because you begin to look like a bot). But more importantly, re-running getSymbols is unnecessary work, which can slow down your app and consume server bandwidth.

-I added a barchart, volume of trade feature to the graph that is not in the original.   

How to Use
========================================================

Choose a stock to view using stock symbols like those at 
finance.yahoo.com/lookup

Here are a few you can use
S       C       GOOG    K
SBUX    GE      GOOGL   KMI
WMT     CAT     H       KMB
CSCO    DIS     PYPL    KR
GS      KO      HD      KORS
AAPL    CVX     HAL     L
BAC     PG      HPQ     LMT
T       HON     LNKD    AMZN
AXP     IBM     BA      BABA
BP      BE      DOW     XOM
F       FB      WFC     FDX
FIT     CVS     INTC    NFLX
JNJ     JPM     JCP     JCI
LOW     M       MSFT    MCD

there are many more you can see by following the link above.

Asset Returns
========================================================
Most financial studies involve returns, instead of prices, of assets.
For average investors return complety describes the investment opportunity 
regardless of the  units of currency involved.
Return series are easier to handle than price series because the former have more attractive statistical properties.


From Price to Return
=======================================================

$P_{t}$ is the price of an asset at time t.

Then a one-period simple return implies holding the asset for 
one period from date t-1 to date t

$$1+R_{t}=\frac{P_{t}}{P_{t-1}}$$




Asset Returns
========================================================

Future modification of the app will do the following
-produce a return series instead of prices
-produce both one period simple returns and multiperiod simple returns
-produce the continuously compounded return
-produce a portfolio return of 5 selected assets
-produce a theoretical dividend payment to be included in the returns
-produce an excess return 

Picture 1: New Feature in ui.r  Number of bin selector 
           for future histogram
========================================================

![NewGraph](histogramMocUp.jpg)


Picture 2: Reactive Function adjust()
=======================================================

![OriginalGraph](stockVisRegPic.jpg)


Picture 3 Reactive Function barchart()
=========================================================

![barchart](barchartpicture.jpg) 


