# Azure web app deployed using docker, terraform, azure container registry

# Command to build the container:
 docker build -t azure-react-app-neilacosta .
 
 --run this if you have mac m:
 docker build -t azure-react-app-neilacosta --platform linux/amd64 .

# Command to run the container 
 docker run -p 3000:80 azure-react-app-neilacosta