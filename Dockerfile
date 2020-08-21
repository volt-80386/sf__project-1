FROM python:3
COPY *.html /srv/
EXPOSE 8080
WORKDIR /srv
RUN cp bugs.html index.html
CMD python -m http.server 8080
