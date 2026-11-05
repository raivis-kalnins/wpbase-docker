#!/bin/bash

FLAG_FILE="/var/lib/mysql/.imported"
SQL_FILE="/docker-entrypoint-initdb.d/init.sql"

if [ ! -f "$FLAG_FILE" ] && [ -f "$SQL_FILE" ]; then
  echo "💾 Importing database from $SQL_FILE..."
  mysql -u root -psomewordpress wordpress < "$SQL_FILE" && \
    touch "$FLAG_FILE"
else
  echo "✅ Skipping import (already done or no SQL file found)."
fi
