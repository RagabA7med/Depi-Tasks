DB_IMAGE=mysql:8.4
DB_PORT=3306
MYSQL_DATABASE=petclinic
MYSQL_USER=petclinic
MYSQL_PASSWORD=petclinic
MYSQL_ROOT_PASSWORD=root
DB_HEALTHCHECK=mysqladmin ping -h 127.0.0.1 -upetclinic -ppetclinic || mysqladmin ping -h 127.0.0.1 -uroot -proot

# Spring
SPRING_DATASOURCE_URL=jdbc:mysql://db:3306/petclinic
SPRING_DATASOURCE_USERNAME=petclinic
SPRING_DATASOURCE_PASSWORD=petclinic
SPRING_JPA_HIBERNATE_DDL_AUTO=update
SPRING_PROFILES_ACTIVE=mysql
