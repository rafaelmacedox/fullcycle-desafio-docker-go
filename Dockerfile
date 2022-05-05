## Stage 1
FROM golang:alpine as build

WORKDIR /app

COPY . .

RUN go build -o code-rocks .


## Stage 2
FROM scratch

WORKDIR /

COPY --from=build /app/code-rocks /code-rocks

CMD [ "/code-rocks" ]