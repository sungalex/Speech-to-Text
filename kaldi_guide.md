# Kaldi 실습 (Kaldi 환경 구축)

## 한국어 입력을 위한 locale 설정

    (Root 계정으로 수행)
    >> apt-get install language-pack-ko
    >> locale-gen ko_KR.UTF-8
    (User 계정으로 수행)
    >> export LC_ALL=ko_KR.UTF-8
    >> export LANG=ko_KR.UTF-8

## FFMPEG 설치

    >> apt-get update
    >> apt-get install ffmpeg

## Vim  설정

    >> vim ~/.vimrc
    set nu
    set expandtab
    set tabstop=4
    set encoding=utf-8
    set fileencoding=utf-8

## 음성 데이터 준비 및 전처리 과정

    * 아래의 {user_name}은 각자 본인의 아이디로 변경함

    (터미널 실행 후)
    >> docker start kaldi
    >> docker cp study_01.sh kaldi:/home/{user_name}/test/
    >> docker cp study_02.sh kaldi:/home/{user_name}/test/
    >> docker cp p_01.sh kaldi:/home/{user_name}/test/

### LibriSpeech DATA

- LM : [https://drive.google.com/file/d/1IGZMscEJtwoQdBqM92Zl1lJLrDY1cT90/view?usp=sharing](https://drive.google.com/file/d/1IGZMscEJtwoQdBqM92Zl1lJLrDY1cT90/view?usp=sharing)
- AM : [https://drive.google.com/file/d/1y8LZjEHGnCkgScH80Kbdzy8NxzP-AsLi/view?usp=sharing](https://drive.google.com/file/d/1y8LZjEHGnCkgScH80Kbdzy8NxzP-AsLi/view?usp=sharing)

## MFCC 확인

    >> cd mfcc
    >> cat raw_mfcc_dev_clean.5.ark | copy-feats scp:raw_mfcc_dev_clean.5.scp ark,t:- | more

## 한국어 음성인식 시스템 구축 (1/5)

(1) 한국어 음성인식용 container 새로 생성 (약 60GB 필요 // 학습전 25GB)

    (cmd창에서) >> D:
    (cmd창에서) >> mkdir docker
    (cmd창에서) >> docker run -it --name kaldi-kor -p 8888:8888 kaldi-ubuntu:kaldi-ubuntu /bin/bash
    (root) >> apt-get install language-pack-ko
    (root) >> locale-gen ko_KR.UTF-8
    (root) >> apt-get install flac ffmpeg

(2) User 등록 및 환경 설정

    (root) >> adduser {alex}
    (root) >> chown -R {alex}:{alex} /usr/local/kaldi
    (root) >> su {alex}
    (alex) >> cd ~
    (alex) >> ln -s /usr/local/kaldi
    (alex) >> vim ~/.bashrc
    (맨 마지막에 추가함)
    export LC_ALL=ko_KR.UTF-8
    export LANG=ko_KR.UTF-8
    alex) >> source ~/.bashrc
    (alex) >> locale             (확인용)

(3) Anaconda 설치 (개인 계정에서 설치함)

    (alex) >> cd ~
    (alex) >> wget https://repo.anaconda.com/archive/Anaconda3-2019.07-Linux-x86_64.sh
    (alex) >> sh Anaconda3-2019.07-Linux-x86_64.sh
    (alex) >> source ~/.bashrc
    (alex) >> conda create --name kaldi python=3.6.5 pip ipykernel
    (alex) >> conda activate kaldi
    (alex) >> conda install notebook ipykernel (옵션 가능성 확인)
    (alex) >> ipython kernel install --user (옵션 가능성 확인)
    (alex) >> pip install gdown jupyter librosa

(4) Jupyter 구축

    >> (alex) cd ~/kaldi/egs/zeroth_korean/s5/
    >> (alex) jupyter notebook --allow-root --ip=0.0.0.0 --port=8888

(5) Kaldi 한국어 음성인식 시스템 구축

    (alex) >> cd ~/kaldi/egs/zeroth_korean/s5
    (alex) >> mkdir db
    (alex) >> cd db
    (alex) >> gdown --id 1ugQRqUL0EGBUqLqbjCf8BIFmlRi8630K --output db.tar.gz
    (alex) >> (Morfessor 설치)

(6) PyKaldi 설치

    (alex) >> conda install -c pykaldi pykaldi-cpu

## 한국어 음성인식 시스템 구축 (2/5)

(1) 실습 쥬피터 파일 및 모델 파일 다운로드

    (alex) >> cd ~/kaldi/egs/zeroth_korean/s5
    (alex) >> gdown --id 1Db1tnadUAVmekTbLbx5qRMRCW9yLl9Hc --output lecture.tar.gz
    (alex) >> tar xvfz lecture.tar.gz

(2) Morfessor 설치

    (alex) >> cd ~/kaldi/tools
    (alex) >> extras/install_morfessor.sh
    (alex) >> cat env.sh                (확인사항) 
    // export MORFESSOR="/usr/local/kaldi/tools/morfessor"

(3) KALDI PATH 설정

    (alex) >> cd ~
    (alex) >> vim ~/.bashrc
    (맨 마지막에 추가함)
    cd ~/kaldi/egs/zeroth_korean/s5
    . path.sh

(4) 실습 주피터 시작 (새로운 Command 창에서 실행)

    (cmd창에서) >> docker exec -it kaldi-kor /bin/bash
    (root) >> su {alex}
    (alex) >> conda activate kaldi
    (alex) >> jupyter notebook --allow-root --ip=0.0.0.0 --port=8888

## 한국어 음성인식 시스템 구축 (3/5)

[실습 코드](docs/nnet3-online-recognizer.updated_20190817.ipynb)

## 한국어 음성인식 시스템 구축 (4/5)

(1) 파이썬 Flask 모듈 기반의 Restful 음성인식 API 서버

    (alex) >> (kaldi-kor 도커 접속 후 본인 아이디로 변경)
    (alex) >> conda activate kaldi
    (alex) >> conda install flask
    (alex) >> pip install pydub

(2) SRILM 설치 (srilm-1.7.2.tar.gz)

    (alex) >> cd ~
    (alex) >> mkdir srilm
    (alex) >> cd srilm
    (alex) >> tar xvfz srilm-1.7.2.tar.gz
    (alex) >> vim Makefile
    (상단) SRILM 경로변경
    SRILM=/home/{alex}/srilm
    (alex) >> make 
    (alex) >> vim ~/.bashrc
    (아래의 두 라인 추가)
    export SRILM_PATH=/home/alex/srilm/bin/i686-m64
    export PATH=$PATH:$SRILM_PATH
    (alex) >> source ~/.bashrc

## 한국어 음성인식 시스템 구축 (5/5)

TBD
