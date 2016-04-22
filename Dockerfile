FROM scratch
MAINTAINER Joshua Haase <hahj87@gmail.com>
VOLUME ["/data"]
VOLUME ["/results"]
ADD "surpi.tar.gz" "/"
RUN useradd -m -d /results surpiuser
ENTRYPOINT ["su", "-", "surpiuser"]
