sudo -i -u postgres

psql

# create user
# cat auth/create-user.sql
# \q

createdb dbname

psql 
# add access to db
# cat auth/add-access-to-db.sql
# change owner
# cat auth/change-owner.sql
# \q

exit

psql -d dbname