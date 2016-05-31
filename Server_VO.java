
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Server_VO implements Runnable {
	ServerSocket ss;
	Socket s;
	Thread thread;
	InputStream in;
	ObjectInputStream ois;
	OutputStream out;
	ObjectOutputStream oos;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	String user, url, password = null;
	int result =0;
	String res = null;
	String flag = null;
	String cmd = null;
	
	
		
	public Server_VO() {
		try {
			ss = new ServerSocket(7777);
			System.out.println("서버 대기중...");
			
			Class.forName("oracle.jdbc.OracleDriver");
			url = "jdbc:oracle:thin:@192.168.0.23:1521:xe";
			user = "hr";
			password = "1111";
			conn = DriverManager.getConnection(url, user, password);
			
			s = ss.accept();
			in = s.getInputStream();
			ois = new ObjectInputStream(in);
			
			out = s.getOutputStream();
			oos = new ObjectOutputStream(out);
			
			thread = new Thread(this);
			thread.start();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	public void run() {
		chk:while(true){
		try {
			Person_VO p = new Person_VO();
			p = (Person_VO)ois.readObject();
			System.out.println(p.getId());
			try {
				
				switch (p.getCmd()) {
				//로그인
				case "1":
					sql = "select * from member where id = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, p.getId());
					rs = pstmt.executeQuery();
					rs.next();
					if(p.getPwd().trim().equals(rs.getString(3).trim())){p.setCmd("4");}
					else{p.setCmd("5");}
					
						p.setId(rs.getString(2).trim());
						p.setPwd(rs.getString(3).trim());
						p.setName(rs.getString(4).trim());
						p.setAge(rs.getString(5).trim());
						p.setAddr(rs.getString(6).trim());
						
					
					System.out.println(p.getAge());
					oos.writeObject(p);
					oos.flush();
				break;
				//회원가입
				case "2":
					sql = "insert into member values(member_seq.nextval,?,?,?,?,?)";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, p.getId());
					pstmt.setString(2, p.getPwd());
					pstmt.setString(3, p.getName());
					pstmt.setString(4, p.getAge());
					pstmt.setString(5, p.getAddr());
					p.setResult(pstmt.executeUpdate());
					if(p.getResult()>0)p.setFlag("Success");
					else p.setFlag("fail");
					oos.writeObject(p);
					oos.flush();
					break;
				//회원정보수정	
				case "3":
					sql = "update member set name=?,age=?,addr=? where id= ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, p.getName());
					pstmt.setInt(2, Integer.parseInt(p.getAge().trim()));
					pstmt.setString(3, p.getAddr());
					pstmt.setString(4, p.getId());
					p.setResult(pstmt.executeUpdate());
					if(p.getResult()>0)p.setFlag("Success");
					else p.setFlag("fail");
					oos.writeObject(p);
					oos.flush();
					break;
				//종료	
				case "4": break chk;
				
				//아이디 중복검사
				case "5":
					sql = "select * from member where id = ? ";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, p.getId());
					rs = pstmt.executeQuery();
					if(rs.next()){
						p.setCmd("7");
						oos.writeObject(p);
						oos.flush();
					}else{
						p.setCmd("8");
						oos.writeObject(p);
						oos.flush();
					} 
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			} 
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		}
		
		
	}
	public static void main(String[] args) {
	 new Server_VO();	
	}

	
	
	

}
