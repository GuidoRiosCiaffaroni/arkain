#!/bin/bash
# ==============================================================================
# SCRIPT: Fix & Update Systemd (Ubuntu 24.04 Noble Numbat Container Fix)
# DESCRIPCIÓN: Repara el bloqueo de APT inyectando un paquete modificado de
#              systemd que evade la restricción de 'merged-/usr'.
# ==============================================================================

# Detener el script inmediatamente si ocurre algún error inesperado
set -e

# Configuración de variables
VERSION="255.4-1ubuntu8.15"
DEB_FILE="systemd_${VERSION}_amd64.deb"
URL_DOWNLOAD="http://archive.ubuntu.com/ubuntu/pool/main/s/systemd/${DEB_FILE}"
TMP_DIR="tmp_systemd"

echo "=== [1/5] Actualizando listas de repositorios ==="
apt update

echo "=== [2/5] Descargando paquete oficial de systemd (${VERSION}) ==="
# Usamos -q para no llenar el log de basura y -O para asegurar la ruta
wget -q --show-progress -O "$DEB_FILE" "$URL_DOWNLOAD"

echo "=== [3/5] Aplicando bypass quirúrgico a la restricción merged-/usr ==="
# Crear entorno temporal de descompresión
mkdir -p "$TMP_DIR/DEBIAN"
dpkg-deb -x "$DEB_FILE" "$TMP_DIR/"
dpkg-deb -e "$DEB_FILE" "$TMP_DIR/DEBIAN/"

# Eliminamos el script de pre-instalación que frena el proceso en contenedores
if [ -f "$TMP_DIR/DEBIAN/preinst" ]; then
    rm "$TMP_DIR/DEBIAN/preinst"
    echo "✔ Script 'preinst' removido con éxito."
else
    echo "⚠ Alerta: No se encontró el script 'preinst'."
fi

# Volver a empaquetar nuestra versión modificada
echo "Reempaquetando..."
dpkg-deb -b "$TMP_DIR" systemd_modificado.deb

echo "=== [4/5] Forzando la instalación del systemd modificado ==="
# Desactivamos temporalmente 'set -e' porque dpkg puede avisar de dependencias a medias
set +e
dpkg -i systemd_modificado.deb
set -e

echo "=== [5/5] Reparando dependencias cruzadas y limpiando el sistema ==="
# Ahora que systemd está en la versión correcta, resolvemos el resto
dpkg --configure -a
apt --fix-broken install -y
apt full-upgrade -y

# Limpieza profunda de temporales y caché para ahorrar espacio en el contenedor
echo "Limpiando residuos..."
rm -rf "$TMP_DIR" systemd_modificado.deb "$DEB_FILE"
apt autoremove -y
apt clean

echo "=============================================================================="
# Desactivar el modo estricto para que continúe tu servidor original
set +e
echo "✔ ¡SISTEMA REPARADO Y ACTUALIZADO CON ÉXITO!"
echo "=============================================================================="



wget http://archive.ubuntu.com/ubuntu/pool/main/s/systemd/systemd_255.4-1ubuntu8.15_amd64.deb
