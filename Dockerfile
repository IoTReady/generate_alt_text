FROM ubuntu:18.04
#MAINTAINER <your name> "<your email>"
RUN apt-get update -y && apt-get install -y wget python3-pip python3-dev libsm6 libxext6 libxrender-dev
#We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt
RUN wget https://pjreddie.com/media/files/yolov3.weights
COPY . /app
ENTRYPOINT [ "python3" ]
CMD [ "app.py" ]