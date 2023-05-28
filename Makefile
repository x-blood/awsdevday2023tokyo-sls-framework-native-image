STACK_NAME=awsdevday2023tokyo-sls-framework-native-image

build:
	mvn clean package -Pnative

sam-deploy-guided:
	sam deploy --guided --stack-name ${STACK_NAME}

sam-deploy:
	sam deploy

sam-delete:
	sam delete
