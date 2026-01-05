package user

import (
	pb "UserService/proto/pkg/api/user"
	"context"
	"log"
)

type UserServiceImpl struct {
	pb.UnimplementedUserServiceServer
}

func (s *UserServiceImpl) SearchByNickname(ctx context.Context,
	req *pb.SearchByNicknameRequest,
) (*pb.SearchByNicknameResponse, error) {

	log.Println("Достучался до метода")

	return &pb.SearchByNicknameResponse{
		Results: []*pb.UserProfile{},
	}, nil
}
