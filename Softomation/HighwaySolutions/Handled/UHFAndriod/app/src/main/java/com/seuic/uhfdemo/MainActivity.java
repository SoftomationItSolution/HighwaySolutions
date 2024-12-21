package com.seuic.uhfdemo;

import com.seuic.uhf.UHFService;

import android.Manifest;
import android.app.Activity;
import android.app.ActivityManager;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.app.ProgressDialog;
import android.content.ComponentName;
import android.content.Context;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.os.Build;
import android.os.Bundle;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.RadioButton;
import android.widget.Spinner;
import android.widget.Toast;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import static com.seuic.uhf.UHFService.PARAMETER_HIDE_PC;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class MainActivity extends Activity implements OnClickListener {
	private RadioButton rb_inventory;
//	private RadioButton rb_settings;

	private UHFService mDevice;

	private FragmentManager fm;
	private FragmentTransaction ft;

	private InventoryFragement m_inventory;
	// private SettingsFragement m_setinventory;

	private Spinner spinner;
	private String baseUrl;
	private ArrayAdapter<String> SpinnerAdapter;
	private List<String> dataList;
	private List<LANERESPONSE> dataList2;
	private HashMap<String, String> CLASSGETResponseList;


	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		stopApps(MainActivity.this,"com.seuic.uhftool");
		mDevice = UHFService.getInstance();
		boolean ret = mDevice.open();
		if (!ret) {
			Toast.makeText(this, R.string.open_failed, Toast.LENGTH_SHORT).show();
		}

		rb_inventory = (RadioButton) findViewById(R.id.rb_inventory);
//		rb_settings = (RadioButton) findViewById(R.id.rb_settings);

		rb_inventory.setOnClickListener(this);
//		rb_settings.setOnClickListener(this);

		spinner = (Spinner) findViewById(R.id.lane_spinner);
		dataList = new ArrayList<>();
		dataList2 = new ArrayList<>();
		CLASSGETResponseList = new HashMap<>();

		dataList.add("Select Lane");
		dataList2.add(new LANERESPONSE());
		SpinnerAdapter = new ArrayAdapter<>(this, android.R.layout.simple_spinner_item, dataList);
		SpinnerAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
		spinner.setAdapter(SpinnerAdapter);

//		spinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
//			@Override
//			public void onItemSelected(AdapterView<?> parentView, View selectedItemView, int position, long id) {
//				String selectedItem = parentView.getItemAtPosition(position).toString();
//
//				Log.d("selectedItem", "onItemSelected: "+selectedItem);
//
//				// Skip posting if "Select Lane" is chosen
//				if (position == 0) {
//					return;
//				}
//
//				// Get the selected LANERESPONSE object
//				LANERESPONSE selectedLane = dataList2.get(position);
//
//				// Post the lane selection
//				postLaneSelection(selectedLane);
//
//				// Pass data to fragment as before
//				fragmentCommunicator.passDataToFragment(
//						selectedLane.getIPAddress(),
//						selectedLane.getLaneID(),
//						CLASSGETResponseList
//				);
//			}
//
//			@Override
//			public void onNothingSelected(AdapterView<?> parentView) {
//				// Handle case when nothing is selected
//			}
//		});

		spinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
			@Override
			public void onItemSelected(AdapterView<?> parentView, View selectedItemView, int position, long id) {
				String selectedItem = parentView.getItemAtPosition(position).toString();
				Log.d("selectedItem", "onItemSelected: " + selectedItem);

				// Skip processing if "Select Lane" is chosen
				if (position == 0) {
					return;
				}

				// Get the selected LANERESPONSE object
				LANERESPONSE selectedLane = dataList2.get(position);

				// Create the URL based on the selected lane
				String url = "http://" + selectedLane.getIPAddress() + ":5002/";
				Log.d("GeneratedURL", "URL: " + url);

				// Optionally pass the generated URL to your method or save it
				baseUrl = url;  // Save the URL dynamically based on selected lane

				fragmentCommunicator.passDataToFragment(
						selectedLane.getIPAddress(),
						selectedLane.getLaneID(),
						CLASSGETResponseList
				);
			}

			@Override
			public void onNothingSelected(AdapterView<?> parentView) {
				// Handle case when nothing is selected
			}
		});

		fm = getFragmentManager();
		ft = fm.beginTransaction();
		m_inventory = InventoryFragement.getInstance();
		ft.replace(R.id.frl_content, m_inventory);
		rb_inventory.setEnabled(false);
		ft.commit();

		getLanes();
		getCLASSGET();
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}


	public static void stopApps(Context context,String packageName) {
		try {
			ActivityManager am = (ActivityManager)context.getSystemService(Context.ACTIVITY_SERVICE);
			Method forceStopPackage = am.getClass().getDeclaredMethod("forceStopPackage", String.class);
			forceStopPackage.setAccessible(true);
			forceStopPackage.invoke(am, packageName);
			Log.i("zy","TimerV force stop package "+packageName+" successful");
			System.out.println("TimerV force stop package "+packageName+" successful");
		}catch(Exception ex) {
			ex.printStackTrace();
			System.err.println("TimerV force stop package "+packageName+" error!");
			Log.i("zy","TimerV force stop package "+packageName+" error!");
		}
	}


	@Override
	protected void onResume() {
		super.onResume();
		// new object
		mDevice = UHFService.getInstance();
		// open UHF
		boolean ret = mDevice.open();
		if (!ret) {
			Toast.makeText(this, R.string.open_failed, Toast.LENGTH_SHORT).show();
		}

	}

	@Override
	protected void onPause() {
		super.onPause();
		// close UHF
		mDevice.close();
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		// Handle action bar item clicks here. The action bar will
		// automatically handle clicks on the Home/Up button, so long
		// as you specify a parent activity in AndroidManifest.xml.
		int id = item.getItemId();
		if (id == R.id.action_exit) {
			mDevice.close();
			// Toast.makeText(this, "exit", 0).show();
			System.exit(0);
			return true;
		}
		if (id == R.id.action_hide) {
			// Toast.makeText(this, "hide", 0).show();
			this.finish();
			return true;
		}
		return super.onOptionsItemSelected(item);
	}

	@Override
	public void onClick(View v) {
		ft = fm.beginTransaction();
		switch (v.getId()) {
		case R.id.rb_inventory:
			ft.replace(R.id.frl_content, InventoryFragement.getInstance());
			rb_inventory.setEnabled(false);
//			rb_settings.setEnabled(true);
			break;

//		case R.id.rb_settings:
//			if (!m_inventory.mInventoryStart) {
//				ft.replace(R.id.frl_content, SettingsFragement.getInstance());
////				rb_settings.setEnabled(false);
//			}
//			rb_inventory.setEnabled(true);
//
//			break;

		default:
			break;
		}
		ft.commit();
	}

	public void getLanes() {
//        String myString = MySharedPreferences.getString(getApplicationContext());
//        if (!Objects.equals(myString, "")) {
		Retrofit retrofit = new Retrofit.Builder().baseUrl("http://93.127.198.13:2006/")
				.addConverterFactory(GsonConverterFactory.create())
				.build();

		JsonPlaceHolderApi jsonPlaceHolderApi = retrofit.create(JsonPlaceHolderApi.class);

		Call<List<LANERESPONSE>> listCall = jsonPlaceHolderApi.getPosts();

		ProgressDialog pDialog = new ProgressDialog(this);
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
//                    UIHelper.ToastMessage(UHFMainActivity.this, t.getMessage());
				Log.d("onFailure", t.getMessage());
			}
		});
//        } else {
////            UIHelper.ToastMessage(UHFMainActivity.this, "Please configure server");
////            playSound(2);
//        }
	}

	public void getCLASSGET() {

		Retrofit retrofit = new Retrofit.Builder().baseUrl("http://" + "http://93.127.198.13:2006" + "/api/")
				.addConverterFactory(GsonConverterFactory.create())
				.build();

		JsonPlaceHolderApi jsonPlaceHolderApi = retrofit.create(JsonPlaceHolderApi.class);

		Call<List<CLASSGETResponse>> listCall = jsonPlaceHolderApi.getCLASSGET();

		ProgressDialog pDialog = new ProgressDialog(this);
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

	private void postLaneSelection(LANERESPONSE laneResponse) {
		if (laneResponse == null || laneResponse.getIPAddress() == null) {
			Toast.makeText(this, "Invalid lane data", Toast.LENGTH_SHORT).show();
			return;
		}

		String baseURL = "http://" + laneResponse.getIPAddress() + ":5002/";
		Retrofit retrofit = new Retrofit.Builder()
				.baseUrl(baseURL)
				.addConverterFactory(GsonConverterFactory.create())
				.build();

		JsonPlaceHolderApi api = retrofit.create(JsonPlaceHolderApi.class);
		Call<Void> call = api.postLaneSelection(laneResponse);

		ProgressDialog pDialog = new ProgressDialog(this);
		pDialog.setMessage("Sending lane selection...");
		pDialog.setCancelable(false);
		pDialog.show();

		call.enqueue(new Callback<Void>() {
			@Override
			public void onResponse(Call<Void> call, Response<Void> response) {
				pDialog.dismiss();
				if (response.isSuccessful()) {

				} else {
					String errorMessage = "Failed to send lane selection. Code: " + response.code();
//					Toast.makeText(, errorMessage, Toast.LENGTH_SHORT).show();
					Log.e("LaneSelection", errorMessage);
				}
			}

			@Override
			public void onFailure(Call<Void> call, Throwable t) {
				pDialog.dismiss();
				String errorMessage = "Error: " + t.getMessage();
//				Toast.makeText(UHFMainActivity.this, errorMessage, Toast.LENGTH_SHORT).show();
				Log.e("LaneSelection", errorMessage, t);
			}
		});
	}


	public static FragmentCommunicator fragmentCommunicator = null;
	public interface FragmentCommunicator{
		public void passDataToFragment(String someValue,String selectedLaneId, HashMap<String, String> cLASSGETResponseList);
	}

}
