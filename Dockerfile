# # 사용할 os
# 설치할 프로그램들
# 어떤 터미널 명령어 실행
# 어떤 파일 집어넣을 것인지 등 관련된 모든것을 총망라해서 작성하면 된다. 

# os가 설치된 이미지를 적는게 일반적 - 도커 허브에서 검색
FROM node:20-slim
# 파일들이 app폴더에 전부 카피됨
WORKDIR /app
# ******Docker file Tip1  변동성 적은 파일을 먼저 카피 하도록 적어두기
#  docker build 시간 단축하려면
# 단계별로 작업이 완료되면, 작업 내용을 캐싱해둔다. 기존것과 차이가 없으면 캐시데이터를 가져다가 쓴다
# 잘 안변하는걸 위에 변하는걸 아래에
# 예를 들어 package.json 같은 라이브러리 파일은 변동성이 적음 
COPY package*.json .

# ******Docker file Tip2 npm install 대신 ci 쓰기
# package-lock 파일을 기준으로 install 하라고 하는 의미 왜:? package.json은 버전 정보 앞에 ^4.XX 이런식으로 되어있는데 이건 버전이 소수점 단위로 업데이트 됐을 때 업데이트 된 버전으로 다운받아질 수도 있기 때문!!!
RUN ["npm", "install"]

# 환경 변수
# ENV 이름=값
COPY . .
EXPOSE 1234

# ******Docker file Tip3 코드 실행전 유저 권한 낮추기
# root 권한으로 실행되니까 유저를 하나 만들기 - 우리는 node 환경을 쓰니까 node 로 지정해줌
USER node

# docker 파일 마지막 명령어는 cmd 아니면 entrypoint 라고 적을 수 있다
CMD ["node", "server.js"]

# #  Docker 터미널 명령어 정리 
# # 이미지 만들기
# docker build -t 이미지이름:태그 .  
# # 이미지 실행
# docker run -d 이미지명:태그명 
# # 이미지 실행시 포트를 설정해야함
# # 내pc 포트 : 지정한 포트 
# # 왜 이렇게 해야할까? 사용자가 내 pc의 포트로 들어온건데, 가상pc의 포트쪽으로 안내를 해줘야한다. (캡쳐.png)
# docker run -p 8081:8080 -d 이미지명:태그명 
# # 실행중인 콘테이너 
# docker ps
# # 로그확인 
# docker logs 컨테이너 이름
# # 컨테이너로 접속 
# docker exec -it upbeat_pike sh
# # 나오는 것 
# ctrl + p
# # 컨테이너 정지
# docker stop 콘테이너이름
# # 컨테이너 삭제
# docker rm 콘테이너이름
# # 실행중 컨테이너 삭제 
# docker rm -f 콘테이너이름


