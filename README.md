# Speech-to-Text(음성인식)

## 딥러닝 강의 및 Docker 설치 가이드 : 모두를 위한 딥러닝 시즌2

- [https://www.edwith.org/boostcourse-dl-tensorflow](https://www.edwith.org/boostcourse-dl-tensorflow)

## Docker TensorFlow 설치 가이드

- [docker_guide.md](docker_guide.md)

## 학습용 코드 Clone 하기

- 아래 명령으로 본 github repository를 Clone 하세요.

    `git clone https://github.com/sungalex/Speech-to-Text.git`

- Speech-to-Text 폴더로 이동 후 아래 명령으로 github의 deeplearningzerotoall/TensorFlow 코드를 내려 받으세요.

    `git clone https://github.com/deeplearningzerotoall/TensorFlow.git`

## Digital Signal 개요

- [음성인식 개요](digital_signal_processing.md)

### 음성인식 관련 설명 자료

- Medium 자료 : [딥러닝(Deep Learning)을 이용한 음성 인식(Speech Recognition)](https://medium.com/@jongdae.lim/%EA%B8%B0%EA%B3%84-%ED%95%99%EC%8A%B5-machine-learning-%EC%9D%80-%EC%A6%90%EA%B2%81%EB%8B%A4-part-6-eb0ed6b0ed1d)

- 오디오 신호 잡음 제거 기술 (딥러닝) : [A Wavenet for Speech Denoising](http://www.jordipons.me/apps/speech-denoising-wavenet/25.html)

- [은닉마코프모델(Hidden Markov Models) 설명자료](https://ratsgo.github.io/machine%20learning/2017/03/18/HMMs/)

## Google Cloud Speech-to-Text / Text-to-Speech

- [Google Cloud Speech-to-Text 참고자료](https://github.com/sungalex/VoiceMagic)
- [Google Cloud Speech-to-Text 개발환경 설정하기](https://github.com/sungalex/VoiceMagic/blob/master/google%20cloud%20speech-to-text%20%EA%B0%9C%EB%B0%9C%ED%99%98%EA%B2%BD%20%EC%84%A4%EC%A0%95%ED%95%98%EA%B8%B0.pdf)

## Urban Sound Dataset 기반 HMM-DNN 실습(End-to-End 기법)

- Deep Learning Zero to All - PyTorch : [https://github.com/deeplearningzerotoall/PyTorch.git](https://github.com/deeplearningzerotoall/PyTorch.git)
- UrbanSound8K 구글 드라이브 링크 주소 : [link](https://drive.google.com/open?id=176DIx-0_uYWUuMD8oO57utQwhchsnmlW)
  - 압축풀기 : `tar -zxvf UrbanSound8K.tar.gz`
- Pytorch 및 패키지 추가 설치
  - `sudo apt-get update`
  - `sudo apt-get install sox libsox-dev libsox-fmt-all`
  - `pip3 install torch torchvision`
- torchaudio 설치
  - `pip3 install torchaudio -f https://download.pytorch.org/whl/torch_stable.html`
- 주피터 노트북 실행
  - `sh run_jupyter_docker.sh`
- 실습코드 : [실습용 주피터 노트북 파일](docs/urbansound8k_classifier_spectrogram_updated.ipynb)

## kaldi 설치 하기(Kaldi 도커 파일 생성 과정)

- docker 환경설정 변경(windows인 경우 docker icon > settings > Advanced)
  - CPU: 8Core
  - RAM: 8Giga 이상
  - SWAP: 2Giga
  - HDD: 64Giga
- `git clone https://github.com/kaldi-asr/kaldi.git`
- `cd kaldi/misc/docker/ubuntu`
- 도커파일(Dockerfile) 내용 변경 (내용 설명) : [Dockerfile_modified](Dockerfile_modified) 참조
  - "apt-get install"에 "unzip vim htop" 추가
  - WORKDIR /usr/local/kaldi/tools 아래에 "RUN extras/install_mkl.sh" 추가
- `docker build --tag kaldi-ubuntu:kaldi-ubuntu .`
- `docker run -it --name kaldi kaldi-ubuntu:kaldi-ubuntu bash`

## kaldi 실습 (Kaldi 환경 구축)

- [kaldi 환경 구축](kaldi_guide.md)

## Seq2Seq 학습자료

- 딥 러닝을 이용한 자연어 처리 입문 - [시퀀스-투-시퀀스(Sequence-to-Sequence, seq2seq)](https://wikidocs.net/24996)
- [케라스를 이용해 seq2seq를 10분안에 알려주기](https://tykimos.github.io/2018/09/14/ten-minute_introduction_to_sequence-to-sequence_learning_in_Keras/)
- RNN 관련 자료: [ratsgo's blog - RNN과 LSTM을 이해해보자](https://ratsgo.github.io/natural%20language%20processing/2017/03/09/rnnlstm/)

## 음성인식 프로젝트

### 음성인식 실습 환경 구축 (Local PC + Anaconda + Jupyter Lab)

    (Anaconda Prompt) >> D:
    (Anaconda Prompt) >> mkdir seq2seq
    (Anaconda Prompt) >> cd seq2seq
    (Anaconda Prompt) >> conda create -n cuda python=3.6.5 pip ipykernel 
    (Anaconda Prompt) >> conda activate cuda
    (Anaconda Prompt) >> conda install pytorch torchvision cudatoolkit=10.0 -c pytorch  (본인의 환경에 따라 명령어가 달라짐. https://pytorch.org 참조)
    (Anaconda Prompt) >> pip install gdown librosa python-Levenshtein jupyterlab
    (Anaconda Prompt) >> jupyter lab --port 8889
    (JupyterLab Terminal) >> gdown --id 1H02H4-ema1NeiHfBPSrqqopNiwcvtovf --output db.tar.gz
    (JupyterLab Terminal) >> tar xvfz db.tar.gz
