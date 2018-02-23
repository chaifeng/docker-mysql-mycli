# mycli in docker

This docker image is a MySQL client which is provided by mycli

## Usage

### Just run it

    docker run -it chaifeng/mycli
    
    docker run -it chaifeng/mycli --version
    
    docker run -it chaifeng/mycli -h mysqlserver -u root

### Connect to a MySQL server

    docker run -it --name mycli \
           -e MYSQL_DATABASE=your-dbname \
           -e MYSQL_HOST=your-mysql-container \
           -e MYSQL_USER=your-mysql-username \
           -e MYSQL_PASSWORD="your-mysql-password" \
           --network your-network \
           chaifeng/mycli

## Optional Variables

- `MYSQL_HOST`
  the host/ip of your mysql database
- `MYSQL_USER`
  the username of your mysql database
- `MYSQL_PASSWORD`
  the password of your mysql database
- `MYSQL_ROOT_PASSWORD`
  the root's password of your mysql database
- `MYSQL_DATABASE`
  the database name to use
