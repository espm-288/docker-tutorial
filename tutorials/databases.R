library(dbplyr)
library(DBI)
library(nycflights13)

### SQLite ###

#sqlite <- DBI::dbConnect(RSQLite::SQLite(), path = ":memory:")
sqlite <- DBI::dbConnect(RSQLite::SQLite(), path = "ex.sqlite")
sqlite_src <- dbplyr::src_dbi(sqlite)
copy_nycflights13(sqlite_src)


##### POSTGRES -- Working #####

pd <- DBI::dbConnect(RPostgreSQL::PostgreSQL(), 
                     host = "postgres",
                     user = "postgres",
                     password = "password"
)
DBI::dbWriteTable(pd, "flights", flights, overwrite = TRUE)

postgres_src <- src_dbi(pd)
copy_nycflights13(postgres_src)


#### MYSQL -- Issues losing connection ########
mysql <- DBI::dbConnect(RMySQL::MySQL(),
                      dbname = "mysql",
                      host = "mariadb",
                      user = "root",
                      password = rstudioapi::askForPassword("Database password")
)
## Manual way to write to a table
DBI::dbWriteTable(mysql, "flights", flights, overwrite = TRUE)

## create dbplyr representation of the src
mysql_src <- dbplyr::src_dbi(mysql)

## dbplyr short-cut, not recommended, not sure why.
copy_to(mysql_src, flights)


