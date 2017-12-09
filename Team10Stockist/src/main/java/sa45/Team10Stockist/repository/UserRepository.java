package sa45.Team10Stockist.repository;

import java.util.ArrayList;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import sa45.Team10Stockist.model.User;


public interface UserRepository extends JpaRepository<User, String> {
	
	User findByEmail(String email);
	
	@Query("Select u FROM user u WHERE u.email =:nm AND u.password =:pwd")
	User findUserByNamePwd(@Param("nm") String name, @Param("pwd") String password);
}
