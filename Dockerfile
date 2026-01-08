FROM python:3.11-slim-bookworm AS builder

WORKDIR /working

RUN apt-get update
RUN apt-get install -y git vim
RUN python -m pip install quart uvicorn

COPY .vimrc /root/.vimrc
COPY .vim /root/.vim
COPY .ssh /root/.ssh
RUN git config --global user.email "alt.mattr@gmail.com"
RUN git config --global user.name "Matt Roberts"

ENV TERM=xterm-256color
RUN echo 'export PS1="\[\e[38;5;251m\]\u@$TAG \w > \[\e[0m\]"' >> /root/.bashrc

# copy over our app
COPY app /app
COPY entrypoint.sh entrypoint.sh

# Add docker configuration
LABEL permissions='{\
  "ExposedPorts": {\
    "8000/tcp": {}\
  },\
  "HostConfig": {\
    "PortBindings": {\
      "8000/tcp": [\
        {\
          "HostPort": ""\
        }\
      ]\
    }\
  }\
}'
LABEL version="0.0.1"
LABEL authors='[\
    {\
        "name": "Matt Roberts",\
        "email": "alt.mattr@gmail.com"\
    }\
]'
LABEL company='{\
    "about": "Consultancy specialising in scientific software",\
    "name": "ALT Scientific",\
    "email": "alt.mattr@gmail.com"\
}'
LABEL readme="https://raw.githubusercontent.com/altmattr/fuzzy-data-viewer/master/README.md"
LABEL type="tool"
LABEL tags='[\
  "mapping",\
  "data"\
]'

ENTRYPOINT ["/working/entrypoint.sh"]
