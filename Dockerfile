FROM scratch AS runner
#FROM alpine:3.22.4 AS runner

WORKDIR /app

COPY --chmod=755 target/work/server /app/
COPY target/work/dist /app/dist

EXPOSE 80

CMD ["/app/server", "--addr=0.0.0.0:80"]
