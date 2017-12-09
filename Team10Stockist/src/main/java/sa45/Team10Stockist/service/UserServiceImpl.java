package sa45.Team10Stockist.service;

import java.util.ArrayList;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sa45.Team10Stockist.model.User;
import sa45.Team10Stockist.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserRepository userRepository;

	
	/* (non-Javadoc)
	 * @see sa45.Team10Stockist.service.UserService#loadUserByEmail(java.lang.String)
	 */
	@Override
	@Transactional
	public User loadUserByEmail(String email) {
		User user = userRepository.findByEmail(email);
		return user;
	}


	/* (non-Javadoc)
	 * @see sa45.Team10Stockist.service.UserService#authenticate(java.lang.String, java.lang.String)
	 */
	@Override
	@Transactional
	public User authenticate(String email, String password) {
		User user = userRepository.findUserByNamePwd(email, password);
		return user;
	}
	
	/* (non-Javadoc)
	 * @see sa45.Team10Stockist.service.UserService#createUser(sa45.Team10Stockist.model.User)
	 */
	@Override
	@Transactional
	public User createUser(User user) {
		return userRepository.saveAndFlush(user);
	}
	
	/* (non-Javadoc)
	 * @see sa45.Team10Stockist.service.UserService#findAllUsers()
	 */
	@Override
	@Transactional
	public ArrayList<User> findAllUsers() {
		ArrayList<User> ul = (ArrayList<User>) userRepository.findAll();
		return ul;
	}
	
	/* (non-Javadoc)
	 * @see sa45.Team10Stockist.service.UserService#findUser(java.lang.String)
	 */
	@Override
	@Transactional
	public User findUser(String email) {
		return userRepository.findByEmail(email);
	}
	
	/* (non-Javadoc)
	 * @see sa45.Team10Stockist.service.UserService#changeUser(sa45.Team10Stockist.model.User)
	 */
	@Override
	@Transactional
	public User changeUser(User user) {
		return userRepository.saveAndFlush(user);
	}
	

	/* (non-Javadoc)
	 * @see sa45.Team10Stockist.service.UserService#removeUser(sa45.Team10Stockist.model.User)
	 */
	@Override
	@Transactional
	public void removeUser(User user) {
		userRepository.delete(user);
	}
	
	
	
	
}