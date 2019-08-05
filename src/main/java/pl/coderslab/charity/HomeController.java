package pl.coderslab.charity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.donation.DonationService;
import pl.coderslab.institution.Institution;
import pl.coderslab.institution.InstitutionService;

import java.util.List;


@Controller
public class HomeController {

    private InstitutionService institutionService;
    private DonationService donationService;

    @Autowired
    public HomeController(InstitutionService institutionService, DonationService donationService) {
        this.institutionService = institutionService;
        this.donationService = donationService;
    }

    @RequestMapping(value = "/", produces = "text/html; charset=UTF-8")
    public String homeAction(Model model){
        List<Institution> institutions = institutionService.findAllInstitutions();
        int sumOfAllBags = donationService.sumOfAllBags();
        int sumOfAllSupportedInstitutions = donationService.sumOfAllSupportedInstitutions();
        model.addAttribute("institutions", institutions);
        model.addAttribute("allBags", sumOfAllBags);
        model.addAttribute("sumOfAllSupportedInstitutions", sumOfAllSupportedInstitutions);
        return "index";
    }
}
