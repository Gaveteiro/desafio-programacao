#MANUAL SET
CREATE_USER_FILE="create_user.sql"
DB_NAME="gaveteiro"

#AUTO SET
USER=$(whoami)

echo "CREATE USER $USER WITH CREATEDB; " >> $CREATE_USER_FILE

sudo -u postgres psql -f $CREATE_USER_FILE
echo "---------- Created USER: '$USER' in Postgres"
rm $CREATE_USER_FILE



#echo "---------- Created environment file: '$ENVFILE' used by gem:dotenv-rails"
rails db:drop
rails db:create
rails db:migrate
echo "---------- DB: created"
#sleep 1
rake db_import:import_api
echo "---------- Movies: imported"
#sleep 1
sudo bundle install
echo "---------- Gems: instaled"
#sleep 1
rails test
#echo "---------- Tests: completed"
