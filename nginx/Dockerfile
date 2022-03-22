FROM nginx:stable

COPY *conf /etc/nginx/conf.d/
RUN rm /etc/nginx/conf.d/default.conf

CMD [ "sh", "-c", "nginx -g 'daemon off;'" ]
