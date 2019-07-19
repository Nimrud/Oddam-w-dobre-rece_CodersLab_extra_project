package pl.coderslab.institution;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class InstitutionService {

    private InstitutionRepo institutionRepo;

    @Autowired
    public InstitutionService(InstitutionRepo institutionRepo) {
        this.institutionRepo = institutionRepo;
    }

    public void saveInstitution(Institution institution){
        institutionRepo.save(institution);
    }

    public void updateInstitution(Institution institution){
        institutionRepo.save(institution);
    }

    public Institution findInstitution(Long id){
        return institutionRepo.findById(id).orElse(null);
    }

    public List<Institution> findAllInstitutions(){
        return institutionRepo.findAll();
    }
}
