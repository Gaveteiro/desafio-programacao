#!/bin/bash

source './conf.sh'

export RAILS_ENV="development"

if [ $1 = "--setup-db" ]; then
    echo "[i] Rodando \"bundle install\"..."
    bundle install

    echo "[i] Criando usuário no banco de dados... (Pode ser necessária sua autorização e uma senha)"
    sudo -u postgres createuser -s $DB_USER -P

    echo -n "Digite a senha que você digitou para o usuário no banco de dados: "
    read -s DB_PASSWD
    export DB_PASSWD

    echo "export DB_PASSWD=\"$DB_PASSWD\"" >> conf.sh

    echo -e "\n[i] Criando banco de dados..."
    rails db:create
    rails db:migrate
    rails db:seed

    #rails assets:precompile

    echo "[i] Importando dados da API..."
    rails import_movie_catalog
fi

echo "Rodando"
rails server
