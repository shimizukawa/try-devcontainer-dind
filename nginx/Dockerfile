FROM nginx:1.21

ENV NGINX_ROUTER_RESOLVER_IP_ADDRESS 127.0.0.11
ENV NGINX_ROUTER_BACKEND_HOST backend-management:8000
ENV NGINX_ROUTER_FRONTEND_HOST frontend-management:3000
RUN mkdir /etc/nginx/templates
COPY etc/nginx/templates/*.conf.template /etc/nginx/templates/
