#!/bin/bash

source './conf.sh'

# first,  install everyting necessary

echo "[!] É ASSUMIDO QUE O BANCO DE DADOS POSTGRES JÁ ESTÁ CONFIGURADO [!]"

echo "[i] Rodando \"bundle install\"..."
bundle install --without test development

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
