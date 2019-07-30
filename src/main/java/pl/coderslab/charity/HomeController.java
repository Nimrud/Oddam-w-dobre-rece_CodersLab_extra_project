package pl.coderslab.charity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.institution.Institution;
import pl.coderslab.institution.InstitutionService;

import java.util.List;


@Controller
public class HomeController {

    private InstitutionService institutionService;

    @Autowired
    public HomeController(InstitutionService institutionService) {
        this.institutionService = institutionService;
    }

    @RequestMapping(value = "/", produces = "text/html; charset=UTF-8")
    public String homeAction(Model model){
        List<Institution> institutions = institutionService.findAllInstitutions();
        model.addAttribute("institutions", institutions);
        return "index";
    }
}
