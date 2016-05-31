import java.io.Serializable;

public class Person_VO implements Serializable {
	public static final long serialVersionUID = 10L;
	String flag;
	String id, pwd, name, age, addr, cmd;
	int result;
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getCmd() {
		return cmd;
	}
	public void setCmd(String cmd) {
		this.cmd = cmd;
	}
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
	public Person_VO(){}
	public Person_VO(String flag, String id, String pwd, String name, String age, String addr, String cmd, int result) {
		super();
		this.flag = flag;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.age = age;
		this.addr = addr;
		this.cmd = cmd;
		this.result = result;
	}

	
	
	

}
