package ra.model.serviceImp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ra.model.entity.Company;
import ra.model.repository.CompanyRepository;
import ra.model.service.CompanyService;

import java.util.List;
@Service
public class CompanyServiceImp implements CompanyService {
    @Autowired
    private CompanyRepository companyRepository;

    @Override
    public List<Company> findAll() {
        return companyRepository.findAll();
    }

    @Override
    public Company findById(int id) {
        return companyRepository.findById(id).get();
    }

    @Override
    public void save(Company company) {
        companyRepository.save(company);
    }

    @Override
    public void update(Company company) {
        companyRepository.save(company);
    }

    @Override
    public void delete(int id) {
        companyRepository.deleteById(id);
    }

    @Override
    public List<Company> search(String name) {
        return companyRepository.customSearchByName(name);
    }
}
