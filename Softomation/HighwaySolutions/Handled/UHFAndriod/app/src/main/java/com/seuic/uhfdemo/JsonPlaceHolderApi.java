package com.seuic.uhfdemo;

import java.util.List;

import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Body;
import retrofit2.http.POST;

public interface JsonPlaceHolderApi {

    @GET("Softomation/FastTrackHighway-TMS/HandledLane")
    Call<List<LANERESPONSE>> getPosts();
    @GET("CLASSGET")
    Call<List<CLASSGETResponse>> getCLASSGET();

    @POST("Softomation/FastTrackHighway-lane/FasTag")
    Call<Void> postLaneSelection(@Body LANERESPONSE laneResponse);

}