package com.Pojo;


//import com.google.gson.annotations.SerializedName;

public class EchartsPojo {
    /*@SerializedName("name")
    private String ename;
    @SerializedName("value")
    private String evalue;

    public EchartsPojo(String ename, String evalue) {
        this.ename = ename;
        this.evalue = evalue;
    }

    public EchartsPojo() {
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    public String getEvalue() {
        return evalue;
    }

    public void setEvalue(String evalue) {
        this.evalue = evalue;
    }*/
    private String name;
    private String value;

    public EchartsPojo() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
