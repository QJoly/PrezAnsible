FROM alpine as builder
WORKDIR /data
COPY . .
RUN apk --no-cache add py3-pip python3-dev git curl
RUN pip3 install git+https://gitlab.com/da_doomer/markdown-slides.git
RUN curl -o /usr/lib/python3.9/site-packages/mdslides/cdn-release/build/styles/zenburn.min.css https://unpkg.com/browse/@highlightjs/cdn-assets@10.5.0/styles/zenburn.min.css
RUN mdslides CyberPrez.md --include img
RUN ls -lah
FROM alpine

RUN apk update \
    && apk add lighttpd \
    && rm -rf /var/cache/apk/*

COPY --from=builder /data/dist /var/www/localhost/htdocs

CMD ["lighttpd","-D","-f","/etc/lighttpd/lighttpd.conf"]
