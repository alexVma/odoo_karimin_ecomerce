#!/bin/bash
set -e

# Esperar a que la base de datos esté lista
until pg_isready -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER"; do
  echo "Esperando a la base de datos..."
  sleep 2
done

# Ejecutar Odoo
exec odoo -c /etc/odoo/odoo.conf