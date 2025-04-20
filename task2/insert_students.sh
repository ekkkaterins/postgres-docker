#!/bin/bash

ITER=$1

NAMES=("Alice" "Bob" "Charlie" "David" "Eve" "Frank" "Grace" "Hannah" "Ivy" "Jack")

for i in $(seq 1 "$ITER"); do
  NAME=${NAMES[$((RANDOM % ${#NAMES[@]}))]}
  YEAR=$((2000 + RANDOM % 25))

  docker exec -i postgres-docker_postgres_1 psql -U user -d mydb -c "INSERT INTO Students (s_id, name, start_year) VALUES (DEFAULT, '${NAME}', ${YEAR}) ON CONFLICT (s_id) DO NOTHING;"
  
  echo "Inserted: Name=${NAME}, Year=${YEAR}"
done


