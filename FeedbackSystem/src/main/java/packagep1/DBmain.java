package packagep1;

import java.sql.Connection;

public class DBmain {

	public static void main(String[] args) {
		Connection con = DBConnection.getConnection();

        if (con != null) {
            System.out.println("✔ Database Connection Successful!");
        } else {
            System.out.println("✘ Failed to Connect to Database!");
        }
    }



	}


