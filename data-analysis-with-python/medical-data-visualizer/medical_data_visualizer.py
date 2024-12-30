import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import numpy as np

# 1
df = pd.read_csv("medical_examination.csv")

# 2
bmi = df["weight"] / ((df["height"] / 100) ** 2)
df['overweight'] = (bmi > 25).astype(int)

# 3
df[["cholesterol", "gluc"]] = np.where(df[["cholesterol", "gluc"]] == 1, 0, 1)

# 4
def draw_cat_plot():
    # 5
    categorical = ["cholesterol", "gluc", "smoke", "alco", "active", "overweight"]
    df_cat = pd.melt(df, id_vars = "cardio", value_vars = categorical)

    # 6
    df_cat = df_cat.groupby(["cardio", "variable"])["value"].value_counts().reset_index(name="total")


    # 8
    fig = sns.catplot(data=df_cat, x="variable", y="total", col = "cardio", hue="value", kind="bar")

    # 9
    fig.savefig('catplot.png')
    # https://forum.freecodecamp.org/t/errors-for-catplot-in-medical-data-visualizer-challenge/488909/3
    return fig.fig


# 10
def draw_heat_map():
    # 11
    df_heat = df.loc[(df['ap_lo'] <= df['ap_hi']) & 
    (df['height'] >= df['height'].quantile(0.025)) &
    (df['height'] <= df['height'].quantile(0.975)) &
    (df['weight'] >= df['weight'].quantile(0.025)) &
    (df['weight'] <= df['weight'].quantile(0.975))
    ]

    # 12
    corr = df_heat.corr(numeric_only=True)

    # 13
    mask = np.triu(np.ones_like(corr, dtype=bool))



    # 14
    fig, ax = plt.subplots()

    # 15
    sns.heatmap(corr, mask=mask, annot=True, fmt=".1f")


    # 16
    fig.savefig('heatmap.png')
    return fig

