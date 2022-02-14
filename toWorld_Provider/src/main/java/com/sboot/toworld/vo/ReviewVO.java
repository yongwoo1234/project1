package com.sboot.toworld.vo;



import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class ReviewVO {
   
      private int serial;
	  private String id;
      private String contents;
      private String title;
      private String datetime;
      
      private String uuid;
      private String fileName;
      private String contentType;
      private String fileUrl;
      private String country;
      private int viewcnt;
   

      public ReviewVO() {}


   public ReviewVO(int serial, String country, String id, String contents, String title, String datetime, String uuid, String fileName,
         String contentType, String fileUrl, int viewcnt) {
      super();
      this.id = id;
      this.contents = contents;
      this.title = title;
      this.datetime = datetime;
      this.uuid = uuid;
      this.fileName = fileName;
      this.contentType = contentType;
      this.fileUrl = fileUrl;
      this.country = country;
      this.viewcnt = viewcnt;
      this.serial = serial;
   }
   

      
   
   
}