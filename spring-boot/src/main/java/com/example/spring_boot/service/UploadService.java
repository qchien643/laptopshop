package com.example.spring_boot.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.spring_boot.controller.UserController;

import jakarta.servlet.ServletContext;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Path;
import java.util.stream.Stream;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Service
public class UploadService {

    private final ServletContext servletContext;
    private static final Logger logger = LoggerFactory.getLogger(UploadService.class);
    private static final DateTimeFormatter FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS");

    public UploadService(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    /**
     * @param file         MultipartFile từ client
     * @param targetFolder Tên thư mục con dưới /resources/images, ví dụ "avatars",
     *                     "documents"
     * @return Thông báo kết quả
     */
    public String uploadFileHandler(MultipartFile file, String targetFolder) {
        if (file.isEmpty()) {
            return "Bạn chưa chọn file để upload.";
        }

        try {
            // Lấy path gốc tới /resources/images
            String rootPath = servletContext.getRealPath("/resources/");
            // Tạo thư mục con theo targetFolder
            File dir = new File(rootPath, targetFolder);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            // Tạo timestamp dưới dạng yyyyMMddHHmmssSSS
            LocalDateTime now = LocalDateTime.now();
            DateTimeFormatter fmt = DateTimeFormatter.ofPattern("yyyyMMddHHmmssSSS");
            String timestamp = now.format(fmt);
            // Lấy tên file gốc, hoặc bạn có thể truyền tên khác vào
            String originalFilename = org.springframework.util.StringUtils.cleanPath(file.getOriginalFilename());
            // Thêm timestamp vào tên file để tránh trùng lặp
            String timeStampingFileName = timestamp + "_" + originalFilename;

            // Tạo File đích trong thư mục vừa tạo
            File serverFile = new File(dir, timeStampingFileName);

            // Ghi file (có thể thay bằng Files.copy hoặc file.transferTo)
            file.transferTo(serverFile);

            logger.info("Server File Location=" + serverFile.getAbsolutePath());
            return timeStampingFileName;

        } catch (Exception e) {
            logger.error("Lỗi khi upload file", e);
            return "Upload thất bại: " + e.getMessage();
        }
    }
}
