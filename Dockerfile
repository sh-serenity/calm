FROM golang:buster
ENV GOPATH /go
RUN apt-get update
RUN apt-get install git

WORKDIR /go

RUN git clone https://sh-serenity:c3pozhaby@github.com/sh-serenity/calm.git

WORKDIR /go/calm
RUN go get github.com/go-sql-driver/mysql github.com/gorilla/sessions github.com/shurcooL/github_flavored_markdown
COPY mailrq.go /go/calm
RUN go build

RUN mkdir /app
RUN cp calm /app
RUN cp -R ./static /app
RUN cp -R ./tmpl /app

WORKDIR /app

CMD /app/calm


