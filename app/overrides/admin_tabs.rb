
Deface::Override.new(:virtual_path      => "spree/layouts/admin",
                     :name              => "projects_admin_tab",
                     :insert_bottom     => "[data-hook='admin_tabs']",
                     :text              => "<%= tab(:projects) %>",
                     :disabled          => true
                    )

Deface::Override.new(:virtual_path      => "spree/layouts/admin",
                     :name              => "tutorials_admin_tab",
                     :insert_bottom     => "[data-hook='admin_tabs']",
                     :text              => "<%= tab(:tutorials) %>",
                     :disabled          => true
                    )

Deface::Override.new(:virtual_path      => "spree/layouts/admin",
                     :name              => "articles_admin_tab",
                     :insert_bottom     => "[data-hook='admin_tabs']",
                     :text              => "<%= tab(:articles) %>",
                     :disabled          => true
                    )
