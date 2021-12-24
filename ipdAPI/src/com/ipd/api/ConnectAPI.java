package com.ipd.api;

import javax.ws.rs.Path;

import java.sql.Date;

import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.json.JSONArray;
import org.json.JSONObject;

import com.customLog.*;
import com.ipd.api.ConnectDataBean;
import com.fasterxml.jackson.core.JsonParser;

import jdk.nashorn.internal.parser.JSONParser;

@Path("/ipdapi")
public class ConnectAPI {
	
	
	
	@POST
	@Path("/insertUpdateAdvice")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdateAdvice(@FormParam("advice_name") String advice_name,
			@FormParam("advice_desc") String advice_desc, @FormParam("advice_id") int advice_id,
			@FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {

			Logger.log("IPD", "advice_name:: " + advice_name);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdateAdvice(advice_name, advice_desc, advice_id, flag);
			Logger.log("IPD", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("IPD", e);
		}

		return beanData;
	}

	@POST
	@Path("/getAdvice")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getAdvice() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {

			bean = new ConnectDataBean();
			beanData = bean.getAdvice().toString();
//				Logger.log("BAFNA","beandata:: "+beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("IPD", e);
		}

		return beanData;
	}

	
	
	@POST
	@Path("/insertUpdateAmbulance")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdateAmbulance(@FormParam("ambulance_no") String ambulance_no,
			@FormParam("ambulance_purchase_date") Date ambulance_purchase_date, @FormParam("price") String price, @FormParam("purchase_place") String purchase_place, @FormParam("ambulance_id") int ambulance_id,
			@FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {

			Logger.log("IPD", "ambulance_no:: " + ambulance_no);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdateAmbulance(ambulance_no, ambulance_purchase_date, price, purchase_place, ambulance_id, flag);
			Logger.log("IPD", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("IPD", e);
		}

		return beanData;
	}

	@POST
	@Path("/getAmbulance")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getAmbulance() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {

			bean = new ConnectDataBean();
			beanData = bean.getAmbulance().toString();
//				Logger.log("IPD","beandata:: "+beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("IPD", e);
		}

		return beanData;
	}
	
	
///////////////////Asset File///////////////////////////////////
	
	@POST
	@Path("/insertUpdateAsset")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdateAsset(@FormParam("asset_name") String asset_name,
			@FormParam("asset_code") String asset_code, @FormParam("asset_price") String asset_price,
			@FormParam("asset_desc") String asset_desc, @FormParam("asset_scan_pdf_name") String asset_scan_pdf_name,
			@FormParam("asset_amount") String asset_amount, @FormParam("percent") String percent, @FormParam("asset_id") int asset_id,
			@FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {

			Logger.log("IPD", "asset_name:: " + asset_code);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdateAsset(asset_name, asset_code, asset_price, asset_desc, asset_scan_pdf_name, asset_amount, percent, asset_id, flag);
			Logger.log("IPD", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("IPD", e);
		}

		return beanData;
	}

	@POST
	@Path("/getAsset")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getAsset() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {

			bean = new ConnectDataBean();
			beanData = bean.getAsset().toString();
//				Logger.log("BAFNA","beandata:: "+beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("IPD", e);
		}

		return beanData;
	}
////////////////////Basic Calender File/////////////////////////
	
	@POST
	@Path("/insertUpdateCalender")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdateCalender(@FormParam("date") String date,
			@FormParam("add_event") String add_event,  @FormParam("calender_id") int calender_id,
			@FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {

			Logger.log("IPD", "date:: " + add_event);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdateCalender(date, add_event, calender_id, flag);
			Logger.log("IPD", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("IPD", e);
		}

		return beanData;
	}

	@POST
	@Path("/getCalender")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getCalender() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {

			bean = new ConnectDataBean();
			beanData = bean.getCalender().toString();
//				Logger.log("BAFNA","beandata:: "+beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("IPD", e);
		}

		return beanData;
	}
	
	///////////////////Building File///////////////////////////////

	@POST
	@Path("/insertUpdateBuilding")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdateBuilding(@FormParam("building_name") String building_name,
			@FormParam("building_floors") String building_floors, @FormParam("building_count") String building_count,
			@FormParam("wards") String wards, @FormParam("floors") String floors,
			@FormParam("rooms") String rooms, @FormParam("operation_theater") String operation_theater, @FormParam("icu") String icu, @FormParam("building_id") int building_id,
			@FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {

			Logger.log("IPD", "building_name:: " + building_floors);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdateBuilding(building_name, building_floors, building_count, wards, floors, rooms, operation_theater, icu, building_id, flag);
			Logger.log("IPD", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("IPD", e);
		}

		return beanData;
	}

	@POST
	@Path("/getBuilding")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getBuilding() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {

			bean = new ConnectDataBean();
			beanData = bean.getBuilding().toString();
//				Logger.log("BAFNA","beandata:: "+beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("IPD", e);
		}

		return beanData;
	}
   ///////////////////Qualification File///////////////////////////
	@POST
	@Path("/insertUpdateQualification")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdateQualification(@FormParam("qualification_name") String qualification_name,
		    @FormParam("qualification_id") int qualification_id,
			@FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {

			Logger.log("IPD", "qualification_name:: " + qualification_name);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdateQualification(qualification_name, qualification_id, flag);
			Logger.log("IPD", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("IPD", e);
		}

		return beanData;
	}

	@POST
	@Path("/getQualification")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getQualification() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {

			bean = new ConnectDataBean();
			beanData = bean.getQualification().toString();
//				Logger.log("BAFNA","beandata:: "+beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("IPD", e);
		}

		return beanData;
	}
	
}
