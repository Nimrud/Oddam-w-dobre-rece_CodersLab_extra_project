package pl.coderslab.category;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/categories")
public class CategoryController {

    private CategoryService categoryService;

    @Autowired
    public CategoryController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @GetMapping(value = "/add", produces = "text/html; charset=UTF-8")
    public String addCategory(Model model){
        model.addAttribute("category", new Category());
        return "form_category";
    }

    @PostMapping(value = "/add", produces = "text/html; charset=UTF-8")
    public String addCategory(@ModelAttribute @Valid Category category, BindingResult result){
        if(result.hasErrors()){
            return "form_category";
        }
        categoryService.saveCategory(category);
        return "redirect:list";
    }

    @GetMapping(value = "/list", produces = "text/html; charset=UTF-8")
    public String categoriesList(Model model){
        List<Category> categories = categoryService.findAllCategories();
        model.addAttribute("categories", categories);
        return "categoriesList";
    }

    @GetMapping(value = "/update/{id}", produces = "text/html; charset=UTF-8")
    public String updateCategory(@PathVariable Long id, Model model){
        Category category = categoryService.findCategory(id);
        model.addAttribute("category", category);
        return "category";
    }

    @PostMapping(value = "/update/{id}", produces = "text/html; charset=UTF-8")
    public String updateCategory(@ModelAttribute @Valid Category category, BindingResult result){
        if(result.hasErrors()){
            return "category";
        }
        categoryService.updateCategory(category);
        return "redirect:../list";
    }
}
