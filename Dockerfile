FROM scratch AS runner

WORKDIR /app

COPY target/work/server /app/
COPY target/work/dist /app/dist

EXPOSE 80

CMD ["/app/server", "--addr=127.0.0.1:80"]
