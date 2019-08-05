package pl.coderslab.donation;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface DonationRepo extends JpaRepository<Donation, Long> {

    @Query(value = "select sum(quantity) from donations", nativeQuery = true)
    int sumOfAllBags();

    @Query(value = "select count(distinct institution_id) from donations", nativeQuery = true)
    int sumOfAllSupportedInstitutions();
}
