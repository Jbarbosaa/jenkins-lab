#!/bin/bash

counter=0

while [ $counter -lt 20 ]; do
        let counter=counter+1

        line=$(head -n 1 people.txt)
        name=$(echo "$line" | awk -F ',' '{print $1}')
        lastname=$(echo "$line" | awk -F ',' '{print $2}')
        age=$(echo "$line" | awk -F ',' '{print $3}')

        echo "Name: $name, Lastname: $lastname, Age: $age"
        echo "INSERT INTO people (name, lastname) VALUES ('$name', '$lastname');" >> insert_people.sql
        sed -i '1d' people.txt
        sleep 1
        echo "Counter: $counter"

        mysql -h sql_rost -u root -p1234 people -e "insert into register values ($counter, '$name', '$lastname', $age);"
        echo "Inserted: $counter, $name, $lastname, $age was correctly inserted into the database"
done
