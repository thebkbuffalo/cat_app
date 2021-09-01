# Welcome to the cat image api!

How to get started:

- clone down the repo or download the repo
- download and setup docker if you haven't already(https://www.docker.com/)
- download and setup mysql if you haven't already. this can be done a few different ways so whatever method works best for you.
- run: docker-compose build
- run: docker-compose up
- run: docker-compose run web rake db:create to set up your database
- CONGRATULATIONS your cat image api is ready to CRUD some cats.

- for testing I used a combo of a (very) basic html front end that connected to localhost:3000 with CORS setup to accept all traffic on the rails side. I also used the Postman app for some localhost testing.
