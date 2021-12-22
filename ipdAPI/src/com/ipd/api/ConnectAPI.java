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
