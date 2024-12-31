import pandas as pd
import matplotlib.pyplot as plt
from scipy.stats import linregress
import numpy as np

def draw_plot():
    # Read data from file
    df = pd.read_csv("epa-sea-level.csv")

    # Create scatter plot
    fig = plt.figure()
    plt.scatter(df["Year"], df["CSIRO Adjusted Sea Level"])

    # Create first line of best fit
    fit = linregress(x=df["Year"], y=df["CSIRO Adjusted Sea Level"])
    xx = np.linspace(df["Year"].min(), 2050, 171)
    yy = fit.intercept + xx * fit.slope
    plt.plot(xx, yy)

    # Create second line of best fit
    df_2000up = df.loc[df["Year"] >= 2000]
    fit2 = linregress(x=df_2000up["Year"], y=df_2000up["CSIRO Adjusted Sea Level"])
    xx2 = np.linspace(2000, 2050, 51)
    yy2 = fit2.intercept + xx2 * fit2.slope
    plt.plot(xx2, yy2)
    # Add labels and title
    plt.title("Rise in Sea Level")
    plt.xlabel("Year")
    plt.ylabel("Sea Level (inches)")
    
    # Save plot and return data for testing (DO NOT MODIFY)
    plt.savefig('sea_level_plot.png')
    return plt.gca()
