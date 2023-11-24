#!/bin/bash

set -e

host="$1"
shift
cmd="$@"

# Make sure to export these variables in your Docker Compose or Dockerfile
export PGUSER=postgres
export PGPASSWORD=postgres

until psql -h "$host" -d "$POSTGRES_DB" -c '\q'; do
  >&2 echo "PostgreSQL is unavailable - sleeping"
  sleep 1
done

>&2 echo "PostgreSQL is up - executing command"
exec $cmd
