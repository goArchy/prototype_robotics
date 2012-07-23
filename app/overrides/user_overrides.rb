Deface::Override.new(:virtual_path      => "spree/admin/users/_form",
                     :name              => "admin_users_form",
                     :insert_bottom     => "[data-hook='admin_user_form_fields']",
                     :partial           => "shared/user_form")

Deface::Override.new(:virtual_path      => "spree/users/show",
                     :name              => "users_profile_add_projects",
                     :insert_after     => "[data-hook='account_my_orders']",
                     :partial           => "shared/user_projects")
