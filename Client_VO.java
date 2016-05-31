import java.awt.BorderLayout;
import java.awt.CardLayout;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.Socket;
import java.net.UnknownHostException;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;

public class Client_VO extends JFrame implements Runnable {
	JPanel jp_all, jp_id1, jp_pwd1,jp_id2, jp_pwd2,jp_id3, jp_pwd3, jp_join, jp_name, jp_age, jp_addr, jp_chk, jp_name1, jp_age1, jp_addr1;
	JLabel jl_id1, jl_pwd1,jl_id2, jl_pwd2,jl_id3, jl_pwd3, jl_name, jl_age, jl_addr, jl_name1, jl_age1, jl_addr1;
	JTextField jtf, jtf_id2, jtf_pwd2,jtf_id3, jtf_pwd3, jtf_name, jtf_age, jtf_addr, jtf_name1, jtf_age1, jtf_addr1;
	JButton jb1, jb2, jb_chk, jb_can, jb_mod, jb_gum;
	JPasswordField jpf;
	Socket s;
	InputStream in = null;
	ObjectInputStream ois;
	OutputStream out;
	ObjectOutputStream oos;
	Thread thread1;
	String msg;
	CardLayout card;
	JPanel cards, card1, card2, card3;
	String res;
	String cmd;
	String id, pwd, name, age, addr;
	int result;
	String flag;
	
	public Client_VO() {
		card = new CardLayout();
		cards = new JPanel();
		cards.setLayout(card);
		
		card1 = new JPanel(new BorderLayout());
		
		jp_id1 = new JPanel(new FlowLayout(FlowLayout.RIGHT));
		jl_id1 = new JLabel("ID");
		jtf = new JTextField(10);
		jp_id1.add(jl_id1);
		jp_id1.add(jtf);
		
		jp_pwd1 = new JPanel(new FlowLayout(FlowLayout.RIGHT));
		jl_pwd1 = new JLabel("PWD");
		jpf = new JPasswordField(10);
		jp_pwd1.add(jl_pwd1);
		jp_pwd1.add(jpf);
			
		jp_join = new JPanel(new FlowLayout(FlowLayout.RIGHT));
		jb1 = new JButton("LOGIN");
		jb2 = new JButton("JOIN");
		jp_join.add(jb1);
		jp_join.add(jb2);
		
		
		jp_all = new JPanel(new BorderLayout());
		jp_all.add(jp_id1, BorderLayout.NORTH);
		jp_all.add(jp_pwd1, BorderLayout.CENTER);
		jp_all.add(jp_join, BorderLayout.SOUTH);
				
		card1.add(jp_all, BorderLayout.SOUTH);
		cards.add(card1, "1");
		
		
		//회원가입
		card2 = new JPanel();
		card2.setLayout(new GridLayout(6, 1));
		
		jp_id2 = new JPanel(new FlowLayout(FlowLayout.LEFT));
		jl_id2 = new JLabel("I       D ");
		jtf_id2 = new JTextField(10);
		jb_gum = new JButton("CHECK");
		jp_id2.add(jl_id2);
		jp_id2.add(jtf_id2);
		jp_id2.add(jb_gum);
		
		jp_pwd2 = new JPanel(new FlowLayout(FlowLayout.LEFT));
		jl_pwd2 = new JLabel("P W D");
		jtf_pwd2 = new JTextField(10);
		jp_pwd2.add(jl_pwd2);
		jp_pwd2.add(jtf_pwd2);
		
		jp_name = new JPanel(new FlowLayout(FlowLayout.LEFT));
		jl_name = new JLabel("NAME");
		jtf_name = new JTextField(10);
		jp_name.add(jl_name);
		jp_name.add(jtf_name);
		
		jp_age = new JPanel(new FlowLayout(FlowLayout.LEFT));
		jl_age = new JLabel("A G E ");
		jtf_age = new JTextField(10);
		jp_age.add(jl_age);
		jp_age.add(jtf_age);
				
		jp_addr = new JPanel(new FlowLayout(FlowLayout.LEFT));
		jl_addr = new JLabel("ADDR");
		jtf_addr = new JTextField(10);
		jp_addr.add(jl_addr);
		jp_addr.add(jtf_addr);
		
		jp_chk = new JPanel(new FlowLayout(FlowLayout.LEFT));
		jb_chk = new JButton("JOIN");
		jb_can = new JButton("CANCEL");
		jp_chk.add(jb_chk);
		jp_chk.add(jb_can);
		
		
		card2.add(jp_id2);
		card2.add(jp_pwd2);
		card2.add(jp_name);
		card2.add(jp_age);
		card2.add(jp_addr);
		card2.add(jp_chk);
		
		cards.add(card2,  "2");
		
		card3 = new JPanel();
		card3.setLayout(new GridLayout(6, 1));
		
		jp_id3 = new JPanel(new FlowLayout(FlowLayout.LEFT));
		jl_id3 = new JLabel("ID");
		jtf_id3 = new JTextField(10);
		jp_id3.add(jl_id3);
		jp_id3.add(jtf_id3);
		
		jp_pwd3 = new JPanel(new FlowLayout(FlowLayout.LEFT));
		jl_pwd3 = new JLabel("PWD");
		jtf_pwd3 = new JTextField(10);
		jp_pwd3.add(jl_pwd3);
		jp_pwd3.add(jtf_pwd3);
		
		jp_name1 = new JPanel(new FlowLayout(FlowLayout.LEFT));
		jl_name1 = new JLabel("NAME");
		jtf_name1 = new JTextField(10);
		jp_name1.add(jl_name1);
		jp_name1.add(jtf_name1);
		
		jp_age1 = new JPanel(new FlowLayout(FlowLayout.LEFT));
		jl_age1 = new JLabel("AGE");
		jtf_age1 = new JTextField(10);
		jp_age1.add(jl_age1);
		jp_age1.add(jtf_age1);
				
		jp_addr1 = new JPanel(new FlowLayout(FlowLayout.LEFT));
		jl_addr1 = new JLabel("ADDR");
		jtf_addr1 = new JTextField(10);
		jp_addr1.add(jl_addr1);
		jp_addr1.add(jtf_addr1);
		
		jb_mod = new JButton("MODIFY");
		
		card3.add(jp_id3);
		card3.add(jp_pwd3);
		card3.add(jp_name1);
		card3.add(jp_age1);
		card3.add(jp_addr1);
		card3.add(jb_mod);
		
		cards.add(card3,  "3");
	
		
		
		add(cards);
			
		setBounds(100, 100, 300, 300);
		setVisible(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		thread1 = new Thread(Client_VO.this);
		thread1.start();
		
		
		jb1.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				if(jtf.getText().length()>0&&jpf.getText().length()>0){
				try {
					Person_VO p1 = new Person_VO();
					p1.setId(jtf.getText());
					p1.setPwd(jpf.getText());
					p1.setCmd("1");
					
					oos.writeObject(p1);
					oos.flush();
				
					p1 = (Person_VO)ois.readObject();
										
					if(p1.getCmd().equals("4")){
						JOptionPane.showMessageDialog(getContentPane(), "SUCCESS");
						card.show(cards, "3");
						jtf_id3.setText(p1.getId());
						jtf_pwd3.setText(p1.getPwd());
						jtf_name1.setText(p1.getName());
						jtf_age1.setText(p1.getAge());
						jtf_addr1.setText(p1.getAddr());
					}else {
						JOptionPane.showMessageDialog(getContentPane(), "FAIL");
						card.show(cards, "2");
					}
				} catch (Exception e1) {
					e1.printStackTrace();
				}
				}else {
					JOptionPane.showMessageDialog(getContentPane(), "ENTER THE ALL INFORMATION");
				}
			}
		});
		
		jb2.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				card.show(cards, "2");
				
			}
		});
		
		jb_gum.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				Person_VO p1 = new Person_VO();
				p1.setCmd("5");
				p1.setId(jtf_id2.getText().trim());
				try {
					oos.writeObject(p1);
					oos.flush();
					p1 = (Person_VO)ois.readObject();
					if(p1.getCmd().equals("7")){
						JOptionPane.showMessageDialog(getContentPane(), "DUPLICATE");
						jtf_id2.setText(" ");
					}else{
						JOptionPane.showMessageDialog(getContentPane(), "AVAILABLE ID");
					}
				} catch (Exception e2) {
					
				}
				
			}
		});
		jb_chk.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				Person_VO p1 = new Person_VO();
				p1.setId(jtf_id2.getText());
				p1.setPwd(jtf_pwd2.getText());
				p1.setName(jtf_name.getText());
				p1.setAge(jtf_age.getText());
				p1.setAddr(jtf_addr.getText()); 
				p1.setCmd("2");
				try {
					oos.writeObject(p1);
					oos.flush();
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				try {
					p1 = (Person_VO)ois.readObject();
					if(p1.getFlag().equals("Success")){
						JOptionPane.showMessageDialog(getContentPane(), "SUCCESS");
					}else{
						JOptionPane.showMessageDialog(getContentPane(), "FAIL");
					}
				} catch (Exception e1) {
					e1.printStackTrace();
				}
				
				
			}
		});
		jb_can.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				card.show(cards, "1");
				
			}
		});
		jb_mod.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				Person_VO p1 = new Person_VO();
				p1.setId(jtf_id3.getText());
				p1.setPwd(jtf_pwd3.getText());
				p1.setName(jtf_name1.getText());
				p1.setAge(jtf_age1.getText());
				p1.setAddr(jtf_addr1.getText()); 
				p1.setCmd("3");
				try {
					oos.writeObject(p1);
					oos.flush();
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				try {
					p1 = (Person_VO)ois.readObject();
					if(p1.getFlag().equals("Success")){
						JOptionPane.showMessageDialog(getContentPane(), "SUCCESS");
					}else{
						JOptionPane.showMessageDialog(getContentPane(), "FAIL");
					}
				} catch (Exception e1) {
					e1.printStackTrace();
				}
			}
		});
		addWindowListener(new WindowAdapter() {
			@Override
			public void windowClosing(WindowEvent e) {
				Person_VO p1 = new Person_VO();
				p1.setCmd("4");
				try {
					oos.writeObject(p1);
					oos.flush();
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});
	}
	public void send(){
		try {
		
//			System.out.println(p1.getId());
//			oos.writeObject(p1);
//			oos.flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void connected(){
		try {
			s = new Socket("192.168.0.23", 7777);
			out = s.getOutputStream();
			oos = new ObjectOutputStream(out);
			
			in = s.getInputStream();
			ois = new ObjectInputStream(in);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	public void run() {
		try {
			connected();	
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
			
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
				
	}
	public static void main(String[] args) {
		new Client_VO();
	}
	

}
