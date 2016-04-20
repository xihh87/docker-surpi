FROM scratch
MAINTAINER Joshua Haase <hahj87@gmail.com>
VOLUME ["/data"]
ADD "surpi.tar.gz" "/"
ENTRYPOINT ["/usr/bin/bash"]
