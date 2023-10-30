# syntax=docker/dockerfile:1

# slim buster is one of the smallest python images available

FROM python:3.8-slim-buster

WORKDIR /python-docker

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

COPY . .

# instructs Docker to run our Flask app as a module, as indicated by the "-m" tag.
# Then it instructs Docker to make the container available externally, such as from our browser,
# rather than just from within the container. We pass the host port:

CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]

