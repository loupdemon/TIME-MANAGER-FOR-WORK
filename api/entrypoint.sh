#!/bin/bash

echo "debut de entrypoint.sh"
command -v pg_isready

#if [ -z ".env" ]; then
#    exit 1
#fi
echo "$PGUSER $PGHOST:$PGPORT ---- VERYFYING"

while ! pg_isready -q -h $PGHOST -p $PGPORT --username=$PGUSER
do
  echo "$(date) - waiting database to start"
  sleep 2
done
# Create, migrate, and seed database if it doesn't exist.
if [[ -z `psql -Atqc "\\list $PGDATABASE"` ]]; then
  echo "Database $PGDATABASE does not exist. Creating..."
  createdb -E UTF8 $PGDATABASE -l en_US.UTF-8 -T template0
  # mix ecto.drop
  mix ecto.reset
  mix ecto.migrate
  mix run priv/repo/seeds.exs
  echo "Database $PGDATABASE created."
else
#  source .env
#  if [[ $RESETDB == 1 ]]; then
#    echo "Database $PGDATABASE is being reseted becauge you have specified RESETDB !! /!\ "
    mix ecto.reset
#    echo "Database $PGDATABASE reseted !"
#    export RESETDB=0
#  else
    mix ecto.migrate
#  fi
fi
exec mix phx.server
echo "API RUNNING"