package pl.coderslab.category;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CategoryService {

    private CategoryRepo categoryRepo;

    @Autowired
    public CategoryService(CategoryRepo categoryRepo) {
        this.categoryRepo = categoryRepo;
    }

    public void saveCategory(Category category){
        categoryRepo.save(category);
    }

    public void updateCategory(Category category){
        categoryRepo.save(category);
    }

    public Category findCategory(Long id){
        return categoryRepo.findById(id).orElse(null);
    }

    public List<Category> findAllCategories(){
        return categoryRepo.findAll();
    }
}
