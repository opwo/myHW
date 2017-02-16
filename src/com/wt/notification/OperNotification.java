package com.wt.notification;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

import com.wt.DB.DBOperation;

public class OperNotification {
	/**
	 * 查看所有通知
	 * @return
	 */
	public static List<Notification> selectNotifi() {
		Connection con=null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		con=DBOperation.getConnection();
		List<Notification> list = new ArrayList<Notification>();
		String sql = "select * from notification_table order by time desc";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				Notification nfc = new Notification(rs.getString(1), rs.getString(2), rs.getTimestamp(3));
				list.add(nfc);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBOperation.closeAll(rs, ps, con);
		}
		return list;
		
	}
	
	public static Notification timeSelect(long times) {
		Connection con=null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		con=DBOperation.getConnection();
		Notification nfc = new Notification();
		Timestamp time = new Timestamp(times);
		String sql = "select * from notification_table where time=?";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setTimestamp(1, time);
			rs = ps.executeQuery();
			while(rs.next()){
				nfc.setTitle(rs.getString(1));
				nfc.setContent(rs.getString(2));
				nfc.setDate(rs.getTimestamp(3));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBOperation.closeAll(rs, ps, con);
		}
		return nfc;
		
	}

}
