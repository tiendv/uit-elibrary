package uit.elib.dto;
// Generated Feb 12, 2012 10:39:26 PM by Hibernate Tools 3.2.1.GA



/**
 * Ip generated by hbm2java
 */
public class Ip  implements java.io.Serializable {


     private Integer ipid;
     private String ipvalue;
     private Integer ipstatus;

    public Ip() {
    }

    public Ip(String ipvalue, Integer ipstatus) {
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
    public Integer getIpstatus() {
        return this.ipstatus;
    }
    
    public void setIpstatus(Integer ipstatus) {
        this.ipstatus = ipstatus;
    }




}


