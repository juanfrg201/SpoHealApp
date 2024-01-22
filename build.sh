#!/bin/bash

echo "Iniciando script de construcción..."

# Verifica si Rails está instalado
if ! command -v rails &> /dev/null; then
    echo "Rails no está instalado. Ejecutando instalación de Rails..."
    ./install_rails.sh

    # Verifica si la instalación de Rails fue exitosa
    if ! command -v rails &> /dev/null; then
        echo "Error: La instalación de Rails ha fallado. No se puede continuar con la construcción."
        exit 1
    fi
fi

# Verifica si psql (cliente de PostgreSQL) está instalado
if ! command -v psql &> /dev/null; then
    echo "PostgreSQL no está instalado. Ejecutando instalación de PostgreSQL..."
    ./install_postgresql.sh

    # Verifica si la instalación de PostgreSQL fue exitosa
    if ! command -v psql &> /dev/null; then
        echo "Error: La instalación de PostgreSQL ha fallado. No se puede continuar con la construcción."
        exit 1
    fi
fi

# Si se han instalado Rails y PostgreSQL, continúa con la construcción
echo "Rails y PostgreSQL están instalados. Ejecutando el script de construcción..."

# Verifica si Bundler está instalado
if ! command -v bundle &> /dev/null; then
    echo "Bundler no está instalado. Instalando..."
    gem install bundler
fi

echo "Instalando dependencias..."
bundle install --jobs 4 --retry 3
echo "Finalización de la instalación. Recuerda ejecutar 'rails db:create'."
rails db:create