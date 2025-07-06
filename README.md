```
aws configure

export ACCOUNT_ID=$(aws sts get-caller-identity --output text --query Account)

echo "export ACCOUNT_ID=${ACCOUNT_ID}" | tee -a ~/.bash_profile

docker tag lambda-ensemble $ACCOUNT_ID.dkr.ecr.ap-northeast-2.amazonaws.com/lambda-ensemble

aws ecr get-login-password --region ap-northeast-2 | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.ap-northeast-2.amazonaws.com

docker push $ACCOUNT_ID.dkr.ecr.ap-northeast-2.amazonaws.com/lambda-ensemble
```



https://github.com/workdd/lambda-container-example 에있는 프로젝트를 제 실습환경에 맞춰 변경했습니다.
