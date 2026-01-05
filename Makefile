PROTO_SRC=api/user/v1
OUT=.
DOCKER_IMAGE=namely/protoc-all:1.56_0

# Проверяем, установлен ли локальный protoc
HAVE_PROTOC := $(shell command -v protoc 2> /dev/null)

.PHONY: proto
proto:
ifeq ($(HAVE_PROTOC),)
	@echo "⚠️  protoc не найден — использую Docker"
	docker run --rm \
	  -v $(PWD):/workspace \
	  -w /workspace \
	  $(DOCKER_IMAGE) \
	  -d $(PROTO_SRC) \
	  -l go \
	  -o $(OUT)
else
	@echo "✔ Использую локальный protoc"
	protoc -I $(PROTO_SRC) \
	  --go_out=$(OUT) \
	  --go-grpc_out=$(OUT) \
	  $(PROTO_SRC)/*.proto
endif
