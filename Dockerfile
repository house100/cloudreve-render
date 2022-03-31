FROM debian:stable-slim

ADD conf.ini /root/cloudreve/conf.ini
# 付费版需要下载许可证，删除下方的#
#ADD key.bin /root/cloudreve/key.bin
ADD run.sh /root/cloudreve/run.sh

RUN apt-get update \
    && apt-get install wget curl  -y

# 使用付费版,删除#号，普通版要加#
#RUN wget -qO cloudreve.tar.gz https://github.com/cloudreve/Cloudreve/releases/download/3.4.2/cloudreve_3.4.2_linux_amd64.tar.gz
# 使用普通版，要使用付费版，普通版前要加#
RUN wget -qO cloudreve.tar.gz https://github.com/cloudreve/Cloudreve/releases/download/3.4.2/cloudreve_3.4.2_linux_amd64.tar.gz
    
RUN tar -zxvf cloudreve.tar.gz -C /root/cloudreve
RUN chmod +x /root/cloudreve/cloudreve \
    && chmod +x /root/cloudreve/run.sh

CMD /root/cloudreve/run.sh
