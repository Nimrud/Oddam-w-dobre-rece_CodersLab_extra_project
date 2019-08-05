package pl.coderslab.donation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class DonationService {

    private DonationRepo donationRepo;

    @Autowired
    public DonationService(DonationRepo donationRepo) {
        this.donationRepo = donationRepo;
    }

    public void saveDonation(Donation donation){
        donationRepo.save(donation);
    }

    public void updateDonation(Donation donation){
        donationRepo.save(donation);
    }

    public Donation findDonation(Long id){
        return donationRepo.findById(id).orElse(null);
    }

    public List<Donation> findAllDonations(){
        return donationRepo.findAll();
    }

    public int sumOfAllBags(){
        return donationRepo.sumOfAllBags();
    }

    public int sumOfAllSupportedInstitutions(){ return donationRepo.sumOfAllSupportedInstitutions();}

}
