# aws에서 제공하는 lambda base python image 사용
FROM amazon/aws-lambda-python:3.8

# optional : pip update
RUN /var/lang/bin/python3.8 -m pip install --upgrade pip

# install git  yum은 아마존 리눅스 기반의 패키지 관리자
RUN yum install git -y

# 미리 구성된 github clone
RUN git clone https://github.com/MarineCorps/lambda-container-example

# install packages
RUN pip install -r lambda-container-example/requirements.txt

# /var/task/ 경로로 실행파일 복사(AWS Lambda의 실행경로)
RUN cp lambda-container-example/lambda_function.py /var/task/
RUN cp lambda-container-example/imagenet_class_index.json /var/task/
#도커 이미지 내부에서 lambda-container-example/ 폴더에있는
#lambda_function.py파일은 /var/task/폴더로 복사

# 실행 시 lambda_function.py의 lambda_handler 함수를 실행시킴을 정의
CMD ["lambda_function.lambda_handler"]
