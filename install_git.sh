#!/bin/bash

# ==============================================================================
# SCRIPT: Instalación Automatizada de Git y Herramientas de Desarrollo Core
# ENTORNO: Ubuntu 24.04 LTS (Noble Numbat)
# ==============================================================================

# Detener el script si ocurre un error y forzar modo no-interactivo
set -e
export DEBIAN_FRONTEND=noninteractive

echo "=== [1/3] Actualizando los índices de paquetes ==="
apt-get update

echo "=== [2/3] Instalando Git y utilidades de desarrollo ==="
# Se instalan Git y sus dependencias de entorno en una sola transacción de APT
apt-get install -y --no-install-recommends \
    git \
    git-lfs \
    curl \
    wget \
    ca-certificates \
    build-essential

# ==============================================================================
# GLOSARIO DE APLICATIVOS INSTALADOS (Documentación interna)
# ==============================================================================
# [CONTROL DE VERSIONES]
# - git: El sistema de control de versiones distribuido estándar de la industria.
#        Permite rastrear cambios en el código fuente, gestionar ramas (branches)
#        y colaborar con repositorios remotos como GitHub, GitLab o Bitbucket.
# - git-lfs (Large File Storage): Extensión crítica para Git que reemplaza archivos
#        pesados (como binarios, imágenes grandes o datasets) con punteros de texto
#        dentro de Git, almacenando el contenido real en servidores remotos. Evita
#         que el repositorio `.git` se vuelva gigante e inmanejable.
#
# [TRANSFERENCIA DE DATOS Y RED]
# - curl: Herramienta de línea de comandos para transferir datos desde o hacia un
#         servidor usando múltiples protocolos (HTTP, HTTPS, FTP, etc.). Es vital
#         para consumir APIs o descargar scripts de instalación automáticos.
# - wget: Utilidad para descargar archivos desde la web. A diferencia de curl, está
#         optimizada para descargas en segundo plano, reanudación de descargas rotas
#         y clonación recursiva de directorios web.
# - ca-certificates: Paquete que contiene los certificados de seguridad públicos
#                    necesarios para que las conexiones SSL/TLS (HTTPS) sean de
#                    confianza. Es obligatorio para que 'git clone' o 'curl' no 
#                    tiren errores de certificado inseguro al conectarse a GitHub.
#
# [SOPORTE DE COMPILACIÓN]
# - build-essential: Paquete de meta-dependencias que incluye 'gcc', 'g++' y 'make'.
#                    Garantiza que puedas compilar herramientas nativas desde el
#                    código fuente si no se encuentran disponibles en APT.
# ==============================================================================

echo "=== [3/3] Limpiando la caché de APT ==="
apt-get autoremove -y
apt-get clean

echo "=============================================================================="
echo "✔ ¡Git y las herramientas aliadas han sido instaladas con éxito!"
echo "=============================================================================="
echo "Versión de Git instalada:"
git --version
echo "=============================================================================="