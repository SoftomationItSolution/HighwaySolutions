package com.seuic.uhfdemo;

public class LANERESPONSE {
    private String IPAddress;
    private String LaneID;
    private String LaneName;
    private String plateNo;
    private String vehicleClass;
    private String epc;
    private String tagId;
    private String laneId;

    public String getPlateNo() {
        return plateNo;
    }

    public void setPlateNo(String plateNo) {
        this.plateNo = plateNo;
    }

    public String getVehicleClass() {
        return vehicleClass;
    }

    public void setVehicleClass(String vehicleClass) {
        this.vehicleClass = vehicleClass;
    }

    public String getEpc() {
        return epc;
    }

    public void setEpc(String epc) {
        this.epc = epc;
    }

    public String getTagId() {
        return tagId;
    }

    public void setTagId(String tagId) {
        this.tagId = tagId;
    }

    public String getLaneId() {
        return laneId;
    }

    public void setLaneId(String laneId) {
        this.laneId = laneId;
    }

    // Getter methods
    public String getIPAddress() {
        return IPAddress;
    }

    public String getLaneID() {
        return LaneID;
    }

    public String getLaneName() {
        return LaneName;
    }

    // Setter methods (needed for Retrofit/Gson deserialization)
    public void setIPAddress(String IPAddress) {
        this.IPAddress = IPAddress;
    }

    public void setLaneID(String LaneID) {
        this.LaneID = LaneID;
    }

    public void setLaneName(String LaneName) {
        this.LaneName = LaneName;
    }

    // Override toString() method for better logging
    @Override
    public String toString() {
        return "LANERESPONSE{" +
                "IPAddress='" + IPAddress + '\'' +
                ", LaneID='" + LaneID + '\'' +
                ", LaneName='" + LaneName + '\'' +
                '}';
    }
}
