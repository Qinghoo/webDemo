package com.company.utils;

import java.sql.Connection;
import java.sql.SQLException;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class BaseDbutil {
	protected static ComboPooledDataSource pool=new ComboPooledDataSource();
	protected Connection conn;
	
	public BaseDbutil() {
		try {
			this.conn=pool.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Connection getConnection() {
		try {
			conn=pool.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
		
	}
}
