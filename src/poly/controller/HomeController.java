package poly.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.lingala.zip4j.core.ZipFile;
import net.lingala.zip4j.model.ZipParameters;
import net.lingala.zip4j.util.Zip4jConstants;
import poly.util.CmmUtil;
/*
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	//메인화면
	@RequestMapping(value="index")
	public String index(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception{
		return "/index";
	}
	//에러화면
	@RequestMapping(value="/Soucre/error")
	public String error(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception{
		return "Source/error";
	}
	//홈화면
	@RequestMapping(value="home", method = { RequestMethod.GET, RequestMethod.POST })
	public String home(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception{
        String filePath = request.getSession().getServletContext().getRealPath("Temp"); //설정파일로 뺀다.
        File dir = new File(filePath); //파일 저장 경로 확인, 없으면 만든다.
    	//
    	if( dir.exists() ){ //파일존재여부확인
            if(dir.isDirectory()){ //파일이 디렉토리인지 확인
                File[] files = dir.listFiles();
                for( int i=0; i<files.length; i++){
                    files[i].delete();
                }
                dir.mkdirs();
            }
        }else{
            dir.mkdirs();
        }
    	//
		return "/home";
	}
	//Alert 화면
	@RequestMapping(value="/Source/alert")
	public String alert(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception{
		return "/alert";
	}
	
	// 파일 업로드
	@RequestMapping(value = "fileUpload" , method = RequestMethod.GET) //ajax에서 호출하는 부분\
    @ResponseBody
    public String fileUpload(HttpServletRequest request, MultipartHttpServletRequest multipartRequest) { //Multipart로 받는다.
    	Iterator<String> itr =  multipartRequest.getFileNames();
        String filePath = request.getSession().getServletContext().getRealPath("Temp"); //설정파일로 뺀다.
        
        File dir = new File(filePath); //파일 저장 경로 확인, 없으면 만든다.
    	//
    	if( dir.exists() ){ //파일존재여부확인
            if(dir.isDirectory()){ //파일이 디렉토리인지 확인
                File[] files = dir.listFiles();
                for( int i=0; i<files.length; i++){
                    files[i].delete();
                }
                dir.mkdirs();
            }
        }else{
            dir.mkdirs();
        }
    	//
        while (itr.hasNext()) { //받은 파일들을 모두 돌린다.
            MultipartFile mpf = multipartRequest.getFile(itr.next());
            String originalFilename = mpf.getOriginalFilename(); //파일명
            String fileFullPath = filePath+"/"+originalFilename; //파일 전체 경로
            try {
                //파일 저장
            	Thread.sleep(500);
                mpf.transferTo(new File(fileFullPath)); //파일저장 실제로는 service에서 처리
            } catch (Exception e) {
                e.printStackTrace();
            }
       }
        return "success";
    }
    // 파일 다운로드
    @RequestMapping(value = "filedownload") //ajax에서 호출하는 부분\
   	public void fileDownload(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	String path = request.getSession().getServletContext().getRealPath("Temp/"); //경로
        String oriFileName = CmmUtil.nvl(request.getParameter("filename")); //파일명
        String user_id = CmmUtil.nvl(request.getParameter("user_id")); //확장자명
        String user_key = CmmUtil.nvl(request.getParameter("user_key")); //암호화 키
        String type = CmmUtil.nvl(request.getParameter("type")); // 암호화/복호화
        String fileName = null;
        
        // 암호화
        Process cipher = null;
        String PyPath = request.getSession().getServletContext().getRealPath(""); //파이썬파일 경로
    	if (type.equals("Encrypt_fileUpload")) {
    		cipher = new ProcessBuilder("python", PyPath+"WEB-INF\\view\\Source\\Encrypt.py", "\"" + PyPath+"Temp\\**"+oriFileName+"\" \""+user_key+"\" \""+user_id+"\"").start(); //암호화
    		fileName = oriFileName +"." + user_id;
    		
    	} else if (type.equals("Decrypt_fileUpload")) {
    		cipher = new ProcessBuilder("python", PyPath+"WEB-INF\\view\\Source\\Decrypt.py", "\"" + PyPath+"Temp\\**"+oriFileName+"\" \""+user_key+"\" \""+user_id+"\"").start(); //복호화
    		fileName = oriFileName.replace("."+user_id, "");
    	}
    	
    	BufferedReader stdOut = new BufferedReader(new InputStreamReader(cipher.getInputStream()));
    	String line;
        while((line=stdOut.readLine())!=null){
        	System.out.println(line);
        }
        String fullPath = path + fileName;
        File file = new File(fullPath);
        FileInputStream fileInputStream = null;
        ServletOutputStream servletOutputStream = null;
     
        try{
            String downName = null;
            String browser = request.getHeader("User-Agent");
            //파일 인코딩
            if(browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")){//브라우저 확인 파일명 encode  
                downName = URLEncoder.encode(fileName,"UTF-8").replaceAll("\\+", "%20");
            }else{
                downName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
            }
            response.setHeader("Content-Disposition","attachment;filename=\"" + downName+"\"");             
            response.setContentType("application/octer-stream");
            response.setHeader("Content-Transfer-Encoding", "binary;");
            fileInputStream = new FileInputStream(file);
            servletOutputStream = response.getOutputStream();
            byte b [] = new byte[1024];
            int data = 0;
            while((data=(fileInputStream.read(b, 0, b.length))) != -1){
                servletOutputStream.write(b, 0, data);
            }
            servletOutputStream.flush();//출력
        }catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(servletOutputStream!=null){
                try{
                    servletOutputStream.close();
                }catch (IOException e){
                    e.printStackTrace();
                }
            }
            if(fileInputStream!=null){
                try{
                    fileInputStream.close();
                }catch (IOException e){
                    e.printStackTrace();
                }
            }
        }
    }
    // 파일 압축 다운로드
    @RequestMapping(value = "multifiledownload") //ajax에서 호출하는 부분\
    public void multifiledownload(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException{
    	String path = request.getSession().getServletContext().getRealPath("Temp/"); //경로
        String user_id = CmmUtil.nvl(request.getParameter("user_id")); //확장자명
        String user_key = CmmUtil.nvl(request.getParameter("user_key")); //암호화 키
        String type = CmmUtil.nvl(request.getParameter("type")); // 암호화/복호화

        // 암호화
        Process cipher = null;
        String PyPath = request.getSession().getServletContext().getRealPath(""); //파이썬파일 경로
    	if (type.equals("Encryption_multi")) {
    		cipher = new ProcessBuilder("python", PyPath+"WEB-INF\\view\\Source\\Encrypt.py", "\"" + PyPath+"Temp\\**\" \""+user_key+"\" \""+user_id+"\"").start(); //암호화
    		System.out.println("cipher : " + cipher.toString());
    	} else if (type.equals("Decryption_multi")) {
    		cipher = new ProcessBuilder("python", PyPath+"WEB-INF\\view\\Source\\Decrypt.py", "\"" + PyPath+"Temp\\**\" \""+user_key+"\" \""+user_id+"\"").start(); //복호화
    		System.out.println("cipher : "  + cipher.toString());
    	}
    	BufferedReader stdOut = new BufferedReader(new InputStreamReader(cipher.getInputStream()));
    	
    	String line;
        while((line=stdOut.readLine())!=null){
        	System.out.println(line);
        }
        String zipname = "";
        String now = new SimpleDateFormat("yyyyMMddhmsS").format(new Date()); //현재시간 나타내는 변수
		ArrayList<String> fileList = new ArrayList<String>(); // 파일리스트 선언
		fileList = findExt(user_id, request); // 확장자로 파일리스트 검색
		boolean zipYN = true; // 파일압축 유무 값 선언
		if (zipYN == true) { // 압축파일이 있다면
			zipname = now + ".zip"; // 압축파일명
		}
		String zipFileName = path + "\\" + zipname; // 압축될 파일명 선언 (경로\확장자.zip)

		// 파일들 압축하기
		try {
			ZipFile zipfile = new ZipFile(zipFileName);
			ZipParameters parameters = new ZipParameters();
			parameters.setCompressionMethod(Zip4jConstants.COMP_DEFLATE);
			parameters.setCompressionLevel(Zip4jConstants.DEFLATE_LEVEL_NORMAL);
			if (fileList.size() > 0) { // 파일 리스트가 존재한다면
				for (int i = 0; i < fileList.size(); i++) {
					zipfile.addFile(new File(fileList.get(i)), parameters);
				}
				System.out.println("zipfile : " + zipfile);
				File file = new File(zipFileName);
		        FileInputStream fileInputStream = null;
		        ServletOutputStream servletOutputStream = null;
		        try{
		            String downName = null;
		            String browser = request.getHeader("User-Agent");
		            //파일 인코딩
		            if(browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")){//브라우저 확인 파일명 encode  
		                downName = URLEncoder.encode(zipname,"UTF-8").replaceAll("\\+", "%20");
		            }else{
		                downName = new String(zipname.getBytes("UTF-8"), "ISO-8859-1");
		            }
		            response.setHeader("Content-Disposition","attachment;filename=\"" + downName+"\"");             
		            response.setContentType("application/octer-stream");
		            response.setHeader("Content-Transfer-Encoding", "binary;");
		            fileInputStream = new FileInputStream(file);
		            servletOutputStream = response.getOutputStream();
		            byte b [] = new byte[1024];
		            int data = 0;
		            while((data=(fileInputStream.read(b, 0, b.length))) != -1){
		                servletOutputStream.write(b, 0, data);
		            }
		            servletOutputStream.flush();//출력
		        }catch (Exception e) {
		            e.printStackTrace();
		        }finally{
		            if(servletOutputStream!=null){
		                try{
		                    servletOutputStream.close();
		                }catch (IOException e){
		                    e.printStackTrace();
		                }
		            }
		            if(fileInputStream!=null){
		                try{
		                    fileInputStream.close();
		                }catch (IOException e){
		                    e.printStackTrace();
		                }
		            }
		        }
				
			} else { // 리스트가 없다면
				System.out.println("파일이 존재하지 않음");
				zipYN = false; // 파일압축 유무 > false
			}
		} catch (Exception e) {
			System.out.println("Error");
		}
	}
	// 파일 검색 후 리스트 작성
	public ArrayList<String> findExt(String ext, HttpServletRequest request) {
		String path = request.getSession().getServletContext().getRealPath("Temp"); //경로
    	File file = new File(path);
    	ArrayList<String> fileList = new ArrayList<String>(); // 파일 리스트 선언
		if(file.isDirectory()){ //파일이 디렉토리인지 확인 
			File[] files = file.listFiles();
			for (int i = 0; i < files.length; i++) { // 개수만큼 for 문 돌려돌려
				if (files[i].getName().endsWith("." + ext)) { // 해당 파일에서 마지막 글자가 .확장자 라면
					fileList.add(files[i].getPath()); // fileList(파일 리스트) 에 추가
				}
			}
		}
		return fileList; // fileList 리턴
	}
}