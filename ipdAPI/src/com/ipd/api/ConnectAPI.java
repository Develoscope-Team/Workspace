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
//				Logger.log("IPD","beandata:: "+beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("IPD", e);
		}

		return beanData;
	}

	//Bank
	@POST

	@Path("/insertUpdateBank")

	@Produces(MediaType.TEXT_PLAIN)

	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdateBank(@FormParam("bank_name") String bank_name,

			@FormParam("account_holder_name") String account_holder_name, @FormParam("account_no") String account_no,

			@FormParam("IFSC_code") String IFSC_code, @FormParam("branch") String branch,

			@FormParam("acc_type") String acc_type, @FormParam("opening_amount") String opening_amount,

			@FormParam("bank_id") int bank_id, @FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {
			System.out.println("I am here");
			bean = new ConnectDataBean();
			beanData = bean.insertUpdateBank(bank_name, account_holder_name, account_no, IFSC_code, branch, acc_type,
					opening_amount, bank_id, flag);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("IPD", e);
		}

		return beanData;
	}

	@POST
	@Path("/getBank")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getBank() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {

			bean = new ConnectDataBean();
			beanData = bean.getAdvice().toString();
//				Logger.log("IPD","beandata:: "+beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("IPD", e);
		}

		return beanData;
	}

	/*
	 * // Bank Master
	 * 
	 * @POST
	 * 
	 * @Path("/insertUpdateBank")
	 * 
	 * @Produces(MediaType.TEXT_PLAIN)
	 * 
	 * @Consumes(MediaType.APPLICATION_FORM_URLENCODED) public int
	 * insertUpdateBank(@FormParam("bank_name") String bank_name,
	 * 
	 * @FormParam("account_holder_name") String
	 * account_holder_name, @FormParam("account_no") String account_no,
	 * 
	 * @FormParam("IFSC_code") String IFSC_code, @FormParam("branch") String branch,
	 * 
	 * @FormParam("acc_type") String acc_type, @FormParam("opening_amount") String
	 * opening_amount,
	 * 
	 * @FormParam("bank_id") int bank_id, @FormParam("flag") int flag) {
	 * ConnectDataBean bean = null; int beanData = 0; try {
	 * System.out.println("I am here"); bean = new ConnectDataBean(); beanData =
	 * bean.insertUpdateBank(bank_name, account_holder_name, account_no, IFSC_code,
	 * branch, acc_type, opening_amount, bank_id, flag);
	 * 
	 * if (beanData > 0) {
	 * 
	 * } } catch (Exception e) { System.out.println(e); Logger.log("IPD", e); }
	 * 
	 * return beanData; }
	 * 
	 * @POST
	 * 
	 * @Path("/getBankDetails")
	 * 
	 * @Produces(MediaType.TEXT_PLAIN)
	 * 
	 * @Consumes(MediaType.APPLICATION_FORM_URLENCODED) public String
	 * getBankDetails() { ConnectDataBean bean = null; String beanData = null; try {
	 * 
	 * bean = new ConnectDataBean(); beanData = bean.getBankDetails().toString();
	 * 
	 * } catch (Exception e) { System.out.println(e); Logger.log("IPD", e); } return
	 * beanData; }
	 */

}
