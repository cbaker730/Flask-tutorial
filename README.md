# Flask-tutorial

*** Assumes Ubuntu 20.04 with Python v3.8.5 ***

If you don't have docker installed, run 01_install_docker.sh. If all went well, you should be greeted with 'Hello from Docker!'

Now that docker is installed, let's create a MySQL database to be integrated with our application

Verify Python v3.8.5 is installed

    $ python3 -V
    Python3.8.5
    

Run 01 to set up docker, docker-compose
Run 02 to set up a mysql container

Connect to docker with

    mysql -h 127.0.0.1 -P 3306 -u root -p

Load employee data (source: https://github.com/datacharmer/test_db )

    mysql -h 127.0.0.1 -P 3306 -u root -p < employees.sql

Create app
