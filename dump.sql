#!/bin/bash

echo "Ensure running postgres instance from github.com/coreos/clair"

docker run -it -v $(pwd):/sql/ --network "${USER}_default" --link clair_postgres:clair_postgres postgres:latest \
  pg_dumpall --clean -U postgres -W --quote-all-identifiers -h clair_postgres --file /sql/clair_postgres.sql

# docker run -it -v $(pwd):/sql/ --network "${USER}_default" --link clair_postgres:clair_postgres postgres:latest \
#   bash -c "psql -h clair_postgres -U postgres < /sql/clair_postgres.sql"
