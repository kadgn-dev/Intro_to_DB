#!/usr/bin/env python3
"""
MySQLServer.py
Creates the database 'alx_book_store' in a MySQL server.
If the database already exists, the script will not fail.
"""

import mysql.connector
from mysql.connector import Error

def create_database():
    """Create the alx_book_store database safely."""
    try:
        # Connect to MySQL server (adjust credentials as needed)
        connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password=''  # Replace with your MySQL root password if required
        )

        if connection.is_connected():
            cursor = connection.cursor()
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")

    except Error as e:
        print(f"Error while connecting to MySQL: {e}")

    finally:
        # Close cursor and connection properly
        try:
            if cursor:
                cursor.close()
            if connection.is_connected():
                connection.close()
                # Confirm connection closed
                print("MySQL connection closed.")
        except NameError:
            pass


if __name__ == "__main__":
    create_database()
