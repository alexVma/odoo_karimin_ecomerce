FROM odoo:17.0

USER root

# Copiar configuración personalizada de Odoo
COPY ./odoo.conf /etc/odoo/odoo.conf

# Copiar dependencias adicionales (opcional)
COPY ./requirements.txt /requirements.txt
RUN pip3 install --no-cache-dir -r /requirements.txt || true

# Copiar módulos extra (opcional)
# COPY ./custom-addons /mnt/extra-addons

# Script de arranque
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER odoo

ENTRYPOINT ["/entrypoint.sh"]