PROTO_SRC=api/user/v1
PROTOC=protoc

.PHONY: proto
proto:
	$(PROTOC) -I $(PROTO_SRC) \
	  --go_out=. \
	  --go-grpc_out=. \
	  $(PROTO_SRC)/*.proto
