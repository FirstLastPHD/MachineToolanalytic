package com.zps.machine.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class PsqlDBConfig {
	
	public static Statement GetConnection() throws SQLException {
		
		/* When Real Server is used */
		 Connection conn =
		 DriverManager.getConnection("jdbc:postgresql://vm28.os.zps:5432/opcuadb",
		 "dbguest", "xxxxxx");
		
		/* END */
		
		/* When Local Server is Used */
		/*Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/opcuadb1", "postgres",
				"iaremko89q");*/
		 /*  END */
		 
	    Statement st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	    return st;
	}
	


}
