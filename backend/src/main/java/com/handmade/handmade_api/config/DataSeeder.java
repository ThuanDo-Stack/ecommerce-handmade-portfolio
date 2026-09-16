package com.handmade.handmade_api.config;

import com.handmade.handmade_api.modules.auth.entity.Role;
import com.handmade.handmade_api.modules.auth.entity.User;
import com.handmade.handmade_api.modules.auth.repository.RoleRepository;
import com.handmade.handmade_api.modules.auth.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Profile;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import java.util.Collections;

@Component
// Đã bỏ @Profile("dev") để cho phép Docker (Production) cũng tự sinh được tài khoản Demo và Admin
public class DataSeeder implements CommandLineRunner {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public void run(String... args) throws Exception {
        // 1. Tạo các quyền mặc định nếu chưa có
        if (roleRepository.findByName("ROLE_ADMIN").isEmpty()) {
            Role adminRole = new Role();
            adminRole.setName("ROLE_ADMIN");
            adminRole.setDisplayName("Administrator");
            roleRepository.save(adminRole);
        }

        if (roleRepository.findByName("ROLE_USER").isEmpty()) {
            Role userRole = new Role();
            userRole.setName("ROLE_USER");
            userRole.setDisplayName("Customer");
            roleRepository.save(userRole);
        }

        // 2. Tạo tài khoản Admin mặc định nếu chưa có
        if (!userRepository.existsByUsername("admin") && !userRepository.existsByEmail("admin@handmade.com")) {
            User admin = new User();
            admin.setUsername("admin");
            admin.setEmail("admin@handmade.com");
            admin.setFullName("Quản trị viên hệ thống");
            admin.setPassword(passwordEncoder.encode("Admin@123")); // Mật khẩu mẫu
            admin.setEnabled(true);

            Role adminRole = roleRepository.findByName("ROLE_ADMIN").get();
            admin.setRoles(Collections.singleton(adminRole));

            userRepository.save(admin);
            System.out.println(">>> Đã tạo tài khoản Admin mặc định thành công!");
        }

        // 3. Tạo tài khoản Demo Admin
        if (roleRepository.findByName("ROLE_DEMO_ADMIN").isEmpty()) {
            Role demoAdminRole = new Role();
            demoAdminRole.setName("ROLE_DEMO_ADMIN");
            demoAdminRole.setDisplayName("Demo Administrator");
            roleRepository.save(demoAdminRole);
        }

        if (!userRepository.existsByUsername("demoadmin") && !userRepository.existsByEmail("demo@admin.com")) {
            User demoAdmin = new User();
            demoAdmin.setUsername("demoadmin");
            demoAdmin.setEmail("demo@admin.com");
            demoAdmin.setFullName("Khách xem Demo Admin");
            demoAdmin.setPassword(passwordEncoder.encode("demo123")); 
            demoAdmin.setEnabled(true);

            Role demoRole = roleRepository.findByName("ROLE_DEMO_ADMIN").get();
            demoAdmin.setRoles(Collections.singleton(demoRole));

            userRepository.save(demoAdmin);
            System.out.println(">>> Đã tạo tài khoản Demo Admin thành công (demo@admin.com / demo123)!");
        }
    }
}