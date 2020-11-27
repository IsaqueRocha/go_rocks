FROM golang:1.14 as BUILDER

WORKDIR /go/src/app
COPY . .

RUN go get -d -v ./...
RUN go install -v ./...
RUN go build -v

CMD ["ls"]

FROM hello-world

WORKDIR /go/src/app

COPY --from=BUILDER /go/src/app/app .

CMD ["./app"]