#!/usr/bin/env python3
"""
MySQLServer.py
Creates the database 'alx_book_store' in a MySQL server.
Handles exceptions properly and closes the connection safely.
"""

import mysql.connector

try:
    # Connect to MySQL server
    connection = mysql.connector.connect(
        host='localhost',
        user='root',
        password=''  # replace with your MySQL root password if needed
    )

    if connection.is_connected():
        cursor = connection.cursor()
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
        print("Database 'alx_book_store' created successfully!")

except mysql.connector.Error as err:
    print(f"Error while connecting to MySQL: {err}")

finally:
    # Close cursor and connection if they exist
    if 'cursor' in locals() and cursor is not None:
        cursor.close()
    if 'connection' in locals() and connection.is_connected():
        connection.close()
        print("MySQL connection closed.")
