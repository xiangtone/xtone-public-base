//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.SQLException;
//
//import org.common.util.ConfigManager;
//import org.common.util.ConnectionService;
//import org.common.util.GenerateIdService;
//
//
//public class DownLogInsert implements Runnable {
//  
//  private static final int LOG_ID=6060;
//  
//  private Long id ; 
//  private String gamename ; 
//
//
//  public DownLogInsert(String gamename) {
//    super();
//    this.gamename = gamename;
//   
//  }
//
//  public Long getId() {
//    return id;
//  }
//
//  public void setId(Long id) {
//    this.id = id;
//  }
//
//  
//  public String getGamename() {
//	return gamename;
//}
//
//public void setGamename(String gamename) {
//	this.gamename = gamename;
//}
//
//public static int getLogId() {
//	return LOG_ID;
//}
//
//@Override
//  public void run() {
//	System.out.println();
//    setId(GenerateIdService.getInstance().generateNew(Integer.parseInt(ConfigManager.getConfigData("server.id")), "clicks", 1));
//    System.out.println(this.id);
//    if(this.id > 0){
//      PreparedStatement ps = null;
//      Connection con = null;
//      try{
//        con = LogConnectionService.getInstance().getConnectionForLocal();
//        ps = con.prepareStatement("insert into `log_async_generals` (id,logId,para01) values (?,?,?)");
//        int m = 1;
//        ps.setLong(1, this.getId());
//        ps.setInt(2, LOG_ID);
//        ps.setString(3, this.gamename);
//       
//        ps.executeUpdate();
//      }catch(Exception e){
//        // TODO Auto-generated catch block
//        e.printStackTrace();
//      }finally{
//        if(con != null){
//          try{
//            con.close();
//          }catch(SQLException e){
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//          }
//        }
//      }
//    }
//  }
//
//}