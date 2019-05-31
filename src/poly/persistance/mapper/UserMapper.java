package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.UserDTO;

@Mapper("UserMapper")
public interface UserMapper {
	public int insertUserDTO(UserDTO uDTO) throws Exception;
	public List<UserDTO> getUserList() throws Exception; // List 인터페이스 타입으로 UserDTO를
	public UserDTO getUserLogin(UserDTO uDTO) throws Exception; // 함수명 getUserLogin로 xml 이랑 연결
	public String getId(UserDTO uDTO) throws Exception;
}