FROM python:3.6.2

RUN apt-get update \
 && apt-get install -y \
      git \
      unzip \
 && rm -rf /var/lib/apt/lists/*

# フォントとして Ricty Diminished をインストールする。
WORKDIR /usr/share/fonts
ENV RICTY_DIMINISHED_VERSION 3.2.4
ADD https://github.com/mzyy94/RictyDiminished-for-Powerline/archive/$RICTY_DIMINISHED_VERSION-powerline-early-2016.zip .
RUN unzip -jo $RICTY_DIMINISHED_VERSION-powerline-early-2016.zip \
 && fc-cache -fv

# Matplotlib 用の設定ファイルを用意する。
WORKDIR /etc
RUN echo "backend : Agg" >> matplotlibrc \
 && echo "font.family : Ricty Diminished" >> matplotlibrc

# Matplotlib をインストールする。
WORKDIR /opt/app
ENV MATPLOTLIB_VERSION 2.0.2
RUN pip install matplotlib==$MATPLOTLIB_VERSION

# Matplotlib を使ったサンプルスクリプトをコピーする。
COPY plot.py .
