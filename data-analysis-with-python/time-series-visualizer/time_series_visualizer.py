import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns
from pandas.plotting import register_matplotlib_converters
register_matplotlib_converters()

# Import data (Make sure to parse dates. Consider setting index column to 'date'.)
df = pd.read_csv("fcc-forum-pageviews.csv", index_col="date", parse_dates=True)

# Clean data
df = df.loc[df["value"].between(df["value"].quantile(.025), df["value"].quantile(.975))]

def draw_line_plot():
    # Draw line plot
    fig = plt.figure(figsize=(10, 6))
    plt.plot(df.index, df["value"], color="red")

    plt.title("Daily freeCodeCamp Forum Page Views 5/2016-12/2019")
    plt.xlabel("Date")
    plt.ylabel("Page Views")




    # Save image and return fig (don't change this part)
    fig.savefig('line_plot.png')
    return fig

def draw_bar_plot():
    # Copy and modify data for monthly bar plot
    df_bar = df.copy()
    df_bar["year"] = df_bar.index.year
    df_bar["month"] = df_bar.index.month
    df_bar = df_bar.groupby(["year", "month"]).mean().unstack()

    # Draw bar plot
    fig, ax = plt.subplots(figsize=(10,6))
    df_bar.plot(ax = ax, kind='bar')
    ax.set_xlabel('Years')
    ax.set_ylabel('Average Page Views')

    handles, _ = ax.get_legend_handles_labels()
    months = ["January", "February", "March", "April", "May", "June", "July",
    "August", "September", "October", "November", "December"]
    ax.legend(handles=handles, labels=months, title="Months")

    # Save image and return fig (don't change this part)
    fig.savefig('bar_plot.png')
    return fig

def draw_box_plot():
    # Prepare data for box plots (this part is done!)
    df_box = df.copy()
    df_box.reset_index(inplace=True)
    df_box['year'] = [d.year for d in df_box.date]
    df_box['month'] = [d.strftime('%b') for d in df_box.date]

    month_order = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 
               'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']

    # Draw box plots (using Seaborn)
    fig, (ax1, ax2) = plt.subplots(1, 2)
    sns.boxplot(data=df_box, x="year", y="value", hue="year", ax=ax1, legend=False)
    ax1.set_title("Year-wise Box Plot (Trend)")
    ax1.set_xlabel("Year")
    ax1.set_ylabel("Page Views")
    sns.boxplot(data=df_box, x="month", y="value", hue="month", order=month_order, ax=ax2)
    ax2.set_title("Month-wise Box Plot (Seasonality)")
    ax2.set_xlabel("Month")
    ax2.set_ylabel("Page Views")


    # Save image and return fig (don't change this part)
    fig.savefig('box_plot.png')
    return fig

