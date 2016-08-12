package login_service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import spring.project.db.LoginDAO;

@Service

public class LoginServiceImpl implements LoginService {

	@Autowired

	LoginDAO logDAO;

	@Override

	public String loginCheck(HashMap<String, String> hstParam) {

		// TODO Auto-generated method stub

		String identify = logDAO.loginIdentify(hstParam);

		return identify;

	}

}
