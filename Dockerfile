# Container image that runs your code
FROM alpine:3.12

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh
# Make sure to make you entrypoint.sh file executable:
RUN chmod +x entrypoint.sh

RUN apk update \
 && apk add --no-cache wget \
 && wget -O upx.tar.gz http://collection.b0.upaiyun.com/softwares/upx/upx_0.3.6_linux_x86_64.tar.gz \
 && tar -zxf upx.tar.gz \
 && mv upx /usr/local/bin/upx \
 && chmod +x /usr/local/bin/upx

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
