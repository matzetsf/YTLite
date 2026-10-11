# tttool – das Schweizer Taschenmesser für den tiptoi-Stift
# https://github.com/entropia/tip-toi-reveng
FROM ubuntu:24.04 AS download

ARG TTTOOL_VERSION=1.11
ARG TTTOOL_SHA256=f8ca054fdc5ee7c3406a5f11d8df8d662d53fc9e7bfa3101ea046ebb358729ce

RUN apt-get update \
 && apt-get install -y --no-install-recommends ca-certificates curl unzip \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp
RUN curl -fsSL -o tttool.zip \
      "https://github.com/entropia/tip-toi-reveng/releases/download/${TTTOOL_VERSION}/tttool-${TTTOOL_VERSION}.zip" \
 && echo "${TTTOOL_SHA256}  tttool.zip" | sha256sum -c - \
 && unzip -q tttool.zip \
 && mv "tttool-${TTTOOL_VERSION}" tttool


FROM ubuntu:24.04

# espeak + oggenc werden für "speak:"-Einträge (Text-to-Speech) in YAML-Dateien gebraucht
RUN apt-get update \
 && apt-get install -y --no-install-recommends espeak-ng espeak-ng-espeak vorbis-tools \
 && rm -rf /var/lib/apt/lists/*

COPY --from=download /tmp/tttool/linux/tttool /usr/local/bin/tttool
COPY --from=download /tmp/tttool/templates    /usr/share/tttool/templates
COPY --from=download /tmp/tttool/example      /usr/share/tttool/example
COPY --from=download /tmp/tttool/Audio        /usr/share/tttool/Audio
COPY --from=download /tmp/tttool/book.pdf     /usr/share/doc/tttool/book.pdf

WORKDIR /work
ENTRYPOINT ["tttool"]
CMD ["--help"]
