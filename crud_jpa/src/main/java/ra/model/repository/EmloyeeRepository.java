package ra.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import ra.model.entity.Employee;

import java.util.List;

@Repository
public interface EmloyeeRepository extends JpaRepository<Employee,Integer> {
    @Query(value = "select o from Employee o where o.name like '%'||:name||'%'"
            +" OR o.email like '%'||:name||'%'")
    List<Employee> customSearchByName(@Param("name") String name);
}
