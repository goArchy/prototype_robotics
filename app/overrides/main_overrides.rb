# overrides for the application layout
#
Deface::Override.new(:virtual_path      => "spree/layouts/spree_application",
                     :name              => "logo_override",
                     :replace           => "#logo",
                     :text              => "",
                     :disabled          => true)

Deface::Override.new(:virtual_path      => "spree/layouts/spree_application",
                     :name              => "cart_home_override",
                     :replace           => "#main-nav-bar",
                     :text              => "",
                     :disabled          => true)

Deface::Override.new(:virtual_path      => "spree/layouts/spree_application",
                     :name              => "top_home_override",
                     :replace           => "#top-nav-bar",
                     :text              => "",
                     :disabled          => true)

Deface::Override.new(:virtual_path      => "spree/layouts/spree_application",
                     :name              => "footer_override",
                     :replace           => "#footer-left",
                     :text              => "prototyperobotics.com",
                     :disabled          => false)

Deface::Override.new(:virtual_path      => "spree/layouts/admin",
                     :name              => "articles_admin_tab",
                     :insert_bottom     => "[data-hook='admin_tabs']",
                     :text              => "<%= tab(:articles) %>")

Deface::Override.new(:virtual_path      => "spree/layouts/admin",
                     :name              => "projects_admin_tab",
                     :insert_bottom     => "[data-hook='admin_tabs']",
                     :text              => "<%= tab(:projects) %>")

Deface::Override.new(:virtual_path      => "spree/layouts/admin",
                     :name              => "tutorials_admin_tab",
                     :insert_bottom     => "[data-hook='admin_tabs']",
                     :text              => "<%= tab(:tutorials) %>")

