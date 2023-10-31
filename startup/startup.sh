#!/usr/bin/env bash

set -e

# turns on the database so that records can be inserted
sqlplus / as sysdba <<EOF
    STARTUP;
    exit;
EOF

# loops over all sql files in the directory and executes them
for filename in /docker-entrypoint-initdb.d/**/*.sql; do
    echo "Executing $filename"

    sqlplus -l -s / as sysdba 2>&1 <<EOF
        whenever sqlerror exit sql.sqlcode;
        @$filename;
        exit;
EOF
done
