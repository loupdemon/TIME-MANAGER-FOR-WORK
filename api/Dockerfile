FROM elixir:latest
# POSTGRES INSTALL
RUN apt-get update
#RUN apt-get install -y inotify-tools
RUN apt-get install -y postgresql-client openssl

# COPY SRC FOLDER
RUN mkdir /api
COPY . /api
WORKDIR /api

RUN mix local.hex --force

# GET DEPEDENCIES
RUN mix deps.get
RUN mix local.rebar --force
RUN mix do compile

# CREATE SSL CERTIFICATE
# RUN openssl genrsa -des3 -passout pass:epitech1234 -out ./priv/server.pass.key 2048 && \
#     openssl rsa -passin pass:epitech1234 -in ./priv/server.pass.key -out ./priv/server.key && \
#     rm ./priv/server.pass.key && \
#     openssl req -new -key ./priv/server.key -out ./priv/server.csr \
#     -subj "/C=FR/ST=Alsace/L=Strasbourg/O=Epitech/OU=IT Department/CN=clebou.fr" && \
#     openssl x509 -req -days 365 -in ./priv/server.csr -signkey ./priv/server.key -out ./priv/server.crt
# RUN ["chmod", "+x", "/api/entrypoint.sh"]

RUN chmod +x /api/entrypoint.sh

CMD ["/api/entrypoint.sh"]