FROM alpine:3.22.4 AS runner

WORKDIR /app

COPY target/work/server /app/
COPY target/work/dist /app/dist
RUN chmod +x /app/server

RUN pwd
RUN ls -l
EXPOSE 80

CMD ["/app/server", "--addr=0.0.0.0:80"]
