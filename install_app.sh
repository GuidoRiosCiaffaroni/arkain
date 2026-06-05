#!/bin/bash

# ==============================================================================
# SCRIPT: Instalación Automatizada de Herramientas y Librerías
# ENTORNO: Ubuntu 24.04 LTS (Noble Numbat)
# ==============================================================================

# Detener el script si ocurre un error y forzar modo no-interactivo
set -e
export DEBIAN_FRONTEND=noninteractive

echo "=== [1/3] Actualizando los índices de paquetes ==="
apt-get update

echo "=== [2/3] Instalando herramientas del sistema y librerías ==="
# Se agrupan todos los paquetes con barras invertidas (\) para instalación en paralelo.
# Los comentarios '#' explican la función de cada aplicativo directamente en el código.

apt-get install -y --no-install-recommends \
    apg \
    atop \
    bmon \
    bsdextrautils \
    byobu \
    ccze \
    cmatrix \
    console-setup \
    console-setup-linux \
    cron \
    cron-daemon-common \
    gawk \
    gettext-base \
    htop \
    iproute2 \
    jp2a \
    kbd \
    keyboard-configuration \
    libatm1t64 \
    libbpf1 \
    libcap2-bin \
    libconfuse-common \
    libconfuse2 \
    libelf1t64 \
    libevent-core-2.1-7t64 \
    libfribidi0 \
    libgpm2 \
    libio-pty-perl \
    libipc-run-perl \
    liblocale-gettext-perl \
    libmnl0 \
    libncurses6 \
    libnewt0.52 \
    libnl-3-200 \
    libnl-genl-3-200 \
    libnl-route-3-200 \
    libpam-cap \
    libsigsegv2 \
    libslang2 \
    libtime-duration-perl \
    libtimedate-perl \
    liburing2 \
    libutempter0 \
    libxtables12 \
    moreutils \
    pastebinit \
    plocate \
    python3-newt \
    python3-psutil \
    python3-setuptools \
    python3-typing-extensions \
    python3-urwid \
    python3-wcwidth \
    run-one \
    speedometer \
    tmux \
    tree \
    xkb-data

# ==============================================================================
# GLOSARIO DE APLICATIVOS INSTALADOS (Documentación interna)
# ==============================================================================
# [MONITOREO Y RENDIMIENTO]
# - atop: Monitor avanzado de rendimiento de CPU, memoria, disco y procesos.
# - bmon: Monitor de ancho de banda e interfaces de red en tiempo real (ASCII).
# - htop: Visor de procesos interactivo y moderno para la terminal.
# - speedometer: Grafica visualmente la velocidad de la red o lectura de archivos.
#
# [UTILIDADES DE TERMINAL]
# - tmux: Multiplexor de terminales para mantener sesiones activas en segundo plano.
# - byobu: Capa de personalización y barras de estado que corre sobre tmux.
# - tree: Lista directorios en un formato visual de diagrama de árbol.
# - moreutils: Colección de herramientas adicionales para pipelines (sponge, ts, etc).
# - ccze: Coloreador rápido de archivos de log para facilitar su lectura.
# - cmatrix: Simulador de la lluvia de texto de la película Matrix.
# - jp2a: Convertidor de imágenes JPG a arte ASCII directo en la terminal.
# - pastebinit: Envía texto desde la terminal a repositorios públicos tipo Pastebin.
# - plocate: Buscador de archivos ultra rápido basado en índices precalculados.
#
# [ADMINISTRACIÓN Y CORE LINUX]
# - cron / cron-daemon-common: Demonio estándar para programar tareas automáticas.
# - apg: Generador automático de contraseñas aleatorias y seguras.
# - run-one: Asegura que solo se ejecute una única instancia de un comando a la vez.
# - bsdextrautils: Utilidades heredadas de BSD (como el calendario 'cal').
# - gawk: Versión GNU de awk, lenguaje para filtrar y procesar texto avanzado.
# - iproute2: Herramientas modernas de red en Linux (comandos ip, ss, etc).
# - libcap2-bin / libpam-cap: Administra capacidades del Kernel (permisos selectivos).
#
# [CONFIGURACIÓN DE CONSOLA Y TECLADO]
# - console-setup / console-setup-linux: Configura fuentes y comportamiento de TTYs.
# - kbd: Administra tablas de fuentes de consola y repetición de teclado.
# - keyboard-configuration / xkb-data: Base de datos para la distribución del teclado.
#
# [LIBRERÍAS DE PYTHON Y PERL]
# - python3-psutil: Acceso a estadísticas de hardware y procesos desde Python.
# - python3-setuptools: Módulo esencial para instalar y distribuir paquetes Python.
# - python3-urwid: Librería para diseñar interfaces de texto avanzadas (TUI).
# - python3-newt / libnewt0.52: Ventanas y menús interactivos en terminal (estilo azul/gris).
# - python3-typing-extensions: Soporte de tipado estático moderno para Python.
# - python3-wcwidth: Manejo correcto del ancho de caracteres especiales y emojis en terminal.
# - libio-pty-perl / libipc-run-perl / liblocale-gettext-perl / libtimedate-perl /
#   libtime-duration-perl: Dependencias de Perl para gestionar procesos, idiomas y fechas.
#
# [LIBRERÍAS DEL SISTEMA / BAJO NIVEL]
# - libbpf1: Interfaz para interactuar con eBPF (monitoreo del kernel y seguridad).
# - libelf1t64: Permite leer y manipular binarios en formato ejecutable ELF.
# - liburing2: Soporte para la interfaz de E/S asíncrona ultra rápida io_uring.
# - libncurses6: Permite pintar menús y colores dinámicos en la terminal.
# - libevent-core-2.1-7t64: Notificación de eventos asíncronos (usado por tmux).
# - libnl-3-200 / libnl-genl-3-200 / libnl-route-3-200 / libmnl0: Librerías Netlink para red.
# - libxtables12: Manipulación de tablas de filtrado en el firewall (iptables).
# - libfribidi0: Manejo de textos bidireccionales (ej. lectura de derecha a izquierda).
# - libgpm2 / libutempter0: Soporte de mouse en consola y registro de auditoría utmp.
# - libslang2: Renderizado rápido de texto complejo en terminales.
# - libsigsegv2: Gestión controlada de fallos de segmentación de memoria.
# - libconfuse2 / libconfuse-common: Parser ligero de archivos de configuración.
# - libatm1t64: Soporte para conexiones de red heredadas tipo ATM.
# ==============================================================================

echo "=== [3/3] Limpiando la caché de APT ==="
apt-get autoremove -y
apt-get clean

echo "✔ ¡Instalación y documentación completadas con éxito!"