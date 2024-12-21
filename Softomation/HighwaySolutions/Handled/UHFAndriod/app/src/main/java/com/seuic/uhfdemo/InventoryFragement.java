package com.seuic.uhfdemo;

import java.io.IOException;
import java.io.OutputStream;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;

import com.seuic.scankey.IKeyEventCallback;
import com.seuic.scankey.ScanKeyService;
import com.seuic.uhf.EPC;
import com.seuic.uhf.UHFService;

import android.app.Fragment;
import android.app.ProgressDialog;
import android.content.Context;
import android.media.AudioManager;
import android.media.SoundPool;
import android.nfc.Tag;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.RemoteException;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ArrayAdapter;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class InventoryFragement extends Fragment implements MainActivity.FragmentCommunicator {

    public static final int MAX_LEN = 128;

    public static final int ItemSelectColor = 0x44000000;

    private UHFService mDevice;
    private String baseUrl;

    private InventoryRunable mInventoryRunable;
    public boolean mInventoryStart = false;
    private Thread mInventoryThread;

    private int mSelectedIndex = -1;

    private Button btn_once;
    private Button btn_continue;
    private Button btn_stop;

    private TextView tv_total;
    private ListView lv_id;

    private EditText et_bank;
    private EditText et_address;
    private EditText et_lenth;
    private EditText et_password;

    private Button btn_read;
    private TextView plate_no;
    private TextView tv_class;
    private TextView tv_epc;
    private TextView tv_tag;
    private Button okButton;
    private Spinner spinner;
    private ArrayAdapter<String> SpinnerAdapter;
    private List<String> dataList;
    private List<LANERESPONSE> dataList2;
    private HashMap<String, String> CLASSGETResponseList;

    private Button btn_write;
    private Button btn_clear;

    private EditText et_data;

    private List<EPC> mEPCList;
    private InventoryAdapter mAdapter;

    View currentView;

    static int m_count = 0;

    private String UserID = null;
    private String User_VehicleRegNo = null;
    private String Tag_Vehicle_Class = null;
    private String Tag_Vehicle_Class2 = null;

    private String selectedLane = null;
    private String selecteLaneId = null;

    private static InventoryFragement inventoryfragement;

    public static InventoryFragement getInstance() {
        if (inventoryfragement == null)
            inventoryfragement = new InventoryFragement();
        return inventoryfragement;
    }

    private Handler handler = new Handler() {

        public void handleMessage(Message msg) {
            // Refresh listview
            switch (msg.what) {
                case 1:
                    synchronized (currentView.getContext()) {
                        mEPCList = mDevice.getTagIDs();
                    }
                    refreshData();
                    break;
                case 2:
                    BtnOnce();
                    handler.sendEmptyMessageDelayed(2, 200);
                    break;
                case 3:
                    BtnOnce();
                    break;
                default:
                    break;
            }
        }

        ;
    };

    // sound
    private static SoundPool mSoundPool;
    private static int soundID;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        View view = inflater.inflate(R.layout.fragment_inventory, container, false);
        Log.i(TAG, "UHFReadTagFragment.onCreateView");

        mDevice = UHFService.getInstance();


        btn_read = (Button) view.findViewById(R.id.bt_read);
        plate_no = (TextView) view.findViewById(R.id.tv_plate_no);
        tv_epc = (TextView) view.findViewById(R.id.tv_epc);
        tv_tag = (TextView) view.findViewById(R.id.tv_tag);
        tv_class = (TextView) view.findViewById(R.id.tv_class);
        okButton = (Button) view.findViewById(R.id.btn_ok);


        MainActivity.fragmentCommunicator = this;


        btn_read.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                BtnOnce();
            }
        });

        mSoundPool = new SoundPool(3, AudioManager.STREAM_MUSIC, 20);
        soundID = mSoundPool.load(view.getContext(), R.raw.scan, 1);

        mEPCList = new ArrayList<EPC>();
        mAdapter = new InventoryAdapter();
        mInventoryRunable = new InventoryRunable();
////		lv_id.setAdapter(mAdapter);
        return view;
    }

    private ScanKeyService mScanKeyService = ScanKeyService.getInstance();
    private String TAG = "zy";
    private IKeyEventCallback mCallback = new IKeyEventCallback.Stub() {
        @Override
        public void onKeyDown(int keyCode) throws RemoteException {
            Log.d(TAG, "onKeyDown: keyCode=" + keyCode);
            Message message = Message.obtain();// Avoid repeated application of memory, reuse of information
            message.what = 3;
            handler.sendMessage(message);
        }

        @Override
        public void onKeyUp(int keyCode) throws RemoteException {
            Log.d(TAG, "onKeyUp: keyCode=" + keyCode);
        }
    };

    @Override
    public void onResume() {
        super.onResume();
        mScanKeyService.registerCallback(mCallback, "100,101,102,249,249,250");
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        mScanKeyService.unregisterCallback(mCallback);
    }

    // init UI
    private View initUI(LayoutInflater inflater) {
        currentView = inflater.inflate(R.layout.fragment_inventory, null);

        btn_read = (Button) currentView.findViewById(R.id.bt_read);
        plate_no = (TextView) currentView.findViewById(R.id.tv_plate_no);
        tv_epc = (TextView) currentView.findViewById(R.id.tv_epc);
        tv_tag = (TextView) currentView.findViewById(R.id.tv_tag);
        tv_class = (TextView) currentView.findViewById(R.id.tv_class);
        spinner = (Spinner) currentView.findViewById(R.id.lane_spinner);
        dataList = new ArrayList<>();
        dataList2 = new ArrayList<>();
        CLASSGETResponseList = new HashMap<>();

        dataList.add("Select Lane");
        dataList2.add(new LANERESPONSE());
        SpinnerAdapter = new ArrayAdapter<>(getActivity().getApplicationContext(), android.R.layout.simple_spinner_item, dataList);
        SpinnerAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinner.setAdapter(SpinnerAdapter);



        btn_read.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                BtnOnce();
            }
        });

        getLanes();
        getCLASSGET();



        mSoundPool = new SoundPool(3, AudioManager.STREAM_MUSIC, 20);
        soundID = mSoundPool.load(currentView.getContext(), R.raw.scan, 1);

        return currentView;
    }

    private void refreshData() {
        if (mEPCList != null) {
            // Gets the number inside the list of all labels
            int count = 0;
            for (EPC item : mEPCList) {
                count += item.count;
            }
            if (count > m_count) {
                playSound();
            }
            mAdapter.notifyDataSetChanged();
            tv_total.setText(getString(R.string.id_pc_epc) + getString(R.string.total) + mEPCList.size());
            m_count = count;
        }
    }

    private void postLaneData(String tidId,String epcId,String userDataStr) {
        // Retrieve data from UI elements


        baseUrl = "http://" + selectedLane + ":5002/";
        Log.d("url", "postLaneData: "+baseUrl);
        if (selectedLane == null || selecteLaneId == null || selectedLane.equals("Select Lane")) {
            Toast.makeText(getActivity(), "Please select a lane", Toast.LENGTH_SHORT).show();
            return;
        }

        if (tidId.isEmpty() || epcId.isEmpty() || userDataStr.isEmpty()) {
            Toast.makeText(getActivity(), "All fields are required", Toast.LENGTH_SHORT).show();
            return;
        }

        // Create LANERESPONSE object
        LANERESPONSE laneResponse = new LANERESPONSE();
        //laneResponse.setPlateNo(plateNoValue);
        //laneResponse.setVehicleClass(classValue);
        laneResponse.setEpc(epcId);
        laneResponse.setTagId(tidId);
        laneResponse.setLaneId(userDataStr);

        // Use the dynamically selected URL
        if (baseUrl == null || baseUrl.isEmpty()) {
            baseUrl = "http://default.url";  // Fallback to default URL if no lane is selected
        }

        // Retrofit API call with the selected URL
        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl(baseUrl)
                .addConverterFactory(GsonConverterFactory.create())
                .build();

        JsonPlaceHolderApi apiService = retrofit.create(JsonPlaceHolderApi.class);

        Call<Void> call = apiService.postLaneSelection(laneResponse);
        call.enqueue(new Callback<Void>() {
            @Override
            public void onResponse(Call<Void> call, Response<Void> response) {
                if (response.isSuccessful()) {
                    Toast.makeText(getActivity(), "Data submitted successfully", Toast.LENGTH_SHORT).show();
                } else {
                    Toast.makeText(getActivity(), "Failed to submit data: " + response.code(), Toast.LENGTH_SHORT).show();
                }
            }

            @Override
            public void onFailure(Call<Void> call, Throwable t) {
                Toast.makeText(getActivity(), "Error: " + t.getMessage(), Toast.LENGTH_SHORT).show();
            }
        });
    }


    @Override
    public void passDataToFragment(String someValue, String selectedLaneId, HashMap<String, String> cLASSGETResponseList) {
        selectedLane = someValue;
        selecteLaneId = selectedLaneId;
        cLASSGETResponseList = CLASSGETResponseList;
    }

    // EPC list item listener
    private class MyItemClickListener implements OnItemClickListener {
        public void onItemClick(AdapterView<?> parent, View view, int position, long id) {

            mSelectedIndex = position;
            mAdapter.notifyDataSetInvalidated();
        }
    }



    private void BtnContinue() {
        clearList();
        mSelectedIndex = -1;
        mAdapter.notifyDataSetChanged();
        if (mInventoryThread != null && mInventoryThread.isAlive()) {
            System.out.println("Thread not null");
            return;
        }
        if (mDevice.inventoryStart()) {
            System.out.println("RfidInventoryStart sucess.");
            mInventoryStart = true;
            mInventoryThread = new Thread(mInventoryRunable);
            mInventoryThread.start();
            btn_continue.setEnabled(false);
            btn_once.setEnabled(false);
            btn_stop.setEnabled(true);
        } else {
            System.out.println("RfidInventoryStart faild.");
        }
        return;
    }

    private String convertHexToInt(String byte1) {
        try{
            Integer d=Integer.parseInt(byte1,16);

            return d.toString()+"("+getVehicleType(d)+")";
        }
        catch (Exception e) {
            return "0"+"("+getVehicleType(0)+")";
        }
    }

    public static String getVehicleType(int input) {
        switch (input) {
            case 1:
                return "Two wheeler";
            case 2:
                return "Three - Wheeler Passenger";
            case 3:
                return "Three - wheeler Freight";
            case 4:
                return "Car / Jeep / Van";
            case 5:
                return "Light Commercial vehicle 2-axle";
            case 6:
                return "Light Commercial vehicle 3-axle";
            case 7:
                return "Bus 2-axle";
            case 8:
                return "Bus 3-axle";
            case 9:
                return "Mini-Bus";
            case 10:
                return "Truck 2 - axle";
            case 11:
                return "Truck 3 - axle";
            case 12:
                return "Truck 4 - axle";
            case 13:
                return "Truck 5 - axle";
            case 14:
                return "Truck 6 - axle";
            case 15:
                return "Truck Multi axle (7 and above)";
            case 16:
                return "Earth Moving Machinery";
            case 17:
                return "Heavy Construction machinery";
            case 18:
                return "Tractor";
            case 19:
                return "Tractor with trailer";
            case 20:
                return "Tata Ace or Similar Mini Light Commercial Vehicle";
            default:
                return "Invalid class";
        }
    }

    public void DecryptUserData(String userDataStr) {
        try {
            //System.out(userDataStr);
            Log.d("BtnOnce", "BtnOnce: " + userDataStr);
            tv_class.setText(convertHexToInt(userDataStr.substring(24,26)));
            plate_no.setText(hexToStringVehicleNumber(userDataStr.substring(4,24)));
        }
        catch (Exception e) {
           // tv_class.setText("0");
            //plate_no.setText("xxxxxxxxxx");
            Log.d("Tag", e.toString());
            Toast.makeText(getActivity(), e.toString(), Toast.LENGTH_LONG).show();
        }
    }

    public String hexToStringVehicleNumber(String hexString) {
        try{
        StringBuilder result = new StringBuilder();
        for (int i = 0; i < hexString.length(); i += 2) {
            String hexChar = hexString.substring(i, i + 2);
            result.append((char) Integer.parseInt(hexChar, 16));
        }
        return result.toString();}
        catch (Exception e) {
            return "XXXXXXXXXX";
        }
    }


    private void BtnOnce() {
        EPC epc = new EPC();
        try {
            if (mDevice.inventoryOnce(epc, 100)) {
                String epcId = epc.getId();
                System.out.println("EPC ID: " + epcId);
                tv_tag.setText("");

                String password = "00000000"; // Use appropriate password if needed

                // Read TID
                byte[] tidData = new byte[12]; // Adjust size if needed
                String tidBank = "2"; // TID is typically in bank 2
                String tidOffset = "0";
                String tidLength = "12"; // Adjust if needed

                boolean tidReadSuccess = readTagOnce(epcId, password, tidBank, tidOffset, tidLength, tidData);

                // Read User Data
                byte[] userData = new byte[32]; // Adjust size based on your needs
                String userBank = "3"; // User memory is typically in bank 3
                String userOffset = "0";
                String userLength = "32"; // Adjust based on how much user data you want to read

                boolean userReadSuccess = readTagOnce(epcId, password, userBank, userOffset, userLength, userData);

                if (tidReadSuccess || userReadSuccess) {
                    String tidId = BaseUtil.getHexString(tidData, tidData.length, "");
                    String userDataStr = BaseUtil.getHexString(userData, userData.length, "");

                    System.out.println("TID: " + tidId);
                    System.out.println("User Data: " + userDataStr);

                    if (epcId != null && !"".equals(epcId)) {
                        playSound();
                        boolean exist = false;
                        for (EPC item : mEPCList) {
                            if (item.equals(epc)) {
                                item.count++;
                                exist = true;
                                break;
                            }
                        }
                        if (!exist) {
                            mEPCList.add(epc);
                        }
                        //String message = "EPC: " + epcId + "\nTID: " + tidId + "\nUser Data: " + userDataStr;
                        //Log.d("BtnOnce", "BtnOnce: " + message);
                        tv_epc.setText(epcId);
                        tv_tag.setText(tidId);
                        DecryptUserData(userDataStr);

                        okButton.setOnClickListener(new View.OnClickListener() {
                            @Override
                            public void onClick(View v) {
                                postLaneData(tidId,epcId,userDataStr);
                                //Toast.makeText(getActivity(), epcId, Toast.LENGTH_SHORT).show();
                            }
                        });

                    }
                    System.out.println("Inventory, TID, and User Data read successful!");
                } else {
                    System.out.println("TID or User Data read failed!");
                    Toast.makeText(getActivity(), "EPC read successful, but TID or User Data read failed", Toast.LENGTH_SHORT).show();
                }
            } else {
                System.out.println("Inventory Failed!");
                Toast.makeText(getActivity(), "Inventory Failed!", Toast.LENGTH_SHORT).show();
            }
        } catch (Exception w) {
            System.out.println("Error during inventory: " + w.getMessage());
            Toast.makeText(getActivity(), "Error: " + w.getMessage(), Toast.LENGTH_SHORT).show();
        }
    }

    public void test(String userdata, String EPC) {



        String Epc_TagID = "";
        String EPC_UniqueID = "";
        int EPC_UniqueID1 = 0;
        try {
            if (EPC.length() >= 20) {
                //Epc_TagID = "34161FA820328E4012B9"
                Epc_TagID = EPC.substring(0, 20); // for 20 digit EPC
                //EPC_UniqueID = "161FA82"
                EPC_UniqueID = Epc_TagID.substring(2, 9);
            }
        } catch (Exception ex) {
//            logException(ex);
        }

        try {
            if (EPC.length() >= 24) {
                //s = "001101000001011000011111101010000010000000110010100011100100000000010010101110011000001001000000"
                String s = hexToBin(EPC.substring(0, 24));
                //sss = "100001111110101000001000"
//                String sss = s.substring(14, 24);
                String sss = s.substring(14, 38);
                //EPC_UniqueID1 = 8907272
                EPC_UniqueID1 = Integer.parseInt(sss, 2);
//                EPC_UniqueID1 = Int32.Parse(sss,2);
            }
        } catch (Exception ex) {
//            logException(ex);
            Log.d(TAG, "test: " + ex);
        }


        if (EPC.length() >= 24) {
            Epc_TagID = EPC.substring(0, 24); // for 24 digit EPC
        } else
            Epc_TagID = "";

        UserID = userdata;
        User_VehicleRegNo = hexaToStringVehicleNumber(userdata.substring(4, 24));
        Tag_Vehicle_Class = UserID.substring(24, 26);
        Tag_Vehicle_Class2 = String.valueOf(Integer.parseInt(Tag_Vehicle_Class, 16));
//			String Description = cLASSGETResponseList.get(Tag_Vehicle_Class2);
		tv_class.setText(UserID);
		tv_epc.setText(Tag_Vehicle_Class);
        plate_no.setText(Tag_Vehicle_Class2);

        Log.d("allData", UserID);
        Log.d("allData", User_VehicleRegNo);
        Log.d("allData", Tag_Vehicle_Class);
        Log.d("allData", Tag_Vehicle_Class2);

//
       // Ensure the button is properly initialized
        okButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Perform the action you want when the button is clicked
                Log.d("InventoryFragment", "okButton clicked");
//                postLaneData(); // For example, you can call postLaneData() or any other function
//                if (UserID != null && User_VehicleRegNo != null && Tag_Vehicle_Class2 != null) {
//                    sendData(selectedLane, EPC, UserID, User_VehicleRegNo, Tag_Vehicle_Class2);
//                }
                Toast.makeText(getActivity(), EPC, Toast.LENGTH_SHORT).show();
            }
        });



    }



    public String hexToBin(String hexString) {
        StringBuilder binString = new StringBuilder();
        for (int i = 0; i < hexString.length(); i++) {
            char hexChar = hexString.charAt(i);
            String binary = Integer.toBinaryString(Character.digit(hexChar, 16));
            // Ensure leading zeros
            while (binary.length() < 4) {
                binary = "0" + binary;
            }
            binString.append(binary);
        }
        return binString.toString();
    }


    private String hexaToStringVehicleNumber(String hex) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < hex.length(); i += 2) {
            String hexPair = hex.substring(i, i + 2);
            int decimal = Integer.parseInt(hexPair, 16);
            sb.append((char) decimal);
        }
        return sb.toString();
    }

    private void sendData(String selectedLane, String EPC, String userID, String user_VehicleRegNo, String tag_Vehicle_Class2) {
        // Define the data you want to send
        //34161FA820328E4012B98240#58585858585858585858585804003824F6C6CC2C85531E00BD765A8CF82952E4E2F9D2B5140E3C8AF94D138AB1E80000#E2003412013002000CB7B0F7
        String dataToSend = EPC + "#" + user_VehicleRegNo + "#" + tag_Vehicle_Class2 + "#" + EPC;
        sendDataToPort(dataToSend, selectedLane);

    }

    // Method to send data to the server
    private void sendDataToPort(String dataToSend, String serverAddress) {

        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    // Create socket connection
                    Socket socket = new Socket(serverAddress, Integer.parseInt("1200"));

                    // Get output stream from the socket
                    OutputStream outputStream = socket.getOutputStream();

                    // Write data to the output stream
                    outputStream.write(dataToSend.getBytes());
                    outputStream.flush();

                    // Close the output stream and socket
                    outputStream.close();
                    socket.close();

                    // Perform UI operations on the main thread using Handler
                    new Handler(Looper.getMainLooper()).post(new Runnable() {
                        @Override
                        public void run() {
                        }
                    });
                } catch (UnknownHostException e) {
//                    e.printStackTrace();
                    new Handler(Looper.getMainLooper()).post(new Runnable() {
                        @Override
                        public void run() {

                        }
                    });
                } catch (IOException e) {
//                    e.printStackTrace();
                    new Handler(Looper.getMainLooper()).post(new Runnable() {
                        @Override
                        public void run() {

                        }
                    });
                }
            }
        }).start();
    }

    private void BtnStop() {
        mInventoryStart = false;
        if (mInventoryThread != null) {
            mInventoryThread.interrupt();
            mInventoryThread = null;
        }
        System.out.println("begin stop!!");
        if (mDevice.inventoryStop()) {
            System.out.println("end stop!!");
            btn_once.setEnabled(true);
            btn_continue.setEnabled(true);
            btn_stop.setEnabled(false);

        } else {
            System.out.println("RfidInventoryStop failed.");
        }
        return;
    }

    private void clearList() {
        mSelectedIndex = -1;
        if (mEPCList != null) {
            mEPCList.clear();
            mAdapter.notifyDataSetChanged();
            m_count = 0;
        }
    }

    private void BtnRead() {
//		if (mSelectedIndex >= 0) {
        if (et_bank.getText().toString().isEmpty() || et_address.getText().toString().isEmpty()
                || et_lenth.getText().toString().isEmpty()) {
            Toast.makeText(getActivity(), R.string.the_parameter_cannot_be_empty, Toast.LENGTH_SHORT).show();
            return;
        }
        int bank = Integer.parseInt(et_bank.getText().toString());
        int address = Integer.parseInt(et_address.getText().toString());
        int length = Integer.parseInt(et_lenth.getText().toString());

        String str_password = et_password.getText().toString().trim();


        String Epc = mEPCList.get(mSelectedIndex).getId();

        byte[] btPassword = new byte[16];
        BaseUtil.getHexByteArray(str_password, btPassword, btPassword.length);
        byte[] buffer = new byte[MAX_LEN];
        if (length > MAX_LEN) {
            buffer = new byte[length];
        }

        boolean sss = mDevice.readTagData(BaseUtil.getHexByteArray(Epc), btPassword, bank, address, length, buffer);
        if (!sss) {
            et_data.setText("读取数据=" + sss);
        } else {
            String data = BaseUtil.getHexString(buffer, length, " ");
            et_data.setText(data);
        }

    }


    public boolean readTagOnce(String epcID, String psw, String bank, String offset, String len, byte[] data) {
        Log.d("UHFLogic", "readTagData times:111");
        boolean result = false;
        try {
            long st = System.currentTimeMillis();
            if (mDevice.readTagData(BaseUtil.getHexByteArray(epcID),
                    BaseUtil.getHexByteArray(psw),
                    Integer.parseInt(bank),
                    Integer.parseInt(offset),
                    Integer.parseInt(len), data)) {
                result = true;
            }
            Log.d("UHFLogic", "readTagData times:" + (System.currentTimeMillis() - st));
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return result;
        }

    }


    private void BtnWrite() {
        if (mSelectedIndex >= 0) {

            if (et_bank.getText().toString().isEmpty() || et_address.getText().toString().isEmpty()
                    || et_lenth.getText().toString().isEmpty()) {
                Toast.makeText(getActivity(), R.string.the_parameter_cannot_be_empty, Toast.LENGTH_SHORT).show();
                return;
            }
            int bank = Integer.parseInt(et_bank.getText().toString());
            int address = Integer.parseInt(et_address.getText().toString());
            int length = Integer.parseInt(et_lenth.getText().toString());
            String str_password = et_password.getText().toString().trim();

            byte[] Epc = mEPCList.get(mSelectedIndex).id;

            byte[] btPassword = new byte[16];
            BaseUtil.getHexByteArray(str_password, btPassword, btPassword.length);

            String str_data = et_data.getText().toString().replace(" ", "");
            if (str_data.isEmpty()) {
                Toast.makeText(getActivity(), R.string.writeData_cannot_be_empty, Toast.LENGTH_SHORT).show();
                return;
            }
            byte[] buffer = new byte[MAX_LEN];
            if (length > MAX_LEN) {
                buffer = new byte[length];
            }
            BaseUtil.getHexByteArray(str_data, buffer, length);

            if (!mDevice.writeTagData(Epc, btPassword, bank, address, length, buffer)) {

                Toast.makeText(getActivity(), R.string.writeTagData_faild, Toast.LENGTH_SHORT).show();
            } else {
                Toast.makeText(getActivity(), R.string.writeTagData_sucess, Toast.LENGTH_SHORT).show();

            }
        } else {
            Toast.makeText(getActivity(), R.string.please_select_a_tag, Toast.LENGTH_SHORT).show();
        }
    }

    private void BtnClear() {
        et_data.setText(null);
    }

    private void playSound() {
        if (mSoundPool == null) {
            mSoundPool = new SoundPool(3, AudioManager.STREAM_MUSIC, 20);
            soundID = mSoundPool.load(currentView.getContext(), R.raw.scan, 1);// "/system/media/audio/notifications/Antimony.ogg"
        }
        mSoundPool.play(soundID, 1, 1, 0, 0, 1);
    }

    private class InventoryAdapter extends BaseAdapter {

        @Override
        public int getCount() {

            // return 0;
            if (mEPCList != null) {
                return mEPCList.size();
            }
            return 0;
        }

        @Override
        public Object getItem(int position) {

            // return null;
            return mEPCList.get(position);
        }

        @Override
        public long getItemId(int position) {

            // return 0;
            return position;
        }

        @Override
        public void notifyDataSetChanged() {
            super.notifyDataSetChanged();
            mSelectedIndex = -1;
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            View item_view = View.inflate(currentView.getContext(), R.layout.item_epc, null);
            EPC epc = mEPCList.get(position);

            TextView tv_id = (TextView) item_view.findViewById(R.id.tv_epc);
            TextView tv_nums = (TextView) item_view.findViewById(R.id.tv_nums);
            TextView tv_rssi = (TextView) item_view.findViewById(R.id.tv_rssi);

            tv_id.setText(epc.getId());
            tv_nums.setText(epc.count + "");
            tv_rssi.setText(epc.rssi + "");

            if (position == mSelectedIndex) {
                item_view.setBackgroundColor(ItemSelectColor);
            }
            return item_view;
        }

    }

    private class InventoryRunable implements Runnable {

        @Override
        public void run() {

            while (mInventoryStart) {

                Message message = Message.obtain();// Avoid repeated application of memory, reuse of information
                message.what = 1;
                handler.sendMessage(message);

                try {
                    Thread.sleep(100);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }

            }
        }
    }

    public void getLanes() {
//        String myString = MySharedPreferences.getString(getApplicationContext());
//        if (!Objects.equals(myString, "")) {
            Retrofit retrofit = new Retrofit.Builder().baseUrl("http://93.127.198.13:2006/")
                    .addConverterFactory(GsonConverterFactory.create())
                    .build();

            JsonPlaceHolderApi jsonPlaceHolderApi = retrofit.create(JsonPlaceHolderApi.class);

            Call<List<LANERESPONSE>> listCall = jsonPlaceHolderApi.getPosts();

            ProgressDialog pDialog = new ProgressDialog(currentView.getContext());
            pDialog.setMessage("Loading...Please wait");
            pDialog.show();

            listCall.enqueue(new Callback<List<LANERESPONSE>>() {
                @Override
                public void onResponse(Call<List<LANERESPONSE>> call, Response<List<LANERESPONSE>> response) {
                    if (!response.isSuccessful()) {
                        pDialog.hide();
                        return;
                    }

                    List<LANERESPONSE> posts = response.body();
                    pDialog.hide();

                    dataList.clear();
                    dataList2.clear();
                    dataList.add("Select Lane");
                    dataList2.add(new LANERESPONSE());

                    // Iterate through the response to add lane names to the dropdown
                    for (LANERESPONSE post : posts) {
                        Log.d("posts", "onResponse: "+post);
                        dataList.add(post.getLaneName());  // Add lane name to the list
                        dataList2.add(post);
                    }

                    SpinnerAdapter.notifyDataSetChanged();  // Notify the adapter to refresh the spinner

//                    UIHelper.ToastMessage(UHFMainActivity.this, "Server configure successfully");
                }

                @Override
                public void onFailure(Call<List<LANERESPONSE>> call, Throwable t) {
                    pDialog.hide();
                    Log.e("InventoryFragment", "API call failed: " + t.getMessage());
//                    UIHelper.ToastMessage(UHFMainActivity.this, t.getMessage());
                    Log.d("onFailure", t.getMessage());
                }
            });
    }

    public void getCLASSGET() {
//        String myString = MySharedPreferences.getString(getApplicationContext());
//        Retrofit retrofit = new Retrofit.Builder().baseUrl("http://192.168.1.110:8090/api/")
//        if (!Objects.equals(myString, "")) {
//            Retrofit retrofit = new Retrofit.Builder().baseUrl("http://" + myString + ":8090/api/")
            Retrofit retrofit = new Retrofit.Builder().baseUrl("http://" + "http://93.127.198.13:2006" + "/api/")
                    .addConverterFactory(GsonConverterFactory.create())
                    .build();

            JsonPlaceHolderApi jsonPlaceHolderApi = retrofit.create(JsonPlaceHolderApi.class);

            Call<List<CLASSGETResponse>> listCall = jsonPlaceHolderApi.getCLASSGET();

            ProgressDialog pDialog = new ProgressDialog(currentView.getContext());
            pDialog.setMessage("Loading...Please wait");
            pDialog.show();

            listCall.enqueue(new Callback<List<CLASSGETResponse>>() {
                @Override
                public void onResponse(Call<List<CLASSGETResponse>> call, Response<List<CLASSGETResponse>> response) {
                    if (!response.isSuccessful()) {
//                    textView.setText("Code " + response.code());
                        pDialog.hide();
                        return;
                    }

                    List<CLASSGETResponse> posts = response.body();
                    pDialog.hide();

                    CLASSGETResponseList.clear();
                    for (CLASSGETResponse post : posts) {
//                    CLASSGETResponseList.add(post);
                        CLASSGETResponseList.put(post.getCCHClassId(), post.getDescription());

                    }

                }

                @Override
                public void onFailure(Call<List<CLASSGETResponse>> call, Throwable t) {
//                textView.setText(t.getMessage());
                    pDialog.hide();
//                    UIHelper.ToastMessage(UHFMainActivity.this, t.getMessage());
                    Log.d("onFailure", t.getMessage());
                }
            });
//        }else{
//            UIHelper.ToastMessage(UHFMainActivity.this, "Please configure server");
//            playSound(2);
//        }

    }
}
