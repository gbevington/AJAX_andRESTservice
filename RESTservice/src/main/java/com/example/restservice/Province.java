package com.example.restservice;

public class Province {
    private String provinceCode;
    private String provinceName;
    private String countryCode;

    public Province(){

    }

    public Province (String provinceCode, String provinceName, String countryCode){
        this.provinceCode = provinceCode;
        this.provinceName = provinceName;
        this.countryCode = countryCode;
    }

    public String getProvinceCode() {
        return provinceCode;
    }

    public void setProvinceCode(String provinceCode) {
        this.provinceCode = provinceCode;
    }

    public String getProvinceName() {
        return provinceName;
    }

    public void setProvinceName(String provinceName) {
        this.provinceName = provinceName;
    }

    public String getCountryCode() {
        return countryCode;
    }

    public void setCountryCode(String countryCode) {
        this.countryCode = countryCode;
    }
}
