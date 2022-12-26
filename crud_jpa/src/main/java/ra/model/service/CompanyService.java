package ra.model.service;

import ra.model.entity.Company;


import java.util.List;

public interface CompanyService {
    List<Company> findAll();
    Company findById(int id);
    void save(Company company);
    void update(Company company);
    void delete(int id);
    List<Company> search(String name);
}
