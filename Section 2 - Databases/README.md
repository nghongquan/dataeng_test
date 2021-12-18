# Usage
1. Ensure that the Dockerfile and car_dealership.sql are in the same directory
2. Run the following in CMD to create the Docker Image: <br>
    <code>docker build -t car-dealership-db ./</code>
3. Run the following in CMD to run the Docker Image: <br>
    <code>docker run -d --name car-dealership-container -p 5432:5432 car-dealership-db</code>
    
# ERD
1. car_details has a one-to-many relationship with car
2. car has a one-to-one relationship with sales