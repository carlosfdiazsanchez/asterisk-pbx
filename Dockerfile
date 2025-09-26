# Usar una imagen base de Debian
FROM debian:bullseye

# Instalar Asterisk y dependencias
RUN apt-get update && apt-get install -y \
    asterisk \
    && rm -rf /var/lib/apt/lists/*

# Copiar los archivos de configuración personalizados al contenedor
COPY ./etc/asterisk/ /etc/asterisk/

# Expone los puertos que necesitas (SIP y ARI)
EXPOSE 5060/udp
EXPOSE 8088

# Comando para iniciar Asterisk en primer plano
CMD ["asterisk", "-f", "-cvvv"]
