FROM alpine:3.18.3

RUN apk update && apk add nginx

# Move our nginx configuration to the standard nginx path
COPY files/nginx.conf /etc/nginx/nginx.conf

# Add our static files to a common folder to be provided by nginx
RUN mkdir -p /site
COPY files/register_service /site/register_service
COPY site/ /site/

# Copy everything for your application
COPY files/entrypoint.sh /entrypoint.sh

# Add docker configuration
LABEL permissions='{\
  "ExposedPorts": {\
    "80/tcp": {}\
  },\
  "HostConfig": {\
    "PortBindings": {\
      "80/tcp": [\
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

ENTRYPOINT ["/entrypoint.sh"]
