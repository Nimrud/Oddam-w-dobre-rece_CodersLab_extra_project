package pl.coderslab.donation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.category.Category;
import pl.coderslab.category.CategoryService;
import pl.coderslab.institution.Institution;
import pl.coderslab.institution.InstitutionService;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/donations")
public class DonationController {

    private DonationService donationService;
    private CategoryService categoryService;
    private InstitutionService institutionService;

    @Autowired
    public DonationController(DonationService donationService, CategoryService categoryService, InstitutionService institutionService) {
        this.donationService = donationService;
        this.categoryService = categoryService;
        this.institutionService = institutionService;
    }

    @GetMapping(value = "/add", produces = "text/html; charset=UTF-8")
    public String addDonation(Model model){
        model.addAttribute("donation", new Donation());
        return "form_1";
    }

    @PostMapping(value = "/add", produces = "text/html; charset=UTF-8")
    public String addDonation(@ModelAttribute @Valid Donation donation, BindingResult result){
        if(result.hasErrors()){
            return "form_1";
        }
        donationService.saveDonation(donation);
        return "redirect:list";
    }

    @GetMapping(value = "/list", produces = "text/html; charset=UTF-8")
    public String donationsList(Model model){
        List<Donation> donations = donationService.findAllDonations();
        model.addAttribute("donations", donations);
        return "donationsList";
    }

    @ModelAttribute("categories")
    public List<Category> getCategories(){
        return categoryService.findAllCategories();
    }

    @ModelAttribute("institutions")
    public List<Institution> getInstitutions(){
        return institutionService.findAllInstitutions();
    }


    // TODO
    @GetMapping(value = "/update/{id}", produces = "text/html; charset=UTF-8")
    public String updateDonation(@PathVariable Long id, Model model){
        Donation donation = donationService.findDonation(id);
        model.addAttribute("donation", donation);
        return "donation";
    }

    // TODO
    @PostMapping(value = "/update/{id}", produces = "text/html; charset=UTF-8")
    public String updateDonation(@ModelAttribute @Valid Donation donation, BindingResult result){
        if(result.hasErrors()){
            return "donation";
        }
        donationService.updateDonation(donation);
        return "redirect:../list";
    }
}
