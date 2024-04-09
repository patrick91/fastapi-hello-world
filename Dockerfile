FROM python:3.12-slim

# install PDM
RUN pip install -U pip setuptools wheel
RUN pip install pdm

# copy files
COPY pyproject.toml pdm.lock /project/
COPY . /project

WORKDIR /project
RUN pdm install --prod --no-lock --no-editable

ENV PORT=8000
STOPSIGNAL SIGINT


CMD ["pdm", "start", "--port", "${PORT}"]
