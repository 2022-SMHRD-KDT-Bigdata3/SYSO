package com.smhrd.model;

public class tb_srVO {
<<<<<<< HEAD
   
      private int sr_num;
      private String sr_name;
      private String user_id;      
      private String sr_gender;
      private int sr_aog;
      private String sr_start_date;
      private String sr_end_date;
      private int sr_capacity;
      private int sr_headcount;
      private String location;
      private String sb_num;
      
      
=======
	
	   private int sr_num;
	   private String sr_name;
	   private String user_id;	   
	   private String sr_gender;
	   private int sr_aog;
	   private String sr_start_date;
	   private String sr_end_date;
	   private int sr_capacity;
	   private int sr_headcount;
	   private String location;
	   private String sb_num;
	   
	   
>>>>>>> branch 'master' of https://github.com/2022-SMHRD-KDT-Bigdata3/SYSO

<<<<<<< HEAD
      
   @Override
   public String toString() {
      return "tb_srVO [sr_num=" + sr_num + ", sr_name=" + sr_name + ", user_id=" + user_id + ", sr_gender="
            + sr_gender + ", sr_aog=" + sr_aog + ", sr_start_date=" + sr_start_date + ", sr_end_date=" + sr_end_date
            + ", sr_capacity=" + sr_capacity + ", sr_headcount=" + sr_headcount + ", location=" + location
            + ", sb_num=" + sb_num + "]";
   }
   
   
   
   public tb_srVO() {
      super();
   }
   
   
   
   public tb_srVO(int sr_num, String sr_name, String user_id, String sr_gender, int sr_aog, String sr_start_date,
         String sr_end_date, int sr_capacity, int sr_headcount, String location, String sb_num) {
      super();
      this.sr_num = sr_num;
      this.sr_name = sr_name;
      this.user_id = user_id;
      this.sr_gender = sr_gender;
      this.sr_aog = sr_aog;
      this.sr_start_date = sr_start_date;
      this.sr_end_date = sr_end_date;
      this.sr_capacity = sr_capacity;
      this.sr_headcount = sr_headcount;
      this.location = location;
      this.sb_num = sb_num;
   }
   
   
   
   public tb_srVO(String sr_name, String user_id, String sr_gender, int sr_aog, String location, int sr_capacity, String sb_num) {
      this.sr_name = sr_name;
      this.user_id = user_id;
      this.sr_gender = sr_gender;
      this.sr_aog = sr_aog;
      this.sr_capacity = sr_capacity;
      this.location = location;
      this.sb_num = sb_num;
   }
=======
	   
	@Override
	public String toString() {
		return "tb_srVO [sr_num=" + sr_num + ", sr_name=" + sr_name + ", user_id=" + user_id + ", sr_gender="
				+ sr_gender + ", sr_aog=" + sr_aog + ", sr_start_date=" + sr_start_date + ", sr_end_date=" + sr_end_date
				+ ", sr_capacity=" + sr_capacity + ", sr_headcount=" + sr_headcount + ", location=" + location
				+ ", sb_num=" + sb_num + "]";
	}
	
	
	
	public tb_srVO() {
		super();
	}
	
	
	
	public tb_srVO(int sr_num, String sr_name, String user_id, String sr_gender, int sr_aog, String sr_start_date,
			String sr_end_date, int sr_capacity, int sr_headcount, String location, String sb_num) {
		super();
		this.sr_num = sr_num;
		this.sr_name = sr_name;
		this.user_id = user_id;
		this.sr_gender = sr_gender;
		this.sr_aog = sr_aog;
		this.sr_start_date = sr_start_date;
		this.sr_end_date = sr_end_date;
		this.sr_capacity = sr_capacity;
		this.sr_headcount = sr_headcount;
		this.location = location;
		this.sb_num = sb_num;
	}
	
	
	
	public tb_srVO(String sr_name, String user_id, String sr_gender, int sr_aog, String location, int sr_capacity, String sb_num) {
		this.sr_name = sr_name;
		this.user_id = user_id;
		this.sr_gender = sr_gender;
		this.sr_aog = sr_aog;
		this.sr_capacity = sr_capacity;
		this.location = location;
		this.sb_num = sb_num;
	}
>>>>>>> branch 'master' of https://github.com/2022-SMHRD-KDT-Bigdata3/SYSO



<<<<<<< HEAD
   public int getSr_num() {
      return sr_num;
   }
   public void setSr_num(int sr_num) {
      this.sr_num = sr_num;
   }
   public String getSr_name() {
      return sr_name;
   }
   public void setSr_name(String sr_name) {
      this.sr_name = sr_name;
   }
   public String getUser_id() {
      return user_id;
   }
   public void setUser_id(String user_id) {
      this.user_id = user_id;
   }
   public String getSr_gender() {
      return sr_gender;
   }
   public void setSr_gender(String sr_gender) {
      this.sr_gender = sr_gender;
   }
   public int getSr_aog() {
      return sr_aog;
   }
   public void setSr_aog(int sr_aog) {
      this.sr_aog = sr_aog;
   }
   public String getSr_start_date() {
      return sr_start_date;
   }
   public void setSr_start_date(String sr_start_date) {
      this.sr_start_date = sr_start_date;
   }
   public String getSr_end_date() {
      return sr_end_date;
   }
   public void setSr_end_date(String sr_end_date) {
      this.sr_end_date = sr_end_date;
   }
   public int getSr_capacity() {
      return sr_capacity;
   }
   public void setSr_capacity(int sr_capacity) {
      this.sr_capacity = sr_capacity;
   }
   public int getSr_headcount() {
      return sr_headcount;
   }
   public void setSr_headcount(int sr_headcount) {
      this.sr_headcount = sr_headcount;
   }
   public String getLocation() {
      return location;
   }
   public void setLocation(String location) {
      this.location = location;
   }
   public String getSb_num() {
      return sb_num;
   }
   public void setSb_num(String sb_num) {
      this.sb_num = sb_num;
   }
     
      
            
=======
	public int getSr_num() {
		return sr_num;
	}
	public void setSr_num(int sr_num) {
		this.sr_num = sr_num;
	}
	public String getSr_name() {
		return sr_name;
	}
	public void setSr_name(String sr_name) {
		this.sr_name = sr_name;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getSr_gender() {
		return sr_gender;
	}
	public void setSr_gender(String sr_gender) {
		this.sr_gender = sr_gender;
	}
	public int getSr_aog() {
		return sr_aog;
	}
	public void setSr_aog(int sr_aog) {
		this.sr_aog = sr_aog;
	}
	public String getSr_start_date() {
		return sr_start_date;
	}
	public void setSr_start_date(String sr_start_date) {
		this.sr_start_date = sr_start_date;
	}
	public String getSr_end_date() {
		return sr_end_date;
	}
	public void setSr_end_date(String sr_end_date) {
		this.sr_end_date = sr_end_date;
	}
	public int getSr_capacity() {
		return sr_capacity;
	}
	public void setSr_capacity(int sr_capacity) {
		this.sr_capacity = sr_capacity;
	}
	public int getSr_headcount() {
		return sr_headcount;
	}
	public void setSr_headcount(int sr_headcount) {
		this.sr_headcount = sr_headcount;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getSb_num() {
		return sb_num;
	}
	public void setSb_num(String sb_num) {
		this.sb_num = sb_num;
	}
	  
	   
	   	   
>>>>>>> branch 'master' of https://github.com/2022-SMHRD-KDT-Bigdata3/SYSO

   
      
      
      
        

}