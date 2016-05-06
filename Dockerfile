FROM scratch
MAINTAINER Joshua Haase <hahj87@gmail.com>
VOLUME ["/data"]
VOLUME ["/results"]
VOLUME ["/reference"]
VOLUME ["/pipeline"]
ADD "surpi.tar.gz" "/"
RUN useradd -m -d /pipeline surpiuser; \
	printf "change-this-pass\nchange-this-pass\n" | passwd root
ENTRYPOINT ["su", "-", "surpiuser"]
