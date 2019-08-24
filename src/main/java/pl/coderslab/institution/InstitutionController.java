package pl.coderslab.institution;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/institutions")
public class InstitutionController {

    private InstitutionService institutionService;

    @Autowired
    public InstitutionController(InstitutionService institutionService) {
        this.institutionService = institutionService;
    }

    @GetMapping(value = "/add", produces = "text/html; charset=UTF-8")
    public String addInstitution(Model model){
        model.addAttribute("institution", new Institution());
        return "institution";
    }
    @PostMapping(value = "/add", produces = "text/html; charset=UTF-8")
    public String addInstitution(@ModelAttribute @Valid Institution institution, BindingResult result){
        if(result.hasErrors()){
            return "institution";
        }
        institutionService.saveInstitution(institution);
        return "index";
    }

    @GetMapping(value = "/list", produces = "text/html; charset=UTF-8")
    public String institutionsList(Model model){
        List<Institution> institutions = institutionService.findAllInstitutions();
        model.addAttribute("institutions", institutions);
        return "index";
    }

    // TODO
    @GetMapping(value = "/update/{id}", produces = "text/html; charset=UTF-8")
    public String updateInstitution(@PathVariable Long id, Model model){
        Institution institution = institutionService.findInstitution(id);
        model.addAttribute("institution", institution);
        return "institution";
    }

    // TODO
    @PostMapping(value = "/update/{id}", produces = "text/html; charset=UTF-8")
    public String updateInstitution(@ModelAttribute @Valid Institution institution, BindingResult result){
        if(result.hasErrors()){
            return "institution";
        }
        institutionService.updateInstitution(institution);
        return "redirect:../list";
    }

}
