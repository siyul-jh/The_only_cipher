package poly.service;

import java.util.List;

import poly.dto.UserDTO;

public interface IUserService {
	public int insertUserDTO(UserDTO uDTO) throws Exception;
	public List<UserDTO> getUserList() throws Exception;
	public UserDTO getUserLogin(UserDTO uDTO) throws Exception;
}