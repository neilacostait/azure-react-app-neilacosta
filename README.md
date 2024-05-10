# Azure web app deployed using docker, terraform, azure container registry

Command to build the container:
 docker build -t azure-react-app-neilacosta .

Command to run the container (use 8000:80) ngnix
 docker run -p 8000:80 my-react-app
