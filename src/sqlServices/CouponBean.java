/*
 * Gabriel Avinaz
 * 5/29/2020
 * Assignment 9.3
 *
 *This Class is the Bean for Coupon entries, including String method constructing and insert statement for the Bean
 * 
 */
package sqlServices;

import java.io.Serializable;

public class CouponBean implements Serializable {
	//enum for the type of coupon
	enum DiscountType{
		PERCENT, FLATRATE, BOGO, BOGOHALF, FREE, OTHER
	}
	//private variables
	private String id;
	private String code;
	private String storeId;
	private String title;
	private String description;
	private String restriction;
	private DiscountType discType;
	private double discAmt;
	private String startDate;
	private String endDate;
	
	public CouponBean() {
		
	}

	public CouponBean(String id, String code, String storeId, String title, String description, String restriction,
			DiscountType discType, double discAmt, String startDate, String endDate) {
		this.id = id;
		this.code = code;
		this.storeId = storeId;
		this.title = title;
		this.description = description;
		this.restriction = restriction;
		this.discType = discType;
		this.discAmt = discAmt;
		this.startDate = startDate;
		this.endDate = endDate;
	}
	
	public String toSQLInsertString(){
		
		StringBuffer insertBuffer = new StringBuffer("INSERT INTO COUPON VALUES (seq_coupon.nextval, ");
		insertBuffer.append("'" + code + "', ");
		insertBuffer.append("'" + storeId + "', ");
		insertBuffer.append("'" + title + "', ");
		insertBuffer.append("'" + description + "', ");
		insertBuffer.append("'" + restriction + "', ");
		insertBuffer.append("'" + getDiscType() + "', ");
		if (discAmt == 0) {
			insertBuffer.append("'', ");
		}else {
			insertBuffer.append(discAmt + ", ");
		}
		insertBuffer.append("TO_DATE('" + startDate + "', 'YYYY-MM-DD'), ");
		if (endDate.isEmpty()) {
			insertBuffer.append("'')");
		}else {
			insertBuffer.append("TO_DATE('" + endDate + "', 'YYYY-MM-DD'))");
		}
		System.out.println(insertBuffer.toString());
		return insertBuffer.toString();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getStoreId() {
		return storeId;
	}

	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getRestriction() {
		return restriction;
	}

	public void setRestriction(String restriction) {
		this.restriction = restriction;
	}

	public String getDiscType() {
		return discType.name();
	}

	public void setDiscType(String discTypeString) {
		
		DiscountType discType = DiscountType.OTHER;
		try {
			discType = DiscountType.valueOf(discTypeString.toUpperCase());
		} catch (Exception e) {
			System.out.print(e);
		}
				
		this.discType = discType;
	}

	public double getDiscAmt() {
		return discAmt;
	}

	public void setDiscAmt(double discAmt) {
		this.discAmt = discAmt;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	
	
}
