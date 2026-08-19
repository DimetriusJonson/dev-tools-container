FROM gcr.io/distroless/cc-debian12:nonroot AS runner

WORKDIR /app

COPY --chmod=755 target/work/server /app/
COPY target/work/site /app/site

EXPOSE 80

ENV LEPTOS_SITE_ROOT=site \
    LEPTOS_SITE_ADDR=0.0.0.0:80

CMD ["/app/server"]
