ARG TAG=express:21.3.0-xe

FROM container-registry.oracle.com/database/${TAG} as builder

LABEL org.opencontainers.image.source https://github.com/NickYahrKvcc/banner-db-mono/tree/main

COPY ./startup /docker-entrypoint-initdb.d

ENV ORACLE_CHARACTERSET=AL32UTF8
ENV ORACLE_PWD=mysecretpassword

RUN /opt/oracle/runUserScripts.sh /docker-entrypoint-initdb.d

FROM container-registry.oracle.com/database/${TAG}

COPY --from=builder /opt/oracle/oradata /opt/oracle/oradata