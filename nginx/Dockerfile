# step1 docker hub에서 nginx 받기
FROM nginx:1.27.2-alpine

COPY ./myconfig.conf/etc/nginx/conf.d/myconfig.conf
RUN rm/etc/nginx/config.d/delete.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

# 지금 nginx는 port1234와 다른 가상 pc에서 구동 되고 있다. 
# 그래서 80으로 들어와서 8080포트로 연결하는게 불가능
# 이럴 때는 네트워크를 하나 만들어서, 가상컴퓨터의 임의의 ip가 부여되면 
# 해당 ip를 이용해서 가상 pc간 소통을 하도록 만들어 주면 된다. 