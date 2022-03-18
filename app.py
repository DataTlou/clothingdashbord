import pandas as pd
import plotly.express as px
import streamlit as st
import plotly as pl

st.set_page_config(page_title='My DashBoard', page_icon=":bar_chart:", layout="wide")
st.markdown("# :necktie: Clothing Dashboard", unsafe_allow_html=True)
print(pd.__version__)
print(pl.__version__)
print(st.__version__)
df = pd.read_csv('CLEAN_STATS.csv')
industry = st.sidebar.multiselect(
    "Select The Industry:",
    options=df["INDUSTRY"].unique(),
    default=df["INDUSTRY"].unique()
)
condition = st.sidebar.multiselect(
    "Select Condition:",
    options=df["CONDITION"].unique(),
    default=df["CONDITION"].unique()
)
df_selection = df.query("INDUSTRY == @industry & CONDITION == @condition" )
first_graph = px.bar(df_selection, x='YEAR', y='VALUE_%', color='ACTION', barmode='group', title="<b>Utilisation of Clothing Products</b>", hover_data=['QUARTER', 'VALUE_%'])
first_graph.update_layout(
    plot_bgcolor="rgba(0, 0, 0, 0)",
    yaxis=(dict(showgrid=False)),
    yaxis_title="VALUE (%)")
quarter_data = df_selection.groupby(by=['QUARTER', 'ACTION']).mean()[['VALUE_%']]
second_graph = px.bar(quarter_data, x=quarter_data.index.get_level_values(0), y='VALUE_%', color = quarter_data.index.get_level_values(1), title="<b>AVERAGE RATE PER QUARTER</b>")
second_graph.update_layout(
    plot_bgcolor="rgba(0, 0, 0, 0)",
    yaxis=(dict(showgrid=False)),
    xaxis_title="QUARTER",
    yaxis_title="VALUE (%)")
left, right = st.columns(2)
left.plotly_chart(first_graph, use_container_width=True)
right.plotly_chart(second_graph, use_container_width=True)
df2 = pd.read_csv('CLEAN_UNDER.csv')
df_selection2 = df2.query("INDUSTRY == @industry & CONDITION == @condition")
third_graph = px.bar(df_selection2, y = 'VALUE_%', x = 'CAUSE', title="<b>UNDER UTILISATION CONTRIBUTORS</b>", hover_data=['QUARTER', 'VALUE_%', 'YEAR', 'INDUSTRY'])
third_graph.update_layout(
    plot_bgcolor="rgba(0, 0, 0, 0)",
    yaxis=(dict(showgrid=False)),
    yaxis_title="VALUE (%)")
st.plotly_chart(third_graph)
hiding_unnecessary = """
                <style>
                #MainMenu {visibility: hidden;}
                footer {visbility: hidden;}
                header {visibility: hidden;}
                </style>
            """
st.markdown(hiding_unnecessary, unsafe_allow_html=True)