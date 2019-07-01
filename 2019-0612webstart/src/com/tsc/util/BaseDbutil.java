package com.tsc.util;

import java.sql.Connection;
import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class BaseDbutil {
	protected static ComboPooledDataSource pool=new ComboPooledDataSource();
	protected static QueryRunner qRunner=new QueryRunner(pool);
	
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
			this.conn=pool.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
		
	}
}
