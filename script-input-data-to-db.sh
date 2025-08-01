#!/bin/bash

counter=0

while [ $counter -lt 50 ]; do
        let counter=counter+1

        name= $(nl people.txt | grep -w $counter | awk '{print $2}' | awk -F ',' '{print $1}')
        lastname= $(nl people.txt | grep -w $counter | awk '{print $2}' | awk -F ',' '{print $2}')
        age= $(nl people.txt | grep -w $counter | awk '{print $2}' | awk -F ',' '{print $3}')
        echo "Name: $name, Lastname: $lastname, Age: $age"
        echo "INSERT INTO people (name, lastname) VALUES ('$name', '$lastname');" >> insert_people.sql
        sed -i '1d' people.txt
        sleep 1
        echo "Counter: $counter"

        mysql -u root -p1234 people -e "insert into register values ($counter, '$name', ', $lastname', $age);"
        echo "Inserted: $counter, $name, $lastname, $age was correctly inserted into the database"
done
