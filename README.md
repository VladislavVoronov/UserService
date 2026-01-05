# UserService
Сервис для юзеров


## Генерация protobuf и gRPC

Перед запуском нужно сгенерировать код:

```bash
protoc -I api/user/v1 \
  --go_out=. \
  --go-grpc_out=. \
  api/user/v1/*.proto