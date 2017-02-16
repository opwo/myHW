package com.wt.DB;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DBOperation {
	private static Connection con;
	public static Connection getConnection(){
		try {
			if(con!=null && !con.isClosed()){
				return con;
			}
			Class.forName("oracle.jdbc.driver.OracleDriver");//��������
			String url = "jdbc:oracle:thin:@localhost:1521:XE";//��ȡ���ݿ�URL
			con = DriverManager.getConnection(url, "dvp", "dvp"); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
		
	}
	/**
	 * 
	 * @param rs �ر�resultset
	 * @param ps �ر�PreparedStatement
	 * @param con �ر�Connection
	 */
	public static void closeAll(ResultSet rs,PreparedStatement ps,Connection con){
		try {
			if(rs!=null) rs.close();
			if(ps!=null) ps.close();
			if(con!=null) con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
