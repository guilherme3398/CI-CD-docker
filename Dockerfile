# FROM ubuntu:latest

# EXPOSE 8000

# WORKDIR /app

# COPY ./main main

# CMD [ “./main” ]

# Estágio 1: Compilação do código Go
FROM golang:1.22-alpine AS builder

WORKDIR /app

COPY . .

RUN go mod tidy
RUN CGO_ENABLED=0 go build -o /app/main main.go

# ---

# Estágio 2: Imagem final com o executável
FROM scratch

WORKDIR /app

ENV HOST=localhost DBPORT=5432 
ENV USER=root PASSWORD=root DBNAME=root



COPY --from=builder /app/main .

EXPOSE 8000

CMD ["./main"]

