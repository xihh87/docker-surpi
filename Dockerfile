FROM scratch
MAINTAINER Joshua Haase <hahj87@gmail.com>
VOLUME ["/data"]
VOLUME ["/results"]
VOLUME ["/reference"]
VOLUME ["/pipeline"]
ADD "surpi.tar.gz" "/"
RUN useradd -m -d /pipeline surpiuser; \
	chown surpiuser:surpiuser /data /results /reference /pipeline ; \
	printf "change-this-pass\nchange-this-pass\n" | passwd root
ENTRYPOINT ["su", "-", "surpiuser"]
