package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.UserDTO;
import poly.persistance.mapper.UserMapper;
import poly.service.IUserService;

@Service("UserService")
public class UserService implements IUserService{
	
	@Resource(name = "UserMapper")
	private UserMapper userMapper;
	
	@Override //사용자 생성
	public int insertUserDTO(UserDTO uDTO) throws Exception {
		return userMapper.insertUserDTO(uDTO);
	}
	@Override //사용자 리스트
	public List<UserDTO> getUserList() throws Exception {
		return userMapper.getUserList();
	}
	@Override //사용자 로그인
	public UserDTO getUserLogin(UserDTO uDTO) throws Exception {
		return userMapper.getUserLogin(uDTO);
	}
}
