class RemoveOldSpreeTables < ActiveRecord::Migration
  def change
    rename_table :spree_users, :users
    rename_table :spree_assets, :assets

    rename_table :spree_projects, :projects
    rename_table :spree_articles, :articles
    rename_table :spree_tutorials, :tutorials
    rename_table :spree_galleries, :galleries
    rename_table :spree_steps, :steps

    drop_table :spree_activators
    drop_table :spree_addresses
    drop_table :spree_adjustments
    drop_table :spree_calculators
    drop_table :spree_configurations
    drop_table :spree_countries
    drop_table :spree_creditcards
    drop_table :spree_gateways
    drop_table :spree_inventory_units
    drop_table :spree_line_items
    drop_table :spree_log_entries
    drop_table :spree_mail_methods
    drop_table :spree_option_types
    drop_table :spree_option_types_prototypes
    drop_table :spree_option_values
    drop_table :spree_option_values_variants
    drop_table :spree_orders
    drop_table :spree_payment_methods
    drop_table :spree_payments
    drop_table :spree_pending_promotions
    drop_table :spree_preferences
    drop_table :spree_product_groups
    drop_table :spree_product_groups_products
    drop_table :spree_product_option_types
    drop_table :spree_product_properties
    drop_table :spree_product_scopes
    drop_table :spree_products
    drop_table :spree_products_promotion_rules
    drop_table :spree_products_taxons
    drop_table :spree_promotion_action_line_items
    drop_table :spree_promotion_actions
    drop_table :spree_promotion_rules
    drop_table :spree_promotion_rules_users
    drop_table :spree_properties
    drop_table :spree_properties_prototypes
    drop_table :spree_prototypes
    drop_table :spree_return_authorizations
    drop_table :spree_roles
    drop_table :spree_roles_users
    drop_table :spree_shipments
    drop_table :spree_shipping_categories
    drop_table :spree_shipping_methods
    drop_table :spree_state_events
    drop_table :spree_states
    drop_table :spree_tax_categories
    drop_table :spree_tax_rates
    drop_table :spree_taxonomies
    drop_table :spree_taxons
    drop_table :spree_tokenized_permissions
    drop_table :spree_trackers
    drop_table :spree_variants
    drop_table :spree_zone_members
    drop_table :spree_zones
  end
end
