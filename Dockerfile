
FROM nginx:alpine


RUN echo "<h1>Assignment 1: Automated Deployment</h1><p>Student: Alan</p>" > /usr/share/nginx/html/index.html

EXPOSE 80
FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html