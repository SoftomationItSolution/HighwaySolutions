from datetime import datetime
from onvif2 import ONVIFCamera
from wsdiscovery.discovery import ThreadedWSDiscovery
from wsdiscovery import Scope
import re
import os
#from utils.onvifModel import OnvifHandler


class Onvif2Handler:
    wsdldir=r'wsdl'
    script_dir = os.path.dirname(os.path.abspath(__file__))
    @staticmethod
    def fetch_devices(devicelist=None):
        try:
            wsd = ThreadedWSDiscovery()
            scope1 = Scope("onvif://www.onvif.org/Profile")
            wsd.start()
            services = wsd.searchServices(scopes=[scope1])
            if devicelist is None or len(devicelist)==0:
                devicelist=[]
            for service in services:
                ipaddress = re.search('(\d+|\.)+', str(service.getXAddrs()[0])).group(0)
                filtered_array = list(filter(lambda x: x["EquipmentIp"] ==ipaddress, devicelist))
                if len(filtered_array)==0:
                    y={"EquipmentId":0,"EquipmentIp":ipaddress,"EquipmentName":"","UserName":"","UserPassword":"","EquipmentPort":80,"Manufacturer":"",
                    "Model":"","SerialNumber":"","MacAddress":"","HardwareId":"","FirmwareVersion":"","Streamurl":"",
                    "RecordIntervalTime":30,"RecordingDays":30,"RecordingResolution":"1280,720","FramePerSecond":"","EquipmentTypeId":4,
                    "EquipmentTypeName":"None","ServerId":"","LPUId":"","DataStatus":True,"CreatedDate":datetime.now(),"CreatedBy":0,
                    "ModifiedDate":datetime.now(),"ModifiedBy":0}
                    devicelist.append(y)
            wsd.clearRemoteServices()
            wsd.stop()
            wsd._stopThreads()
            return devicelist
        except Exception as e:
            raise RuntimeError(f"An error occurred while fetching devices: {str(e)}")
        
    @staticmethod
    def GetStreamURL(mycam):
        streamurl=[]
        try:
            media2_service = mycam.create_media2_service()
            profiles = media2_service.GetProfiles()
            for profile in profiles:
                o = media2_service.create_type('GetStreamUri')
                o.ProfileToken = profile.token
                o.Protocol = 'RTSP'
                uri = media2_service.GetStreamUri(o)
                streamurl.append(uri)
        except Exception as e:
            print(str(e))
            #streamurl=OnvifHandler.get_rtsp_stream_urls(mycam)
        finally:
            return streamurl 

    @staticmethod
    def GetDeviceDetails(camera):
        try:
            GetDeviceInformation = camera.devicemgmt.GetDeviceInformation()
            network_interfaces = camera.devicemgmt.GetNetworkInterfaces()
            for network_interface in network_interfaces:
                if network_interface.Enabled:
                    mac_address = network_interface.Info.HwAddress
                    GetDeviceInformation['MacAddress']=mac_address
                    break
            return GetDeviceInformation  
        except Exception as e:
            print(e)
            # try:
            #     GetDeviceInformation = OnvifHandler.GetDeviceDetails(camera)
            #     return GetDeviceInformation 
            # except Exception as e:
            #     raise RuntimeError(f"An error occurred while Get Device Details: {str(e)}")
   
    @staticmethod
    def fetch_devices_details(cam_details):
        try:
            wsdl_path = os.path.join(Onvif2Handler.script_dir, '..', "wsdl")
            wsdl_path = os.path.normpath(wsdl_path)
            onvif_cam = ONVIFCamera(cam_details["EquipmentIp"], int(cam_details["EquipmentPort"]),
                                    cam_details["UserName"], cam_details["UserPassword"], wsdl_dir=wsdl_path)
            DeviceDetails = Onvif2Handler.GetDeviceDetails(onvif_cam)
            stream_urls = Onvif2Handler.GetStreamURL(onvif_cam)
            if stream_urls is not None:
                stream_url = Onvif2Handler.update_url(stream_urls, cam_details["UserName"], cam_details["UserPassword"], False)
            else:
                stream_url=stream_urls
            DeviceDetails['Streamurl'] = stream_url
            return DeviceDetails
        except Exception as e:
            raise RuntimeError(f"An error occurred while fetching device details: {str(e)}")

    @staticmethod
    def update_url(rtsp_urls: list, username: str, password: str, gstream: bool = False) -> list:
        try:
            if not isinstance(rtsp_urls, list):
                raise TypeError("rtsp_urls must be a list")
            if not isinstance(username, str):
                raise TypeError("username must be a string")
            if not isinstance(password, str):
                raise TypeError("password must be a string")
            if gstream:
                if "@" in password:
                    password = password.replace("@", "%40")
            updated_urls = [url.replace("rtsp://", f"rtsp://{username}:{password}@") for url in rtsp_urls]
            return updated_urls
        except Exception as e:
            raise RuntimeError(f"An error occurred while updating RTSP URLs: {str(e)}")
