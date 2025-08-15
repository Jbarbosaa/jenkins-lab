echo maven-project > /tmp/.env
echo $BUILD_TAG >> /tmp/.env
echo $pass >> /tmp/.env

sed -i '1s/^/IMAGE=/' /tmp/.env
sed -i '2s/^/TAG=/' /tmp/.env
sed -i '3s/^/pass=/' /tmp/.env


scp -i ~/.ssh/prod /tmp/.env prod-user@54.207.139.47:/tmp/.env
scp -i ~/.ssh/prod /home/jenkins/jenkins-data/pipeline/jenkins/deploy/publish.sh prod-user@54.207.139.47:/tmp/publish.sh

#ssh -i ~/.ssh/prod prod-user@54.207.139.47 './tmp/publish.sh'

ssh -i ~/.ssh/prod prod-user@54.207.139.47 'bash /tmp/publish.sh'