import streamlit as st
from db import fetch_query
import pandas as pd
from datetime import datetime


st.set_page_config(
    page_title="Routine",
    layout="wide"
)

st.title("Techspire College Semester III Routine ")


now = datetime.now()
left,right =st.columns(2)
today = now.strftime("%A")
current_time = now.strftime("%H:%M:%S")
with left:
    st.write(f"### Today: **{today}**")
with right:
    st.write(f"### Current Time: **{current_time}**")

# fetching today's routine 
try:
    routine_query = f"""

SELECT
    day as Day,
    time as Time,
    module_title Subject,
    room as Class,
    lecturer,
    class_type as ClassType
FROM bscit_sem3_timetable
WHERE
    day = Trim(TO_CHAR(CURRENT_DATE, 'DY'))
ORDER BY
    time;
    """
    today_df = fetch_query(routine_query)

    st.subheader("Today's Routine")
    if today_df.empty:
        st.warning("No routine found for today.")
        # removing index column  in data  
    else:
        st.dataframe(
    today_df,
    use_container_width=True,
    hide_index=True
)
except Exception as e:
    st.error(f"Unexpected error: {e}")


# fetching currently running class

try:
    running_query = """
    SELECT
        day AS day,
        time AS time,
        module_title AS subject,
        room AS room,
        lecturer AS lecturer,
        class_type AS classtype
    FROM bscit_sem3_timetable
    WHERE
        UPPER(day) = UPPER(TO_CHAR(CURRENT_DATE, 'DY'))
        AND CURRENT_TIME BETWEEN
            TRIM(split_part(time, '-', 1))::time
            AND TRIM(split_part(time, '-', 2))::time;
    """

    running_df = fetch_query(running_query)

    st.subheader("Current Running Class")

    if running_df.empty:
        st.info("No class is running right now.")
    else:
        row = running_df.iloc[0]
        st.dataframe(
            running_df,
    use_container_width=True,
    hide_index=True)
              
except Exception as e:
    st.error(f"Unexpected error: {e}")
