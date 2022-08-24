FROM alpine:3.12

RUN apk --no-cache add wget curl bash

RUN wget -O upx.tar.gz http://collection.b0.upaiyun.com/softwares/upx/upx_0.3.6_linux_x86_64.tar.gz \
  && tar -zxf upx.tar.gz \
  && mv upx /usr/local/bin/upx \
  && chmod +x /usr/local/bin/upx

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
