package ra.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import ra.model.entity.Company;
import ra.model.entity.Employee;
import ra.model.serviceImp.CompanyServiceImp;

import java.util.List;

@Controller
@RequestMapping("/company")
public class CompanyController {
    @Autowired
    CompanyServiceImp companyServiceImp;
    @RequestMapping(value = {"/","getAll",""})
    public String showListCompany(Model model){
        List<Company> listCompany = companyServiceImp.findAll();
        model.addAttribute("listCompany",listCompany);
        return "company/list";
    }
    @RequestMapping("/create")
    public String createFormCompany(Model model){
        Company company = new Company();
        model.addAttribute("company",company);
        return "company/create";
    }
    @PostMapping("/create")
    public String createEmployee(@ModelAttribute("company") Company company){
        companyServiceImp.save(company);
        return "redirect:/company";

    }

    @RequestMapping("/delete")
    public String deleteCompany(int id){
        companyServiceImp.delete(id);
        return "redirect:/company";
    }

    @RequestMapping("/edit")
    public String editForm(int id,Model model){
        Company company = companyServiceImp.findById(id);
        model.addAttribute("company",company);
        return "company/edit";
    }

    @PostMapping("/edit")
    public String editCompany(@ModelAttribute("company") Company company){
          companyServiceImp.save(company);
        return "redirect:/company";
    }

    @PostMapping("/search")
    public String customSearch(String search,Model model){
        List<Company> listCompany = companyServiceImp.search(search);
        model.addAttribute("company",listCompany);
        return "company/list";
    }
}
