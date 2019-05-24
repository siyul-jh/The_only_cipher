package poly.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
/*
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@RequestMapping(value = "fileUpload", method = RequestMethod.GET)
	public String dragAndDrop(Model model) {
		System.out.println("fileUpload");
	return "/fileUpload";
	}
	
    @RequestMapping(value = "fileUpload") //ajax에서 호출하는 부분\
    //  파일 업로드
    @ResponseBody
    public String upload(HttpServletRequest request, MultipartHttpServletRequest multipartRequest) { //Multipart로 받는다.
    	System.out.println("upload");
        Iterator<String> itr =  multipartRequest.getFileNames();
        
        String filePath = request.getRealPath("Temp"); //설정파일로 뺀다.
        
        File dir = new File(filePath); //파일 저장 경로 확인, 없으면 만든다.
        if (!dir.exists()) {
        	System.out.println("저장 폴더가 없다. 만든다!");
            dir.mkdirs();
        }
        
        while (itr.hasNext()) { //받은 파일들을 모두 돌린다.
                        
            MultipartFile mpf = multipartRequest.getFile(itr.next());
     
            String originalFilename = mpf.getOriginalFilename(); //파일명
            String fileFullPath = filePath+"/"+originalFilename; //파일 전체 경로
     
            try {
                //파일 저장
                mpf.transferTo(new File(fileFullPath)); //파일저장 실제로는 service에서 처리
                
                System.out.println("파일명 => "+originalFilename);
                System.out.println("파일저장 경로 => "+fileFullPath);
     
            } catch (Exception e) {
                System.out.println("ERROR======>"+fileFullPath);
                e.printStackTrace();
            }
                         
       }
        return "success";
    }
    // 파일 다운로드
    
    @RequestMapping(value = "filedownload") //ajax에서 호출하는 부분\
	public String downloadFile(@RequestParam("FileName") String FileName, Map<String, Object> map, HttpServletResponse response) throws Exception{
		System.out.println("downloadFile");
		String path = "D:\\The only cipher\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\The only cipher\\Temp"; //경로 지정해주기
		System.out.println("path : " + path);
		String FileFullPath = path + "\\" + FileName;         
		System.out.println("FileFullPath : " + FileFullPath);
		
    	try {
    		java.io.File file = new java.io.File(FileFullPath);
            
    		response.setContentType("DEFAULT_CONTENT_TYPE");
    		response.setContentLength((int) file.length());
    		response.setHeader("Content-Disposition", "attachment; filename=\"" + java.net.URLEncoder.encode(file.getName(), "utf-8") + "\";");
    		response.setHeader("Content-Transfer-Encoding", "binary");
    		
    		FileInputStream fis = new FileInputStream(file); //파일 읽어오기
    		ServletOutputStream sout = response.getOutputStream();
    		
    		byte[] buf = new byte[1024];
            int size = -1;

            while ((size = fis.read(buf, 0, buf.length)) != -1) {
                sout.write(buf, 0, size);
            }

			fis.close();
			sout.close();
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
		
    	return "/fileUpload";
	}
}