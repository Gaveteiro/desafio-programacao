#!/bin/bash

#######################
# CONFIGURATION
#######################

export API_KEY="5e5d53209ed6dc1be90cea6823b24335"
export LANGUAGE="pt-BR"
export DB_USER="desafio_prog"
export DB_NAME="desafio_db"
export DB_HOST="localhost"
export DB_USERNAME="desafio_prog"

#######################
# CONFIGURATION END
#######################

echo "[i] Rodando \"bundle install\"..."
bundle install --without production

export SECRET="$(rails secret)"

echo "[i] Criando usuário no banco de dados... (Pode ser necessária sua autorização e uma senha)"
sudo -u postgres createuser -s $DB_USER -P

echo -n "Digite a senha que você digitou para o usuário no banco de dados: "
read -s DB_PASSWD
export DB_PASSWD

export RAILS_ENV="production"

echo -e "\n[i] Criando banco de dados..."
rails db:create
rails db:migrate
rails db:seed

rails assets:precompile

echo "[i] Importando dados da API..."
rails import_movie_catalog

echo "Rodando"
rails server
