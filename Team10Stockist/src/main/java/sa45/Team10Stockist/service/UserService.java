package sa45.Team10Stockist.service;

import java.util.ArrayList;

import javax.transaction.Transactional;

import sa45.Team10Stockist.model.User;

public interface UserService {

	User loadUserByEmail(String email);

	User authenticate(String name, String password);

	User createUser(User user);

	ArrayList<User> findAllUsers();

	User findUser(String email);

	User changeUser(User user);

	void removeUser(User user);

}