FROM filebrowser/filebrowser:latest
RUN apk --update add ca-certificates \
                     mailcap \
                     curl

HEALTHCHECK --start-period=2s --interval=5s --timeout=3s \
  CMD curl -f http://localhost/health || exit 1
LABEL io.openshift.expose-services="81:http"
VOLUME /srv


COPY .docker.json /.filebrowser.json

ENTRYPOINT [ "/filebrowser" ]
