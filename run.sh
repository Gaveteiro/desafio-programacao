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

export RAILS_ENV="development"

echo "[i] Rodando \"bundle install\"..."
bundle install

export SECRET="$(rails secret)"

#echo "[i] Criando usuário no banco de dados... (Pode ser necessária sua autorização e uma senha)"
#sudo -u postgres createuser -s $DB_USER -P

#echo -n "Digite a senha que você digitou para o usuário no banco de dados: "
#read -s DB_PASSWD
#export DB_PASSWD

echo -e "\n[i] Criando banco de dados..."
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed

#rails assets:precompile

echo "[i] Importando dados da API..."
bundle exec rails import_movie_catalog

echo "Rodando"
bundle exec rails server -e development
