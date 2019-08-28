package pl.coderslab.users;

public interface UserService {

    User findByUsername(String username);

    void saveUser(User user);
}
