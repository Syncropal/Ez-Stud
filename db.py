import psycopg2
import pandas as pd
from psycopg2 import OperationalError, Error
import os
from dotenv import load_dotenv

load_dotenv()

def get_connection():
    try:
        conn = psycopg2.connect(
             host=os.getenv("DB_HOST"),
            database=os.getenv("DB_NAME"),
            user=os.getenv("DB_USER"),
            password=os.getenv("DB_PASSWORD"),
            port=os.getenv("DB_PORT")
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

