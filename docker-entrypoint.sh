#!/bin/sh

cat > /hibiscus-server/cfg/de.willuhn.jameica.hbci.rmi.HBCIDBService.properties <<EOF
database.driver=de.willuhn.jameica.hbci.server.DBSupportMySqlImpl
database.driver.mysql.jdbcurl=jdbc\:mysql\://${DB_HOST}\:${DB_PORT}/${DB_NAME}?useUnicode\=Yes&characterEncoding\=ISO8859_1
database.driver.mysql.username=${DB_USERNAME}
database.driver.mysql.password=${DB_PASSWORD}
EOF

cat > /hibiscus-server/cfg/de.willuhn.jameica.webadmin.Plugin.properties <<EOF
listener.http.address=${LISTEN_ADDRESS}
listener.http.port=${LISTEN_PORT}
listener.http.auth=true
listener.http.ssl=true
EOF

./hibiscus-server/jameicaserver.sh -p $PASSWORD -f /srv/hibiscus