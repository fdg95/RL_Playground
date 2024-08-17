FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-runtime

#Install system packages
RUN apt-get update && apt-get install -y python3 python3-pip

WORKDIR /code/

COPY requirements.txt .

RUN pip install --no-cache-dir --upgrade -r requirements.txt

#Copy the rest of the application code
COPY ./src /code

#Expose tensorboard port
EXPOSE 6006

#Default command to run when the container starts
CMD ["python3"]
