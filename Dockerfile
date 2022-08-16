FROM golang:1.16-alpine as build
COPY ./main.go /go/main.go
RUN go build main.go

FROM scratch
COPY --from=build /go/main /app/main

CMD ["/app/main"]