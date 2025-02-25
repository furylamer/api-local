# Используем официальный образ Go
FROM golang:1.20-alpine

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем файлы Go-модуля и загружаем зависимости
COPY go.mod go.sum ./
RUN go mod download

# Копируем исходный код
COPY . .

# Собираем приложение
RUN go build -o main ./cmd/main.go

# Открываем порт
EXPOSE 8080

# Запускаем приложение
CMD ["./main"]
