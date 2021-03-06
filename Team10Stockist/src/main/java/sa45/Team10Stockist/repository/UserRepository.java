package sa45.Team10Stockist.repository;

import java.util.ArrayList;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import sa45.Team10Stockist.model.User;


public interface UserRepository extends JpaRepository<User, String> {
	
	@Query("Select u FROM User u WHERE u.email =:nm")
	User findByEmail(@Param("nm") String nm);
	
	@Query("Select u FROM User u WHERE u.name =:un AND u.password =:pwd")
	User findUserByNamePwd(@Param("un") String name, @Param("pwd") String password);
}
