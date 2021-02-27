FROM golang:1.15-alpine AS build

WORKDIR /go/src/app
COPY . .

ENV CGO_ENABLED=0
RUN go get && export ver=$(cat version) && go build -ldflags='-X main.AppVersion='$ver -o app main.go

FROM alpine:3.12
LABEL Maintainer="Denis Danilov <ddanilov77@mail.ru>" \
      Description="Lightweight container with output sample logs based on Alpine Linux."
RUN apk add tzdata
WORKDIR /app
COPY --from=build /go/src/app/app /app/
CMD ["/app/app"]
