### Backup of databases with docker

### Copy files from one server to another
```bash
scp -3 user@iphost1:/home/sunday/projects/finnice/fin-app-1/public/site/images/slides/* \
user@iphost2:/home/sunday/projects/finnice/app-fin/public/site/images/slides
```

### Backup
```bash
docker exec CONTAINER /usr/bin/mysqldump -u root --password=root DATABASE > backup.sql
```

### Restore
```bash
cat backup.sql | docker exec -i CONTAINER /usr/bin/mysql -uroot -proot DATABASE
```

### Host Is Not Allowed to Connect to This MySQL Server (from phpMyAdmin)

[resolution](https://support.infrasightlabs.com/troubleshooting/host-is-not-allowed-to-connect-to-this-mysql-server/)

```bash
> CREATE USER 'root'@'%' IDENTIFIED BY 'root_password';
> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
```

### How to reset the root password in MySQL 8.0.11?

[resolution](https://stackoverflow.com/questions/50691977/how-to-reset-the-root-password-in-mysql-8-0-11)

```bash
> ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'yourpasswd';
```