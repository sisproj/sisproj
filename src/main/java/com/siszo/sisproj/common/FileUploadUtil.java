package com.siszo.sisproj.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component
public class FileUploadUtil {
    private static final Logger logger = LoggerFactory.getLogger(FileUploadUtil.class);

    //파일업로드 경로 관련 상수
    public static final int PDS_UPLOAD = 1;  //자료실 업로드인 경우
    public static final int EMP_IMAGE_UPLOAD = 2;  //상품등록시 이미지 업로드인 경우
    public static final int ATTACHFILE = 3;  //전자결재 첨부파일 처리
    public static final int USER_SIGN = 4;  //전자결재 서명 첨부파일 처리
    public static final int WEBHARD = 6;  //전자결재 서명 첨부파일 처리
    public static final int PDS_UPLOAD_NOTI = 9;  //공지사항 첨부파일 처리
    
    public static final int NEWS_IMAGES = 5;  //뉴스 등록이미지 업로드인 경우

    @Resource(name = "fileUploadProperties")
    private Properties fileProperties;

    public List<Map<String, Object>> fileupload(HttpServletRequest request, int uploadGb) throws IllegalStateException, IOException {
        //파일업로드 처리
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;

        Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();

        //file정보 결과를 저장할 list
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

        Iterator<String> iter = fileMap.keySet().iterator();
        while (iter.hasNext()) {
            String key = iter.next();
            MultipartFile tempFile = fileMap.get(key);
            //=> 업로드된 파일을 임시파일 형태로 제공
            //업로드 된경우
            if (!tempFile.isEmpty()) {
                String ofileName = tempFile.getOriginalFilename();
              
                //unique한 파일명 구하기
                String fileName = getUniqueFileName(ofileName);

                long fileSize = tempFile.getSize();

                //업로드 처리
                String uploadPath = getUploadPath(request, uploadGb);

                File file = new File(uploadPath, fileName);
                tempFile.transferTo(file);

                //결과 저장
                Map<String, Object> resultMap = new HashMap<String, Object>();
               
                resultMap.put("originalFileName", ofileName);
                resultMap.put("fileName", fileName);
                resultMap.put("fileSize", fileSize);
                
                list.add(resultMap);
            }
        }//while
        return list;
    }

    public String getUploadPath(HttpServletRequest request, int uploadGb) {
        String upPath = "";

        String type = fileProperties.getProperty("file.upload.type");
        if (type.equals("test")) {
            //테스트시 경로
            if (uploadGb == PDS_UPLOAD) {
                upPath = fileProperties.getProperty("file.upload.path.test");
            } else if (uploadGb == EMP_IMAGE_UPLOAD) {
                upPath = fileProperties.getProperty("empImageFile.upload.path.test");
            } else if (uploadGb == ATTACHFILE) {
                upPath = fileProperties.getProperty("confirm.attachfile.path.test");
            } else if (uploadGb == USER_SIGN) {
                upPath = fileProperties.getProperty("confirm.user_sign.path.test");
            } else if (uploadGb == PDS_UPLOAD_NOTI) {
            	upPath = fileProperties.getProperty("notifile.upload.path.test");
            } else if (uploadGb == NEWS_IMAGES) {
            	upPath = fileProperties.getProperty("newsImageFile.upload.path.test");
            } else if (uploadGb == WEBHARD) {
            	upPath = fileProperties.getProperty("webhard.upload.path.test");
            }
            logger.info("test 경로:" + upPath);
        } else {
            //배포시 경로
            if (uploadGb == PDS_UPLOAD) {
                upPath = fileProperties.getProperty("file.upload.path");
            } else if (uploadGb == EMP_IMAGE_UPLOAD) {
                upPath = fileProperties.getProperty("empImageFile.upload.path");
            } else if (uploadGb == ATTACHFILE) {
                upPath = fileProperties.getProperty("confirm.attachfile.path");
            } else if (uploadGb == USER_SIGN) {
                upPath = fileProperties.getProperty("confirm.user_sign.path");
            } else if (uploadGb == PDS_UPLOAD_NOTI) {
            	upPath = fileProperties.getProperty("notifile.upload.path");
            }else if (uploadGb == NEWS_IMAGES) {
            	upPath = fileProperties.getProperty("newsImageFile.upload.path");
            }else if (uploadGb == WEBHARD) {
            	upPath = fileProperties.getProperty("webhard.upload.path");
            }
            logger.info("배포시 경로:" + upPath);

            //실제 물리적인 경로 구하기
            upPath = request.getSession().getServletContext().getRealPath(upPath);
            logger.info("배포시 실제 물리적 경로:" + upPath);
        }

        return upPath;
    }

    private String getUniqueFileName(String ofileName) {
        //test.txt => test20171204054830123.txt
        int idx = ofileName.lastIndexOf(".");
        String fName = ofileName.substring(0, idx);  //test
        String ext = ofileName.substring(idx);  //.txt

        String fileName = fName + getCurrentTime() + ext;
        logger.info("변경된 파일 이름:" + fileName);

        return fileName;
    }

    private String getCurrentTime() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");

        Date d = new Date();

        return sdf.format(d);
    }

}












