#!/bin/bash

# ==============================================================================
# SCRIPT: Instalación de Editores y Gestores de Archivos Avanzados
# ENTORNO: Ubuntu 24.04 LTS (Noble Numbat)
# ==============================================================================

# Detener el script si ocurre un error y forzar modo no-interactivo
set -e
export DEBIAN_FRONTEND=noninteractive

echo "=== [1/3] Actualizando los índices de paquetes ==="
apt-get update

echo "=== [2/3] Instalando aplicativos ==="
# Se añade 'ranger' a la lista para mantener la eficiencia de instalación.
apt-get install -y --no-install-recommends \
    nano \
    vim \
    vim-gtk3 \
    mc \
    ranger

# ==============================================================================
# GLOSARIO DE APLICATIVOS INSTALADOS (Documentación interna)
# ==============================================================================
# [EDITORES DE TEXTO]
# - nano: Editor de texto en terminal, extremadamente simple, intuitivo y ligero. 
#         Ideal para modificaciones rápidas sin curva de aprendizaje.
# - vim:  Editor de texto avanzado, altamente configurable y basado en modos. 
#         Es el estándar de facto para administradores de sistemas y desarrolladores.
# - vim-gtk3: Versión de Vim que añade soporte para el entorno gráfico (X11/Wayland),
#             permitiendo compartir el portapapeles del sistema (clipboard) con la
#             terminal y habilitando la interfaz gráfica de Vim (gvim).
#
# [GESTORES DE ARCHIVOS]
# - mc (Midnight Commander): Potente gestor de archivos en modo texto basado en dos 
#         paneles (estilo Norton Commander). Permite copiar, mover, renombrar, ver
#         y editar archivos de forma visual y rápida directamente en la terminal.
# - ranger: Gestor de archivos para terminal moderno, escrito en Python y basado en
#         una vista de tres columnas (Directorio anterior, Directorio actual y 
#         Vista previa del archivo). Utiliza los mismos atajos de teclado que 'vim'
#         y permite previsualizar imágenes y contenido de archivos de forma nativa.
# ==============================================================================

echo "=== [3/3] Limpiando la caché de APT ==="
apt-get autoremove -y
apt-get clean

echo "✔ ¡Instalación y documentación completadas con éxito!"