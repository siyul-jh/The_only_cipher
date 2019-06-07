package poly.dto;

/**
 * @author 이협건
 * @version 1.1 공지사항 DTO
 */
public class UserDTO {
	// user DB
	private String user_no; // 기본키, 순번
	private String user_id; // 아이디 (이메일)
	private String user_pw; // 비밀번호
	private String user_phone; // 연락처
	private String user_date;// 생년월일
	private String reg_dt; // 생성일자
	private String active; // 활성화여부
	// Email
	
	
	public String getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
	public String getUser_no() {
		return user_no;
	}
	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_date() {
		return user_date;
	}
	public void setUser_date(String user_date) {
		this.user_date = user_date;
	}
	public String getUser_dt() {
		return reg_dt;
	}
	public void setUser_dt(String user_dt) {
		this.reg_dt = user_dt;
	}
	
}
