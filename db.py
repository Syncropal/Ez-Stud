import psycopg2
import pandas as pd
from psycopg2 import OperationalError, Error


def get_connection():
    try:
        conn = psycopg2.connect(
            host="localhost",
            database="routinedb",
            user="postgres",
            password="Nishan@2059",
            port="5432"
        )
        return conn

    except OperationalError as e:
        print("Database connection error:", e)
        return None



def fetch_query(query):
    conn = get_connection()

    if conn is None:
     
        return pd.DataFrame()

    try:
        df = pd.read_sql(query, conn)
        conn.close()
        return df

    except Error as e:
        print("SQL query error:", e)
        conn.close()
        return pd.DataFrame()
    
if __name__ == "__main__":
    print("Testing database connection...")

    conn = get_connection()

    if conn:
        print(" Connection successful!")
        conn.close()
    else:
        print("Failed to connect")

