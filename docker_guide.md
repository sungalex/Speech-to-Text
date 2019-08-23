# Docker TensorFlow 가이드

## Docker 설치 가이드

[Tensorflow Docker 설치 가이드](https://github.com/deeplearningzerotoall/TensorFlow/blob/master/docker_user_guide.md)

## 도커 TensorFlow 이미지 설치

- [hub.docker.com](http://hub.docker.com) 에서 도커 이미지를 받아서 설치 합니다.(회원 가입이 필요 합니다.)

  - Windows에 설치하는 경우, Hyper-V가 활성화(Enabled) 되어 있지 않으면 Docker가 정상적으로 실행되지 않을 수 있습니다.
  - 이 경우 Bios 설정(부팅 시 F2 또는 Del 키로 진입 가능)에서 가상화 설정을 Enable로 변경해주면 됩니다.

- docker 설치가 완료되면, tensorflow docker 이미지를 다운로드 합니다.

    `docker pull deeplearningzerotoall/tensorflow`

- 설치된 docker images를 확인 합니다.

    `docker images`

- 도커 이미지로부터 컨테이너를 생성하고 실행합니다.(jupyter notebook이 실행 됩니다.)

    `docker run -i -t --name tf -p 8888:8888 -p 6006:6006 deeplearningzerotoall/tensorflow`

  - 위 명령 실행 후 나타나는 URL 주소를 웹 브라우저에 붙여넣기 하면 jupyter notebook에 접속 됩니다.
      (<http://localhost:8888/?token=62d657f6a1ca13df9c26859ed2ab36b80e85cd72a7d3fd5a> 와 같은 토큰이 포함된 URL)
  - token을 잊어버린 경우, <http://localhost:8888/> 에 접속하면, 실행중인 jupyter notebook list를 확인할 수 있는 방법을 알려줍니다.
  - 아래 명령으로 container에 접속해서, 실행중인 jupyter notebook list에서 token을 확인 할 수 있습니다.

      `docker exec -it tf /bin/bash`

      `jupyter notebook list`

- 명령 창을 하나 더 띄워서 docker 프로세스를 확인 합니다.

    `docker ps -a`

  - status가 "Up 2 minutes"와 같이 나타나면 컨테이너가 실행중인 상태 입니다.

- 아래 명령으로 종료된 컨테이너를 다시 실행할 수 있습니다.(docker run 명령은 한번 만 실행하면 됩니다.)

    `docker start tf`

- docker 터미널(bash 명령창)에 접속하려면 아래 명령을 실행하면 됩니다.

    `docker exec -it tf /bin/bash`

- docker 컨테이너 shell(bash)에서 빠져 나오려면 아래 명령을 사용합니다.

    `exit`

- docker 컨테이너를 종료하려면 아래 명령을 사용 합니다.

    `docker stop tf`

- docker 컨테이너를 삭제하려면 아래 명령을 사용 합니다.

    `docker rm tf`

## 도커 허브를 이용한 image backup 및 재설치

- Docker 컨테이너(Container) 커밋(Commit) 및 이미지(Image) 푸시(Push) 하기 : [참고 사이트](https://nicewoong.github.io/development/2018/03/06/docker-commit-container/)

### 도커 허브를 이용한 백업 과정

    >> docker commit tf (도커허브 아이디)/tf:20190724
    >> docker login
       (도커허브 아이디, 패스워드 입력)
    >> docker push (도커허브 아이디)/tf:20190724

### 도커 허브를 이용한 도커 생성 과정

    (): 본인에 맞도록 수정 사항 
    >> docker login
    >> docker pull (cloudai/tf:20190725)
    >> docker run -i -t --name (tf_20190725) -p 8888:8888 -p 6006:6006 (cloudai/tf:20190725) /bin/bash
