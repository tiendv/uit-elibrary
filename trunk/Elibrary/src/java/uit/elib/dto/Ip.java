package uit.elib.dto;
// Generated Jan 24, 2012 2:15:42 AM by Hibernate Tools 3.2.1.GA



/**
 * Ip generated by hbm2java
 */
public class Ip  implements java.io.Serializable {


     private Integer ipid;
     private String ipvalue;
     private String ipstatus;

    public Ip() {
    }

    public Ip(String ipvalue, String ipstatus) {
       this.ipvalue = ipvalue;
       this.ipstatus = ipstatus;
    }
   
    public Integer getIpid() {
        return this.ipid;
    }
    
    public void setIpid(Integer ipid) {
        this.ipid = ipid;
    }
    public String getIpvalue() {
        return this.ipvalue;
    }
    
    public void setIpvalue(String ipvalue) {
        this.ipvalue = ipvalue;
    }
    public String getIpstatus() {
        return this.ipstatus;
    }
    
    public void setIpstatus(String ipstatus) {
        this.ipstatus = ipstatus;
    }




}

