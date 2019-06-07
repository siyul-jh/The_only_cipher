package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.UserDTO;

@Mapper("UserMapper")
public interface UserMapper {
	public int insertUserDTO(UserDTO uDTO) throws Exception;
	public List<UserDTO> getUserList() throws Exception;
	public UserDTO getUserLogin(UserDTO uDTO) throws Exception;
}