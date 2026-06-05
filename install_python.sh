#!/bin/bash

# ==============================================================================
# SCRIPT: Instalación Automatizada de Python 3 y Entorno de Desarrollo
# ENTORNO: Ubuntu 24.04 LTS (Noble Numbat)
# ==============================================================================

# Detener el script si ocurre un error y forzar modo no-interactivo
set -e
export DEBIAN_FRONTEND=noninteractive

echo "=== [1/3] Actualizando los índices de paquetes ==="
apt-get update

echo "=== [2/3] Instalando Python 3 y herramientas esenciales ==="
# Se instalan los paquetes necesarios en una sola ejecución de APT.
apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-venv \
    python3-dev \
    build-essential

# ==============================================================================
# GLOSARIO DE APLICATIVOS INSTALADOS (Documentación interna)
# ==============================================================================
# [NÚCLEO DE PYTHON]
# - python3: El intérprete oficial de Python 3. Es el corazón del lenguaje y
#            permite ejecutar scripts `.py` en el sistema.
#
# [GESTIÓN DE PAQUETES Y ENTORNOS]
# - python3-pip: El gestor de paquetes estándar de Python. Permite descargar e
#                instalar librerías externas desde el repositorio oficial PyPI 
#                (ej. `pip install requests`).
# - python3-venv: Módulo crítico que permite crear "Entornos Virtuales" aislados.
#                 Esto evita que las librerías de un proyecto interfieran con otros
#                 proyectos o con las herramientas del propio sistema operativo.
#
# [COMPILACIÓN Y DESARROLLO NATIVO]
# - python3-dev: Incluye los archivos de cabecera (headers) necesarios para 
#                compilar extensiones de C/C++ para Python. Requerido por librerías
#                avanzadas de datos o criptografía.
# - build-essential: Paquete meta que contiene el compilador `gcc`, `g++` y `make`.
#                    Es indispensable para que `pip` pueda compilar módulos nativos
#                    durante la instalación de ciertas librerías.
# ==============================================================================

echo "=== [3/3] Limpiando la caché de APT ==="
apt-get autoremove -y
apt-get clean

echo "=============================================================================="
echo "✔ ¡Python 3 y su entorno de desarrollo han sido instalados con éxito!"
echo "=============================================================================="
echo "Versión instalada:"
python3 --version
pip3 --version
echo "=============================================================================="