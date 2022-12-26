package ra.model.serviceImp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ra.model.entity.Employee;
import ra.model.repository.EmloyeeRepository;
import ra.model.service.EmployeeService;

import java.util.List;
@Service
public class EmployeeServiceImp implements EmployeeService {
    @Autowired
    EmloyeeRepository emloyeeRepository;
    @Override
    public List<Employee> findAll() {
        return emloyeeRepository.findAll();
    }

    @Override
    public Employee findById(int id) {
        return emloyeeRepository.findById(id).get();
    }

    @Override
    public void save(Employee employee) {
        emloyeeRepository.save(employee);
    }

    @Override
    public void update(Employee employee) {
        emloyeeRepository.save(employee);
    }

    @Override
    public void delete(int id) {
        emloyeeRepository.deleteById(id);
    }

    @Override
    public List<Employee> search(String name) {
        return emloyeeRepository.customSearchByName(name) ;
    }
}
