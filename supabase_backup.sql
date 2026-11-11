--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public.store_locale DROP CONSTRAINT IF EXISTS store_locale_store_id_foreign;
ALTER TABLE IF EXISTS ONLY public.store_currency DROP CONSTRAINT IF EXISTS store_currency_store_id_foreign;
ALTER TABLE IF EXISTS ONLY public.stock_location DROP CONSTRAINT IF EXISTS stock_location_address_id_foreign;
ALTER TABLE IF EXISTS ONLY public.shipping_option DROP CONSTRAINT IF EXISTS shipping_option_shipping_profile_id_foreign;
ALTER TABLE IF EXISTS ONLY public.shipping_option DROP CONSTRAINT IF EXISTS shipping_option_shipping_option_type_id_foreign;
ALTER TABLE IF EXISTS ONLY public.shipping_option DROP CONSTRAINT IF EXISTS shipping_option_service_zone_id_foreign;
ALTER TABLE IF EXISTS ONLY public.shipping_option_rule DROP CONSTRAINT IF EXISTS shipping_option_rule_shipping_option_id_foreign;
ALTER TABLE IF EXISTS ONLY public.shipping_option DROP CONSTRAINT IF EXISTS shipping_option_provider_id_foreign;
ALTER TABLE IF EXISTS ONLY public.service_zone DROP CONSTRAINT IF EXISTS service_zone_fulfillment_set_id_foreign;
ALTER TABLE IF EXISTS ONLY public.search_index_version DROP CONSTRAINT IF EXISTS search_index_version_search_index_id_foreign;
ALTER TABLE IF EXISTS ONLY public.search_index_sync DROP CONSTRAINT IF EXISTS search_index_sync_search_index_version_id_foreign;
ALTER TABLE IF EXISTS ONLY public.return_reason DROP CONSTRAINT IF EXISTS return_reason_parent_return_reason_id_foreign;
ALTER TABLE IF EXISTS ONLY public.reservation_item DROP CONSTRAINT IF EXISTS reservation_item_inventory_item_id_foreign;
ALTER TABLE IF EXISTS ONLY public.region_country DROP CONSTRAINT IF EXISTS region_country_region_id_foreign;
ALTER TABLE IF EXISTS ONLY public.refund DROP CONSTRAINT IF EXISTS refund_payment_id_foreign;
ALTER TABLE IF EXISTS ONLY public.provider_identity DROP CONSTRAINT IF EXISTS provider_identity_auth_identity_id_foreign;
ALTER TABLE IF EXISTS ONLY public.promotion_rule_value DROP CONSTRAINT IF EXISTS promotion_rule_value_promotion_rule_id_foreign;
ALTER TABLE IF EXISTS ONLY public.promotion_promotion_rule DROP CONSTRAINT IF EXISTS promotion_promotion_rule_promotion_rule_id_foreign;
ALTER TABLE IF EXISTS ONLY public.promotion_promotion_rule DROP CONSTRAINT IF EXISTS promotion_promotion_rule_promotion_id_foreign;
ALTER TABLE IF EXISTS ONLY public.promotion DROP CONSTRAINT IF EXISTS promotion_campaign_id_foreign;
ALTER TABLE IF EXISTS ONLY public.promotion_campaign_budget_usage DROP CONSTRAINT IF EXISTS promotion_campaign_budget_usage_budget_id_foreign;
ALTER TABLE IF EXISTS ONLY public.promotion_campaign_budget DROP CONSTRAINT IF EXISTS promotion_campaign_budget_campaign_id_foreign;
ALTER TABLE IF EXISTS ONLY public.promotion_application_method DROP CONSTRAINT IF EXISTS promotion_application_method_promotion_id_foreign;
ALTER TABLE IF EXISTS ONLY public.product_variant_product_image DROP CONSTRAINT IF EXISTS product_variant_product_image_image_id_foreign;
ALTER TABLE IF EXISTS ONLY public.product_variant DROP CONSTRAINT IF EXISTS product_variant_product_id_foreign;
ALTER TABLE IF EXISTS ONLY public.product_variant_option DROP CONSTRAINT IF EXISTS product_variant_option_variant_id_foreign;
ALTER TABLE IF EXISTS ONLY public.product_variant_option DROP CONSTRAINT IF EXISTS product_variant_option_option_value_id_foreign;
ALTER TABLE IF EXISTS ONLY public.product DROP CONSTRAINT IF EXISTS product_type_id_foreign;
ALTER TABLE IF EXISTS ONLY public.product_tags DROP CONSTRAINT IF EXISTS product_tags_product_tag_id_foreign;
ALTER TABLE IF EXISTS ONLY public.product_tags DROP CONSTRAINT IF EXISTS product_tags_product_id_foreign;
ALTER TABLE IF EXISTS ONLY public.product_product_option_value DROP CONSTRAINT IF EXISTS product_product_option_value_product_product_option_id_foreign;
ALTER TABLE IF EXISTS ONLY public.product_product_option_value DROP CONSTRAINT IF EXISTS product_product_option_value_product_option_value_id_foreign;
ALTER TABLE IF EXISTS ONLY public.product_product_option DROP CONSTRAINT IF EXISTS product_product_option_product_option_id_foreign;
ALTER TABLE IF EXISTS ONLY public.product_product_option DROP CONSTRAINT IF EXISTS product_product_option_product_id_foreign;
ALTER TABLE IF EXISTS ONLY public.product_option_value DROP CONSTRAINT IF EXISTS product_option_value_option_id_foreign;
ALTER TABLE IF EXISTS ONLY public.product DROP CONSTRAINT IF EXISTS product_collection_id_foreign;
ALTER TABLE IF EXISTS ONLY public.product_category_product DROP CONSTRAINT IF EXISTS product_category_product_product_id_foreign;
ALTER TABLE IF EXISTS ONLY public.product_category_product DROP CONSTRAINT IF EXISTS product_category_product_product_category_id_foreign;
ALTER TABLE IF EXISTS ONLY public.product_category DROP CONSTRAINT IF EXISTS product_category_parent_category_id_foreign;
ALTER TABLE IF EXISTS ONLY public.price_rule DROP CONSTRAINT IF EXISTS price_rule_price_id_foreign;
ALTER TABLE IF EXISTS ONLY public.price DROP CONSTRAINT IF EXISTS price_price_set_id_foreign;
ALTER TABLE IF EXISTS ONLY public.price DROP CONSTRAINT IF EXISTS price_price_list_id_foreign;
ALTER TABLE IF EXISTS ONLY public.price_list_rule DROP CONSTRAINT IF EXISTS price_list_rule_price_list_id_foreign;
ALTER TABLE IF EXISTS ONLY public.payment_session DROP CONSTRAINT IF EXISTS payment_session_payment_collection_id_foreign;
ALTER TABLE IF EXISTS ONLY public.payment DROP CONSTRAINT IF EXISTS payment_payment_collection_id_foreign;
ALTER TABLE IF EXISTS ONLY public.payment_collection_payment_providers DROP CONSTRAINT IF EXISTS payment_collection_payment_providers_payment_pro_2d555_foreign;
ALTER TABLE IF EXISTS ONLY public.payment_collection_payment_providers DROP CONSTRAINT IF EXISTS payment_collection_payment_providers_payment_col_aa276_foreign;
ALTER TABLE IF EXISTS ONLY public.order_transaction DROP CONSTRAINT IF EXISTS order_transaction_order_id_foreign;
ALTER TABLE IF EXISTS ONLY public.order_summary DROP CONSTRAINT IF EXISTS order_summary_order_id_foreign;
ALTER TABLE IF EXISTS ONLY public.order_shipping DROP CONSTRAINT IF EXISTS order_shipping_order_id_foreign;
ALTER TABLE IF EXISTS ONLY public.order_shipping_method_tax_line DROP CONSTRAINT IF EXISTS order_shipping_method_tax_line_shipping_method_id_foreign;
ALTER TABLE IF EXISTS ONLY public.order_shipping_method_adjustment DROP CONSTRAINT IF EXISTS order_shipping_method_adjustment_shipping_method_id_foreign;
ALTER TABLE IF EXISTS ONLY public."order" DROP CONSTRAINT IF EXISTS order_shipping_address_id_foreign;
ALTER TABLE IF EXISTS ONLY public.order_line_item DROP CONSTRAINT IF EXISTS order_line_item_totals_id_foreign;
ALTER TABLE IF EXISTS ONLY public.order_line_item_tax_line DROP CONSTRAINT IF EXISTS order_line_item_tax_line_item_id_foreign;
ALTER TABLE IF EXISTS ONLY public.order_line_item_adjustment DROP CONSTRAINT IF EXISTS order_line_item_adjustment_item_id_foreign;
ALTER TABLE IF EXISTS ONLY public.order_item DROP CONSTRAINT IF EXISTS order_item_order_id_foreign;
ALTER TABLE IF EXISTS ONLY public.order_item DROP CONSTRAINT IF EXISTS order_item_item_id_foreign;
ALTER TABLE IF EXISTS ONLY public.order_credit_line DROP CONSTRAINT IF EXISTS order_credit_line_order_id_foreign;
ALTER TABLE IF EXISTS ONLY public.order_change DROP CONSTRAINT IF EXISTS order_change_order_id_foreign;
ALTER TABLE IF EXISTS ONLY public.order_change_action DROP CONSTRAINT IF EXISTS order_change_action_order_change_id_foreign;
ALTER TABLE IF EXISTS ONLY public."order" DROP CONSTRAINT IF EXISTS order_billing_address_id_foreign;
ALTER TABLE IF EXISTS ONLY public.notification DROP CONSTRAINT IF EXISTS notification_provider_id_foreign;
ALTER TABLE IF EXISTS ONLY public.inventory_level DROP CONSTRAINT IF EXISTS inventory_level_inventory_item_id_foreign;
ALTER TABLE IF EXISTS ONLY public.image DROP CONSTRAINT IF EXISTS image_product_id_foreign;
ALTER TABLE IF EXISTS ONLY public.geo_zone DROP CONSTRAINT IF EXISTS geo_zone_service_zone_id_foreign;
ALTER TABLE IF EXISTS ONLY public.fulfillment DROP CONSTRAINT IF EXISTS fulfillment_shipping_option_id_foreign;
ALTER TABLE IF EXISTS ONLY public.fulfillment DROP CONSTRAINT IF EXISTS fulfillment_provider_id_foreign;
ALTER TABLE IF EXISTS ONLY public.fulfillment_label DROP CONSTRAINT IF EXISTS fulfillment_label_fulfillment_id_foreign;
ALTER TABLE IF EXISTS ONLY public.fulfillment_item DROP CONSTRAINT IF EXISTS fulfillment_item_fulfillment_id_foreign;
ALTER TABLE IF EXISTS ONLY public.fulfillment DROP CONSTRAINT IF EXISTS fulfillment_delivery_address_id_foreign;
ALTER TABLE IF EXISTS ONLY public.customer_group_customer DROP CONSTRAINT IF EXISTS customer_group_customer_customer_id_foreign;
ALTER TABLE IF EXISTS ONLY public.customer_group_customer DROP CONSTRAINT IF EXISTS customer_group_customer_customer_group_id_foreign;
ALTER TABLE IF EXISTS ONLY public.customer_address DROP CONSTRAINT IF EXISTS customer_address_customer_id_foreign;
ALTER TABLE IF EXISTS ONLY public.credit_line DROP CONSTRAINT IF EXISTS credit_line_cart_id_foreign;
ALTER TABLE IF EXISTS ONLY public.cart_shipping_method_tax_line DROP CONSTRAINT IF EXISTS cart_shipping_method_tax_line_shipping_method_id_foreign;
ALTER TABLE IF EXISTS ONLY public.cart_shipping_method DROP CONSTRAINT IF EXISTS cart_shipping_method_cart_id_foreign;
ALTER TABLE IF EXISTS ONLY public.cart_shipping_method_adjustment DROP CONSTRAINT IF EXISTS cart_shipping_method_adjustment_shipping_method_id_foreign;
ALTER TABLE IF EXISTS ONLY public.cart DROP CONSTRAINT IF EXISTS cart_shipping_address_id_foreign;
ALTER TABLE IF EXISTS ONLY public.cart_line_item_tax_line DROP CONSTRAINT IF EXISTS cart_line_item_tax_line_item_id_foreign;
ALTER TABLE IF EXISTS ONLY public.cart_line_item DROP CONSTRAINT IF EXISTS cart_line_item_cart_id_foreign;
ALTER TABLE IF EXISTS ONLY public.cart_line_item_adjustment DROP CONSTRAINT IF EXISTS cart_line_item_adjustment_item_id_foreign;
ALTER TABLE IF EXISTS ONLY public.cart DROP CONSTRAINT IF EXISTS cart_billing_address_id_foreign;
ALTER TABLE IF EXISTS ONLY public.capture DROP CONSTRAINT IF EXISTS capture_payment_id_foreign;
ALTER TABLE IF EXISTS ONLY public.auth_verification DROP CONSTRAINT IF EXISTS auth_verification_auth_identity_id_foreign;
ALTER TABLE IF EXISTS ONLY public.auth_password_reset_token DROP CONSTRAINT IF EXISTS auth_password_reset_token_provider_identity_id_foreign;
ALTER TABLE IF EXISTS ONLY public.auth_password_reset_token DROP CONSTRAINT IF EXISTS auth_password_reset_token_auth_identity_id_foreign;
ALTER TABLE IF EXISTS ONLY public.auth_mfa_recovery_code DROP CONSTRAINT IF EXISTS auth_mfa_recovery_code_auth_identity_id_foreign;
ALTER TABLE IF EXISTS ONLY public.auth_mfa_factor DROP CONSTRAINT IF EXISTS auth_mfa_factor_auth_identity_id_foreign;
ALTER TABLE IF EXISTS ONLY public.application_method_target_rules DROP CONSTRAINT IF EXISTS application_method_target_rules_promotion_rule_id_foreign;
ALTER TABLE IF EXISTS ONLY public.application_method_target_rules DROP CONSTRAINT IF EXISTS application_method_target_rules_application_method_id_foreign;
ALTER TABLE IF EXISTS ONLY public.application_method_buy_rules DROP CONSTRAINT IF EXISTS application_method_buy_rules_promotion_rule_id_foreign;
ALTER TABLE IF EXISTS ONLY public.application_method_buy_rules DROP CONSTRAINT IF EXISTS application_method_buy_rules_application_method_id_foreign;
ALTER TABLE IF EXISTS ONLY public.tax_region DROP CONSTRAINT IF EXISTS "FK_tax_region_provider_id";
ALTER TABLE IF EXISTS ONLY public.tax_region DROP CONSTRAINT IF EXISTS "FK_tax_region_parent_id";
ALTER TABLE IF EXISTS ONLY public.tax_rate DROP CONSTRAINT IF EXISTS "FK_tax_rate_tax_region_id";
ALTER TABLE IF EXISTS ONLY public.tax_rate_rule DROP CONSTRAINT IF EXISTS "FK_tax_rate_rule_tax_rate_id";
DROP INDEX IF EXISTS public.search_pg_product_v1_trgm_idx;
DROP INDEX IF EXISTS public.search_pg_product_v1_indexed_idx;
DROP INDEX IF EXISTS public.search_pg_product_v1_fts_idx;
DROP INDEX IF EXISTS public.idx_script_name_unique;
DROP INDEX IF EXISTS public."IDX_workflow_execution_workflow_id_transaction_id_run_id_unique";
DROP INDEX IF EXISTS public."IDX_workflow_execution_workflow_id_transaction_id";
DROP INDEX IF EXISTS public."IDX_workflow_execution_workflow_id";
DROP INDEX IF EXISTS public."IDX_workflow_execution_updated_at_retention_time";
DROP INDEX IF EXISTS public."IDX_workflow_execution_transaction_id";
DROP INDEX IF EXISTS public."IDX_workflow_execution_state_updated_at";
DROP INDEX IF EXISTS public."IDX_workflow_execution_state";
DROP INDEX IF EXISTS public."IDX_workflow_execution_run_id";
DROP INDEX IF EXISTS public."IDX_workflow_execution_retention_time_updated_at_state";
DROP INDEX IF EXISTS public."IDX_workflow_execution_id";
DROP INDEX IF EXISTS public."IDX_workflow_execution_deleted_at";
DROP INDEX IF EXISTS public."IDX_view_configuration_user_id";
DROP INDEX IF EXISTS public."IDX_view_configuration_entity_user_id";
DROP INDEX IF EXISTS public."IDX_view_configuration_entity_is_system_default";
DROP INDEX IF EXISTS public."IDX_view_configuration_deleted_at";
DROP INDEX IF EXISTS public."IDX_variant_id_52b23597";
DROP INDEX IF EXISTS public."IDX_variant_id_17b4c4e35";
DROP INDEX IF EXISTS public."IDX_user_preference_user_id_key_unique";
DROP INDEX IF EXISTS public."IDX_user_preference_user_id";
DROP INDEX IF EXISTS public."IDX_user_preference_deleted_at";
DROP INDEX IF EXISTS public."IDX_user_id_64ff0c4c";
DROP INDEX IF EXISTS public."IDX_user_email_unique";
DROP INDEX IF EXISTS public."IDX_user_deleted_at";
DROP INDEX IF EXISTS public."IDX_unique_promotion_code";
DROP INDEX IF EXISTS public."IDX_type_value_unique";
DROP INDEX IF EXISTS public."IDX_tax_region_unique_country_province";
DROP INDEX IF EXISTS public."IDX_tax_region_unique_country_nullable_province";
DROP INDEX IF EXISTS public."IDX_tax_region_provider_id";
DROP INDEX IF EXISTS public."IDX_tax_region_parent_id";
DROP INDEX IF EXISTS public."IDX_tax_region_deleted_at";
DROP INDEX IF EXISTS public."IDX_tax_rate_tax_region_id";
DROP INDEX IF EXISTS public."IDX_tax_rate_rule_unique_rate_reference";
DROP INDEX IF EXISTS public."IDX_tax_rate_rule_tax_rate_id";
DROP INDEX IF EXISTS public."IDX_tax_rate_rule_reference_id";
DROP INDEX IF EXISTS public."IDX_tax_rate_rule_deleted_at";
DROP INDEX IF EXISTS public."IDX_tax_rate_deleted_at";
DROP INDEX IF EXISTS public."IDX_tax_provider_deleted_at";
DROP INDEX IF EXISTS public."IDX_tag_value_unique";
DROP INDEX IF EXISTS public."IDX_store_locale_store_id";
DROP INDEX IF EXISTS public."IDX_store_locale_deleted_at";
DROP INDEX IF EXISTS public."IDX_store_deleted_at";
DROP INDEX IF EXISTS public."IDX_store_currency_store_id";
DROP INDEX IF EXISTS public."IDX_store_currency_deleted_at";
DROP INDEX IF EXISTS public."IDX_stock_location_id_26d06f470";
DROP INDEX IF EXISTS public."IDX_stock_location_id_-e88adb96";
DROP INDEX IF EXISTS public."IDX_stock_location_id_-1e5992737";
DROP INDEX IF EXISTS public."IDX_stock_location_deleted_at";
DROP INDEX IF EXISTS public."IDX_stock_location_address_id_unique";
DROP INDEX IF EXISTS public."IDX_stock_location_address_deleted_at";
DROP INDEX IF EXISTS public."IDX_single_default_region";
DROP INDEX IF EXISTS public."IDX_shipping_profile_name_unique";
DROP INDEX IF EXISTS public."IDX_shipping_profile_id_17a262437";
DROP INDEX IF EXISTS public."IDX_shipping_profile_deleted_at";
DROP INDEX IF EXISTS public."IDX_shipping_option_type_deleted_at";
DROP INDEX IF EXISTS public."IDX_shipping_option_shipping_profile_id";
DROP INDEX IF EXISTS public."IDX_shipping_option_shipping_option_type_id";
DROP INDEX IF EXISTS public."IDX_shipping_option_service_zone_id";
DROP INDEX IF EXISTS public."IDX_shipping_option_rule_shipping_option_id";
DROP INDEX IF EXISTS public."IDX_shipping_option_rule_deleted_at";
DROP INDEX IF EXISTS public."IDX_shipping_option_provider_id";
DROP INDEX IF EXISTS public."IDX_shipping_option_id_ba32fa9c";
DROP INDEX IF EXISTS public."IDX_shipping_option_deleted_at";
DROP INDEX IF EXISTS public."IDX_shipping_method_tax_line_tax_rate_id";
DROP INDEX IF EXISTS public."IDX_shipping_method_option_id";
DROP INDEX IF EXISTS public."IDX_shipping_method_adjustment_promotion_id";
DROP INDEX IF EXISTS public."IDX_service_zone_name_unique";
DROP INDEX IF EXISTS public."IDX_service_zone_fulfillment_set_id";
DROP INDEX IF EXISTS public."IDX_service_zone_deleted_at";
DROP INDEX IF EXISTS public."IDX_search_index_version_search_index_id_version";
DROP INDEX IF EXISTS public."IDX_search_index_version_search_index_id";
DROP INDEX IF EXISTS public."IDX_search_index_version_deleted_at";
DROP INDEX IF EXISTS public."IDX_search_index_sync_search_index_version_id";
DROP INDEX IF EXISTS public."IDX_search_index_sync_job_id";
DROP INDEX IF EXISTS public."IDX_search_index_sync_deleted_at";
DROP INDEX IF EXISTS public."IDX_search_index_name";
DROP INDEX IF EXISTS public."IDX_search_index_deleted_at";
DROP INDEX IF EXISTS public."IDX_sales_channel_id_26d06f470";
DROP INDEX IF EXISTS public."IDX_sales_channel_id_20b454295";
DROP INDEX IF EXISTS public."IDX_sales_channel_id_-1d67bae40";
DROP INDEX IF EXISTS public."IDX_sales_channel_deleted_at";
DROP INDEX IF EXISTS public."IDX_return_reason_value";
DROP INDEX IF EXISTS public."IDX_return_reason_parent_return_reason_id";
DROP INDEX IF EXISTS public."IDX_return_order_id";
DROP INDEX IF EXISTS public."IDX_return_item_return_id";
DROP INDEX IF EXISTS public."IDX_return_item_reason_id";
DROP INDEX IF EXISTS public."IDX_return_item_item_id";
DROP INDEX IF EXISTS public."IDX_return_item_deleted_at";
DROP INDEX IF EXISTS public."IDX_return_id_-31ea43a";
DROP INDEX IF EXISTS public."IDX_return_exchange_id";
DROP INDEX IF EXISTS public."IDX_return_display_id";
DROP INDEX IF EXISTS public."IDX_return_claim_id";
DROP INDEX IF EXISTS public."IDX_reservation_item_location_id";
DROP INDEX IF EXISTS public."IDX_reservation_item_line_item_id";
DROP INDEX IF EXISTS public."IDX_reservation_item_inventory_item_id";
DROP INDEX IF EXISTS public."IDX_reservation_item_deleted_at";
DROP INDEX IF EXISTS public."IDX_region_id_1c934dab0";
DROP INDEX IF EXISTS public."IDX_region_deleted_at";
DROP INDEX IF EXISTS public."IDX_region_country_region_id_iso_2_unique";
DROP INDEX IF EXISTS public."IDX_region_country_region_id";
DROP INDEX IF EXISTS public."IDX_region_country_deleted_at";
DROP INDEX IF EXISTS public."IDX_refund_refund_reason_id";
DROP INDEX IF EXISTS public."IDX_refund_reason_deleted_at";
DROP INDEX IF EXISTS public."IDX_refund_payment_id_idempotency_key_unique";
DROP INDEX IF EXISTS public."IDX_refund_payment_id";
DROP INDEX IF EXISTS public."IDX_refund_deleted_at";
DROP INDEX IF EXISTS public."IDX_rbac_role_id_64ff0c4c";
DROP INDEX IF EXISTS public."IDX_rbac_role_id_-85069d44";
DROP INDEX IF EXISTS public."IDX_publishable_key_id_-1d67bae40";
DROP INDEX IF EXISTS public."IDX_provider_identity_provider_entity_id";
DROP INDEX IF EXISTS public."IDX_provider_identity_deleted_at";
DROP INDEX IF EXISTS public."IDX_provider_identity_auth_identity_id";
DROP INDEX IF EXISTS public."IDX_property_label_entity_property_unique";
DROP INDEX IF EXISTS public."IDX_property_label_entity";
DROP INDEX IF EXISTS public."IDX_property_label_deleted_at";
DROP INDEX IF EXISTS public."IDX_promotion_type";
DROP INDEX IF EXISTS public."IDX_promotion_status";
DROP INDEX IF EXISTS public."IDX_promotion_rule_value_value";
DROP INDEX IF EXISTS public."IDX_promotion_rule_value_rule_id_value";
DROP INDEX IF EXISTS public."IDX_promotion_rule_value_promotion_rule_id";
DROP INDEX IF EXISTS public."IDX_promotion_rule_value_deleted_at";
DROP INDEX IF EXISTS public."IDX_promotion_rule_operator";
DROP INDEX IF EXISTS public."IDX_promotion_rule_deleted_at";
DROP INDEX IF EXISTS public."IDX_promotion_rule_attribute_operator_id";
DROP INDEX IF EXISTS public."IDX_promotion_rule_attribute_operator";
DROP INDEX IF EXISTS public."IDX_promotion_rule_attribute";
DROP INDEX IF EXISTS public."IDX_promotion_is_automatic";
DROP INDEX IF EXISTS public."IDX_promotion_id_-a9d4a70b";
DROP INDEX IF EXISTS public."IDX_promotion_id_-71518339";
DROP INDEX IF EXISTS public."IDX_promotion_deleted_at";
DROP INDEX IF EXISTS public."IDX_promotion_campaign_id";
DROP INDEX IF EXISTS public."IDX_promotion_campaign_deleted_at";
DROP INDEX IF EXISTS public."IDX_promotion_campaign_campaign_identifier_unique";
DROP INDEX IF EXISTS public."IDX_promotion_campaign_budget_usage_deleted_at";
DROP INDEX IF EXISTS public."IDX_promotion_campaign_budget_usage_budget_id";
DROP INDEX IF EXISTS public."IDX_promotion_campaign_budget_usage_attribute_value_budget_id_u";
DROP INDEX IF EXISTS public."IDX_promotion_campaign_budget_deleted_at";
DROP INDEX IF EXISTS public."IDX_promotion_campaign_budget_campaign_id_unique";
DROP INDEX IF EXISTS public."IDX_promotion_application_method_promotion_id_unique";
DROP INDEX IF EXISTS public."IDX_promotion_application_method_deleted_at";
DROP INDEX IF EXISTS public."IDX_promotion_application_method_currency_code";
DROP INDEX IF EXISTS public."IDX_product_variant_upc_unique";
DROP INDEX IF EXISTS public."IDX_product_variant_sku_unique";
DROP INDEX IF EXISTS public."IDX_product_variant_product_image_variant_id";
DROP INDEX IF EXISTS public."IDX_product_variant_product_image_image_id";
DROP INDEX IF EXISTS public."IDX_product_variant_product_image_deleted_at";
DROP INDEX IF EXISTS public."IDX_product_variant_product_id";
DROP INDEX IF EXISTS public."IDX_product_variant_id_product_id";
DROP INDEX IF EXISTS public."IDX_product_variant_ean_unique";
DROP INDEX IF EXISTS public."IDX_product_variant_deleted_at";
DROP INDEX IF EXISTS public."IDX_product_variant_barcode_unique";
DROP INDEX IF EXISTS public."IDX_product_type_id";
DROP INDEX IF EXISTS public."IDX_product_type_deleted_at";
DROP INDEX IF EXISTS public."IDX_product_tag_deleted_at";
DROP INDEX IF EXISTS public."IDX_product_status";
DROP INDEX IF EXISTS public."IDX_product_product_option_value_product_product_option_id_fk";
DROP INDEX IF EXISTS public."IDX_product_product_option_value_product_product_option_id";
DROP INDEX IF EXISTS public."IDX_product_product_option_value_product_option_value_id";
DROP INDEX IF EXISTS public."IDX_product_product_option_value_deleted_at";
DROP INDEX IF EXISTS public."IDX_product_product_option_product_option_id";
DROP INDEX IF EXISTS public."IDX_product_product_option_product_id";
DROP INDEX IF EXISTS public."IDX_product_product_option_deleted_at";
DROP INDEX IF EXISTS public."IDX_product_option_value_option_id";
DROP INDEX IF EXISTS public."IDX_product_option_value_deleted_at";
DROP INDEX IF EXISTS public."IDX_product_option_global_title_unique";
DROP INDEX IF EXISTS public."IDX_product_option_deleted_at";
DROP INDEX IF EXISTS public."IDX_product_image_url_rank_product_id";
DROP INDEX IF EXISTS public."IDX_product_image_url";
DROP INDEX IF EXISTS public."IDX_product_image_rank_product_id";
DROP INDEX IF EXISTS public."IDX_product_image_rank";
DROP INDEX IF EXISTS public."IDX_product_id_20b454295";
DROP INDEX IF EXISTS public."IDX_product_id_17a262437";
DROP INDEX IF EXISTS public."IDX_product_handle_unique";
DROP INDEX IF EXISTS public."IDX_product_deleted_at";
DROP INDEX IF EXISTS public."IDX_product_collection_id";
DROP INDEX IF EXISTS public."IDX_product_collection_deleted_at";
DROP INDEX IF EXISTS public."IDX_product_category_path";
DROP INDEX IF EXISTS public."IDX_product_category_parent_category_id";
DROP INDEX IF EXISTS public."IDX_price_set_id_ba32fa9c";
DROP INDEX IF EXISTS public."IDX_price_set_id_52b23597";
DROP INDEX IF EXISTS public."IDX_price_set_deleted_at";
DROP INDEX IF EXISTS public."IDX_price_rule_price_id_attribute_operator_unique";
DROP INDEX IF EXISTS public."IDX_price_rule_price_id";
DROP INDEX IF EXISTS public."IDX_price_rule_operator_value";
DROP INDEX IF EXISTS public."IDX_price_rule_operator";
DROP INDEX IF EXISTS public."IDX_price_rule_deleted_at";
DROP INDEX IF EXISTS public."IDX_price_rule_attribute_value_price_id";
DROP INDEX IF EXISTS public."IDX_price_rule_attribute_value";
DROP INDEX IF EXISTS public."IDX_price_rule_attribute";
DROP INDEX IF EXISTS public."IDX_price_price_set_id";
DROP INDEX IF EXISTS public."IDX_price_price_list_id";
DROP INDEX IF EXISTS public."IDX_price_preference_deleted_at";
DROP INDEX IF EXISTS public."IDX_price_preference_attribute_value";
DROP INDEX IF EXISTS public."IDX_price_list_rule_value";
DROP INDEX IF EXISTS public."IDX_price_list_rule_price_list_id";
DROP INDEX IF EXISTS public."IDX_price_list_rule_deleted_at";
DROP INDEX IF EXISTS public."IDX_price_list_rule_attribute";
DROP INDEX IF EXISTS public."IDX_price_list_id_status_starts_at_ends_at";
DROP INDEX IF EXISTS public."IDX_price_list_deleted_at";
DROP INDEX IF EXISTS public."IDX_price_deleted_at";
DROP INDEX IF EXISTS public."IDX_price_currency_code";
DROP INDEX IF EXISTS public."IDX_payment_session_payment_collection_id";
DROP INDEX IF EXISTS public."IDX_payment_session_deleted_at";
DROP INDEX IF EXISTS public."IDX_payment_provider_id_1c934dab0";
DROP INDEX IF EXISTS public."IDX_payment_provider_id";
DROP INDEX IF EXISTS public."IDX_payment_provider_deleted_at";
DROP INDEX IF EXISTS public."IDX_payment_payment_session_id_unique";
DROP INDEX IF EXISTS public."IDX_payment_payment_session_id";
DROP INDEX IF EXISTS public."IDX_payment_payment_collection_id";
DROP INDEX IF EXISTS public."IDX_payment_deleted_at";
DROP INDEX IF EXISTS public."IDX_payment_collection_id_f42b9949";
DROP INDEX IF EXISTS public."IDX_payment_collection_id_-4a39f6c9";
DROP INDEX IF EXISTS public."IDX_payment_collection_deleted_at";
DROP INDEX IF EXISTS public."IDX_order_transaction_return_id";
DROP INDEX IF EXISTS public."IDX_order_transaction_reference_id";
DROP INDEX IF EXISTS public."IDX_order_transaction_order_id_version";
DROP INDEX IF EXISTS public."IDX_order_transaction_order_id";
DROP INDEX IF EXISTS public."IDX_order_transaction_exchange_id";
DROP INDEX IF EXISTS public."IDX_order_transaction_currency_code";
DROP INDEX IF EXISTS public."IDX_order_transaction_claim_id";
DROP INDEX IF EXISTS public."IDX_order_summary_order_id_version";
DROP INDEX IF EXISTS public."IDX_order_summary_deleted_at";
DROP INDEX IF EXISTS public."IDX_order_shipping_shipping_method_id";
DROP INDEX IF EXISTS public."IDX_order_shipping_return_id";
DROP INDEX IF EXISTS public."IDX_order_shipping_order_id_version";
DROP INDEX IF EXISTS public."IDX_order_shipping_order_id";
DROP INDEX IF EXISTS public."IDX_order_shipping_method_tax_line_shipping_method_id";
DROP INDEX IF EXISTS public."IDX_order_shipping_method_shipping_option_id";
DROP INDEX IF EXISTS public."IDX_order_shipping_method_adjustment_version_shipping_method";
DROP INDEX IF EXISTS public."IDX_order_shipping_method_adjustment_shipping_method_id";
DROP INDEX IF EXISTS public."IDX_order_shipping_item_id";
DROP INDEX IF EXISTS public."IDX_order_shipping_exchange_id";
DROP INDEX IF EXISTS public."IDX_order_shipping_deleted_at";
DROP INDEX IF EXISTS public."IDX_order_shipping_claim_id";
DROP INDEX IF EXISTS public."IDX_order_shipping_address_id";
DROP INDEX IF EXISTS public."IDX_order_sales_channel_id";
DROP INDEX IF EXISTS public."IDX_order_region_id";
DROP INDEX IF EXISTS public."IDX_order_line_item_variant_id";
DROP INDEX IF EXISTS public."IDX_order_line_item_tax_line_item_id";
DROP INDEX IF EXISTS public."IDX_order_line_item_product_id";
DROP INDEX IF EXISTS public."IDX_order_line_item_adjustment_item_id";
DROP INDEX IF EXISTS public."IDX_order_item_order_id_version";
DROP INDEX IF EXISTS public."IDX_order_item_order_id";
DROP INDEX IF EXISTS public."IDX_order_item_item_id";
DROP INDEX IF EXISTS public."IDX_order_item_deleted_at";
DROP INDEX IF EXISTS public."IDX_order_is_draft_order";
DROP INDEX IF EXISTS public."IDX_order_id_f42b9949";
DROP INDEX IF EXISTS public."IDX_order_id_-e8d2543e";
DROP INDEX IF EXISTS public."IDX_order_id_-71518339";
DROP INDEX IF EXISTS public."IDX_order_id_-71069c16";
DROP INDEX IF EXISTS public."IDX_order_exchange_return_id";
DROP INDEX IF EXISTS public."IDX_order_exchange_order_id";
DROP INDEX IF EXISTS public."IDX_order_exchange_item_item_id";
DROP INDEX IF EXISTS public."IDX_order_exchange_item_exchange_id";
DROP INDEX IF EXISTS public."IDX_order_exchange_item_deleted_at";
DROP INDEX IF EXISTS public."IDX_order_exchange_display_id";
DROP INDEX IF EXISTS public."IDX_order_exchange_deleted_at";
DROP INDEX IF EXISTS public."IDX_order_display_id";
DROP INDEX IF EXISTS public."IDX_order_deleted_at";
DROP INDEX IF EXISTS public."IDX_order_customer_id";
DROP INDEX IF EXISTS public."IDX_order_custom_display_id";
DROP INDEX IF EXISTS public."IDX_order_currency_code";
DROP INDEX IF EXISTS public."IDX_order_credit_line_order_id_version";
DROP INDEX IF EXISTS public."IDX_order_credit_line_order_id";
DROP INDEX IF EXISTS public."IDX_order_credit_line_deleted_at";
DROP INDEX IF EXISTS public."IDX_order_claim_return_id";
DROP INDEX IF EXISTS public."IDX_order_claim_order_id";
DROP INDEX IF EXISTS public."IDX_order_claim_item_item_id";
DROP INDEX IF EXISTS public."IDX_order_claim_item_image_deleted_at";
DROP INDEX IF EXISTS public."IDX_order_claim_item_image_claim_item_id";
DROP INDEX IF EXISTS public."IDX_order_claim_item_deleted_at";
DROP INDEX IF EXISTS public."IDX_order_claim_item_claim_id";
DROP INDEX IF EXISTS public."IDX_order_claim_display_id";
DROP INDEX IF EXISTS public."IDX_order_claim_deleted_at";
DROP INDEX IF EXISTS public."IDX_order_change_version";
DROP INDEX IF EXISTS public."IDX_order_change_status";
DROP INDEX IF EXISTS public."IDX_order_change_return_id";
DROP INDEX IF EXISTS public."IDX_order_change_order_id_version";
DROP INDEX IF EXISTS public."IDX_order_change_order_id";
DROP INDEX IF EXISTS public."IDX_order_change_exchange_id";
DROP INDEX IF EXISTS public."IDX_order_change_deleted_at";
DROP INDEX IF EXISTS public."IDX_order_change_claim_id";
DROP INDEX IF EXISTS public."IDX_order_change_change_type";
DROP INDEX IF EXISTS public."IDX_order_change_action_return_id";
DROP INDEX IF EXISTS public."IDX_order_change_action_ordering";
DROP INDEX IF EXISTS public."IDX_order_change_action_order_id";
DROP INDEX IF EXISTS public."IDX_order_change_action_order_change_id";
DROP INDEX IF EXISTS public."IDX_order_change_action_exchange_id";
DROP INDEX IF EXISTS public."IDX_order_change_action_deleted_at";
DROP INDEX IF EXISTS public."IDX_order_change_action_claim_id";
DROP INDEX IF EXISTS public."IDX_order_billing_address_id";
DROP INDEX IF EXISTS public."IDX_order_address_deleted_at";
DROP INDEX IF EXISTS public."IDX_order_address_customer_id";
DROP INDEX IF EXISTS public."IDX_option_value_option_id_unique";
DROP INDEX IF EXISTS public."IDX_notification_receiver_id";
DROP INDEX IF EXISTS public."IDX_notification_provider_id";
DROP INDEX IF EXISTS public."IDX_notification_provider_deleted_at";
DROP INDEX IF EXISTS public."IDX_notification_idempotency_key_unique";
DROP INDEX IF EXISTS public."IDX_notification_deleted_at";
DROP INDEX IF EXISTS public."IDX_line_item_variant_id";
DROP INDEX IF EXISTS public."IDX_line_item_tax_line_tax_rate_id";
DROP INDEX IF EXISTS public."IDX_line_item_product_type_id";
DROP INDEX IF EXISTS public."IDX_line_item_product_id";
DROP INDEX IF EXISTS public."IDX_line_item_adjustment_promotion_id";
DROP INDEX IF EXISTS public."IDX_layout_configuration_zone_user_id_unique";
DROP INDEX IF EXISTS public."IDX_layout_configuration_zone_unique";
DROP INDEX IF EXISTS public."IDX_layout_configuration_deleted_at";
DROP INDEX IF EXISTS public."IDX_invite_token";
DROP INDEX IF EXISTS public."IDX_invite_id_-85069d44";
DROP INDEX IF EXISTS public."IDX_invite_email_unique";
DROP INDEX IF EXISTS public."IDX_invite_deleted_at";
DROP INDEX IF EXISTS public."IDX_inventory_level_location_id_inventory_item_id";
DROP INDEX IF EXISTS public."IDX_inventory_level_location_id";
DROP INDEX IF EXISTS public."IDX_inventory_level_inventory_item_id";
DROP INDEX IF EXISTS public."IDX_inventory_level_deleted_at";
DROP INDEX IF EXISTS public."IDX_inventory_item_sku";
DROP INDEX IF EXISTS public."IDX_inventory_item_id_17b4c4e35";
DROP INDEX IF EXISTS public."IDX_inventory_item_deleted_at";
DROP INDEX IF EXISTS public."IDX_image_product_id";
DROP INDEX IF EXISTS public."IDX_image_deleted_at";
DROP INDEX IF EXISTS public."IDX_id_f42b9949";
DROP INDEX IF EXISTS public."IDX_id_ba32fa9c";
DROP INDEX IF EXISTS public."IDX_id_64ff0c4c";
DROP INDEX IF EXISTS public."IDX_id_5cb3a0c0";
DROP INDEX IF EXISTS public."IDX_id_52b23597";
DROP INDEX IF EXISTS public."IDX_id_26d06f470";
DROP INDEX IF EXISTS public."IDX_id_20b454295";
DROP INDEX IF EXISTS public."IDX_id_1c934dab0";
DROP INDEX IF EXISTS public."IDX_id_17b4c4e35";
DROP INDEX IF EXISTS public."IDX_id_17a262437";
DROP INDEX IF EXISTS public."IDX_id_-e8d2543e";
DROP INDEX IF EXISTS public."IDX_id_-e88adb96";
DROP INDEX IF EXISTS public."IDX_id_-a9d4a70b";
DROP INDEX IF EXISTS public."IDX_id_-85069d44";
DROP INDEX IF EXISTS public."IDX_id_-71518339";
DROP INDEX IF EXISTS public."IDX_id_-71069c16";
DROP INDEX IF EXISTS public."IDX_id_-4a39f6c9";
DROP INDEX IF EXISTS public."IDX_id_-31ea43a";
DROP INDEX IF EXISTS public."IDX_id_-1e5992737";
DROP INDEX IF EXISTS public."IDX_id_-1d67bae40";
DROP INDEX IF EXISTS public."IDX_geo_zone_service_zone_id";
DROP INDEX IF EXISTS public."IDX_geo_zone_province_code";
DROP INDEX IF EXISTS public."IDX_geo_zone_deleted_at";
DROP INDEX IF EXISTS public."IDX_geo_zone_country_code";
DROP INDEX IF EXISTS public."IDX_geo_zone_city";
DROP INDEX IF EXISTS public."IDX_fulfillment_shipping_option_id";
DROP INDEX IF EXISTS public."IDX_fulfillment_set_name_unique";
DROP INDEX IF EXISTS public."IDX_fulfillment_set_id_-e88adb96";
DROP INDEX IF EXISTS public."IDX_fulfillment_set_deleted_at";
DROP INDEX IF EXISTS public."IDX_fulfillment_provider_id_-1e5992737";
DROP INDEX IF EXISTS public."IDX_fulfillment_provider_deleted_at";
DROP INDEX IF EXISTS public."IDX_fulfillment_location_id";
DROP INDEX IF EXISTS public."IDX_fulfillment_label_fulfillment_id";
DROP INDEX IF EXISTS public."IDX_fulfillment_label_deleted_at";
DROP INDEX IF EXISTS public."IDX_fulfillment_item_line_item_id";
DROP INDEX IF EXISTS public."IDX_fulfillment_item_inventory_item_id";
DROP INDEX IF EXISTS public."IDX_fulfillment_item_fulfillment_id";
DROP INDEX IF EXISTS public."IDX_fulfillment_item_deleted_at";
DROP INDEX IF EXISTS public."IDX_fulfillment_id_-e8d2543e";
DROP INDEX IF EXISTS public."IDX_fulfillment_id_-31ea43a";
DROP INDEX IF EXISTS public."IDX_fulfillment_deleted_at";
DROP INDEX IF EXISTS public."IDX_fulfillment_address_deleted_at";
DROP INDEX IF EXISTS public."IDX_deleted_at_f42b9949";
DROP INDEX IF EXISTS public."IDX_deleted_at_ba32fa9c";
DROP INDEX IF EXISTS public."IDX_deleted_at_64ff0c4c";
DROP INDEX IF EXISTS public."IDX_deleted_at_5cb3a0c0";
DROP INDEX IF EXISTS public."IDX_deleted_at_52b23597";
DROP INDEX IF EXISTS public."IDX_deleted_at_26d06f470";
DROP INDEX IF EXISTS public."IDX_deleted_at_20b454295";
DROP INDEX IF EXISTS public."IDX_deleted_at_1c934dab0";
DROP INDEX IF EXISTS public."IDX_deleted_at_17b4c4e35";
DROP INDEX IF EXISTS public."IDX_deleted_at_17a262437";
DROP INDEX IF EXISTS public."IDX_deleted_at_-e8d2543e";
DROP INDEX IF EXISTS public."IDX_deleted_at_-e88adb96";
DROP INDEX IF EXISTS public."IDX_deleted_at_-a9d4a70b";
DROP INDEX IF EXISTS public."IDX_deleted_at_-85069d44";
DROP INDEX IF EXISTS public."IDX_deleted_at_-71518339";
DROP INDEX IF EXISTS public."IDX_deleted_at_-71069c16";
DROP INDEX IF EXISTS public."IDX_deleted_at_-4a39f6c9";
DROP INDEX IF EXISTS public."IDX_deleted_at_-31ea43a";
DROP INDEX IF EXISTS public."IDX_deleted_at_-1e5992737";
DROP INDEX IF EXISTS public."IDX_deleted_at_-1d67bae40";
DROP INDEX IF EXISTS public."IDX_customer_id_5cb3a0c0";
DROP INDEX IF EXISTS public."IDX_customer_group_name_unique";
DROP INDEX IF EXISTS public."IDX_customer_group_deleted_at";
DROP INDEX IF EXISTS public."IDX_customer_group_customer_deleted_at";
DROP INDEX IF EXISTS public."IDX_customer_group_customer_customer_id";
DROP INDEX IF EXISTS public."IDX_customer_group_customer_customer_group_id";
DROP INDEX IF EXISTS public."IDX_customer_email_has_account_unique";
DROP INDEX IF EXISTS public."IDX_customer_deleted_at";
DROP INDEX IF EXISTS public."IDX_customer_address_unique_customer_shipping";
DROP INDEX IF EXISTS public."IDX_customer_address_unique_customer_billing";
DROP INDEX IF EXISTS public."IDX_customer_address_deleted_at";
DROP INDEX IF EXISTS public."IDX_customer_address_customer_id";
DROP INDEX IF EXISTS public."IDX_credit_line_deleted_at";
DROP INDEX IF EXISTS public."IDX_credit_line_cart_id";
DROP INDEX IF EXISTS public."IDX_collection_handle_unique";
DROP INDEX IF EXISTS public."IDX_category_handle_unique";
DROP INDEX IF EXISTS public."IDX_cart_shipping_method_tax_line_shipping_method_id";
DROP INDEX IF EXISTS public."IDX_cart_shipping_method_tax_line_deleted_at";
DROP INDEX IF EXISTS public."IDX_cart_shipping_method_deleted_at";
DROP INDEX IF EXISTS public."IDX_cart_shipping_method_cart_id";
DROP INDEX IF EXISTS public."IDX_cart_shipping_method_adjustment_shipping_method_id";
DROP INDEX IF EXISTS public."IDX_cart_shipping_method_adjustment_deleted_at";
DROP INDEX IF EXISTS public."IDX_cart_shipping_address_id";
DROP INDEX IF EXISTS public."IDX_cart_sales_channel_id";
DROP INDEX IF EXISTS public."IDX_cart_region_id";
DROP INDEX IF EXISTS public."IDX_cart_line_item_tax_line_item_id";
DROP INDEX IF EXISTS public."IDX_cart_line_item_tax_line_deleted_at";
DROP INDEX IF EXISTS public."IDX_cart_line_item_deleted_at";
DROP INDEX IF EXISTS public."IDX_cart_line_item_cart_id";
DROP INDEX IF EXISTS public."IDX_cart_line_item_adjustment_item_id";
DROP INDEX IF EXISTS public."IDX_cart_line_item_adjustment_deleted_at";
DROP INDEX IF EXISTS public."IDX_cart_id_-a9d4a70b";
DROP INDEX IF EXISTS public."IDX_cart_id_-71069c16";
DROP INDEX IF EXISTS public."IDX_cart_id_-4a39f6c9";
DROP INDEX IF EXISTS public."IDX_cart_deleted_at";
DROP INDEX IF EXISTS public."IDX_cart_customer_id";
DROP INDEX IF EXISTS public."IDX_cart_currency_code";
DROP INDEX IF EXISTS public."IDX_cart_credit_line_reference_reference_id";
DROP INDEX IF EXISTS public."IDX_cart_billing_address_id";
DROP INDEX IF EXISTS public."IDX_cart_address_deleted_at";
DROP INDEX IF EXISTS public."IDX_capture_payment_id";
DROP INDEX IF EXISTS public."IDX_capture_deleted_at";
DROP INDEX IF EXISTS public."IDX_campaign_budget_type";
DROP INDEX IF EXISTS public."IDX_auth_verification_unique_auth_identity_entity_id_entity_typ";
DROP INDEX IF EXISTS public."IDX_auth_verification_deleted_at";
DROP INDEX IF EXISTS public."IDX_auth_verification_auth_identity_id";
DROP INDEX IF EXISTS public."IDX_auth_password_reset_token_token_hash";
DROP INDEX IF EXISTS public."IDX_auth_password_reset_token_provider_identity_id";
DROP INDEX IF EXISTS public."IDX_auth_password_reset_token_expires_at";
DROP INDEX IF EXISTS public."IDX_auth_password_reset_token_deleted_at";
DROP INDEX IF EXISTS public."IDX_auth_password_reset_token_auth_identity_id";
DROP INDEX IF EXISTS public."IDX_auth_mfa_recovery_code_deleted_at";
DROP INDEX IF EXISTS public."IDX_auth_mfa_recovery_code_auth_identity_id";
DROP INDEX IF EXISTS public."IDX_auth_mfa_recovery_code_auth_identity_code_hash";
DROP INDEX IF EXISTS public."IDX_auth_mfa_factor_deleted_at";
DROP INDEX IF EXISTS public."IDX_auth_mfa_factor_auth_identity_provider_active";
DROP INDEX IF EXISTS public."IDX_auth_mfa_factor_auth_identity_id";
DROP INDEX IF EXISTS public."IDX_auth_identity_deleted_at";
DROP INDEX IF EXISTS public."IDX_application_method_type";
DROP INDEX IF EXISTS public."IDX_application_method_target_type";
DROP INDEX IF EXISTS public."IDX_application_method_allocation";
DROP INDEX IF EXISTS public."IDX_api_key_type";
DROP INDEX IF EXISTS public."IDX_api_key_token_unique";
DROP INDEX IF EXISTS public."IDX_api_key_revoked_at";
DROP INDEX IF EXISTS public."IDX_api_key_redacted";
DROP INDEX IF EXISTS public."IDX_api_key_deleted_at";
DROP INDEX IF EXISTS public."IDX_account_holder_provider_id_external_id_unique";
DROP INDEX IF EXISTS public."IDX_account_holder_id_5cb3a0c0";
DROP INDEX IF EXISTS public."IDX_account_holder_deleted_at";
ALTER TABLE IF EXISTS ONLY public.workflow_execution DROP CONSTRAINT IF EXISTS workflow_execution_pkey;
ALTER TABLE IF EXISTS ONLY public.view_configuration DROP CONSTRAINT IF EXISTS view_configuration_pkey;
ALTER TABLE IF EXISTS ONLY public.user_rbac_role DROP CONSTRAINT IF EXISTS user_rbac_role_pkey;
ALTER TABLE IF EXISTS ONLY public.user_preference DROP CONSTRAINT IF EXISTS user_preference_pkey;
ALTER TABLE IF EXISTS ONLY public."user" DROP CONSTRAINT IF EXISTS user_pkey;
ALTER TABLE IF EXISTS ONLY public.tax_region DROP CONSTRAINT IF EXISTS tax_region_pkey;
ALTER TABLE IF EXISTS ONLY public.tax_rate_rule DROP CONSTRAINT IF EXISTS tax_rate_rule_pkey;
ALTER TABLE IF EXISTS ONLY public.tax_rate DROP CONSTRAINT IF EXISTS tax_rate_pkey;
ALTER TABLE IF EXISTS ONLY public.tax_provider DROP CONSTRAINT IF EXISTS tax_provider_pkey;
ALTER TABLE IF EXISTS ONLY public.store DROP CONSTRAINT IF EXISTS store_pkey;
ALTER TABLE IF EXISTS ONLY public.store_locale DROP CONSTRAINT IF EXISTS store_locale_pkey;
ALTER TABLE IF EXISTS ONLY public.store_currency DROP CONSTRAINT IF EXISTS store_currency_pkey;
ALTER TABLE IF EXISTS ONLY public.stock_location DROP CONSTRAINT IF EXISTS stock_location_pkey;
ALTER TABLE IF EXISTS ONLY public.stock_location_address DROP CONSTRAINT IF EXISTS stock_location_address_pkey;
ALTER TABLE IF EXISTS ONLY public.shipping_profile DROP CONSTRAINT IF EXISTS shipping_profile_pkey;
ALTER TABLE IF EXISTS ONLY public.shipping_option_type DROP CONSTRAINT IF EXISTS shipping_option_type_pkey;
ALTER TABLE IF EXISTS ONLY public.shipping_option_rule DROP CONSTRAINT IF EXISTS shipping_option_rule_pkey;
ALTER TABLE IF EXISTS ONLY public.shipping_option_price_set DROP CONSTRAINT IF EXISTS shipping_option_price_set_pkey;
ALTER TABLE IF EXISTS ONLY public.shipping_option DROP CONSTRAINT IF EXISTS shipping_option_pkey;
ALTER TABLE IF EXISTS ONLY public.service_zone DROP CONSTRAINT IF EXISTS service_zone_pkey;
ALTER TABLE IF EXISTS ONLY public.search_postgres_index DROP CONSTRAINT IF EXISTS search_postgres_index_pkey;
ALTER TABLE IF EXISTS ONLY public.search_pg_product_v1 DROP CONSTRAINT IF EXISTS search_pg_product_v1_pkey;
ALTER TABLE IF EXISTS ONLY public.search_index_version DROP CONSTRAINT IF EXISTS search_index_version_pkey;
ALTER TABLE IF EXISTS ONLY public.search_index_sync DROP CONSTRAINT IF EXISTS search_index_sync_pkey;
ALTER TABLE IF EXISTS ONLY public.search_index DROP CONSTRAINT IF EXISTS search_index_pkey;
ALTER TABLE IF EXISTS ONLY public.script_migrations DROP CONSTRAINT IF EXISTS script_migrations_pkey;
ALTER TABLE IF EXISTS ONLY public.sales_channel_stock_location DROP CONSTRAINT IF EXISTS sales_channel_stock_location_pkey;
ALTER TABLE IF EXISTS ONLY public.sales_channel DROP CONSTRAINT IF EXISTS sales_channel_pkey;
ALTER TABLE IF EXISTS ONLY public.return_reason DROP CONSTRAINT IF EXISTS return_reason_pkey;
ALTER TABLE IF EXISTS ONLY public.return DROP CONSTRAINT IF EXISTS return_pkey;
ALTER TABLE IF EXISTS ONLY public.return_item DROP CONSTRAINT IF EXISTS return_item_pkey;
ALTER TABLE IF EXISTS ONLY public.return_fulfillment DROP CONSTRAINT IF EXISTS return_fulfillment_pkey;
ALTER TABLE IF EXISTS ONLY public.reservation_item DROP CONSTRAINT IF EXISTS reservation_item_pkey;
ALTER TABLE IF EXISTS ONLY public.region DROP CONSTRAINT IF EXISTS region_pkey;
ALTER TABLE IF EXISTS ONLY public.region_payment_provider DROP CONSTRAINT IF EXISTS region_payment_provider_pkey;
ALTER TABLE IF EXISTS ONLY public.region_country DROP CONSTRAINT IF EXISTS region_country_pkey;
ALTER TABLE IF EXISTS ONLY public.refund_reason DROP CONSTRAINT IF EXISTS refund_reason_pkey;
ALTER TABLE IF EXISTS ONLY public.refund DROP CONSTRAINT IF EXISTS refund_pkey;
ALTER TABLE IF EXISTS ONLY public.publishable_api_key_sales_channel DROP CONSTRAINT IF EXISTS publishable_api_key_sales_channel_pkey;
ALTER TABLE IF EXISTS ONLY public.provider_identity DROP CONSTRAINT IF EXISTS provider_identity_pkey;
ALTER TABLE IF EXISTS ONLY public.property_label DROP CONSTRAINT IF EXISTS property_label_pkey;
ALTER TABLE IF EXISTS ONLY public.promotion_rule_value DROP CONSTRAINT IF EXISTS promotion_rule_value_pkey;
ALTER TABLE IF EXISTS ONLY public.promotion_rule DROP CONSTRAINT IF EXISTS promotion_rule_pkey;
ALTER TABLE IF EXISTS ONLY public.promotion_promotion_rule DROP CONSTRAINT IF EXISTS promotion_promotion_rule_pkey;
ALTER TABLE IF EXISTS ONLY public.promotion DROP CONSTRAINT IF EXISTS promotion_pkey;
ALTER TABLE IF EXISTS ONLY public.promotion_campaign DROP CONSTRAINT IF EXISTS promotion_campaign_pkey;
ALTER TABLE IF EXISTS ONLY public.promotion_campaign_budget_usage DROP CONSTRAINT IF EXISTS promotion_campaign_budget_usage_pkey;
ALTER TABLE IF EXISTS ONLY public.promotion_campaign_budget DROP CONSTRAINT IF EXISTS promotion_campaign_budget_pkey;
ALTER TABLE IF EXISTS ONLY public.promotion_application_method DROP CONSTRAINT IF EXISTS promotion_application_method_pkey;
ALTER TABLE IF EXISTS ONLY public.product_variant_product_image DROP CONSTRAINT IF EXISTS product_variant_product_image_pkey;
ALTER TABLE IF EXISTS ONLY public.product_variant_price_set DROP CONSTRAINT IF EXISTS product_variant_price_set_pkey;
ALTER TABLE IF EXISTS ONLY public.product_variant DROP CONSTRAINT IF EXISTS product_variant_pkey;
ALTER TABLE IF EXISTS ONLY public.product_variant_option DROP CONSTRAINT IF EXISTS product_variant_option_pkey;
ALTER TABLE IF EXISTS ONLY public.product_variant_inventory_item DROP CONSTRAINT IF EXISTS product_variant_inventory_item_pkey;
ALTER TABLE IF EXISTS ONLY public.product_type DROP CONSTRAINT IF EXISTS product_type_pkey;
ALTER TABLE IF EXISTS ONLY public.product_tags DROP CONSTRAINT IF EXISTS product_tags_pkey;
ALTER TABLE IF EXISTS ONLY public.product_tag DROP CONSTRAINT IF EXISTS product_tag_pkey;
ALTER TABLE IF EXISTS ONLY public.product_shipping_profile DROP CONSTRAINT IF EXISTS product_shipping_profile_pkey;
ALTER TABLE IF EXISTS ONLY public.product_sales_channel DROP CONSTRAINT IF EXISTS product_sales_channel_pkey;
ALTER TABLE IF EXISTS ONLY public.product_product_option_value DROP CONSTRAINT IF EXISTS product_product_option_value_pkey;
ALTER TABLE IF EXISTS ONLY public.product_product_option DROP CONSTRAINT IF EXISTS product_product_option_pkey;
ALTER TABLE IF EXISTS ONLY public.product DROP CONSTRAINT IF EXISTS product_pkey;
ALTER TABLE IF EXISTS ONLY public.product_option_value DROP CONSTRAINT IF EXISTS product_option_value_pkey;
ALTER TABLE IF EXISTS ONLY public.product_option DROP CONSTRAINT IF EXISTS product_option_pkey;
ALTER TABLE IF EXISTS ONLY public.product_collection DROP CONSTRAINT IF EXISTS product_collection_pkey;
ALTER TABLE IF EXISTS ONLY public.product_category_product DROP CONSTRAINT IF EXISTS product_category_product_pkey;
ALTER TABLE IF EXISTS ONLY public.product_category DROP CONSTRAINT IF EXISTS product_category_pkey;
ALTER TABLE IF EXISTS ONLY public.price_set DROP CONSTRAINT IF EXISTS price_set_pkey;
ALTER TABLE IF EXISTS ONLY public.price_rule DROP CONSTRAINT IF EXISTS price_rule_pkey;
ALTER TABLE IF EXISTS ONLY public.price_preference DROP CONSTRAINT IF EXISTS price_preference_pkey;
ALTER TABLE IF EXISTS ONLY public.price DROP CONSTRAINT IF EXISTS price_pkey;
ALTER TABLE IF EXISTS ONLY public.price_list_rule DROP CONSTRAINT IF EXISTS price_list_rule_pkey;
ALTER TABLE IF EXISTS ONLY public.price_list DROP CONSTRAINT IF EXISTS price_list_pkey;
ALTER TABLE IF EXISTS ONLY public.payment_session DROP CONSTRAINT IF EXISTS payment_session_pkey;
ALTER TABLE IF EXISTS ONLY public.payment_provider DROP CONSTRAINT IF EXISTS payment_provider_pkey;
ALTER TABLE IF EXISTS ONLY public.payment DROP CONSTRAINT IF EXISTS payment_pkey;
ALTER TABLE IF EXISTS ONLY public.payment_collection DROP CONSTRAINT IF EXISTS payment_collection_pkey;
ALTER TABLE IF EXISTS ONLY public.payment_collection_payment_providers DROP CONSTRAINT IF EXISTS payment_collection_payment_providers_pkey;
ALTER TABLE IF EXISTS ONLY public.order_transaction DROP CONSTRAINT IF EXISTS order_transaction_pkey;
ALTER TABLE IF EXISTS ONLY public.order_summary DROP CONSTRAINT IF EXISTS order_summary_pkey;
ALTER TABLE IF EXISTS ONLY public.order_shipping DROP CONSTRAINT IF EXISTS order_shipping_pkey;
ALTER TABLE IF EXISTS ONLY public.order_shipping_method_tax_line DROP CONSTRAINT IF EXISTS order_shipping_method_tax_line_pkey;
ALTER TABLE IF EXISTS ONLY public.order_shipping_method DROP CONSTRAINT IF EXISTS order_shipping_method_pkey;
ALTER TABLE IF EXISTS ONLY public.order_shipping_method_adjustment DROP CONSTRAINT IF EXISTS order_shipping_method_adjustment_pkey;
ALTER TABLE IF EXISTS ONLY public.order_promotion DROP CONSTRAINT IF EXISTS order_promotion_pkey;
ALTER TABLE IF EXISTS ONLY public."order" DROP CONSTRAINT IF EXISTS order_pkey;
ALTER TABLE IF EXISTS ONLY public.order_payment_collection DROP CONSTRAINT IF EXISTS order_payment_collection_pkey;
ALTER TABLE IF EXISTS ONLY public.order_line_item_tax_line DROP CONSTRAINT IF EXISTS order_line_item_tax_line_pkey;
ALTER TABLE IF EXISTS ONLY public.order_line_item DROP CONSTRAINT IF EXISTS order_line_item_pkey;
ALTER TABLE IF EXISTS ONLY public.order_line_item_adjustment DROP CONSTRAINT IF EXISTS order_line_item_adjustment_pkey;
ALTER TABLE IF EXISTS ONLY public.order_item DROP CONSTRAINT IF EXISTS order_item_pkey;
ALTER TABLE IF EXISTS ONLY public.order_fulfillment DROP CONSTRAINT IF EXISTS order_fulfillment_pkey;
ALTER TABLE IF EXISTS ONLY public.order_exchange DROP CONSTRAINT IF EXISTS order_exchange_pkey;
ALTER TABLE IF EXISTS ONLY public.order_exchange_item DROP CONSTRAINT IF EXISTS order_exchange_item_pkey;
ALTER TABLE IF EXISTS ONLY public.order_credit_line DROP CONSTRAINT IF EXISTS order_credit_line_pkey;
ALTER TABLE IF EXISTS ONLY public.order_claim DROP CONSTRAINT IF EXISTS order_claim_pkey;
ALTER TABLE IF EXISTS ONLY public.order_claim_item DROP CONSTRAINT IF EXISTS order_claim_item_pkey;
ALTER TABLE IF EXISTS ONLY public.order_claim_item_image DROP CONSTRAINT IF EXISTS order_claim_item_image_pkey;
ALTER TABLE IF EXISTS ONLY public.order_change DROP CONSTRAINT IF EXISTS order_change_pkey;
ALTER TABLE IF EXISTS ONLY public.order_change_action DROP CONSTRAINT IF EXISTS order_change_action_pkey;
ALTER TABLE IF EXISTS ONLY public.order_cart DROP CONSTRAINT IF EXISTS order_cart_pkey;
ALTER TABLE IF EXISTS ONLY public.order_address DROP CONSTRAINT IF EXISTS order_address_pkey;
ALTER TABLE IF EXISTS ONLY public.notification_provider DROP CONSTRAINT IF EXISTS notification_provider_pkey;
ALTER TABLE IF EXISTS ONLY public.notification DROP CONSTRAINT IF EXISTS notification_pkey;
ALTER TABLE IF EXISTS ONLY public.mikro_orm_migrations DROP CONSTRAINT IF EXISTS mikro_orm_migrations_pkey;
ALTER TABLE IF EXISTS ONLY public.location_fulfillment_set DROP CONSTRAINT IF EXISTS location_fulfillment_set_pkey;
ALTER TABLE IF EXISTS ONLY public.location_fulfillment_provider DROP CONSTRAINT IF EXISTS location_fulfillment_provider_pkey;
ALTER TABLE IF EXISTS ONLY public.link_module_migrations DROP CONSTRAINT IF EXISTS link_module_migrations_table_name_key;
ALTER TABLE IF EXISTS ONLY public.link_module_migrations DROP CONSTRAINT IF EXISTS link_module_migrations_pkey;
ALTER TABLE IF EXISTS ONLY public.layout_configuration DROP CONSTRAINT IF EXISTS layout_configuration_pkey;
ALTER TABLE IF EXISTS ONLY public.invite_rbac_role DROP CONSTRAINT IF EXISTS invite_rbac_role_pkey;
ALTER TABLE IF EXISTS ONLY public.invite DROP CONSTRAINT IF EXISTS invite_pkey;
ALTER TABLE IF EXISTS ONLY public.inventory_level DROP CONSTRAINT IF EXISTS inventory_level_pkey;
ALTER TABLE IF EXISTS ONLY public.inventory_item DROP CONSTRAINT IF EXISTS inventory_item_pkey;
ALTER TABLE IF EXISTS ONLY public.image DROP CONSTRAINT IF EXISTS image_pkey;
ALTER TABLE IF EXISTS ONLY public.geo_zone DROP CONSTRAINT IF EXISTS geo_zone_pkey;
ALTER TABLE IF EXISTS ONLY public.fulfillment_set DROP CONSTRAINT IF EXISTS fulfillment_set_pkey;
ALTER TABLE IF EXISTS ONLY public.fulfillment_provider DROP CONSTRAINT IF EXISTS fulfillment_provider_pkey;
ALTER TABLE IF EXISTS ONLY public.fulfillment DROP CONSTRAINT IF EXISTS fulfillment_pkey;
ALTER TABLE IF EXISTS ONLY public.fulfillment_label DROP CONSTRAINT IF EXISTS fulfillment_label_pkey;
ALTER TABLE IF EXISTS ONLY public.fulfillment_item DROP CONSTRAINT IF EXISTS fulfillment_item_pkey;
ALTER TABLE IF EXISTS ONLY public.fulfillment_address DROP CONSTRAINT IF EXISTS fulfillment_address_pkey;
ALTER TABLE IF EXISTS ONLY public.customer DROP CONSTRAINT IF EXISTS customer_pkey;
ALTER TABLE IF EXISTS ONLY public.customer_group DROP CONSTRAINT IF EXISTS customer_group_pkey;
ALTER TABLE IF EXISTS ONLY public.customer_group_customer DROP CONSTRAINT IF EXISTS customer_group_customer_pkey;
ALTER TABLE IF EXISTS ONLY public.customer_address DROP CONSTRAINT IF EXISTS customer_address_pkey;
ALTER TABLE IF EXISTS ONLY public.customer_account_holder DROP CONSTRAINT IF EXISTS customer_account_holder_pkey;
ALTER TABLE IF EXISTS ONLY public.currency DROP CONSTRAINT IF EXISTS currency_pkey;
ALTER TABLE IF EXISTS ONLY public.credit_line DROP CONSTRAINT IF EXISTS credit_line_pkey;
ALTER TABLE IF EXISTS ONLY public.cart_shipping_method_tax_line DROP CONSTRAINT IF EXISTS cart_shipping_method_tax_line_pkey;
ALTER TABLE IF EXISTS ONLY public.cart_shipping_method DROP CONSTRAINT IF EXISTS cart_shipping_method_pkey;
ALTER TABLE IF EXISTS ONLY public.cart_shipping_method_adjustment DROP CONSTRAINT IF EXISTS cart_shipping_method_adjustment_pkey;
ALTER TABLE IF EXISTS ONLY public.cart_promotion DROP CONSTRAINT IF EXISTS cart_promotion_pkey;
ALTER TABLE IF EXISTS ONLY public.cart DROP CONSTRAINT IF EXISTS cart_pkey;
ALTER TABLE IF EXISTS ONLY public.cart_payment_collection DROP CONSTRAINT IF EXISTS cart_payment_collection_pkey;
ALTER TABLE IF EXISTS ONLY public.cart_line_item_tax_line DROP CONSTRAINT IF EXISTS cart_line_item_tax_line_pkey;
ALTER TABLE IF EXISTS ONLY public.cart_line_item DROP CONSTRAINT IF EXISTS cart_line_item_pkey;
ALTER TABLE IF EXISTS ONLY public.cart_line_item_adjustment DROP CONSTRAINT IF EXISTS cart_line_item_adjustment_pkey;
ALTER TABLE IF EXISTS ONLY public.cart_address DROP CONSTRAINT IF EXISTS cart_address_pkey;
ALTER TABLE IF EXISTS ONLY public.capture DROP CONSTRAINT IF EXISTS capture_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_verification DROP CONSTRAINT IF EXISTS auth_verification_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_password_reset_token DROP CONSTRAINT IF EXISTS auth_password_reset_token_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_mfa_recovery_code DROP CONSTRAINT IF EXISTS auth_mfa_recovery_code_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_mfa_factor DROP CONSTRAINT IF EXISTS auth_mfa_factor_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_identity DROP CONSTRAINT IF EXISTS auth_identity_pkey;
ALTER TABLE IF EXISTS ONLY public.application_method_target_rules DROP CONSTRAINT IF EXISTS application_method_target_rules_pkey;
ALTER TABLE IF EXISTS ONLY public.application_method_buy_rules DROP CONSTRAINT IF EXISTS application_method_buy_rules_pkey;
ALTER TABLE IF EXISTS ONLY public.api_key DROP CONSTRAINT IF EXISTS api_key_pkey;
ALTER TABLE IF EXISTS ONLY public.account_holder DROP CONSTRAINT IF EXISTS account_holder_pkey;
ALTER TABLE IF EXISTS public.script_migrations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.return ALTER COLUMN display_id DROP DEFAULT;
ALTER TABLE IF EXISTS public.order_exchange ALTER COLUMN display_id DROP DEFAULT;
ALTER TABLE IF EXISTS public.order_claim ALTER COLUMN display_id DROP DEFAULT;
ALTER TABLE IF EXISTS public.order_change_action ALTER COLUMN ordering DROP DEFAULT;
ALTER TABLE IF EXISTS public."order" ALTER COLUMN display_id DROP DEFAULT;
ALTER TABLE IF EXISTS public.mikro_orm_migrations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.link_module_migrations ALTER COLUMN id DROP DEFAULT;
DROP TABLE IF EXISTS public.workflow_execution;
DROP TABLE IF EXISTS public.view_configuration;
DROP TABLE IF EXISTS public.user_rbac_role;
DROP TABLE IF EXISTS public.user_preference;
DROP TABLE IF EXISTS public."user";
DROP TABLE IF EXISTS public.tax_region;
DROP TABLE IF EXISTS public.tax_rate_rule;
DROP TABLE IF EXISTS public.tax_rate;
DROP TABLE IF EXISTS public.tax_provider;
DROP TABLE IF EXISTS public.store_locale;
DROP TABLE IF EXISTS public.store_currency;
DROP TABLE IF EXISTS public.store;
DROP TABLE IF EXISTS public.stock_location_address;
DROP TABLE IF EXISTS public.stock_location;
DROP TABLE IF EXISTS public.shipping_profile;
DROP TABLE IF EXISTS public.shipping_option_type;
DROP TABLE IF EXISTS public.shipping_option_rule;
DROP TABLE IF EXISTS public.shipping_option_price_set;
DROP TABLE IF EXISTS public.shipping_option;
DROP TABLE IF EXISTS public.service_zone;
DROP TABLE IF EXISTS public.search_postgres_index;
DROP TABLE IF EXISTS public.search_pg_product_v1;
DROP TABLE IF EXISTS public.search_index_version;
DROP TABLE IF EXISTS public.search_index_sync;
DROP TABLE IF EXISTS public.search_index;
DROP SEQUENCE IF EXISTS public.script_migrations_id_seq;
DROP TABLE IF EXISTS public.script_migrations;
DROP TABLE IF EXISTS public.sales_channel_stock_location;
DROP TABLE IF EXISTS public.sales_channel;
DROP TABLE IF EXISTS public.return_reason;
DROP TABLE IF EXISTS public.return_item;
DROP TABLE IF EXISTS public.return_fulfillment;
DROP SEQUENCE IF EXISTS public.return_display_id_seq;
DROP TABLE IF EXISTS public.return;
DROP TABLE IF EXISTS public.reservation_item;
DROP TABLE IF EXISTS public.region_payment_provider;
DROP TABLE IF EXISTS public.region_country;
DROP TABLE IF EXISTS public.region;
DROP TABLE IF EXISTS public.refund_reason;
DROP TABLE IF EXISTS public.refund;
DROP TABLE IF EXISTS public.publishable_api_key_sales_channel;
DROP TABLE IF EXISTS public.provider_identity;
DROP TABLE IF EXISTS public.property_label;
DROP TABLE IF EXISTS public.promotion_rule_value;
DROP TABLE IF EXISTS public.promotion_rule;
DROP TABLE IF EXISTS public.promotion_promotion_rule;
DROP TABLE IF EXISTS public.promotion_campaign_budget_usage;
DROP TABLE IF EXISTS public.promotion_campaign_budget;
DROP TABLE IF EXISTS public.promotion_campaign;
DROP TABLE IF EXISTS public.promotion_application_method;
DROP TABLE IF EXISTS public.promotion;
DROP TABLE IF EXISTS public.product_variant_product_image;
DROP TABLE IF EXISTS public.product_variant_price_set;
DROP TABLE IF EXISTS public.product_variant_option;
DROP TABLE IF EXISTS public.product_variant_inventory_item;
DROP TABLE IF EXISTS public.product_variant;
DROP TABLE IF EXISTS public.product_type;
DROP TABLE IF EXISTS public.product_tags;
DROP TABLE IF EXISTS public.product_tag;
DROP TABLE IF EXISTS public.product_shipping_profile;
DROP TABLE IF EXISTS public.product_sales_channel;
DROP TABLE IF EXISTS public.product_product_option_value;
DROP TABLE IF EXISTS public.product_product_option;
DROP TABLE IF EXISTS public.product_option_value;
DROP TABLE IF EXISTS public.product_option;
DROP TABLE IF EXISTS public.product_collection;
DROP TABLE IF EXISTS public.product_category_product;
DROP TABLE IF EXISTS public.product_category;
DROP TABLE IF EXISTS public.product;
DROP TABLE IF EXISTS public.price_set;
DROP TABLE IF EXISTS public.price_rule;
DROP TABLE IF EXISTS public.price_preference;
DROP TABLE IF EXISTS public.price_list_rule;
DROP TABLE IF EXISTS public.price_list;
DROP TABLE IF EXISTS public.price;
DROP TABLE IF EXISTS public.payment_session;
DROP TABLE IF EXISTS public.payment_provider;
DROP TABLE IF EXISTS public.payment_collection_payment_providers;
DROP TABLE IF EXISTS public.payment_collection;
DROP TABLE IF EXISTS public.payment;
DROP TABLE IF EXISTS public.order_transaction;
DROP TABLE IF EXISTS public.order_summary;
DROP TABLE IF EXISTS public.order_shipping_method_tax_line;
DROP TABLE IF EXISTS public.order_shipping_method_adjustment;
DROP TABLE IF EXISTS public.order_shipping_method;
DROP TABLE IF EXISTS public.order_shipping;
DROP TABLE IF EXISTS public.order_promotion;
DROP TABLE IF EXISTS public.order_payment_collection;
DROP TABLE IF EXISTS public.order_line_item_tax_line;
DROP TABLE IF EXISTS public.order_line_item_adjustment;
DROP TABLE IF EXISTS public.order_line_item;
DROP TABLE IF EXISTS public.order_item;
DROP TABLE IF EXISTS public.order_fulfillment;
DROP TABLE IF EXISTS public.order_exchange_item;
DROP SEQUENCE IF EXISTS public.order_exchange_display_id_seq;
DROP TABLE IF EXISTS public.order_exchange;
DROP SEQUENCE IF EXISTS public.order_display_id_seq;
DROP TABLE IF EXISTS public.order_credit_line;
DROP TABLE IF EXISTS public.order_claim_item_image;
DROP TABLE IF EXISTS public.order_claim_item;
DROP SEQUENCE IF EXISTS public.order_claim_display_id_seq;
DROP TABLE IF EXISTS public.order_claim;
DROP SEQUENCE IF EXISTS public.order_change_action_ordering_seq;
DROP TABLE IF EXISTS public.order_change_action;
DROP TABLE IF EXISTS public.order_change;
DROP TABLE IF EXISTS public.order_cart;
DROP TABLE IF EXISTS public.order_address;
DROP TABLE IF EXISTS public."order";
DROP TABLE IF EXISTS public.notification_provider;
DROP TABLE IF EXISTS public.notification;
DROP SEQUENCE IF EXISTS public.mikro_orm_migrations_id_seq;
DROP TABLE IF EXISTS public.mikro_orm_migrations;
DROP TABLE IF EXISTS public.location_fulfillment_set;
DROP TABLE IF EXISTS public.location_fulfillment_provider;
DROP SEQUENCE IF EXISTS public.link_module_migrations_id_seq;
DROP TABLE IF EXISTS public.link_module_migrations;
DROP TABLE IF EXISTS public.layout_configuration;
DROP TABLE IF EXISTS public.invite_rbac_role;
DROP TABLE IF EXISTS public.invite;
DROP TABLE IF EXISTS public.inventory_level;
DROP TABLE IF EXISTS public.inventory_item;
DROP TABLE IF EXISTS public.image;
DROP TABLE IF EXISTS public.geo_zone;
DROP TABLE IF EXISTS public.fulfillment_set;
DROP TABLE IF EXISTS public.fulfillment_provider;
DROP TABLE IF EXISTS public.fulfillment_label;
DROP TABLE IF EXISTS public.fulfillment_item;
DROP TABLE IF EXISTS public.fulfillment_address;
DROP TABLE IF EXISTS public.fulfillment;
DROP TABLE IF EXISTS public.customer_group_customer;
DROP TABLE IF EXISTS public.customer_group;
DROP TABLE IF EXISTS public.customer_address;
DROP TABLE IF EXISTS public.customer_account_holder;
DROP TABLE IF EXISTS public.customer;
DROP TABLE IF EXISTS public.currency;
DROP TABLE IF EXISTS public.credit_line;
DROP TABLE IF EXISTS public.cart_shipping_method_tax_line;
DROP TABLE IF EXISTS public.cart_shipping_method_adjustment;
DROP TABLE IF EXISTS public.cart_shipping_method;
DROP TABLE IF EXISTS public.cart_promotion;
DROP TABLE IF EXISTS public.cart_payment_collection;
DROP TABLE IF EXISTS public.cart_line_item_tax_line;
DROP TABLE IF EXISTS public.cart_line_item_adjustment;
DROP TABLE IF EXISTS public.cart_line_item;
DROP TABLE IF EXISTS public.cart_address;
DROP TABLE IF EXISTS public.cart;
DROP TABLE IF EXISTS public.capture;
DROP TABLE IF EXISTS public.auth_verification;
DROP TABLE IF EXISTS public.auth_password_reset_token;
DROP TABLE IF EXISTS public.auth_mfa_recovery_code;
DROP TABLE IF EXISTS public.auth_mfa_factor;
DROP TABLE IF EXISTS public.auth_identity;
DROP TABLE IF EXISTS public.application_method_target_rules;
DROP TABLE IF EXISTS public.application_method_buy_rules;
DROP TABLE IF EXISTS public.api_key;
DROP TABLE IF EXISTS public.account_holder;
DROP TEXT SEARCH CONFIGURATION IF EXISTS public.medusa_search_english;
DROP TYPE IF EXISTS public.return_status_enum;
DROP TYPE IF EXISTS public.order_status_enum;
DROP TYPE IF EXISTS public.order_claim_type_enum;
DROP TYPE IF EXISTS public.claim_reason_enum;
DROP EXTENSION IF EXISTS unaccent;
DROP EXTENSION IF EXISTS pg_trgm;
--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


--
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


--
-- Name: claim_reason_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.claim_reason_enum AS ENUM (
    'missing_item',
    'wrong_item',
    'production_failure',
    'other'
);


ALTER TYPE public.claim_reason_enum OWNER TO postgres;

--
-- Name: order_claim_type_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.order_claim_type_enum AS ENUM (
    'refund',
    'replace'
);


ALTER TYPE public.order_claim_type_enum OWNER TO postgres;

--
-- Name: order_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.order_status_enum AS ENUM (
    'pending',
    'completed',
    'draft',
    'archived',
    'canceled',
    'requires_action'
);


ALTER TYPE public.order_status_enum OWNER TO postgres;

--
-- Name: return_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.return_status_enum AS ENUM (
    'open',
    'requested',
    'received',
    'partially_received',
    'canceled'
);


ALTER TYPE public.return_status_enum OWNER TO postgres;

--
-- Name: medusa_search_english; Type: TEXT SEARCH CONFIGURATION; Schema: public; Owner: postgres
--

CREATE TEXT SEARCH CONFIGURATION public.medusa_search_english (
    PARSER = pg_catalog."default" );

ALTER TEXT SEARCH CONFIGURATION public.medusa_search_english
    ADD MAPPING FOR asciiword WITH english_stem;

ALTER TEXT SEARCH CONFIGURATION public.medusa_search_english
    ADD MAPPING FOR word WITH public.unaccent, english_stem;

ALTER TEXT SEARCH CONFIGURATION public.medusa_search_english
    ADD MAPPING FOR numword WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.medusa_search_english
    ADD MAPPING FOR email WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.medusa_search_english
    ADD MAPPING FOR url WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.medusa_search_english
    ADD MAPPING FOR host WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.medusa_search_english
    ADD MAPPING FOR sfloat WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.medusa_search_english
    ADD MAPPING FOR version WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.medusa_search_english
    ADD MAPPING FOR hword_numpart WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.medusa_search_english
    ADD MAPPING FOR hword_part WITH public.unaccent, english_stem;

ALTER TEXT SEARCH CONFIGURATION public.medusa_search_english
    ADD MAPPING FOR hword_asciipart WITH english_stem;

ALTER TEXT SEARCH CONFIGURATION public.medusa_search_english
    ADD MAPPING FOR numhword WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.medusa_search_english
    ADD MAPPING FOR asciihword WITH english_stem;

ALTER TEXT SEARCH CONFIGURATION public.medusa_search_english
    ADD MAPPING FOR hword WITH public.unaccent, english_stem;

ALTER TEXT SEARCH CONFIGURATION public.medusa_search_english
    ADD MAPPING FOR url_path WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.medusa_search_english
    ADD MAPPING FOR file WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.medusa_search_english
    ADD MAPPING FOR "float" WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.medusa_search_english
    ADD MAPPING FOR "int" WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.medusa_search_english
    ADD MAPPING FOR uint WITH simple;


ALTER TEXT SEARCH CONFIGURATION public.medusa_search_english OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: account_holder; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_holder (
    id text NOT NULL,
    provider_id text NOT NULL,
    external_id text NOT NULL,
    email text,
    data jsonb DEFAULT '{}'::jsonb NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.account_holder OWNER TO postgres;

--
-- Name: api_key; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_key (
    id text NOT NULL,
    token text NOT NULL,
    salt text NOT NULL,
    redacted text NOT NULL,
    title text NOT NULL,
    type text NOT NULL,
    last_used_at timestamp with time zone,
    created_by text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    revoked_by text,
    revoked_at timestamp with time zone,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    CONSTRAINT api_key_type_check CHECK ((type = ANY (ARRAY['publishable'::text, 'secret'::text])))
);


ALTER TABLE public.api_key OWNER TO postgres;

--
-- Name: application_method_buy_rules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.application_method_buy_rules (
    application_method_id text NOT NULL,
    promotion_rule_id text NOT NULL
);


ALTER TABLE public.application_method_buy_rules OWNER TO postgres;

--
-- Name: application_method_target_rules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.application_method_target_rules (
    application_method_id text NOT NULL,
    promotion_rule_id text NOT NULL
);


ALTER TABLE public.application_method_target_rules OWNER TO postgres;

--
-- Name: auth_identity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_identity (
    id text NOT NULL,
    app_metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.auth_identity OWNER TO postgres;

--
-- Name: auth_mfa_factor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_mfa_factor (
    id text NOT NULL,
    auth_identity_id text NOT NULL,
    provider text NOT NULL,
    status text NOT NULL,
    provider_metadata jsonb,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.auth_mfa_factor OWNER TO postgres;

--
-- Name: auth_mfa_recovery_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_mfa_recovery_code (
    id text NOT NULL,
    auth_identity_id text NOT NULL,
    code_hash text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.auth_mfa_recovery_code OWNER TO postgres;

--
-- Name: auth_password_reset_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_password_reset_token (
    id text NOT NULL,
    auth_identity_id text NOT NULL,
    provider_identity_id text NOT NULL,
    entity_id text NOT NULL,
    token_hash text NOT NULL,
    expires_at timestamp with time zone NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.auth_password_reset_token OWNER TO postgres;

--
-- Name: auth_verification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_verification (
    id text NOT NULL,
    auth_identity_id text NOT NULL,
    entity_id text NOT NULL,
    entity_type text NOT NULL,
    code_provider text NOT NULL,
    verified_at timestamp with time zone,
    requested_at timestamp with time zone NOT NULL,
    provider_metadata jsonb,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.auth_verification OWNER TO postgres;

--
-- Name: capture; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.capture (
    id text NOT NULL,
    amount numeric NOT NULL,
    raw_amount jsonb NOT NULL,
    payment_id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    created_by text,
    metadata jsonb
);


ALTER TABLE public.capture OWNER TO postgres;

--
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    id text NOT NULL,
    region_id text,
    customer_id text,
    sales_channel_id text,
    email text,
    currency_code text NOT NULL,
    shipping_address_id text,
    billing_address_id text,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    completed_at timestamp with time zone,
    locale text
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- Name: cart_address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_address (
    id text NOT NULL,
    customer_id text,
    company text,
    first_name text,
    last_name text,
    address_1 text,
    address_2 text,
    city text,
    country_code text,
    province text,
    postal_code text,
    phone text,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.cart_address OWNER TO postgres;

--
-- Name: cart_line_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_line_item (
    id text NOT NULL,
    cart_id text NOT NULL,
    title text NOT NULL,
    subtitle text,
    thumbnail text,
    quantity integer NOT NULL,
    variant_id text,
    product_id text,
    product_title text,
    product_description text,
    product_subtitle text,
    product_type text,
    product_collection text,
    product_handle text,
    variant_sku text,
    variant_barcode text,
    variant_title text,
    variant_option_values jsonb,
    requires_shipping boolean DEFAULT true NOT NULL,
    is_discountable boolean DEFAULT true NOT NULL,
    is_tax_inclusive boolean DEFAULT false NOT NULL,
    compare_at_unit_price numeric,
    raw_compare_at_unit_price jsonb,
    unit_price numeric NOT NULL,
    raw_unit_price jsonb NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    product_type_id text,
    is_custom_price boolean DEFAULT false NOT NULL,
    is_giftcard boolean DEFAULT false NOT NULL,
    CONSTRAINT cart_line_item_unit_price_check CHECK ((unit_price >= (0)::numeric))
);


ALTER TABLE public.cart_line_item OWNER TO postgres;

--
-- Name: cart_line_item_adjustment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_line_item_adjustment (
    id text NOT NULL,
    description text,
    promotion_id text,
    code text,
    amount numeric NOT NULL,
    raw_amount jsonb NOT NULL,
    provider_id text,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    item_id text,
    is_tax_inclusive boolean DEFAULT false NOT NULL,
    CONSTRAINT cart_line_item_adjustment_check CHECK ((amount >= (0)::numeric))
);


ALTER TABLE public.cart_line_item_adjustment OWNER TO postgres;

--
-- Name: cart_line_item_tax_line; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_line_item_tax_line (
    id text NOT NULL,
    description text,
    tax_rate_id text,
    code text NOT NULL,
    rate real NOT NULL,
    provider_id text,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    item_id text,
    data jsonb
);


ALTER TABLE public.cart_line_item_tax_line OWNER TO postgres;

--
-- Name: cart_payment_collection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_payment_collection (
    cart_id character varying(255) NOT NULL,
    payment_collection_id character varying(255) NOT NULL,
    id character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.cart_payment_collection OWNER TO postgres;

--
-- Name: cart_promotion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_promotion (
    cart_id character varying(255) NOT NULL,
    promotion_id character varying(255) NOT NULL,
    id character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.cart_promotion OWNER TO postgres;

--
-- Name: cart_shipping_method; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_shipping_method (
    id text NOT NULL,
    cart_id text NOT NULL,
    name text NOT NULL,
    description jsonb,
    amount numeric NOT NULL,
    raw_amount jsonb NOT NULL,
    is_tax_inclusive boolean DEFAULT false NOT NULL,
    shipping_option_id text,
    data jsonb,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    CONSTRAINT cart_shipping_method_check CHECK ((amount >= (0)::numeric))
);


ALTER TABLE public.cart_shipping_method OWNER TO postgres;

--
-- Name: cart_shipping_method_adjustment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_shipping_method_adjustment (
    id text NOT NULL,
    description text,
    promotion_id text,
    code text,
    amount numeric NOT NULL,
    raw_amount jsonb NOT NULL,
    provider_id text,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    shipping_method_id text
);


ALTER TABLE public.cart_shipping_method_adjustment OWNER TO postgres;

--
-- Name: cart_shipping_method_tax_line; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_shipping_method_tax_line (
    id text NOT NULL,
    description text,
    tax_rate_id text,
    code text NOT NULL,
    rate real NOT NULL,
    provider_id text,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    shipping_method_id text,
    data jsonb
);


ALTER TABLE public.cart_shipping_method_tax_line OWNER TO postgres;

--
-- Name: credit_line; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.credit_line (
    id text NOT NULL,
    cart_id text NOT NULL,
    reference text,
    reference_id text,
    amount numeric NOT NULL,
    raw_amount jsonb NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.credit_line OWNER TO postgres;

--
-- Name: currency; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.currency (
    code text NOT NULL,
    symbol text NOT NULL,
    symbol_native text NOT NULL,
    decimal_digits integer DEFAULT 0 NOT NULL,
    rounding numeric DEFAULT 0 NOT NULL,
    raw_rounding jsonb NOT NULL,
    name text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.currency OWNER TO postgres;

--
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    id text NOT NULL,
    company_name text,
    first_name text,
    last_name text,
    email text,
    phone text,
    has_account boolean DEFAULT false NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    created_by text
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- Name: customer_account_holder; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_account_holder (
    customer_id character varying(255) NOT NULL,
    account_holder_id character varying(255) NOT NULL,
    id character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.customer_account_holder OWNER TO postgres;

--
-- Name: customer_address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_address (
    id text NOT NULL,
    customer_id text NOT NULL,
    address_name text,
    is_default_shipping boolean DEFAULT false NOT NULL,
    is_default_billing boolean DEFAULT false NOT NULL,
    company text,
    first_name text,
    last_name text,
    address_1 text,
    address_2 text,
    city text,
    country_code text,
    province text,
    postal_code text,
    phone text,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.customer_address OWNER TO postgres;

--
-- Name: customer_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_group (
    id text NOT NULL,
    name text NOT NULL,
    metadata jsonb,
    created_by text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.customer_group OWNER TO postgres;

--
-- Name: customer_group_customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_group_customer (
    id text NOT NULL,
    customer_id text NOT NULL,
    customer_group_id text NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by text,
    deleted_at timestamp with time zone
);


ALTER TABLE public.customer_group_customer OWNER TO postgres;

--
-- Name: fulfillment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fulfillment (
    id text NOT NULL,
    location_id text NOT NULL,
    packed_at timestamp with time zone,
    shipped_at timestamp with time zone,
    delivered_at timestamp with time zone,
    canceled_at timestamp with time zone,
    data jsonb,
    provider_id text,
    shipping_option_id text,
    metadata jsonb,
    delivery_address_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    marked_shipped_by text,
    created_by text,
    requires_shipping boolean DEFAULT true NOT NULL
);


ALTER TABLE public.fulfillment OWNER TO postgres;

--
-- Name: fulfillment_address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fulfillment_address (
    id text NOT NULL,
    company text,
    first_name text,
    last_name text,
    address_1 text,
    address_2 text,
    city text,
    country_code text,
    province text,
    postal_code text,
    phone text,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.fulfillment_address OWNER TO postgres;

--
-- Name: fulfillment_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fulfillment_item (
    id text NOT NULL,
    title text NOT NULL,
    sku text NOT NULL,
    barcode text NOT NULL,
    quantity numeric NOT NULL,
    raw_quantity jsonb NOT NULL,
    line_item_id text,
    inventory_item_id text,
    fulfillment_id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.fulfillment_item OWNER TO postgres;

--
-- Name: fulfillment_label; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fulfillment_label (
    id text NOT NULL,
    tracking_number text NOT NULL,
    tracking_url text NOT NULL,
    label_url text NOT NULL,
    fulfillment_id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.fulfillment_label OWNER TO postgres;

--
-- Name: fulfillment_provider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fulfillment_provider (
    id text NOT NULL,
    is_enabled boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.fulfillment_provider OWNER TO postgres;

--
-- Name: fulfillment_set; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fulfillment_set (
    id text NOT NULL,
    name text NOT NULL,
    type text NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.fulfillment_set OWNER TO postgres;

--
-- Name: geo_zone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.geo_zone (
    id text NOT NULL,
    type text DEFAULT 'country'::text NOT NULL,
    country_code text NOT NULL,
    province_code text,
    city text,
    service_zone_id text NOT NULL,
    postal_expression jsonb,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    CONSTRAINT geo_zone_type_check CHECK ((type = ANY (ARRAY['country'::text, 'province'::text, 'city'::text, 'zip'::text])))
);


ALTER TABLE public.geo_zone OWNER TO postgres;

--
-- Name: image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.image (
    id text NOT NULL,
    url text NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    rank integer DEFAULT 0 NOT NULL,
    product_id text NOT NULL
);


ALTER TABLE public.image OWNER TO postgres;

--
-- Name: inventory_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory_item (
    id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    sku text,
    origin_country text,
    hs_code text,
    mid_code text,
    material text,
    weight integer,
    length integer,
    height integer,
    width integer,
    requires_shipping boolean DEFAULT true NOT NULL,
    description text,
    title text,
    thumbnail text,
    metadata jsonb,
    unit_of_measure text
);


ALTER TABLE public.inventory_item OWNER TO postgres;

--
-- Name: inventory_level; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory_level (
    id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    inventory_item_id text NOT NULL,
    location_id text NOT NULL,
    stocked_quantity numeric DEFAULT 0 NOT NULL,
    reserved_quantity numeric DEFAULT 0 NOT NULL,
    incoming_quantity numeric DEFAULT 0 NOT NULL,
    metadata jsonb,
    raw_stocked_quantity jsonb,
    raw_reserved_quantity jsonb,
    raw_incoming_quantity jsonb
);


ALTER TABLE public.inventory_level OWNER TO postgres;

--
-- Name: invite; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invite (
    id text NOT NULL,
    email text NOT NULL,
    accepted boolean DEFAULT false NOT NULL,
    token text NOT NULL,
    expires_at timestamp with time zone NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.invite OWNER TO postgres;

--
-- Name: invite_rbac_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invite_rbac_role (
    invite_id character varying(255) NOT NULL,
    rbac_role_id character varying(255) NOT NULL,
    id character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.invite_rbac_role OWNER TO postgres;

--
-- Name: layout_configuration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.layout_configuration (
    id text NOT NULL,
    zone text NOT NULL,
    user_id text,
    is_system_default boolean DEFAULT false NOT NULL,
    configuration jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.layout_configuration OWNER TO postgres;

--
-- Name: link_module_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.link_module_migrations (
    id integer NOT NULL,
    table_name character varying(255) NOT NULL,
    link_descriptor jsonb DEFAULT '{}'::jsonb NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.link_module_migrations OWNER TO postgres;

--
-- Name: link_module_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.link_module_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.link_module_migrations_id_seq OWNER TO postgres;

--
-- Name: link_module_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.link_module_migrations_id_seq OWNED BY public.link_module_migrations.id;


--
-- Name: location_fulfillment_provider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.location_fulfillment_provider (
    stock_location_id character varying(255) NOT NULL,
    fulfillment_provider_id character varying(255) NOT NULL,
    id character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.location_fulfillment_provider OWNER TO postgres;

--
-- Name: location_fulfillment_set; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.location_fulfillment_set (
    stock_location_id character varying(255) NOT NULL,
    fulfillment_set_id character varying(255) NOT NULL,
    id character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.location_fulfillment_set OWNER TO postgres;

--
-- Name: mikro_orm_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mikro_orm_migrations (
    id integer NOT NULL,
    name character varying(255),
    executed_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.mikro_orm_migrations OWNER TO postgres;

--
-- Name: mikro_orm_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mikro_orm_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mikro_orm_migrations_id_seq OWNER TO postgres;

--
-- Name: mikro_orm_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mikro_orm_migrations_id_seq OWNED BY public.mikro_orm_migrations.id;


--
-- Name: notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notification (
    id text NOT NULL,
    "to" text NOT NULL,
    channel text NOT NULL,
    template text,
    data jsonb,
    trigger_type text,
    resource_id text,
    resource_type text,
    receiver_id text,
    original_notification_id text,
    idempotency_key text,
    external_id text,
    provider_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    status text DEFAULT 'pending'::text NOT NULL,
    "from" text,
    provider_data jsonb,
    CONSTRAINT notification_status_check CHECK ((status = ANY (ARRAY['pending'::text, 'success'::text, 'failure'::text])))
);


ALTER TABLE public.notification OWNER TO postgres;

--
-- Name: notification_provider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notification_provider (
    id text NOT NULL,
    handle text NOT NULL,
    name text NOT NULL,
    is_enabled boolean DEFAULT true NOT NULL,
    channels text[] DEFAULT '{}'::text[] NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.notification_provider OWNER TO postgres;

--
-- Name: order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."order" (
    id text NOT NULL,
    region_id text,
    display_id integer,
    customer_id text,
    version integer DEFAULT 1 NOT NULL,
    sales_channel_id text,
    status public.order_status_enum DEFAULT 'pending'::public.order_status_enum NOT NULL,
    is_draft_order boolean DEFAULT false NOT NULL,
    email text,
    currency_code text NOT NULL,
    shipping_address_id text,
    billing_address_id text,
    no_notification boolean,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    canceled_at timestamp with time zone,
    custom_display_id text,
    locale text
);


ALTER TABLE public."order" OWNER TO postgres;

--
-- Name: order_address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_address (
    id text NOT NULL,
    customer_id text,
    company text,
    first_name text,
    last_name text,
    address_1 text,
    address_2 text,
    city text,
    country_code text,
    province text,
    postal_code text,
    phone text,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.order_address OWNER TO postgres;

--
-- Name: order_cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_cart (
    order_id character varying(255) NOT NULL,
    cart_id character varying(255) NOT NULL,
    id character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.order_cart OWNER TO postgres;

--
-- Name: order_change; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_change (
    id text NOT NULL,
    order_id text NOT NULL,
    version integer NOT NULL,
    description text,
    status text DEFAULT 'pending'::text NOT NULL,
    internal_note text,
    created_by text,
    requested_by text,
    requested_at timestamp with time zone,
    confirmed_by text,
    confirmed_at timestamp with time zone,
    declined_by text,
    declined_reason text,
    metadata jsonb,
    declined_at timestamp with time zone,
    canceled_by text,
    canceled_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    change_type text,
    deleted_at timestamp with time zone,
    return_id text,
    claim_id text,
    exchange_id text,
    carry_over_promotions boolean,
    no_notification boolean,
    CONSTRAINT order_change_status_check CHECK ((status = ANY (ARRAY['confirmed'::text, 'declined'::text, 'requested'::text, 'pending'::text, 'canceled'::text])))
);


ALTER TABLE public.order_change OWNER TO postgres;

--
-- Name: order_change_action; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_change_action (
    id text NOT NULL,
    order_id text,
    version integer,
    ordering bigint NOT NULL,
    order_change_id text,
    reference text,
    reference_id text,
    action text NOT NULL,
    details jsonb,
    amount numeric,
    raw_amount jsonb,
    internal_note text,
    applied boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    return_id text,
    claim_id text,
    exchange_id text
);


ALTER TABLE public.order_change_action OWNER TO postgres;

--
-- Name: order_change_action_ordering_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_change_action_ordering_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_change_action_ordering_seq OWNER TO postgres;

--
-- Name: order_change_action_ordering_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_change_action_ordering_seq OWNED BY public.order_change_action.ordering;


--
-- Name: order_claim; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_claim (
    id text NOT NULL,
    order_id text NOT NULL,
    return_id text,
    order_version integer NOT NULL,
    display_id integer NOT NULL,
    type public.order_claim_type_enum NOT NULL,
    no_notification boolean,
    refund_amount numeric,
    raw_refund_amount jsonb,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    canceled_at timestamp with time zone,
    created_by text
);


ALTER TABLE public.order_claim OWNER TO postgres;

--
-- Name: order_claim_display_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_claim_display_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_claim_display_id_seq OWNER TO postgres;

--
-- Name: order_claim_display_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_claim_display_id_seq OWNED BY public.order_claim.display_id;


--
-- Name: order_claim_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_claim_item (
    id text NOT NULL,
    claim_id text NOT NULL,
    item_id text NOT NULL,
    is_additional_item boolean DEFAULT false NOT NULL,
    reason public.claim_reason_enum,
    quantity numeric NOT NULL,
    raw_quantity jsonb NOT NULL,
    note text,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.order_claim_item OWNER TO postgres;

--
-- Name: order_claim_item_image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_claim_item_image (
    id text NOT NULL,
    claim_item_id text NOT NULL,
    url text NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.order_claim_item_image OWNER TO postgres;

--
-- Name: order_credit_line; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_credit_line (
    id text NOT NULL,
    order_id text NOT NULL,
    reference text,
    reference_id text,
    amount numeric NOT NULL,
    raw_amount jsonb NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    version integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.order_credit_line OWNER TO postgres;

--
-- Name: order_display_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_display_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_display_id_seq OWNER TO postgres;

--
-- Name: order_display_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_display_id_seq OWNED BY public."order".display_id;


--
-- Name: order_exchange; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_exchange (
    id text NOT NULL,
    order_id text NOT NULL,
    return_id text,
    order_version integer NOT NULL,
    display_id integer NOT NULL,
    no_notification boolean,
    allow_backorder boolean DEFAULT false NOT NULL,
    difference_due numeric,
    raw_difference_due jsonb,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    canceled_at timestamp with time zone,
    created_by text
);


ALTER TABLE public.order_exchange OWNER TO postgres;

--
-- Name: order_exchange_display_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_exchange_display_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_exchange_display_id_seq OWNER TO postgres;

--
-- Name: order_exchange_display_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_exchange_display_id_seq OWNED BY public.order_exchange.display_id;


--
-- Name: order_exchange_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_exchange_item (
    id text NOT NULL,
    exchange_id text NOT NULL,
    item_id text NOT NULL,
    quantity numeric NOT NULL,
    raw_quantity jsonb NOT NULL,
    note text,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.order_exchange_item OWNER TO postgres;

--
-- Name: order_fulfillment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_fulfillment (
    order_id character varying(255) NOT NULL,
    fulfillment_id character varying(255) NOT NULL,
    id character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.order_fulfillment OWNER TO postgres;

--
-- Name: order_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_item (
    id text NOT NULL,
    order_id text NOT NULL,
    version integer NOT NULL,
    item_id text NOT NULL,
    quantity numeric NOT NULL,
    raw_quantity jsonb NOT NULL,
    fulfilled_quantity numeric NOT NULL,
    raw_fulfilled_quantity jsonb DEFAULT '{"value": "0", "precision": 20}'::jsonb NOT NULL,
    shipped_quantity numeric NOT NULL,
    raw_shipped_quantity jsonb DEFAULT '{"value": "0", "precision": 20}'::jsonb NOT NULL,
    return_requested_quantity numeric NOT NULL,
    raw_return_requested_quantity jsonb DEFAULT '{"value": "0", "precision": 20}'::jsonb NOT NULL,
    return_received_quantity numeric NOT NULL,
    raw_return_received_quantity jsonb DEFAULT '{"value": "0", "precision": 20}'::jsonb NOT NULL,
    return_dismissed_quantity numeric NOT NULL,
    raw_return_dismissed_quantity jsonb DEFAULT '{"value": "0", "precision": 20}'::jsonb NOT NULL,
    written_off_quantity numeric NOT NULL,
    raw_written_off_quantity jsonb DEFAULT '{"value": "0", "precision": 20}'::jsonb NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    delivered_quantity numeric DEFAULT 0 NOT NULL,
    raw_delivered_quantity jsonb DEFAULT '{"value": "0", "precision": 20}'::jsonb NOT NULL,
    unit_price numeric,
    raw_unit_price jsonb,
    compare_at_unit_price numeric,
    raw_compare_at_unit_price jsonb
);


ALTER TABLE public.order_item OWNER TO postgres;

--
-- Name: order_line_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_line_item (
    id text NOT NULL,
    totals_id text,
    title text NOT NULL,
    subtitle text,
    thumbnail text,
    variant_id text,
    product_id text,
    product_title text,
    product_description text,
    product_subtitle text,
    product_type text,
    product_collection text,
    product_handle text,
    variant_sku text,
    variant_barcode text,
    variant_title text,
    variant_option_values jsonb,
    requires_shipping boolean DEFAULT true NOT NULL,
    is_discountable boolean DEFAULT true NOT NULL,
    is_tax_inclusive boolean DEFAULT false NOT NULL,
    compare_at_unit_price numeric,
    raw_compare_at_unit_price jsonb,
    unit_price numeric NOT NULL,
    raw_unit_price jsonb NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    is_custom_price boolean DEFAULT false NOT NULL,
    product_type_id text,
    is_giftcard boolean DEFAULT false NOT NULL
);


ALTER TABLE public.order_line_item OWNER TO postgres;

--
-- Name: order_line_item_adjustment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_line_item_adjustment (
    id text NOT NULL,
    description text,
    promotion_id text,
    code text,
    amount numeric NOT NULL,
    raw_amount jsonb NOT NULL,
    provider_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    item_id text NOT NULL,
    deleted_at timestamp with time zone,
    is_tax_inclusive boolean DEFAULT false NOT NULL,
    version integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.order_line_item_adjustment OWNER TO postgres;

--
-- Name: order_line_item_tax_line; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_line_item_tax_line (
    id text NOT NULL,
    description text,
    tax_rate_id text,
    code text NOT NULL,
    rate numeric NOT NULL,
    raw_rate jsonb NOT NULL,
    provider_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    item_id text NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb,
    data jsonb
);


ALTER TABLE public.order_line_item_tax_line OWNER TO postgres;

--
-- Name: order_payment_collection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_payment_collection (
    order_id character varying(255) NOT NULL,
    payment_collection_id character varying(255) NOT NULL,
    id character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.order_payment_collection OWNER TO postgres;

--
-- Name: order_promotion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_promotion (
    order_id character varying(255) NOT NULL,
    promotion_id character varying(255) NOT NULL,
    id character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.order_promotion OWNER TO postgres;

--
-- Name: order_shipping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_shipping (
    id text NOT NULL,
    order_id text NOT NULL,
    version integer NOT NULL,
    shipping_method_id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    return_id text,
    claim_id text,
    exchange_id text
);


ALTER TABLE public.order_shipping OWNER TO postgres;

--
-- Name: order_shipping_method; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_shipping_method (
    id text NOT NULL,
    name text NOT NULL,
    description jsonb,
    amount numeric NOT NULL,
    raw_amount jsonb NOT NULL,
    is_tax_inclusive boolean DEFAULT false NOT NULL,
    shipping_option_id text,
    data jsonb,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    is_custom_amount boolean DEFAULT false NOT NULL
);


ALTER TABLE public.order_shipping_method OWNER TO postgres;

--
-- Name: order_shipping_method_adjustment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_shipping_method_adjustment (
    id text NOT NULL,
    description text,
    promotion_id text,
    code text,
    amount numeric NOT NULL,
    raw_amount jsonb NOT NULL,
    provider_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    shipping_method_id text NOT NULL,
    deleted_at timestamp with time zone,
    version integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.order_shipping_method_adjustment OWNER TO postgres;

--
-- Name: order_shipping_method_tax_line; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_shipping_method_tax_line (
    id text NOT NULL,
    description text,
    tax_rate_id text,
    code text NOT NULL,
    rate numeric NOT NULL,
    raw_rate jsonb NOT NULL,
    provider_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    shipping_method_id text NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb,
    data jsonb
);


ALTER TABLE public.order_shipping_method_tax_line OWNER TO postgres;

--
-- Name: order_summary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_summary (
    id text NOT NULL,
    order_id text NOT NULL,
    version integer DEFAULT 1 NOT NULL,
    totals jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.order_summary OWNER TO postgres;

--
-- Name: order_transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_transaction (
    id text NOT NULL,
    order_id text NOT NULL,
    version integer DEFAULT 1 NOT NULL,
    amount numeric NOT NULL,
    raw_amount jsonb NOT NULL,
    currency_code text NOT NULL,
    reference text,
    reference_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    return_id text,
    claim_id text,
    exchange_id text
);


ALTER TABLE public.order_transaction OWNER TO postgres;

--
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
    id text NOT NULL,
    amount numeric NOT NULL,
    raw_amount jsonb NOT NULL,
    currency_code text NOT NULL,
    provider_id text NOT NULL,
    data jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    captured_at timestamp with time zone,
    canceled_at timestamp with time zone,
    payment_collection_id text NOT NULL,
    payment_session_id text NOT NULL,
    metadata jsonb
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- Name: payment_collection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_collection (
    id text NOT NULL,
    currency_code text NOT NULL,
    amount numeric NOT NULL,
    raw_amount jsonb NOT NULL,
    authorized_amount numeric,
    raw_authorized_amount jsonb,
    captured_amount numeric,
    raw_captured_amount jsonb,
    refunded_amount numeric,
    raw_refunded_amount jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    completed_at timestamp with time zone,
    status text DEFAULT 'not_paid'::text NOT NULL,
    metadata jsonb,
    CONSTRAINT payment_collection_status_check CHECK ((status = ANY (ARRAY['not_paid'::text, 'awaiting'::text, 'authorized'::text, 'partially_authorized'::text, 'canceled'::text, 'failed'::text, 'partially_captured'::text, 'completed'::text])))
);


ALTER TABLE public.payment_collection OWNER TO postgres;

--
-- Name: payment_collection_payment_providers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_collection_payment_providers (
    payment_collection_id text NOT NULL,
    payment_provider_id text NOT NULL
);


ALTER TABLE public.payment_collection_payment_providers OWNER TO postgres;

--
-- Name: payment_provider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_provider (
    id text NOT NULL,
    is_enabled boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.payment_provider OWNER TO postgres;

--
-- Name: payment_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_session (
    id text NOT NULL,
    currency_code text NOT NULL,
    amount numeric NOT NULL,
    raw_amount jsonb NOT NULL,
    provider_id text NOT NULL,
    data jsonb DEFAULT '{}'::jsonb NOT NULL,
    context jsonb,
    status text DEFAULT 'pending'::text NOT NULL,
    authorized_at timestamp with time zone,
    payment_collection_id text NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    CONSTRAINT payment_session_status_check CHECK ((status = ANY (ARRAY['authorized'::text, 'captured'::text, 'pending'::text, 'requires_more'::text, 'error'::text, 'canceled'::text, 'pending_authorization'::text])))
);


ALTER TABLE public.payment_session OWNER TO postgres;

--
-- Name: price; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.price (
    id text NOT NULL,
    title text,
    price_set_id text NOT NULL,
    currency_code text NOT NULL,
    raw_amount jsonb NOT NULL,
    rules_count integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    price_list_id text,
    amount numeric NOT NULL,
    min_quantity numeric,
    max_quantity numeric,
    raw_min_quantity jsonb,
    raw_max_quantity jsonb
);


ALTER TABLE public.price OWNER TO postgres;

--
-- Name: price_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.price_list (
    id text NOT NULL,
    status text DEFAULT 'draft'::text NOT NULL,
    starts_at timestamp with time zone,
    ends_at timestamp with time zone,
    rules_count integer DEFAULT 0,
    title text NOT NULL,
    description text NOT NULL,
    type text DEFAULT 'sale'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb,
    CONSTRAINT price_list_status_check CHECK ((status = ANY (ARRAY['active'::text, 'draft'::text]))),
    CONSTRAINT price_list_type_check CHECK ((type = ANY (ARRAY['sale'::text, 'override'::text])))
);


ALTER TABLE public.price_list OWNER TO postgres;

--
-- Name: price_list_rule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.price_list_rule (
    id text NOT NULL,
    price_list_id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    value jsonb,
    attribute text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.price_list_rule OWNER TO postgres;

--
-- Name: price_preference; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.price_preference (
    id text NOT NULL,
    attribute text NOT NULL,
    value text,
    is_tax_inclusive boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.price_preference OWNER TO postgres;

--
-- Name: price_rule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.price_rule (
    id text NOT NULL,
    value text NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    price_id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    attribute text DEFAULT ''::text NOT NULL,
    operator text DEFAULT 'eq'::text NOT NULL,
    CONSTRAINT price_rule_operator_check CHECK ((operator = ANY (ARRAY['gte'::text, 'lte'::text, 'gt'::text, 'lt'::text, 'eq'::text])))
);


ALTER TABLE public.price_rule OWNER TO postgres;

--
-- Name: price_set; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.price_set (
    id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.price_set OWNER TO postgres;

--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id text NOT NULL,
    title text NOT NULL,
    handle text NOT NULL,
    subtitle text,
    description text,
    is_giftcard boolean DEFAULT false NOT NULL,
    status text DEFAULT 'draft'::text NOT NULL,
    thumbnail text,
    weight real,
    length real,
    height real,
    width real,
    origin_country text,
    hs_code text,
    mid_code text,
    material text,
    collection_id text,
    type_id text,
    discountable boolean DEFAULT true NOT NULL,
    external_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb,
    CONSTRAINT product_status_check CHECK ((status = ANY (ARRAY['draft'::text, 'proposed'::text, 'published'::text, 'rejected'::text])))
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: product_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_category (
    id text NOT NULL,
    name text NOT NULL,
    description text DEFAULT ''::text NOT NULL,
    handle text NOT NULL,
    mpath text NOT NULL,
    is_active boolean DEFAULT false NOT NULL,
    is_internal boolean DEFAULT false NOT NULL,
    rank integer DEFAULT 0 NOT NULL,
    parent_category_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb,
    external_id text
);


ALTER TABLE public.product_category OWNER TO postgres;

--
-- Name: product_category_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_category_product (
    product_id text NOT NULL,
    product_category_id text NOT NULL
);


ALTER TABLE public.product_category_product OWNER TO postgres;

--
-- Name: product_collection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_collection (
    id text NOT NULL,
    title text NOT NULL,
    handle text NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    external_id text
);


ALTER TABLE public.product_collection OWNER TO postgres;

--
-- Name: product_option; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_option (
    id text NOT NULL,
    title text NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    is_exclusive boolean DEFAULT false NOT NULL
);


ALTER TABLE public.product_option OWNER TO postgres;

--
-- Name: product_option_value; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_option_value (
    id text NOT NULL,
    value text NOT NULL,
    option_id text,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    rank integer
);


ALTER TABLE public.product_option_value OWNER TO postgres;

--
-- Name: product_product_option; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_product_option (
    id text NOT NULL,
    product_id text NOT NULL,
    product_option_id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.product_product_option OWNER TO postgres;

--
-- Name: product_product_option_value; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_product_option_value (
    id text NOT NULL,
    product_product_option_id text NOT NULL,
    product_option_value_id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.product_product_option_value OWNER TO postgres;

--
-- Name: product_sales_channel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_sales_channel (
    product_id character varying(255) NOT NULL,
    sales_channel_id character varying(255) NOT NULL,
    id character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.product_sales_channel OWNER TO postgres;

--
-- Name: product_shipping_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_shipping_profile (
    product_id character varying(255) NOT NULL,
    shipping_profile_id character varying(255) NOT NULL,
    id character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.product_shipping_profile OWNER TO postgres;

--
-- Name: product_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_tag (
    id text NOT NULL,
    value text NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    external_id text
);


ALTER TABLE public.product_tag OWNER TO postgres;

--
-- Name: product_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_tags (
    product_id text NOT NULL,
    product_tag_id text NOT NULL
);


ALTER TABLE public.product_tags OWNER TO postgres;

--
-- Name: product_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_type (
    id text NOT NULL,
    value text NOT NULL,
    metadata json,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    external_id text
);


ALTER TABLE public.product_type OWNER TO postgres;

--
-- Name: product_variant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_variant (
    id text NOT NULL,
    title text NOT NULL,
    sku text,
    barcode text,
    ean text,
    upc text,
    allow_backorder boolean DEFAULT false NOT NULL,
    manage_inventory boolean DEFAULT true NOT NULL,
    hs_code text,
    origin_country text,
    mid_code text,
    material text,
    weight real,
    length real,
    height real,
    width real,
    metadata jsonb,
    variant_rank integer DEFAULT 0,
    product_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    thumbnail text
);


ALTER TABLE public.product_variant OWNER TO postgres;

--
-- Name: product_variant_inventory_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_variant_inventory_item (
    variant_id character varying(255) NOT NULL,
    inventory_item_id character varying(255) NOT NULL,
    id character varying(255) NOT NULL,
    required_quantity numeric DEFAULT 1 NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.product_variant_inventory_item OWNER TO postgres;

--
-- Name: product_variant_option; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_variant_option (
    variant_id text NOT NULL,
    option_value_id text NOT NULL
);


ALTER TABLE public.product_variant_option OWNER TO postgres;

--
-- Name: product_variant_price_set; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_variant_price_set (
    variant_id character varying(255) NOT NULL,
    price_set_id character varying(255) NOT NULL,
    id character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.product_variant_price_set OWNER TO postgres;

--
-- Name: product_variant_product_image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_variant_product_image (
    id text NOT NULL,
    variant_id text NOT NULL,
    image_id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.product_variant_product_image OWNER TO postgres;

--
-- Name: promotion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promotion (
    id text NOT NULL,
    code text NOT NULL,
    campaign_id text,
    is_automatic boolean DEFAULT false NOT NULL,
    type text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    status text DEFAULT 'draft'::text NOT NULL,
    is_tax_inclusive boolean DEFAULT false NOT NULL,
    "limit" integer,
    used integer DEFAULT 0 NOT NULL,
    metadata jsonb,
    CONSTRAINT promotion_status_check CHECK ((status = ANY (ARRAY['draft'::text, 'active'::text, 'inactive'::text]))),
    CONSTRAINT promotion_type_check CHECK ((type = ANY (ARRAY['standard'::text, 'buyget'::text])))
);


ALTER TABLE public.promotion OWNER TO postgres;

--
-- Name: promotion_application_method; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promotion_application_method (
    id text NOT NULL,
    value numeric,
    raw_value jsonb,
    max_quantity integer,
    apply_to_quantity integer,
    buy_rules_min_quantity integer,
    type text NOT NULL,
    target_type text NOT NULL,
    allocation text,
    promotion_id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    currency_code text,
    CONSTRAINT promotion_application_method_allocation_check CHECK ((allocation = ANY (ARRAY['each'::text, 'across'::text, 'once'::text]))),
    CONSTRAINT promotion_application_method_target_type_check CHECK ((target_type = ANY (ARRAY['order'::text, 'shipping_methods'::text, 'items'::text]))),
    CONSTRAINT promotion_application_method_type_check CHECK ((type = ANY (ARRAY['fixed'::text, 'percentage'::text])))
);


ALTER TABLE public.promotion_application_method OWNER TO postgres;

--
-- Name: promotion_campaign; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promotion_campaign (
    id text NOT NULL,
    name text NOT NULL,
    description text,
    campaign_identifier text NOT NULL,
    starts_at timestamp with time zone,
    ends_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.promotion_campaign OWNER TO postgres;

--
-- Name: promotion_campaign_budget; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promotion_campaign_budget (
    id text NOT NULL,
    type text NOT NULL,
    campaign_id text NOT NULL,
    "limit" numeric,
    raw_limit jsonb,
    used numeric DEFAULT 0 NOT NULL,
    raw_used jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    currency_code text,
    attribute text,
    CONSTRAINT promotion_campaign_budget_type_check CHECK ((type = ANY (ARRAY['spend'::text, 'usage'::text, 'use_by_attribute'::text, 'spend_by_attribute'::text])))
);


ALTER TABLE public.promotion_campaign_budget OWNER TO postgres;

--
-- Name: promotion_campaign_budget_usage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promotion_campaign_budget_usage (
    id text NOT NULL,
    attribute_value text NOT NULL,
    used numeric DEFAULT 0 NOT NULL,
    budget_id text NOT NULL,
    raw_used jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.promotion_campaign_budget_usage OWNER TO postgres;

--
-- Name: promotion_promotion_rule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promotion_promotion_rule (
    promotion_id text NOT NULL,
    promotion_rule_id text NOT NULL
);


ALTER TABLE public.promotion_promotion_rule OWNER TO postgres;

--
-- Name: promotion_rule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promotion_rule (
    id text NOT NULL,
    description text,
    attribute text NOT NULL,
    operator text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    CONSTRAINT promotion_rule_operator_check CHECK ((operator = ANY (ARRAY['gte'::text, 'lte'::text, 'gt'::text, 'lt'::text, 'eq'::text, 'ne'::text, 'in'::text])))
);


ALTER TABLE public.promotion_rule OWNER TO postgres;

--
-- Name: promotion_rule_value; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promotion_rule_value (
    id text NOT NULL,
    promotion_rule_id text NOT NULL,
    value text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.promotion_rule_value OWNER TO postgres;

--
-- Name: property_label; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.property_label (
    id text NOT NULL,
    entity text NOT NULL,
    property text NOT NULL,
    label text NOT NULL,
    description text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.property_label OWNER TO postgres;

--
-- Name: provider_identity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.provider_identity (
    id text NOT NULL,
    entity_id text NOT NULL,
    provider text NOT NULL,
    auth_identity_id text NOT NULL,
    user_metadata jsonb,
    provider_metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.provider_identity OWNER TO postgres;

--
-- Name: publishable_api_key_sales_channel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.publishable_api_key_sales_channel (
    publishable_key_id character varying(255) NOT NULL,
    sales_channel_id character varying(255) NOT NULL,
    id character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.publishable_api_key_sales_channel OWNER TO postgres;

--
-- Name: refund; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refund (
    id text NOT NULL,
    amount numeric NOT NULL,
    raw_amount jsonb NOT NULL,
    payment_id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    created_by text,
    metadata jsonb,
    refund_reason_id text,
    note text,
    status text DEFAULT 'pending'::text NOT NULL,
    idempotency_key text,
    CONSTRAINT refund_status_check CHECK ((status = ANY (ARRAY['pending'::text, 'succeeded'::text, 'failed'::text])))
);


ALTER TABLE public.refund OWNER TO postgres;

--
-- Name: refund_reason; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refund_reason (
    id text NOT NULL,
    label text NOT NULL,
    description text,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    code text NOT NULL
);


ALTER TABLE public.refund_reason OWNER TO postgres;

--
-- Name: region; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.region (
    id text NOT NULL,
    name text NOT NULL,
    currency_code text NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    automatic_taxes boolean DEFAULT true NOT NULL
);


ALTER TABLE public.region OWNER TO postgres;

--
-- Name: region_country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.region_country (
    iso_2 text NOT NULL,
    iso_3 text NOT NULL,
    num_code text NOT NULL,
    name text NOT NULL,
    display_name text NOT NULL,
    region_id text,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.region_country OWNER TO postgres;

--
-- Name: region_payment_provider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.region_payment_provider (
    region_id character varying(255) NOT NULL,
    payment_provider_id character varying(255) NOT NULL,
    id character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.region_payment_provider OWNER TO postgres;

--
-- Name: reservation_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservation_item (
    id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    line_item_id text,
    location_id text NOT NULL,
    quantity numeric NOT NULL,
    external_id text,
    description text,
    created_by text,
    metadata jsonb,
    inventory_item_id text NOT NULL,
    allow_backorder boolean DEFAULT false,
    raw_quantity jsonb
);


ALTER TABLE public.reservation_item OWNER TO postgres;

--
-- Name: return; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.return (
    id text NOT NULL,
    order_id text NOT NULL,
    claim_id text,
    exchange_id text,
    order_version integer NOT NULL,
    display_id integer NOT NULL,
    status public.return_status_enum DEFAULT 'open'::public.return_status_enum NOT NULL,
    no_notification boolean,
    refund_amount numeric,
    raw_refund_amount jsonb,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    received_at timestamp with time zone,
    canceled_at timestamp with time zone,
    location_id text,
    requested_at timestamp with time zone,
    created_by text
);


ALTER TABLE public.return OWNER TO postgres;

--
-- Name: return_display_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.return_display_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.return_display_id_seq OWNER TO postgres;

--
-- Name: return_display_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.return_display_id_seq OWNED BY public.return.display_id;


--
-- Name: return_fulfillment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.return_fulfillment (
    return_id character varying(255) NOT NULL,
    fulfillment_id character varying(255) NOT NULL,
    id character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.return_fulfillment OWNER TO postgres;

--
-- Name: return_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.return_item (
    id text NOT NULL,
    return_id text NOT NULL,
    reason_id text,
    item_id text NOT NULL,
    quantity numeric NOT NULL,
    raw_quantity jsonb NOT NULL,
    received_quantity numeric DEFAULT 0 NOT NULL,
    raw_received_quantity jsonb DEFAULT '{"value": "0", "precision": 20}'::jsonb NOT NULL,
    note text,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    damaged_quantity numeric DEFAULT 0 NOT NULL,
    raw_damaged_quantity jsonb DEFAULT '{"value": "0", "precision": 20}'::jsonb NOT NULL
);


ALTER TABLE public.return_item OWNER TO postgres;

--
-- Name: return_reason; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.return_reason (
    id character varying NOT NULL,
    value character varying NOT NULL,
    label character varying NOT NULL,
    description character varying,
    metadata jsonb,
    parent_return_reason_id character varying,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.return_reason OWNER TO postgres;

--
-- Name: sales_channel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_channel (
    id text NOT NULL,
    name text NOT NULL,
    description text,
    is_disabled boolean DEFAULT false NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.sales_channel OWNER TO postgres;

--
-- Name: sales_channel_stock_location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_channel_stock_location (
    sales_channel_id character varying(255) NOT NULL,
    stock_location_id character varying(255) NOT NULL,
    id character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.sales_channel_stock_location OWNER TO postgres;

--
-- Name: script_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.script_migrations (
    id integer NOT NULL,
    script_name character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    finished_at timestamp with time zone
);


ALTER TABLE public.script_migrations OWNER TO postgres;

--
-- Name: script_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.script_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.script_migrations_id_seq OWNER TO postgres;

--
-- Name: script_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.script_migrations_id_seq OWNED BY public.script_migrations.id;


--
-- Name: search_index; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.search_index (
    id text NOT NULL,
    name text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    active_version integer
);


ALTER TABLE public.search_index OWNER TO postgres;

--
-- Name: search_index_sync; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.search_index_sync (
    id text NOT NULL,
    job_id text,
    status text DEFAULT 'pending'::text NOT NULL,
    filters jsonb,
    last_key text,
    documents_synced integer DEFAULT 0 NOT NULL,
    started_at timestamp with time zone,
    completed_at timestamp with time zone,
    error text,
    search_index_version_id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    resumable boolean DEFAULT true NOT NULL,
    CONSTRAINT search_index_sync_status_check CHECK ((status = ANY (ARRAY['pending'::text, 'processing'::text, 'done'::text, 'failed'::text, 'canceled'::text])))
);


ALTER TABLE public.search_index_sync OWNER TO postgres;

--
-- Name: search_index_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.search_index_version (
    id text NOT NULL,
    version integer NOT NULL,
    provider text NOT NULL,
    physical_name text NOT NULL,
    definition_hash text NOT NULL,
    status text DEFAULT 'pending'::text NOT NULL,
    search_index_id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    CONSTRAINT search_index_version_status_check CHECK ((status = ANY (ARRAY['pending'::text, 'building'::text, 'ready'::text, 'error'::text])))
);


ALTER TABLE public.search_index_version OWNER TO postgres;

--
-- Name: search_pg_product_v1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.search_pg_product_v1 (
    id text NOT NULL,
    document jsonb NOT NULL,
    indexed jsonb DEFAULT '{}'::jsonb NOT NULL,
    search_vector tsvector DEFAULT ''::tsvector NOT NULL,
    search_text text DEFAULT ''::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.search_pg_product_v1 OWNER TO postgres;

--
-- Name: search_postgres_index; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.search_postgres_index (
    name text NOT NULL,
    table_name text NOT NULL,
    schema_hash text NOT NULL,
    plan jsonb NOT NULL,
    document_count integer DEFAULT 0 NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.search_postgres_index OWNER TO postgres;

--
-- Name: service_zone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_zone (
    id text NOT NULL,
    name text NOT NULL,
    metadata jsonb,
    fulfillment_set_id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.service_zone OWNER TO postgres;

--
-- Name: shipping_option; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipping_option (
    id text NOT NULL,
    name text NOT NULL,
    price_type text DEFAULT 'flat'::text NOT NULL,
    service_zone_id text NOT NULL,
    shipping_profile_id text,
    provider_id text,
    data jsonb,
    metadata jsonb,
    shipping_option_type_id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    CONSTRAINT shipping_option_price_type_check CHECK ((price_type = ANY (ARRAY['calculated'::text, 'flat'::text])))
);


ALTER TABLE public.shipping_option OWNER TO postgres;

--
-- Name: shipping_option_price_set; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipping_option_price_set (
    shipping_option_id character varying(255) NOT NULL,
    price_set_id character varying(255) NOT NULL,
    id character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.shipping_option_price_set OWNER TO postgres;

--
-- Name: shipping_option_rule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipping_option_rule (
    id text NOT NULL,
    attribute text NOT NULL,
    operator text NOT NULL,
    value jsonb,
    shipping_option_id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    CONSTRAINT shipping_option_rule_operator_check CHECK ((operator = ANY (ARRAY['in'::text, 'eq'::text, 'ne'::text, 'gt'::text, 'gte'::text, 'lt'::text, 'lte'::text, 'nin'::text])))
);


ALTER TABLE public.shipping_option_rule OWNER TO postgres;

--
-- Name: shipping_option_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipping_option_type (
    id text NOT NULL,
    label text NOT NULL,
    description text,
    code text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.shipping_option_type OWNER TO postgres;

--
-- Name: shipping_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipping_profile (
    id text NOT NULL,
    name text NOT NULL,
    type text NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.shipping_profile OWNER TO postgres;

--
-- Name: stock_location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock_location (
    id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    name text NOT NULL,
    address_id text,
    metadata jsonb
);


ALTER TABLE public.stock_location OWNER TO postgres;

--
-- Name: stock_location_address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock_location_address (
    id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    address_1 text NOT NULL,
    address_2 text,
    company text,
    city text,
    country_code text NOT NULL,
    phone text,
    province text,
    postal_code text,
    metadata jsonb
);


ALTER TABLE public.stock_location_address OWNER TO postgres;

--
-- Name: store; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store (
    id text NOT NULL,
    name text DEFAULT 'Medusa Store'::text NOT NULL,
    default_sales_channel_id text,
    default_region_id text,
    default_location_id text,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.store OWNER TO postgres;

--
-- Name: store_currency; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_currency (
    id text NOT NULL,
    currency_code text NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    store_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.store_currency OWNER TO postgres;

--
-- Name: store_locale; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_locale (
    id text NOT NULL,
    locale_code text NOT NULL,
    store_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.store_locale OWNER TO postgres;

--
-- Name: tax_provider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tax_provider (
    id text NOT NULL,
    is_enabled boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.tax_provider OWNER TO postgres;

--
-- Name: tax_rate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tax_rate (
    id text NOT NULL,
    rate real,
    code text NOT NULL,
    name text NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    is_combinable boolean DEFAULT false NOT NULL,
    tax_region_id text NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by text,
    deleted_at timestamp with time zone
);


ALTER TABLE public.tax_rate OWNER TO postgres;

--
-- Name: tax_rate_rule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tax_rate_rule (
    id text NOT NULL,
    tax_rate_id text NOT NULL,
    reference_id text NOT NULL,
    reference text NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by text,
    deleted_at timestamp with time zone
);


ALTER TABLE public.tax_rate_rule OWNER TO postgres;

--
-- Name: tax_region; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tax_region (
    id text NOT NULL,
    provider_id text,
    country_code text NOT NULL,
    province_code text,
    parent_id text,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by text,
    deleted_at timestamp with time zone,
    CONSTRAINT "CK_tax_region_country_top_level" CHECK (((parent_id IS NULL) OR (province_code IS NOT NULL))),
    CONSTRAINT "CK_tax_region_provider_top_level" CHECK (((parent_id IS NULL) OR (provider_id IS NULL)))
);


ALTER TABLE public.tax_region OWNER TO postgres;

--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id text NOT NULL,
    first_name text,
    last_name text,
    email text NOT NULL,
    avatar_url text,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_preference; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_preference (
    id text NOT NULL,
    user_id text NOT NULL,
    key text NOT NULL,
    value jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.user_preference OWNER TO postgres;

--
-- Name: user_rbac_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_rbac_role (
    user_id character varying(255) NOT NULL,
    rbac_role_id character varying(255) NOT NULL,
    id character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.user_rbac_role OWNER TO postgres;

--
-- Name: view_configuration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.view_configuration (
    id text NOT NULL,
    entity text NOT NULL,
    name text,
    user_id text,
    is_system_default boolean DEFAULT false NOT NULL,
    configuration jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.view_configuration OWNER TO postgres;

--
-- Name: workflow_execution; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.workflow_execution (
    id character varying NOT NULL,
    workflow_id character varying NOT NULL,
    transaction_id character varying NOT NULL,
    execution jsonb,
    context jsonb,
    state character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    deleted_at timestamp without time zone,
    retention_time integer,
    run_id text DEFAULT '01M6Q02P1WEZ29GVWT8ET6H14V'::text NOT NULL
);


ALTER TABLE public.workflow_execution OWNER TO postgres;

--
-- Name: link_module_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link_module_migrations ALTER COLUMN id SET DEFAULT nextval('public.link_module_migrations_id_seq'::regclass);


--
-- Name: mikro_orm_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mikro_orm_migrations ALTER COLUMN id SET DEFAULT nextval('public.mikro_orm_migrations_id_seq'::regclass);


--
-- Name: order display_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order" ALTER COLUMN display_id SET DEFAULT nextval('public.order_display_id_seq'::regclass);


--
-- Name: order_change_action ordering; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_change_action ALTER COLUMN ordering SET DEFAULT nextval('public.order_change_action_ordering_seq'::regclass);


--
-- Name: order_claim display_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_claim ALTER COLUMN display_id SET DEFAULT nextval('public.order_claim_display_id_seq'::regclass);


--
-- Name: order_exchange display_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_exchange ALTER COLUMN display_id SET DEFAULT nextval('public.order_exchange_display_id_seq'::regclass);


--
-- Name: return display_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.return ALTER COLUMN display_id SET DEFAULT nextval('public.return_display_id_seq'::regclass);


--
-- Name: script_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.script_migrations ALTER COLUMN id SET DEFAULT nextval('public.script_migrations_id_seq'::regclass);


--
-- Data for Name: account_holder; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_holder (id, provider_id, external_id, email, data, metadata, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: api_key; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_key (id, token, salt, redacted, title, type, last_used_at, created_by, created_at, revoked_by, revoked_at, updated_at, deleted_at) FROM stdin;
apk_01M6Q03EJKHPSNQDSM9WH6CQCG	pk_89ef881f192f2ba8c6b88c5ddd7c1375f3e75cdb8d19022573cb47acff358187		pk_89e***187	Default Publishable API Key	publishable	\N		2026-11-05 18:18:31.251-05	\N	\N	2026-11-05 18:18:31.251-05	\N
\.


--
-- Data for Name: application_method_buy_rules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.application_method_buy_rules (application_method_id, promotion_rule_id) FROM stdin;
\.


--
-- Data for Name: application_method_target_rules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.application_method_target_rules (application_method_id, promotion_rule_id) FROM stdin;
\.


--
-- Data for Name: auth_identity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_identity (id, app_metadata, created_at, updated_at, deleted_at) FROM stdin;
authid_01M6Q03T80HKJN1SHTZ3NNX3WT	{"user_id": "user_01M6Q03T33GR0RX8GX764QHYK1"}	2026-11-05 18:18:43.2-05	2026-11-05 18:18:43.218-05	\N
\.


--
-- Data for Name: auth_mfa_factor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_mfa_factor (id, auth_identity_id, provider, status, provider_metadata, metadata, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: auth_mfa_recovery_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_mfa_recovery_code (id, auth_identity_id, code_hash, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: auth_password_reset_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_password_reset_token (id, auth_identity_id, provider_identity_id, entity_id, token_hash, expires_at, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: auth_verification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_verification (id, auth_identity_id, entity_id, entity_type, code_provider, verified_at, requested_at, provider_metadata, metadata, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: capture; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.capture (id, amount, raw_amount, payment_id, created_at, updated_at, deleted_at, created_by, metadata) FROM stdin;
\.


--
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (id, region_id, customer_id, sales_channel_id, email, currency_code, shipping_address_id, billing_address_id, metadata, created_at, updated_at, deleted_at, completed_at, locale) FROM stdin;
cart_01M6RZQSE3B79E2K57C9YY5X3A	reg_01M6Q03EM0ED42M95E5T6K27Z2	\N	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	\N	eur	\N	\N	\N	2026-11-06 12:50:38.021-05	2026-11-06 12:50:38.021-05	\N	\N	\N
cart_01M6RSMC87ZJ9PAZGK9WT21R7R	reg_01M6Q03EM0ED42M95E5T6K27Z2	\N	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	\N	eur	caaddr_01M73JX5FNK5QSF945SSPSQ6AD	\N	\N	2026-11-06 11:03:54.76-05	2026-11-10 15:38:02.009-05	\N	\N	\N
\.


--
-- Data for Name: cart_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_address (id, customer_id, company, first_name, last_name, address_1, address_2, city, country_code, province, postal_code, phone, metadata, created_at, updated_at, deleted_at) FROM stdin;
caaddr_01M73JX5FNK5QSF945SSPSQ6AD	\N	\N	\N	\N	\N	\N	\N	co	\N	\N	\N	\N	2026-11-10 15:38:01.462-05	2026-11-10 15:38:01.462-05	\N
\.


--
-- Data for Name: cart_line_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_line_item (id, cart_id, title, subtitle, thumbnail, quantity, variant_id, product_id, product_title, product_description, product_subtitle, product_type, product_collection, product_handle, variant_sku, variant_barcode, variant_title, variant_option_values, requires_shipping, is_discountable, is_tax_inclusive, compare_at_unit_price, raw_compare_at_unit_price, unit_price, raw_unit_price, metadata, created_at, updated_at, deleted_at, product_type_id, is_custom_price, is_giftcard) FROM stdin;
cali_01M6RSMCJDXM6MAV11J3BMT1ZX	cart_01M6RSMC87ZJ9PAZGK9WT21R7R	Huevos Camperos Orgánicos AA	Al Detal (Unidad)	https://images.unsplash.com/photo-1582722872445-44dc5f7e3c8f?auto=format&fit=crop&w=800&q=80	1	variant_01M6RPEW4SNYFRBEM22F4YPXXM	prod_01M6RPEW08XDN4YM5CJZA5BJ18	Huevos Camperos Orgánicos AA	Huevos frescos de gallinas libres de jaula alimentadas con maíz natural. Disponibles por docena o por caja de 12 panales (360 uds).	\N	\N	\N	huevos-camperos-docena	DETAL-HUEVOS-CAMPEROS-DOCENA	\N	Al Detal (Unidad)	\N	t	t	f	\N	\N	4	{"value": "4", "precision": 20}	{}	2026-11-06 11:03:55.085-05	2026-11-06 11:03:55.085-05	\N	\N	f	f
\.


--
-- Data for Name: cart_line_item_adjustment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_line_item_adjustment (id, description, promotion_id, code, amount, raw_amount, provider_id, metadata, created_at, updated_at, deleted_at, item_id, is_tax_inclusive) FROM stdin;
\.


--
-- Data for Name: cart_line_item_tax_line; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_line_item_tax_line (id, description, tax_rate_id, code, rate, provider_id, metadata, created_at, updated_at, deleted_at, item_id, data) FROM stdin;
\.


--
-- Data for Name: cart_payment_collection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_payment_collection (cart_id, payment_collection_id, id, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: cart_promotion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_promotion (cart_id, promotion_id, id, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: cart_shipping_method; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_shipping_method (id, cart_id, name, description, amount, raw_amount, is_tax_inclusive, shipping_option_id, data, metadata, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: cart_shipping_method_adjustment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_shipping_method_adjustment (id, description, promotion_id, code, amount, raw_amount, provider_id, metadata, created_at, updated_at, deleted_at, shipping_method_id) FROM stdin;
\.


--
-- Data for Name: cart_shipping_method_tax_line; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_shipping_method_tax_line (id, description, tax_rate_id, code, rate, provider_id, metadata, created_at, updated_at, deleted_at, shipping_method_id, data) FROM stdin;
\.


--
-- Data for Name: credit_line; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.credit_line (id, cart_id, reference, reference_id, amount, raw_amount, metadata, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: currency; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.currency (code, symbol, symbol_native, decimal_digits, rounding, raw_rounding, name, created_at, updated_at, deleted_at) FROM stdin;
usd	$	$	2	0	{"value": "0", "precision": 20}	US Dollar	2026-11-05 18:18:11.919-05	2026-11-05 18:18:11.919-05	\N
cad	CA$	$	2	0	{"value": "0", "precision": 20}	Canadian Dollar	2026-11-05 18:18:11.92-05	2026-11-05 18:18:11.92-05	\N
eur	€	€	2	0	{"value": "0", "precision": 20}	Euro	2026-11-05 18:18:11.92-05	2026-11-05 18:18:11.92-05	\N
aed	AED	د.إ.‏	2	0	{"value": "0", "precision": 20}	United Arab Emirates Dirham	2026-11-05 18:18:11.92-05	2026-11-05 18:18:11.92-05	\N
afn	Af	؋	0	0	{"value": "0", "precision": 20}	Afghan Afghani	2026-11-05 18:18:11.92-05	2026-11-05 18:18:11.92-05	\N
all	ALL	Lek	0	0	{"value": "0", "precision": 20}	Albanian Lek	2026-11-05 18:18:11.92-05	2026-11-05 18:18:11.92-05	\N
amd	AMD	դր.	0	0	{"value": "0", "precision": 20}	Armenian Dram	2026-11-05 18:18:11.92-05	2026-11-05 18:18:11.92-05	\N
aoa	AOA	Kz	2	0	{"value": "0", "precision": 20}	Angolan Kwanza	2026-11-05 18:18:11.92-05	2026-11-05 18:18:11.92-05	\N
ars	AR$	$	2	0	{"value": "0", "precision": 20}	Argentine Peso	2026-11-05 18:18:11.92-05	2026-11-05 18:18:11.92-05	\N
aud	AU$	$	2	0	{"value": "0", "precision": 20}	Australian Dollar	2026-11-05 18:18:11.92-05	2026-11-05 18:18:11.92-05	\N
awg	Afl.	Afl.	2	0	{"value": "0", "precision": 20}	Aruban Florin	2026-11-05 18:18:11.92-05	2026-11-05 18:18:11.92-05	\N
azn	man.	ман.	2	0	{"value": "0", "precision": 20}	Azerbaijani Manat	2026-11-05 18:18:11.92-05	2026-11-05 18:18:11.92-05	\N
bam	KM	KM	2	0	{"value": "0", "precision": 20}	Bosnia-Herzegovina Convertible Mark	2026-11-05 18:18:11.92-05	2026-11-05 18:18:11.92-05	\N
bdt	Tk	৳	2	0	{"value": "0", "precision": 20}	Bangladeshi Taka	2026-11-05 18:18:11.92-05	2026-11-05 18:18:11.92-05	\N
bgn	BGN	лв.	2	0	{"value": "0", "precision": 20}	Bulgarian Lev	2026-11-05 18:18:11.92-05	2026-11-05 18:18:11.92-05	\N
bhd	BD	د.ب.‏	3	0	{"value": "0", "precision": 20}	Bahraini Dinar	2026-11-05 18:18:11.92-05	2026-11-05 18:18:11.92-05	\N
bif	FBu	FBu	0	0	{"value": "0", "precision": 20}	Burundian Franc	2026-11-05 18:18:11.92-05	2026-11-05 18:18:11.92-05	\N
bnd	BN$	$	2	0	{"value": "0", "precision": 20}	Brunei Dollar	2026-11-05 18:18:11.92-05	2026-11-05 18:18:11.92-05	\N
bob	Bs	Bs	2	0	{"value": "0", "precision": 20}	Bolivian Boliviano	2026-11-05 18:18:11.92-05	2026-11-05 18:18:11.92-05	\N
brl	R$	R$	2	0	{"value": "0", "precision": 20}	Brazilian Real	2026-11-05 18:18:11.92-05	2026-11-05 18:18:11.92-05	\N
bwp	BWP	P	2	0	{"value": "0", "precision": 20}	Botswanan Pula	2026-11-05 18:18:11.92-05	2026-11-05 18:18:11.92-05	\N
byn	Br	руб.	2	0	{"value": "0", "precision": 20}	Belarusian Ruble	2026-11-05 18:18:11.92-05	2026-11-05 18:18:11.92-05	\N
bzd	BZ$	$	2	0	{"value": "0", "precision": 20}	Belize Dollar	2026-11-05 18:18:11.92-05	2026-11-05 18:18:11.92-05	\N
cdf	CDF	FrCD	2	0	{"value": "0", "precision": 20}	Congolese Franc	2026-11-05 18:18:11.92-05	2026-11-05 18:18:11.92-05	\N
chf	CHF	CHF	2	0.05	{"value": "0.05", "precision": 20}	Swiss Franc	2026-11-05 18:18:11.92-05	2026-11-05 18:18:11.92-05	\N
clp	CL$	$	0	0	{"value": "0", "precision": 20}	Chilean Peso	2026-11-05 18:18:11.92-05	2026-11-05 18:18:11.92-05	\N
cny	CN¥	CN¥	2	0	{"value": "0", "precision": 20}	Chinese Yuan	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
cop	CO$	$	0	0	{"value": "0", "precision": 20}	Colombian Peso	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
crc	₡	₡	0	0	{"value": "0", "precision": 20}	Costa Rican Colón	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
cve	CV$	CV$	2	0	{"value": "0", "precision": 20}	Cape Verdean Escudo	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
czk	Kč	Kč	2	0	{"value": "0", "precision": 20}	Czech Republic Koruna	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
djf	Fdj	Fdj	0	0	{"value": "0", "precision": 20}	Djiboutian Franc	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
dkk	Dkr	kr	2	0	{"value": "0", "precision": 20}	Danish Krone	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
dop	RD$	RD$	2	0	{"value": "0", "precision": 20}	Dominican Peso	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
dzd	DA	د.ج.‏	2	0	{"value": "0", "precision": 20}	Algerian Dinar	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
eek	Ekr	kr	2	0	{"value": "0", "precision": 20}	Estonian Kroon	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
egp	EGP	ج.م.‏	2	0	{"value": "0", "precision": 20}	Egyptian Pound	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
ern	Nfk	Nfk	2	0	{"value": "0", "precision": 20}	Eritrean Nakfa	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
etb	Br	Br	2	0	{"value": "0", "precision": 20}	Ethiopian Birr	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
gbp	£	£	2	0	{"value": "0", "precision": 20}	British Pound Sterling	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
gel	GEL	GEL	2	0	{"value": "0", "precision": 20}	Georgian Lari	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
ghs	GH₵	GH₵	2	0	{"value": "0", "precision": 20}	Ghanaian Cedi	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
gmd	D	D	2	0	{"value": "0", "precision": 20}	Gambian Dalasi	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
gnf	FG	FG	0	0	{"value": "0", "precision": 20}	Guinean Franc	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
gtq	GTQ	Q	2	0	{"value": "0", "precision": 20}	Guatemalan Quetzal	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
hkd	HK$	$	2	0	{"value": "0", "precision": 20}	Hong Kong Dollar	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
hnl	HNL	L	2	0	{"value": "0", "precision": 20}	Honduran Lempira	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
hrk	kn	kn	2	0	{"value": "0", "precision": 20}	Croatian Kuna	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
htg	HTG	G	2	0	{"value": "0", "precision": 20}	Haitian Gourde	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
huf	Ft	Ft	0	0	{"value": "0", "precision": 20}	Hungarian Forint	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
idr	Rp	Rp	0	0	{"value": "0", "precision": 20}	Indonesian Rupiah	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
ils	₪	₪	2	0	{"value": "0", "precision": 20}	Israeli New Sheqel	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
inr	Rs	₹	2	0	{"value": "0", "precision": 20}	Indian Rupee	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
iqd	IQD	د.ع.‏	0	0	{"value": "0", "precision": 20}	Iraqi Dinar	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
irr	IRR	﷼	0	0	{"value": "0", "precision": 20}	Iranian Rial	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
irt	IRT	تومان	0	0	{"value": "0", "precision": 20}	Iranian Toman	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
isk	Ikr	kr	0	0	{"value": "0", "precision": 20}	Icelandic Króna	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
jmd	J$	$	2	0	{"value": "0", "precision": 20}	Jamaican Dollar	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
jod	JD	د.أ.‏	3	0	{"value": "0", "precision": 20}	Jordanian Dinar	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
jpy	¥	￥	0	0	{"value": "0", "precision": 20}	Japanese Yen	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
kes	Ksh	Ksh	2	0	{"value": "0", "precision": 20}	Kenyan Shilling	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
khr	KHR	៛	2	0	{"value": "0", "precision": 20}	Cambodian Riel	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
kmf	CF	FC	0	0	{"value": "0", "precision": 20}	Comorian Franc	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
krw	₩	₩	0	0	{"value": "0", "precision": 20}	South Korean Won	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
kwd	KD	د.ك.‏	3	0	{"value": "0", "precision": 20}	Kuwaiti Dinar	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
kzt	KZT	тңг.	2	0	{"value": "0", "precision": 20}	Kazakhstani Tenge	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
lbp	LB£	ل.ل.‏	0	0	{"value": "0", "precision": 20}	Lebanese Pound	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
lkr	SLRs	SL Re	2	0	{"value": "0", "precision": 20}	Sri Lankan Rupee	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
ltl	Lt	Lt	2	0	{"value": "0", "precision": 20}	Lithuanian Litas	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
lvl	Ls	Ls	2	0	{"value": "0", "precision": 20}	Latvian Lats	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
lyd	LD	د.ل.‏	3	0	{"value": "0", "precision": 20}	Libyan Dinar	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
mad	MAD	د.م.‏	2	0	{"value": "0", "precision": 20}	Moroccan Dirham	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
mdl	MDL	MDL	2	0	{"value": "0", "precision": 20}	Moldovan Leu	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
mga	MGA	MGA	0	0	{"value": "0", "precision": 20}	Malagasy Ariary	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
mkd	MKD	MKD	2	0	{"value": "0", "precision": 20}	Macedonian Denar	2026-11-05 18:18:11.921-05	2026-11-05 18:18:11.921-05	\N
mmk	MMK	K	0	0	{"value": "0", "precision": 20}	Myanma Kyat	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
mnt	MNT	₮	0	0	{"value": "0", "precision": 20}	Mongolian Tugrig	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
mop	MOP$	MOP$	2	0	{"value": "0", "precision": 20}	Macanese Pataca	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
mur	MURs	MURs	0	0	{"value": "0", "precision": 20}	Mauritian Rupee	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
mwk	K	K	2	0	{"value": "0", "precision": 20}	Malawian Kwacha	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
mxn	MX$	$	2	0	{"value": "0", "precision": 20}	Mexican Peso	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
myr	RM	RM	2	0	{"value": "0", "precision": 20}	Malaysian Ringgit	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
mzn	MTn	MTn	2	0	{"value": "0", "precision": 20}	Mozambican Metical	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
nad	N$	N$	2	0	{"value": "0", "precision": 20}	Namibian Dollar	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
ngn	₦	₦	2	0	{"value": "0", "precision": 20}	Nigerian Naira	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
nio	C$	C$	2	0	{"value": "0", "precision": 20}	Nicaraguan Córdoba	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
nok	Nkr	kr	2	0	{"value": "0", "precision": 20}	Norwegian Krone	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
npr	NPRs	नेरू	2	0	{"value": "0", "precision": 20}	Nepalese Rupee	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
nzd	NZ$	$	2	0	{"value": "0", "precision": 20}	New Zealand Dollar	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
omr	OMR	ر.ع.‏	3	0	{"value": "0", "precision": 20}	Omani Rial	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
pab	B/.	B/.	2	0	{"value": "0", "precision": 20}	Panamanian Balboa	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
pen	S/.	S/.	2	0	{"value": "0", "precision": 20}	Peruvian Nuevo Sol	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
php	₱	₱	2	0	{"value": "0", "precision": 20}	Philippine Peso	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
pkr	PKRs	₨	0	0	{"value": "0", "precision": 20}	Pakistani Rupee	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
pln	zł	zł	2	0	{"value": "0", "precision": 20}	Polish Zloty	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
pyg	₲	₲	0	0	{"value": "0", "precision": 20}	Paraguayan Guarani	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
qar	QR	ر.ق.‏	2	0	{"value": "0", "precision": 20}	Qatari Rial	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
ron	RON	RON	2	0	{"value": "0", "precision": 20}	Romanian Leu	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
rsd	din.	дин.	0	0	{"value": "0", "precision": 20}	Serbian Dinar	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
rub	RUB	₽.	2	0	{"value": "0", "precision": 20}	Russian Ruble	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
rwf	RWF	FR	0	0	{"value": "0", "precision": 20}	Rwandan Franc	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
sar	SR	ر.س.‏	2	0	{"value": "0", "precision": 20}	Saudi Riyal	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
sdg	SDG	SDG	2	0	{"value": "0", "precision": 20}	Sudanese Pound	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
sek	Skr	kr	2	0	{"value": "0", "precision": 20}	Swedish Krona	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
sgd	S$	$	2	0	{"value": "0", "precision": 20}	Singapore Dollar	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
sos	Ssh	Ssh	0	0	{"value": "0", "precision": 20}	Somali Shilling	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
syp	SY£	ل.س.‏	0	0	{"value": "0", "precision": 20}	Syrian Pound	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
thb	฿	฿	2	0	{"value": "0", "precision": 20}	Thai Baht	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
tnd	DT	د.ت.‏	3	0	{"value": "0", "precision": 20}	Tunisian Dinar	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
top	T$	T$	2	0	{"value": "0", "precision": 20}	Tongan Paʻanga	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
tjs	TJS	с.	2	0	{"value": "0", "precision": 20}	Tajikistani Somoni	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
try	₺	₺	2	0	{"value": "0", "precision": 20}	Turkish Lira	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
ttd	TT$	$	2	0	{"value": "0", "precision": 20}	Trinidad and Tobago Dollar	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
twd	NT$	NT$	2	0	{"value": "0", "precision": 20}	New Taiwan Dollar	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
tzs	TSh	TSh	0	0	{"value": "0", "precision": 20}	Tanzanian Shilling	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
uah	₴	₴	2	0	{"value": "0", "precision": 20}	Ukrainian Hryvnia	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
ugx	USh	USh	0	0	{"value": "0", "precision": 20}	Ugandan Shilling	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
uyu	$U	$	2	0	{"value": "0", "precision": 20}	Uruguayan Peso	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
uzs	UZS	UZS	0	0	{"value": "0", "precision": 20}	Uzbekistan Som	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
vef	Bs.F.	Bs.F.	2	0	{"value": "0", "precision": 20}	Venezuelan Bolívar	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
vnd	₫	₫	0	0	{"value": "0", "precision": 20}	Vietnamese Dong	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
xaf	FCFA	FCFA	0	0	{"value": "0", "precision": 20}	CFA Franc BEAC	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
xof	CFA	CFA	0	0	{"value": "0", "precision": 20}	CFA Franc BCEAO	2026-11-05 18:18:11.922-05	2026-11-05 18:18:11.922-05	\N
xpf	₣	₣	0	0	{"value": "0", "precision": 20}	CFP Franc	2026-11-05 18:18:11.923-05	2026-11-05 18:18:11.923-05	\N
yer	YR	ر.ي.‏	0	0	{"value": "0", "precision": 20}	Yemeni Rial	2026-11-05 18:18:11.923-05	2026-11-05 18:18:11.923-05	\N
zar	R	R	2	0	{"value": "0", "precision": 20}	South African Rand	2026-11-05 18:18:11.923-05	2026-11-05 18:18:11.923-05	\N
zmk	ZK	ZK	0	0	{"value": "0", "precision": 20}	Zambian Kwacha	2026-11-05 18:18:11.923-05	2026-11-05 18:18:11.923-05	\N
zwl	ZWL$	ZWL$	0	0	{"value": "0", "precision": 20}	Zimbabwean Dollar	2026-11-05 18:18:11.923-05	2026-11-05 18:18:11.923-05	\N
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (id, company_name, first_name, last_name, email, phone, has_account, metadata, created_at, updated_at, deleted_at, created_by) FROM stdin;
\.


--
-- Data for Name: customer_account_holder; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_account_holder (customer_id, account_holder_id, id, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: customer_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_address (id, customer_id, address_name, is_default_shipping, is_default_billing, company, first_name, last_name, address_1, address_2, city, country_code, province, postal_code, phone, metadata, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: customer_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_group (id, name, metadata, created_by, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: customer_group_customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_group_customer (id, customer_id, customer_group_id, metadata, created_at, updated_at, created_by, deleted_at) FROM stdin;
\.


--
-- Data for Name: fulfillment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fulfillment (id, location_id, packed_at, shipped_at, delivered_at, canceled_at, data, provider_id, shipping_option_id, metadata, delivery_address_id, created_at, updated_at, deleted_at, marked_shipped_by, created_by, requires_shipping) FROM stdin;
\.


--
-- Data for Name: fulfillment_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fulfillment_address (id, company, first_name, last_name, address_1, address_2, city, country_code, province, postal_code, phone, metadata, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: fulfillment_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fulfillment_item (id, title, sku, barcode, quantity, raw_quantity, line_item_id, inventory_item_id, fulfillment_id, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: fulfillment_label; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fulfillment_label (id, tracking_number, tracking_url, label_url, fulfillment_id, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: fulfillment_provider; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fulfillment_provider (id, is_enabled, created_at, updated_at, deleted_at) FROM stdin;
manual_manual	t	2026-11-05 18:18:11.941-05	2026-11-05 18:18:11.941-05	\N
\.


--
-- Data for Name: fulfillment_set; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fulfillment_set (id, name, type, metadata, created_at, updated_at, deleted_at) FROM stdin;
fuset_01M6Q03ENZT5BNBAFGS5C4YKAK	European Warehouse delivery	shipping	\N	2026-11-05 18:18:31.359-05	2026-11-05 18:18:31.359-05	\N
fuset_01M6RV2Z8KMHK4Y8RG8NBYEXG7	Despacho Nacional Colombia	shipping	\N	2026-11-06 11:29:21.555-05	2026-11-06 11:29:21.555-05	\N
\.


--
-- Data for Name: geo_zone; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.geo_zone (id, type, country_code, province_code, city, service_zone_id, postal_expression, metadata, created_at, updated_at, deleted_at) FROM stdin;
fgz_01M6Q03ENX6HEPVSDPFTQJ9X85	country	gb	\N	\N	serzo_01M6Q03ENZ663NJ98X1G15KW77	\N	\N	2026-11-05 18:18:31.359-05	2026-11-05 18:18:31.359-05	\N
fgz_01M6Q03ENYZPG7PM8TMBY4V960	country	de	\N	\N	serzo_01M6Q03ENZ663NJ98X1G15KW77	\N	\N	2026-11-05 18:18:31.36-05	2026-11-05 18:18:31.36-05	\N
fgz_01M6Q03ENYQC2J7GAPB98YFR89	country	dk	\N	\N	serzo_01M6Q03ENZ663NJ98X1G15KW77	\N	\N	2026-11-05 18:18:31.36-05	2026-11-05 18:18:31.36-05	\N
fgz_01M6Q03ENYMRCEKEDP67BWR8K7	country	se	\N	\N	serzo_01M6Q03ENZ663NJ98X1G15KW77	\N	\N	2026-11-05 18:18:31.36-05	2026-11-05 18:18:31.36-05	\N
fgz_01M6Q03ENYMBE0S001HC35BG5A	country	fr	\N	\N	serzo_01M6Q03ENZ663NJ98X1G15KW77	\N	\N	2026-11-05 18:18:31.36-05	2026-11-05 18:18:31.36-05	\N
fgz_01M6Q03ENYDYZQHG9T9TNN1W7G	country	es	\N	\N	serzo_01M6Q03ENZ663NJ98X1G15KW77	\N	\N	2026-11-05 18:18:31.36-05	2026-11-05 18:18:31.36-05	\N
fgz_01M6Q03ENY7FKYK1NX70Q9PZMV	country	it	\N	\N	serzo_01M6Q03ENZ663NJ98X1G15KW77	\N	\N	2026-11-05 18:18:31.36-05	2026-11-05 18:18:31.36-05	\N
fgz_01M6RV2Z8J40W7NG5V9WZQRKMB	country	co	\N	\N	serzo_01M6RV2Z8K3QD75XF5V8DCFQ9T	\N	\N	2026-11-06 11:29:21.555-05	2026-11-06 11:29:21.555-05	\N
\.


--
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.image (id, url, metadata, created_at, updated_at, deleted_at, rank, product_id) FROM stdin;
img_01M6Q03ETP1NSSKXZCZ4FMAT0P	https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png	\N	2026-11-05 18:18:31.519-05	2026-11-06 10:08:27.969-05	2026-11-06 10:08:27.945-05	0	prod_01M6Q03ETMVSFYX1YFMRV52WFM
img_01M6Q03ETP2431GMMGWTR216HE	https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-back.png	\N	2026-11-05 18:18:31.519-05	2026-11-06 10:08:27.969-05	2026-11-06 10:08:27.945-05	1	prod_01M6Q03ETMVSFYX1YFMRV52WFM
img_01M6Q03ETPVVEHAB2QEDDJ255S	https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-white-front.png	\N	2026-11-05 18:18:31.519-05	2026-11-06 10:08:27.969-05	2026-11-06 10:08:27.945-05	2	prod_01M6Q03ETMVSFYX1YFMRV52WFM
img_01M6Q03ETPN6QDTTK92AH3S2TB	https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-white-back.png	\N	2026-11-05 18:18:31.519-05	2026-11-06 10:08:27.969-05	2026-11-06 10:08:27.945-05	3	prod_01M6Q03ETMVSFYX1YFMRV52WFM
img_01M6Q03ETQPPCAJHB8088WKH27	https://medusa-public-images.s3.eu-west-1.amazonaws.com/sweatshirt-vintage-front.png	\N	2026-11-05 18:18:31.519-05	2026-11-06 10:08:27.983-05	2026-11-06 10:08:27.945-05	0	prod_01M6Q03ETMPNV54YAX30PF5MP4
img_01M6Q03ETQY75VKY2F9T23XF8H	https://medusa-public-images.s3.eu-west-1.amazonaws.com/sweatshirt-vintage-back.png	\N	2026-11-05 18:18:31.519-05	2026-11-06 10:08:27.983-05	2026-11-06 10:08:27.945-05	1	prod_01M6Q03ETMPNV54YAX30PF5MP4
img_01M6Q03ETRQMSZWXQ1PNWMSE8J	https://medusa-public-images.s3.eu-west-1.amazonaws.com/sweatpants-gray-front.png	\N	2026-11-05 18:18:31.519-05	2026-11-06 10:08:27.99-05	2026-11-06 10:08:27.945-05	0	prod_01M6Q03ETNKKC3J2PQ8J5HX3X1
img_01M6Q03ETR33GK01CBBN0QXJJN	https://medusa-public-images.s3.eu-west-1.amazonaws.com/sweatpants-gray-back.png	\N	2026-11-05 18:18:31.519-05	2026-11-06 10:08:27.99-05	2026-11-06 10:08:27.945-05	1	prod_01M6Q03ETNKKC3J2PQ8J5HX3X1
img_01M6Q03ETRY7FZQN27QV00B9Q6	https://medusa-public-images.s3.eu-west-1.amazonaws.com/shorts-vintage-front.png	\N	2026-11-05 18:18:31.519-05	2026-11-06 10:08:28.004-05	2026-11-06 10:08:27.945-05	0	prod_01M6Q03ETNJS6M4Y5RV946030B
img_01M6Q03ETR7CF17RSMWZASAMA2	https://medusa-public-images.s3.eu-west-1.amazonaws.com/shorts-vintage-back.png	\N	2026-11-05 18:18:31.519-05	2026-11-06 10:08:28.004-05	2026-11-06 10:08:27.945-05	1	prod_01M6Q03ETNJS6M4Y5RV946030B
img_01M6Q0TVNWDGEA2RTZ474X5XWA	https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?auto=format&fit=crop&w=800&q=80	\N	2026-11-05 18:31:18.348-05	2026-11-06 10:08:28.012-05	2026-11-06 10:08:27.945-05	0	prod_01M6Q0TVNVJF38J8BV2MB49QH0
img_01M6Q0TVNX2FJPBMC7PNXJKDKR	https://images.unsplash.com/photo-1464965911861-746a04b4bca6?auto=format&fit=crop&w=800&q=80	\N	2026-11-05 18:31:18.348-05	2026-11-06 10:08:28.021-05	2026-11-06 10:08:27.945-05	0	prod_01M6Q0TVNV9Y6GBVRV7MFM7ZJV
img_01M6Q0TVNX6J0RDWWZ0HRMT3ZH	https://images.unsplash.com/photo-1559056199-641a0ac8b55e?auto=format&fit=crop&w=800&q=80	\N	2026-11-05 18:31:18.348-05	2026-11-06 10:08:28.031-05	2026-11-06 10:08:27.945-05	0	prod_01M6Q0TVNV2PJR6Q3NWMDR5B75
img_01M6Q0TVNYEWMH6X99YC8NEZXF	https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?auto=format&fit=crop&w=800&q=80	\N	2026-11-05 18:31:18.348-05	2026-11-06 10:08:28.04-05	2026-11-06 10:08:27.945-05	0	prod_01M6Q0TVNVZR9YGNY0KZBMAX7W
img_01M6Q0TVNY94FQZXKB8WGANXJ8	https://images.unsplash.com/photo-1563636619-e9143da7973b?auto=format&fit=crop&w=800&q=80	\N	2026-11-05 18:31:18.348-05	2026-11-06 10:08:28.05-05	2026-11-06 10:08:27.945-05	0	prod_01M6Q0TVNVFFWGQ5Y1B80VW3V3
img_01M6Q0TVNYVXWJEVJ209QFMPDT	https://images.unsplash.com/photo-1582722872445-44dc5f7e3c8f?auto=format&fit=crop&w=800&q=80	\N	2026-11-05 18:31:18.348-05	2026-11-06 10:08:28.059-05	2026-11-06 10:08:27.945-05	0	prod_01M6Q0TVNVGK5HCTWXPDWAWQR1
img_01M6Q0TVNZ2Z5660TP17G7DJH1	https://images.unsplash.com/photo-1600271886742-f049cd451bba?auto=format&fit=crop&w=800&q=80	\N	2026-11-05 18:31:18.348-05	2026-11-06 10:08:28.068-05	2026-11-06 10:08:27.945-05	0	prod_01M6Q0TVNVAZY133GAN1HH5XEW
img_01M6Q0TVNZM0RYAMQZCYVBNZ3Z	https://images.unsplash.com/photo-1509440159596-0249088772ff?auto=format&fit=crop&w=800&q=80	\N	2026-11-05 18:31:18.348-05	2026-11-06 10:08:28.079-05	2026-11-06 10:08:27.945-05	0	prod_01M6Q0TVNVR8Q95SX58M1A1PR8
img_01M6RPEW0A9YFQV36CQKDJB4A7	https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?auto=format&fit=crop&w=800&q=80	\N	2026-11-06 10:08:28.569-05	2026-11-06 11:29:21.993-05	2026-11-06 11:29:21.969-05	0	prod_01M6RPEW07RE5HGX8MNWG22ACV
img_01M6RPEW0ANNWNAW1WZ4602RVQ	https://images.unsplash.com/photo-1464965911861-746a04b4bca6?auto=format&fit=crop&w=800&q=80	\N	2026-11-06 10:08:28.569-05	2026-11-06 11:29:22.003-05	2026-11-06 11:29:21.969-05	0	prod_01M6RPEW08B012SRX8884NNF8R
img_01M6RPEW0BBWJFC4AD3F1M19CD	https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?auto=format&fit=crop&w=800&q=80	\N	2026-11-06 10:08:28.569-05	2026-11-06 11:29:22.012-05	2026-11-06 11:29:21.969-05	0	prod_01M6RPEW08BDRRNWA2XHA9PDWN
img_01M6RPEW0BW5ZYDT8AGSJVTC8E	https://images.unsplash.com/photo-1559056199-641a0ac8b55e?auto=format&fit=crop&w=800&q=80	\N	2026-11-06 10:08:28.569-05	2026-11-06 11:29:22.025-05	2026-11-06 11:29:21.969-05	0	prod_01M6RPEW081153HWTZ3RP6EZ5V
img_01M6RPEW0BAY9CHE1K17ETRNYT	https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?auto=format&fit=crop&w=800&q=80	\N	2026-11-06 10:08:28.569-05	2026-11-06 11:29:22.035-05	2026-11-06 11:29:21.969-05	0	prod_01M6RPEW08Q3WJXN2D5T6MJ68R
img_01M6RPEW0BSAADGCDM2SQFRD64	https://images.unsplash.com/photo-1586201375761-83865001e31c?auto=format&fit=crop&w=800&q=80	\N	2026-11-06 10:08:28.569-05	2026-11-06 11:29:22.053-05	2026-11-06 11:29:21.969-05	0	prod_01M6RPEW08NBPN2008PFPYB34Q
img_01M6RPEW0B1NJ2FSREJ82E6K2G	https://images.unsplash.com/photo-1509440159596-0249088772ff?auto=format&fit=crop&w=800&q=80	\N	2026-11-06 10:08:28.569-05	2026-11-06 11:29:22.063-05	2026-11-06 11:29:21.969-05	0	prod_01M6RPEW084PYH5PFP7RKQC28G
img_01M6RPEW0C8EC6S6V46HW109VV	https://images.unsplash.com/photo-1563636619-e9143da7973b?auto=format&fit=crop&w=800&q=80	\N	2026-11-06 10:08:28.569-05	2026-11-06 11:29:22.077-05	2026-11-06 11:29:21.969-05	0	prod_01M6RPEW086EP0YGHQXYZXMH0D
img_01M6RPEW0CSDNS9STFDP8Y09NV	https://images.unsplash.com/photo-1582722872445-44dc5f7e3c8f?auto=format&fit=crop&w=800&q=80	\N	2026-11-06 10:08:28.569-05	2026-11-06 11:29:22.088-05	2026-11-06 11:29:21.969-05	0	prod_01M6RPEW08XDN4YM5CJZA5BJ18
img_01M6RPEW0CE8PP82EP5TVRSCST	https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?auto=format&fit=crop&w=800&q=80	\N	2026-11-06 10:08:28.569-05	2026-11-06 11:29:22.097-05	2026-11-06 11:29:21.969-05	0	prod_01M6RPEW08GBEJSDYN8AHKK790
img_01M6RPEW0C9MWZXHK1V3CY65N6	https://images.unsplash.com/photo-1607623814075-e51df1bdc82f?auto=format&fit=crop&w=800&q=80	\N	2026-11-06 10:08:28.569-05	2026-11-06 11:29:22.108-05	2026-11-06 11:29:21.969-05	0	prod_01M6RPEW082VFHFT1FWY02275R
img_01M6RPEW0DWA7PYER5CMQYE962	https://images.unsplash.com/photo-1604503468506-a8da13d82791?auto=format&fit=crop&w=800&q=80	\N	2026-11-06 10:08:28.569-05	2026-11-06 11:29:22.118-05	2026-11-06 11:29:21.969-05	0	prod_01M6RPEW08CNRNJSHV2P1ZT5QW
img_01M6RPEW0DMZE3H6006AKD8RB5	https://images.unsplash.com/photo-1600271886742-f049cd451bba?auto=format&fit=crop&w=800&q=80	\N	2026-11-06 10:08:28.569-05	2026-11-06 11:29:22.128-05	2026-11-06 11:29:21.969-05	0	prod_01M6RPEW08AMZS17MYD0A0XQV9
img_01M6RPEW0DDNWRKDDJVA1QS5CG	https://images.unsplash.com/photo-1548839140-29a749e1cf4d?auto=format&fit=crop&w=800&q=80	\N	2026-11-06 10:08:28.569-05	2026-11-06 11:29:22.139-05	2026-11-06 11:29:21.969-05	0	prod_01M6RPEW08K7G5BQ2AJVBNWSD8
img_01M6RPEW0D4WWDCDHDSKQWBNBG	https://images.unsplash.com/photo-1583947215259-38e31be8751f?auto=format&fit=crop&w=800&q=80	\N	2026-11-06 10:08:28.569-05	2026-11-06 11:29:22.148-05	2026-11-06 11:29:21.969-05	0	prod_01M6RPEW08KKFEMGCR8DHA8253
img_01M6RPEW0DFNWMQJW0XQ431KBZ	https://images.unsplash.com/photo-1584556812952-905ffd0c611a?auto=format&fit=crop&w=800&q=80	\N	2026-11-06 10:08:28.569-05	2026-11-06 11:29:22.159-05	2026-11-06 11:29:21.969-05	0	prod_01M6RPEW089JG2ZHZMY25K7FKE
img_01M6RV433YNXC0765V7Y0H2S1N	https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?auto=format&fit=crop&w=800&q=80	\N	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N	0	prod_01M6RV433VXTN0Q3M4KFEPFEVY
img_01M6RV433YR7SZTJCK8ZHXCXBS	https://images.unsplash.com/photo-1464965911861-746a04b4bca6?auto=format&fit=crop&w=800&q=80	\N	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N	0	prod_01M6RV433VBXFP15V95A7WYZJ7
img_01M6RV433ZFPGNNF0CXZVH713F	https://images.unsplash.com/photo-1559056199-641a0ac8b55e?auto=format&fit=crop&w=800&q=80	\N	2026-11-06 11:29:58.288-05	2026-11-06 11:29:58.288-05	\N	0	prod_01M6RV433V8QZPH3PNVY46ZNEP
img_01M6RV433ZQFMW7CZZMKZ8HXCF	https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?auto=format&fit=crop&w=800&q=80	\N	2026-11-06 11:29:58.288-05	2026-11-06 11:29:58.288-05	\N	0	prod_01M6RV433VH280P701DXANFBRN
img_01M6RV433ZACD4FZTYY5BEFRPF	https://images.unsplash.com/photo-1586201375761-83865001e31c?auto=format&fit=crop&w=800&q=80	\N	2026-11-06 11:29:58.288-05	2026-11-06 11:29:58.288-05	\N	0	prod_01M6RV433V3S45S2XK53QKXJG7
img_01M6RV433ZG11GW1VEXJK3F2MN	https://images.unsplash.com/photo-1509440159596-0249088772ff?auto=format&fit=crop&w=800&q=80	\N	2026-11-06 11:29:58.288-05	2026-11-06 11:29:58.288-05	\N	0	prod_01M6RV433V6XR5MWQQ2R2HZK77
img_01M6RV4340ZTAJ2JP5Y8DEAAP1	https://images.unsplash.com/photo-1563636619-e9143da7973b?auto=format&fit=crop&w=800&q=80	\N	2026-11-06 11:29:58.288-05	2026-11-06 11:29:58.288-05	\N	0	prod_01M6RV433VFVQK8CJ13HYDBF8C
img_01M6RV4340MJF2QS54MSQD2VNF	https://images.unsplash.com/photo-1582722872445-44dc5f7e3c8f?auto=format&fit=crop&w=800&q=80	\N	2026-11-06 11:29:58.288-05	2026-11-06 11:29:58.288-05	\N	0	prod_01M6RV433W5X97CNW0881T4HVS
img_01M6RV4340Z6DBNQ0SCA06MHTT	https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?auto=format&fit=crop&w=800&q=80	\N	2026-11-06 11:29:58.288-05	2026-11-06 11:29:58.288-05	\N	0	prod_01M6RV433WAC11MFF8J8MYGGXV
img_01M6RV43413876MQHV4RCFG53F	https://images.unsplash.com/photo-1607623814075-e51df1bdc82f?auto=format&fit=crop&w=800&q=80	\N	2026-11-06 11:29:58.288-05	2026-11-06 11:29:58.288-05	\N	0	prod_01M6RV433WSANFXX1A1XPDAKKT
img_01M6RV4341MBRRTT3T7TC5ZETA	https://images.unsplash.com/photo-1604503468506-a8da13d82791?auto=format&fit=crop&w=800&q=80	\N	2026-11-06 11:29:58.288-05	2026-11-06 11:29:58.288-05	\N	0	prod_01M6RV433WHK3TK8WS4BB3NCD0
img_01M6RV4341PYNGW9FES324X69X	https://images.unsplash.com/photo-1600271886742-f049cd451bba?auto=format&fit=crop&w=800&q=80	\N	2026-11-06 11:29:58.288-05	2026-11-06 11:29:58.288-05	\N	0	prod_01M6RV433WTRZ4DGQ5HHJCEV93
img_01M6RV4341T0AYP80JACR4YG6P	https://images.unsplash.com/photo-1548839140-29a749e1cf4d?auto=format&fit=crop&w=800&q=80	\N	2026-11-06 11:29:58.288-05	2026-11-06 11:29:58.288-05	\N	0	prod_01M6RV433W9FM6BGE5SP0V9VXE
img_01M6RV4341AY7YE7GX4VSVTQBM	https://images.unsplash.com/photo-1583947215259-38e31be8751f?auto=format&fit=crop&w=800&q=80	\N	2026-11-06 11:29:58.288-05	2026-11-06 11:29:58.288-05	\N	0	prod_01M6RV433WFGYYK1YXC74TA0VY
img_01M6RV4342CQ7S0D58CSKB3B4V	https://images.unsplash.com/photo-1584556812952-905ffd0c611a?auto=format&fit=crop&w=800&q=80	\N	2026-11-06 11:29:58.288-05	2026-11-06 11:29:58.288-05	\N	0	prod_01M6RV433WKGNMKY7EYCP575XW
img_01M6RZXMNZXECXZKDR2KCCXFY0	https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?auto=format&fit=crop&w=800&q=80	\N	2026-11-06 12:53:49.759-05	2026-11-06 12:53:49.759-05	\N	0	prod_01M6RV433V2SMZXSHC9ET34Q7P
img_01M6VRP835CAPDHRFF23VH9ZER	https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?auto=format&fit=crop&w=800&q=80	\N	2026-11-07 14:45:10.76-05	2026-11-07 14:45:10.76-05	\N	0	prod_01M6VRP832RAWH9B74NB480E0K
\.


--
-- Data for Name: inventory_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventory_item (id, created_at, updated_at, deleted_at, sku, origin_country, hs_code, mid_code, material, weight, length, height, width, requires_shipping, description, title, thumbnail, metadata, unit_of_measure) FROM stdin;
iitem_01M6Q03EYRYQ9WM5GFVX9APPJX	2026-11-05 18:18:31.642-05	2026-11-06 10:08:27.754-05	2026-11-06 10:08:27.752-05	SHIRT-L-BLACK	\N	\N	\N	\N	\N	\N	\N	\N	t	L / Black	L / Black	\N	\N	\N
iitem_01M6Q03EYRV27GF4AM70QYDSPB	2026-11-05 18:18:31.642-05	2026-11-06 10:08:27.781-05	2026-11-06 10:08:27.752-05	SHIRT-L-WHITE	\N	\N	\N	\N	\N	\N	\N	\N	t	L / White	L / White	\N	\N	\N
iitem_01M6Q03EYQCQN75F89RCP140ZM	2026-11-05 18:18:31.642-05	2026-11-06 10:08:27.791-05	2026-11-06 10:08:27.752-05	SHIRT-M-BLACK	\N	\N	\N	\N	\N	\N	\N	\N	t	M / Black	M / Black	\N	\N	\N
iitem_01M6Q03EYQTB6M5DTG22A12BJY	2026-11-05 18:18:31.642-05	2026-11-06 10:08:27.798-05	2026-11-06 10:08:27.752-05	SHIRT-M-WHITE	\N	\N	\N	\N	\N	\N	\N	\N	t	M / White	M / White	\N	\N	\N
iitem_01M6Q03EYQCH7AQAVVRDH2S9B2	2026-11-05 18:18:31.641-05	2026-11-06 10:08:27.807-05	2026-11-06 10:08:27.752-05	SHIRT-S-BLACK	\N	\N	\N	\N	\N	\N	\N	\N	t	S / Black	S / Black	\N	\N	\N
iitem_01M6Q03EYQM3V7JWNHRJQCBM22	2026-11-05 18:18:31.642-05	2026-11-06 10:08:27.813-05	2026-11-06 10:08:27.752-05	SHIRT-S-WHITE	\N	\N	\N	\N	\N	\N	\N	\N	t	S / White	S / White	\N	\N	\N
iitem_01M6Q03EYR1CN9D2JGQQMN80V8	2026-11-05 18:18:31.642-05	2026-11-06 10:08:27.818-05	2026-11-06 10:08:27.752-05	SHIRT-XL-BLACK	\N	\N	\N	\N	\N	\N	\N	\N	t	XL / Black	XL / Black	\N	\N	\N
iitem_01M6Q03EYR3FH2MH3NZP1AQA3R	2026-11-05 18:18:31.642-05	2026-11-06 10:08:27.821-05	2026-11-06 10:08:27.752-05	SHIRT-XL-WHITE	\N	\N	\N	\N	\N	\N	\N	\N	t	XL / White	XL / White	\N	\N	\N
iitem_01M6Q03EYS656HR3PCYCMYGGHW	2026-11-05 18:18:31.642-05	2026-11-06 10:08:27.826-05	2026-11-06 10:08:27.752-05	SHORTS-L	\N	\N	\N	\N	\N	\N	\N	\N	t	L	L	\N	\N	\N
iitem_01M6Q03EYSXV1BEWHJNYKNT305	2026-11-05 18:18:31.642-05	2026-11-06 10:08:27.83-05	2026-11-06 10:08:27.752-05	SHORTS-M	\N	\N	\N	\N	\N	\N	\N	\N	t	M	M	\N	\N	\N
iitem_01M6Q03EYSF600HCF33W4MQYGS	2026-11-05 18:18:31.642-05	2026-11-06 10:08:27.834-05	2026-11-06 10:08:27.752-05	SHORTS-S	\N	\N	\N	\N	\N	\N	\N	\N	t	S	S	\N	\N	\N
iitem_01M6Q03EYSSXFR2MEHJM6EBR2H	2026-11-05 18:18:31.642-05	2026-11-06 10:08:27.838-05	2026-11-06 10:08:27.752-05	SHORTS-XL	\N	\N	\N	\N	\N	\N	\N	\N	t	XL	XL	\N	\N	\N
iitem_01M6Q0TVTD3CND3QS2E9QJ54W4	2026-11-05 18:31:18.478-05	2026-11-06 10:08:27.842-05	2026-11-06 10:08:27.752-05	SKU-ACEITE-OLIVA-VIRGEN-EXTRA-1	\N	\N	\N	\N	\N	\N	\N	\N	t	Unidad	Unidad	\N	\N	\N
iitem_01M6Q0TVTC2MV4SHXAXHMV9Y8W	2026-11-05 18:31:18.477-05	2026-11-06 10:08:27.846-05	2026-11-06 10:08:27.752-05	SKU-AGUACATE-HASS-ORGANICO-1	\N	\N	\N	\N	\N	\N	\N	\N	t	Unidad	Unidad	\N	\N	\N
iitem_01M6Q0TVTD4N4SCF2WM0TFZG1V	2026-11-05 18:31:18.477-05	2026-11-06 10:08:27.85-05	2026-11-06 10:08:27.752-05	SKU-CAFE-GRANO-ARTESANAL-1	\N	\N	\N	\N	\N	\N	\N	\N	t	Unidad	Unidad	\N	\N	\N
iitem_01M6Q0TVTCV858N47E53EN1WZC	2026-11-05 18:31:18.477-05	2026-11-06 10:08:27.854-05	2026-11-06 10:08:27.752-05	SKU-FRESAS-FRESCAS-500G-1	\N	\N	\N	\N	\N	\N	\N	\N	t	Unidad	Unidad	\N	\N	\N
iitem_01M6Q0TVTD7JXSKV83DE45V1Z6	2026-11-05 18:31:18.478-05	2026-11-06 10:08:27.858-05	2026-11-06 10:08:27.752-05	SKU-HUEVOS-CAMPEROS-DOCENA-1	\N	\N	\N	\N	\N	\N	\N	\N	t	Unidad	Unidad	\N	\N	\N
iitem_01M6Q0TVTDDSJET4BN7X4P0NFE	2026-11-05 18:31:18.478-05	2026-11-06 10:08:27.862-05	2026-11-06 10:08:27.752-05	SKU-JUGO-NARANJA-EXPRIMIDO-1	\N	\N	\N	\N	\N	\N	\N	\N	t	Unidad	Unidad	\N	\N	\N
iitem_01M6Q0TVTDKTGN3JWBBD7MVBNQ	2026-11-05 18:31:18.478-05	2026-11-06 10:08:27.867-05	2026-11-06 10:08:27.752-05	SKU-LECHE-ENTERA-FRESCA-1L-1	\N	\N	\N	\N	\N	\N	\N	\N	t	Unidad	Unidad	\N	\N	\N
iitem_01M6Q0TVTD1X4GFQJ1WGH72TTJ	2026-11-05 18:31:18.478-05	2026-11-06 10:08:27.872-05	2026-11-06 10:08:27.752-05	SKU-PAN-ARTESANAL-MASA-MADRE-1	\N	\N	\N	\N	\N	\N	\N	\N	t	Unidad	Unidad	\N	\N	\N
iitem_01M6Q03EYSE5RBA1R6F88CC6CB	2026-11-05 18:18:31.642-05	2026-11-06 10:08:27.876-05	2026-11-06 10:08:27.752-05	SWEATPANTS-L	\N	\N	\N	\N	\N	\N	\N	\N	t	L	L	\N	\N	\N
iitem_01M6Q03EYSZQRSSC9P53X05V1E	2026-11-05 18:18:31.642-05	2026-11-06 10:08:27.88-05	2026-11-06 10:08:27.752-05	SWEATPANTS-M	\N	\N	\N	\N	\N	\N	\N	\N	t	M	M	\N	\N	\N
iitem_01M6Q03EYRZB88VNWMBXG9YKNR	2026-11-05 18:18:31.642-05	2026-11-06 10:08:27.884-05	2026-11-06 10:08:27.752-05	SWEATPANTS-S	\N	\N	\N	\N	\N	\N	\N	\N	t	S	S	\N	\N	\N
iitem_01M6Q03EYSMKZJ8J3BK5ZF9BSZ	2026-11-05 18:18:31.642-05	2026-11-06 10:08:27.888-05	2026-11-06 10:08:27.752-05	SWEATPANTS-XL	\N	\N	\N	\N	\N	\N	\N	\N	t	XL	XL	\N	\N	\N
iitem_01M6Q03EYRE460RWTP2E9ECXDG	2026-11-05 18:18:31.642-05	2026-11-06 10:08:27.892-05	2026-11-06 10:08:27.752-05	SWEATSHIRT-L	\N	\N	\N	\N	\N	\N	\N	\N	t	L	L	\N	\N	\N
iitem_01M6Q03EYRZ2PW3R16VQW10QQJ	2026-11-05 18:18:31.642-05	2026-11-06 10:08:27.896-05	2026-11-06 10:08:27.752-05	SWEATSHIRT-M	\N	\N	\N	\N	\N	\N	\N	\N	t	M	M	\N	\N	\N
iitem_01M6Q03EYR120J2NDKPFGTY868	2026-11-05 18:18:31.642-05	2026-11-06 10:08:27.9-05	2026-11-06 10:08:27.752-05	SWEATSHIRT-S	\N	\N	\N	\N	\N	\N	\N	\N	t	S	S	\N	\N	\N
iitem_01M6Q03EYRSH7XQ19BN5C5X9PZ	2026-11-05 18:18:31.642-05	2026-11-06 10:08:27.904-05	2026-11-06 10:08:27.752-05	SWEATSHIRT-XL	\N	\N	\N	\N	\N	\N	\N	\N	t	XL	XL	\N	\N	\N
iitem_01M6RPEW5ZMMJZ5MH97EEF3JBP	2026-11-06 10:08:28.738-05	2026-11-06 11:29:21.758-05	2026-11-06 11:29:21.757-05	DETAL-AGUACATE-HASS-ORGANICO	\N	\N	\N	\N	\N	\N	\N	\N	t	Al Detal (Unidad)	Al Detal (Unidad)	\N	\N	\N
iitem_01M6RPEW5ZGMH4KEDFXX4FETW9	2026-11-06 10:08:28.739-05	2026-11-06 11:29:21.767-05	2026-11-06 11:29:21.757-05	MAYOR-AGUACATE-HASS-ORGANICO	\N	\N	\N	\N	\N	\N	\N	\N	t	Al por Mayor (Caja / Bulto)	Al por Mayor (Caja / Bulto)	\N	\N	\N
iitem_01M6RPEW5ZJXA7VESNBFHGFWPK	2026-11-06 10:08:28.739-05	2026-11-06 11:29:21.793-05	2026-11-06 11:29:21.757-05	DETAL-FRESAS-FRESCAS-500G	\N	\N	\N	\N	\N	\N	\N	\N	t	Al Detal (Unidad)	Al Detal (Unidad)	\N	\N	\N
iitem_01M6RPEW5ZVZ0WQ92WJV6G57ZB	2026-11-06 10:08:28.739-05	2026-11-06 11:29:21.797-05	2026-11-06 11:29:21.757-05	MAYOR-FRESAS-FRESCAS-500G	\N	\N	\N	\N	\N	\N	\N	\N	t	Al por Mayor (Caja / Bulto)	Al por Mayor (Caja / Bulto)	\N	\N	\N
iitem_01M6RPEW5ZS833WBBFJQ34387V	2026-11-06 10:08:28.739-05	2026-11-06 11:29:21.802-05	2026-11-06 11:29:21.757-05	DETAL-BANANO-ORGANICO-EXPORTACION	\N	\N	\N	\N	\N	\N	\N	\N	t	Al Detal (Unidad)	Al Detal (Unidad)	\N	\N	\N
iitem_01M6RPEW5Z7VTNDM6T5EMJQ0SH	2026-11-06 10:08:28.739-05	2026-11-06 11:29:21.807-05	2026-11-06 11:29:21.757-05	MAYOR-BANANO-ORGANICO-EXPORTACION	\N	\N	\N	\N	\N	\N	\N	\N	t	Al por Mayor (Caja / Bulto)	Al por Mayor (Caja / Bulto)	\N	\N	\N
iitem_01M6RPEW5Z57K9FZBNQY0QAC16	2026-11-06 10:08:28.739-05	2026-11-06 11:29:21.811-05	2026-11-06 11:29:21.757-05	DETAL-CAFE-GRANO-ARTESANAL	\N	\N	\N	\N	\N	\N	\N	\N	t	Al Detal (Unidad)	Al Detal (Unidad)	\N	\N	\N
iitem_01M6RPEW60YZETMDSF92WE9Q0J	2026-11-06 10:08:28.739-05	2026-11-06 11:29:21.815-05	2026-11-06 11:29:21.757-05	MAYOR-CAFE-GRANO-ARTESANAL	\N	\N	\N	\N	\N	\N	\N	\N	t	Al por Mayor (Caja / Bulto)	Al por Mayor (Caja / Bulto)	\N	\N	\N
iitem_01M6RPEW602BXXKD7W9SWXF3TH	2026-11-06 10:08:28.739-05	2026-11-06 11:29:21.822-05	2026-11-06 11:29:21.757-05	DETAL-ACEITE-OLIVA-VIRGEN-EXTRA	\N	\N	\N	\N	\N	\N	\N	\N	t	Al Detal (Unidad)	Al Detal (Unidad)	\N	\N	\N
iitem_01M6RPEW60HBYFNH744Q0Q21NE	2026-11-06 10:08:28.739-05	2026-11-06 11:29:21.826-05	2026-11-06 11:29:21.757-05	MAYOR-ACEITE-OLIVA-VIRGEN-EXTRA	\N	\N	\N	\N	\N	\N	\N	\N	t	Al por Mayor (Caja / Bulto)	Al por Mayor (Caja / Bulto)	\N	\N	\N
iitem_01M6RPEW60A788Q9QJJF3DGCXD	2026-11-06 10:08:28.739-05	2026-11-06 11:29:21.83-05	2026-11-06 11:29:21.757-05	DETAL-ARROZ-BLANCO-EXTRA-GRANO	\N	\N	\N	\N	\N	\N	\N	\N	t	Al Detal (Unidad)	Al Detal (Unidad)	\N	\N	\N
iitem_01M6RPEW6014SP2219A17VG8E0	2026-11-06 10:08:28.739-05	2026-11-06 11:29:21.834-05	2026-11-06 11:29:21.757-05	MAYOR-ARROZ-BLANCO-EXTRA-GRANO	\N	\N	\N	\N	\N	\N	\N	\N	t	Al por Mayor (Caja / Bulto)	Al por Mayor (Caja / Bulto)	\N	\N	\N
iitem_01M6RPEW604DH168JTS9T55YJN	2026-11-06 10:08:28.739-05	2026-11-06 11:29:21.839-05	2026-11-06 11:29:21.757-05	DETAL-PAN-ARTESANAL-MASA-MADRE	\N	\N	\N	\N	\N	\N	\N	\N	t	Al Detal (Unidad)	Al Detal (Unidad)	\N	\N	\N
iitem_01M6RPEW605G72QWTA6F6MWCKV	2026-11-06 10:08:28.739-05	2026-11-06 11:29:21.843-05	2026-11-06 11:29:21.757-05	MAYOR-PAN-ARTESANAL-MASA-MADRE	\N	\N	\N	\N	\N	\N	\N	\N	t	Al por Mayor (Caja / Bulto)	Al por Mayor (Caja / Bulto)	\N	\N	\N
iitem_01M6RPEW60F4ZTF2BEJH6GSY82	2026-11-06 10:08:28.739-05	2026-11-06 11:29:21.847-05	2026-11-06 11:29:21.757-05	DETAL-LECHE-ENTERA-FRESCA-1L	\N	\N	\N	\N	\N	\N	\N	\N	t	Al Detal (Unidad)	Al Detal (Unidad)	\N	\N	\N
iitem_01M6RPEW6131DNDY8TBDNZHXND	2026-11-06 10:08:28.739-05	2026-11-06 11:29:21.852-05	2026-11-06 11:29:21.757-05	MAYOR-LECHE-ENTERA-FRESCA-1L	\N	\N	\N	\N	\N	\N	\N	\N	t	Al por Mayor (Caja / Bulto)	Al por Mayor (Caja / Bulto)	\N	\N	\N
iitem_01M6RPEW61S782F03DHCXCDDR7	2026-11-06 10:08:28.739-05	2026-11-06 11:29:21.857-05	2026-11-06 11:29:21.757-05	DETAL-HUEVOS-CAMPEROS-DOCENA	\N	\N	\N	\N	\N	\N	\N	\N	t	Al Detal (Unidad)	Al Detal (Unidad)	\N	\N	\N
iitem_01M6RPEW61NFD3S34A8281569X	2026-11-06 10:08:28.739-05	2026-11-06 11:29:21.861-05	2026-11-06 11:29:21.757-05	MAYOR-HUEVOS-CAMPEROS-DOCENA	\N	\N	\N	\N	\N	\N	\N	\N	t	Al por Mayor (Caja / Bulto)	Al por Mayor (Caja / Bulto)	\N	\N	\N
iitem_01M6RPEW613HDTVKVH8351FJKS	2026-11-06 10:08:28.739-05	2026-11-06 11:29:21.865-05	2026-11-06 11:29:21.757-05	DETAL-QUESO-MOZZARELLA-FRESCO	\N	\N	\N	\N	\N	\N	\N	\N	t	Al Detal (Unidad)	Al Detal (Unidad)	\N	\N	\N
iitem_01M6RPEW619WZDZ2SP9HG5KYFR	2026-11-06 10:08:28.739-05	2026-11-06 11:29:21.87-05	2026-11-06 11:29:21.757-05	MAYOR-QUESO-MOZZARELLA-FRESCO	\N	\N	\N	\N	\N	\N	\N	\N	t	Al por Mayor (Caja / Bulto)	Al por Mayor (Caja / Bulto)	\N	\N	\N
iitem_01M6RPEW61NDVJMGW3HWHZY9T1	2026-11-06 10:08:28.739-05	2026-11-06 11:29:21.874-05	2026-11-06 11:29:21.757-05	DETAL-LOMO-RES-MADURADO	\N	\N	\N	\N	\N	\N	\N	\N	t	Al Detal (Unidad)	Al Detal (Unidad)	\N	\N	\N
iitem_01M6RPEW61ZAMCG6AVBM2QKFX4	2026-11-06 10:08:28.739-05	2026-11-06 11:29:21.88-05	2026-11-06 11:29:21.757-05	MAYOR-LOMO-RES-MADURADO	\N	\N	\N	\N	\N	\N	\N	\N	t	Al por Mayor (Caja / Bulto)	Al por Mayor (Caja / Bulto)	\N	\N	\N
iitem_01M6RPEW6121CDA31NRA87AA40	2026-11-06 10:08:28.739-05	2026-11-06 11:29:21.884-05	2026-11-06 11:29:21.757-05	DETAL-PECHUGA-POLLO-FRESCA	\N	\N	\N	\N	\N	\N	\N	\N	t	Al Detal (Unidad)	Al Detal (Unidad)	\N	\N	\N
iitem_01M6RPEW61A9C6XC13F7VZJDWA	2026-11-06 10:08:28.739-05	2026-11-06 11:29:21.889-05	2026-11-06 11:29:21.757-05	MAYOR-PECHUGA-POLLO-FRESCA	\N	\N	\N	\N	\N	\N	\N	\N	t	Al por Mayor (Caja / Bulto)	Al por Mayor (Caja / Bulto)	\N	\N	\N
iitem_01M6RPEW61YHF61SSD29FM58HK	2026-11-06 10:08:28.739-05	2026-11-06 11:29:21.893-05	2026-11-06 11:29:21.757-05	DETAL-JUGO-NARANJA-EXPRIMIDO	\N	\N	\N	\N	\N	\N	\N	\N	t	Al Detal (Unidad)	Al Detal (Unidad)	\N	\N	\N
iitem_01M6RPEW62NRXPJEWEDADA926Q	2026-11-06 10:08:28.739-05	2026-11-06 11:29:21.906-05	2026-11-06 11:29:21.757-05	MAYOR-JUGO-NARANJA-EXPRIMIDO	\N	\N	\N	\N	\N	\N	\N	\N	t	Al por Mayor (Caja / Bulto)	Al por Mayor (Caja / Bulto)	\N	\N	\N
iitem_01M6RPEW625WT6FF2R10TW8NT3	2026-11-06 10:08:28.739-05	2026-11-06 11:29:21.91-05	2026-11-06 11:29:21.757-05	DETAL-AGUA-MINERAL-MANANTIAL	\N	\N	\N	\N	\N	\N	\N	\N	t	Al Detal (Unidad)	Al Detal (Unidad)	\N	\N	\N
iitem_01M6RPEW62TK7C4ERNX6T9SFA0	2026-11-06 10:08:28.739-05	2026-11-06 11:29:21.914-05	2026-11-06 11:29:21.757-05	MAYOR-AGUA-MINERAL-MANANTIAL	\N	\N	\N	\N	\N	\N	\N	\N	t	Al por Mayor (Caja / Bulto)	Al por Mayor (Caja / Bulto)	\N	\N	\N
iitem_01M6RPEW62C5X092Z3CAKJJPCZ	2026-11-06 10:08:28.739-05	2026-11-06 11:29:21.918-05	2026-11-06 11:29:21.757-05	DETAL-DETERGENTE-LIQUIDO-ECOLOGICO	\N	\N	\N	\N	\N	\N	\N	\N	t	Al Detal (Unidad)	Al Detal (Unidad)	\N	\N	\N
iitem_01M6RPEW62Q3Y6BNEZDKHBBN9A	2026-11-06 10:08:28.739-05	2026-11-06 11:29:21.924-05	2026-11-06 11:29:21.757-05	MAYOR-DETERGENTE-LIQUIDO-ECOLOGICO	\N	\N	\N	\N	\N	\N	\N	\N	t	Al por Mayor (Caja / Bulto)	Al por Mayor (Caja / Bulto)	\N	\N	\N
iitem_01M6RPEW62PSAQ2WMC8T3F48PH	2026-11-06 10:08:28.739-05	2026-11-06 11:29:21.928-05	2026-11-06 11:29:21.757-05	DETAL-PAPEL-HIGIENICO-TRIPLE-HOJA	\N	\N	\N	\N	\N	\N	\N	\N	t	Al Detal (Unidad)	Al Detal (Unidad)	\N	\N	\N
iitem_01M6RPEW62ZSRBXA2T55XNY11J	2026-11-06 10:08:28.739-05	2026-11-06 11:29:21.932-05	2026-11-06 11:29:21.757-05	MAYOR-PAPEL-HIGIENICO-TRIPLE-HOJA	\N	\N	\N	\N	\N	\N	\N	\N	t	Al por Mayor (Caja / Bulto)	Al por Mayor (Caja / Bulto)	\N	\N	\N
iitem_01M6RV439XM629J2W67DTV929B	2026-11-06 11:29:58.465-05	2026-11-06 11:29:58.465-05	\N	DETAL-AGUACATE-HASS-ORGANICO	\N	\N	\N	\N	\N	\N	\N	\N	t	Al Detal (Unidad)	Al Detal (Unidad)	\N	\N	\N
iitem_01M6RV439XQNKF4MA8TRFYT6K5	2026-11-06 11:29:58.465-05	2026-11-06 11:29:58.465-05	\N	MAYOR-AGUACATE-HASS-ORGANICO	\N	\N	\N	\N	\N	\N	\N	\N	t	Al por Mayor (Caja / Bulto)	Al por Mayor (Caja / Bulto)	\N	\N	\N
iitem_01M6RV439XS3J0XKTKYX8J1M2K	2026-11-06 11:29:58.465-05	2026-11-06 11:29:58.465-05	\N	DETAL-FRESAS-FRESCAS-500G	\N	\N	\N	\N	\N	\N	\N	\N	t	Al Detal (Unidad)	Al Detal (Unidad)	\N	\N	\N
iitem_01M6RV439XF008GP00GQKT2N7E	2026-11-06 11:29:58.465-05	2026-11-06 11:29:58.465-05	\N	MAYOR-FRESAS-FRESCAS-500G	\N	\N	\N	\N	\N	\N	\N	\N	t	Al por Mayor (Caja / Bulto)	Al por Mayor (Caja / Bulto)	\N	\N	\N
iitem_01M6RV439YGVAPYPMN55HEZM62	2026-11-06 11:29:58.465-05	2026-11-06 11:29:58.466-05	\N	DETAL-BANANO-ORGANICO-EXPORTACION	\N	\N	\N	\N	\N	\N	\N	\N	t	Al Detal (Unidad)	Al Detal (Unidad)	\N	\N	\N
iitem_01M6RV439YNGWKCF1ERHXG23SH	2026-11-06 11:29:58.466-05	2026-11-06 11:29:58.466-05	\N	MAYOR-BANANO-ORGANICO-EXPORTACION	\N	\N	\N	\N	\N	\N	\N	\N	t	Al por Mayor (Caja / Bulto)	Al por Mayor (Caja / Bulto)	\N	\N	\N
iitem_01M6RV439Y08C5WDPJF3PYTHJP	2026-11-06 11:29:58.466-05	2026-11-06 11:29:58.466-05	\N	DETAL-CAFE-GRANO-ARTESANAL	\N	\N	\N	\N	\N	\N	\N	\N	t	Al Detal (Unidad)	Al Detal (Unidad)	\N	\N	\N
iitem_01M6RV439YCT9Y2KH49TH3B54A	2026-11-06 11:29:58.466-05	2026-11-06 11:29:58.466-05	\N	MAYOR-CAFE-GRANO-ARTESANAL	\N	\N	\N	\N	\N	\N	\N	\N	t	Al por Mayor (Caja / Bulto)	Al por Mayor (Caja / Bulto)	\N	\N	\N
iitem_01M6RV439YEMQBWB1K4SQXT81R	2026-11-06 11:29:58.466-05	2026-11-06 11:29:58.466-05	\N	DETAL-ACEITE-OLIVA-VIRGEN-EXTRA	\N	\N	\N	\N	\N	\N	\N	\N	t	Al Detal (Unidad)	Al Detal (Unidad)	\N	\N	\N
iitem_01M6RV439YG3SWBN0KJSVA46DZ	2026-11-06 11:29:58.466-05	2026-11-06 11:29:58.466-05	\N	MAYOR-ACEITE-OLIVA-VIRGEN-EXTRA	\N	\N	\N	\N	\N	\N	\N	\N	t	Al por Mayor (Caja / Bulto)	Al por Mayor (Caja / Bulto)	\N	\N	\N
iitem_01M6RV439Y1P551YKDPFYZEKTS	2026-11-06 11:29:58.466-05	2026-11-06 11:29:58.466-05	\N	DETAL-ARROZ-BLANCO-EXTRA-GRANO	\N	\N	\N	\N	\N	\N	\N	\N	t	Al Detal (Unidad)	Al Detal (Unidad)	\N	\N	\N
iitem_01M6RV439Z3JY3BHRK2K9J8QTZ	2026-11-06 11:29:58.466-05	2026-11-06 11:29:58.466-05	\N	MAYOR-ARROZ-BLANCO-EXTRA-GRANO	\N	\N	\N	\N	\N	\N	\N	\N	t	Al por Mayor (Caja / Bulto)	Al por Mayor (Caja / Bulto)	\N	\N	\N
iitem_01M6RV439ZPB7WNZ0ERAEPDDYP	2026-11-06 11:29:58.466-05	2026-11-06 11:29:58.466-05	\N	DETAL-PAN-ARTESANAL-MASA-MADRE	\N	\N	\N	\N	\N	\N	\N	\N	t	Al Detal (Unidad)	Al Detal (Unidad)	\N	\N	\N
iitem_01M6RV439Z7D8XX7RY0H61P7WF	2026-11-06 11:29:58.466-05	2026-11-06 11:29:58.466-05	\N	MAYOR-PAN-ARTESANAL-MASA-MADRE	\N	\N	\N	\N	\N	\N	\N	\N	t	Al por Mayor (Caja / Bulto)	Al por Mayor (Caja / Bulto)	\N	\N	\N
iitem_01M6RV439Z4YGKFSMP7SX8ZTNE	2026-11-06 11:29:58.466-05	2026-11-06 11:29:58.466-05	\N	DETAL-LECHE-ENTERA-FRESCA-1L	\N	\N	\N	\N	\N	\N	\N	\N	t	Al Detal (Unidad)	Al Detal (Unidad)	\N	\N	\N
iitem_01M6RV439Z6EQFMAC1RSRB0ME7	2026-11-06 11:29:58.466-05	2026-11-06 11:29:58.466-05	\N	MAYOR-LECHE-ENTERA-FRESCA-1L	\N	\N	\N	\N	\N	\N	\N	\N	t	Al por Mayor (Caja / Bulto)	Al por Mayor (Caja / Bulto)	\N	\N	\N
iitem_01M6RV439ZMBXK2EPJXA344XK6	2026-11-06 11:29:58.466-05	2026-11-06 11:29:58.466-05	\N	DETAL-HUEVOS-CAMPEROS-DOCENA	\N	\N	\N	\N	\N	\N	\N	\N	t	Al Detal (Unidad)	Al Detal (Unidad)	\N	\N	\N
iitem_01M6RV439ZQAJ5D2S4DQ73KF93	2026-11-06 11:29:58.466-05	2026-11-06 11:29:58.466-05	\N	MAYOR-HUEVOS-CAMPEROS-DOCENA	\N	\N	\N	\N	\N	\N	\N	\N	t	Al por Mayor (Caja / Bulto)	Al por Mayor (Caja / Bulto)	\N	\N	\N
iitem_01M6RV439Z5R5SWHXEYS5D2124	2026-11-06 11:29:58.466-05	2026-11-06 11:29:58.466-05	\N	DETAL-QUESO-MOZZARELLA-FRESCO	\N	\N	\N	\N	\N	\N	\N	\N	t	Al Detal (Unidad)	Al Detal (Unidad)	\N	\N	\N
iitem_01M6RV439ZCMKFZJKKEF1SCPY4	2026-11-06 11:29:58.466-05	2026-11-06 11:29:58.466-05	\N	MAYOR-QUESO-MOZZARELLA-FRESCO	\N	\N	\N	\N	\N	\N	\N	\N	t	Al por Mayor (Caja / Bulto)	Al por Mayor (Caja / Bulto)	\N	\N	\N
iitem_01M6RV439ZXB9KBYPPFK9JPZJM	2026-11-06 11:29:58.466-05	2026-11-06 11:29:58.466-05	\N	DETAL-LOMO-RES-MADURADO	\N	\N	\N	\N	\N	\N	\N	\N	t	Al Detal (Unidad)	Al Detal (Unidad)	\N	\N	\N
iitem_01M6RV43A0CE1XXG7J1KP5S7ZV	2026-11-06 11:29:58.466-05	2026-11-06 11:29:58.466-05	\N	MAYOR-LOMO-RES-MADURADO	\N	\N	\N	\N	\N	\N	\N	\N	t	Al por Mayor (Caja / Bulto)	Al por Mayor (Caja / Bulto)	\N	\N	\N
iitem_01M6RV43A0TGDSD2M9QB5C82ZR	2026-11-06 11:29:58.466-05	2026-11-06 11:29:58.466-05	\N	DETAL-PECHUGA-POLLO-FRESCA	\N	\N	\N	\N	\N	\N	\N	\N	t	Al Detal (Unidad)	Al Detal (Unidad)	\N	\N	\N
iitem_01M6RV43A059BZ9RFGVBX7FK7G	2026-11-06 11:29:58.466-05	2026-11-06 11:29:58.466-05	\N	MAYOR-PECHUGA-POLLO-FRESCA	\N	\N	\N	\N	\N	\N	\N	\N	t	Al por Mayor (Caja / Bulto)	Al por Mayor (Caja / Bulto)	\N	\N	\N
iitem_01M6RV43A0YRMED8HC4RE4GHPR	2026-11-06 11:29:58.466-05	2026-11-06 11:29:58.466-05	\N	DETAL-JUGO-NARANJA-EXPRIMIDO	\N	\N	\N	\N	\N	\N	\N	\N	t	Al Detal (Unidad)	Al Detal (Unidad)	\N	\N	\N
iitem_01M6RV43A00DSBMSYN3J485BG7	2026-11-06 11:29:58.466-05	2026-11-06 11:29:58.466-05	\N	MAYOR-JUGO-NARANJA-EXPRIMIDO	\N	\N	\N	\N	\N	\N	\N	\N	t	Al por Mayor (Caja / Bulto)	Al por Mayor (Caja / Bulto)	\N	\N	\N
iitem_01M6RV43A0HQ97JSMCFFCBBZJ0	2026-11-06 11:29:58.466-05	2026-11-06 11:29:58.466-05	\N	DETAL-AGUA-MINERAL-MANANTIAL	\N	\N	\N	\N	\N	\N	\N	\N	t	Al Detal (Unidad)	Al Detal (Unidad)	\N	\N	\N
iitem_01M6RV43A0Q16DHWHNV44Y16JJ	2026-11-06 11:29:58.466-05	2026-11-06 11:29:58.466-05	\N	MAYOR-AGUA-MINERAL-MANANTIAL	\N	\N	\N	\N	\N	\N	\N	\N	t	Al por Mayor (Caja / Bulto)	Al por Mayor (Caja / Bulto)	\N	\N	\N
iitem_01M6RV43A0FXDQKHYZM5P1FZDX	2026-11-06 11:29:58.466-05	2026-11-06 11:29:58.466-05	\N	DETAL-DETERGENTE-LIQUIDO-ECOLOGICO	\N	\N	\N	\N	\N	\N	\N	\N	t	Al Detal (Unidad)	Al Detal (Unidad)	\N	\N	\N
iitem_01M6RV43A1B5HDFHRSPD8HKP85	2026-11-06 11:29:58.466-05	2026-11-06 11:29:58.466-05	\N	MAYOR-DETERGENTE-LIQUIDO-ECOLOGICO	\N	\N	\N	\N	\N	\N	\N	\N	t	Al por Mayor (Caja / Bulto)	Al por Mayor (Caja / Bulto)	\N	\N	\N
iitem_01M6RV43A1EQTDJ4WVDMY1JP5G	2026-11-06 11:29:58.466-05	2026-11-06 11:29:58.466-05	\N	DETAL-PAPEL-HIGIENICO-TRIPLE-HOJA	\N	\N	\N	\N	\N	\N	\N	\N	t	Al Detal (Unidad)	Al Detal (Unidad)	\N	\N	\N
iitem_01M6RV43A1C5EEXGYE9G7SH84A	2026-11-06 11:29:58.466-05	2026-11-06 11:29:58.466-05	\N	MAYOR-PAPEL-HIGIENICO-TRIPLE-HOJA	\N	\N	\N	\N	\N	\N	\N	\N	t	Al por Mayor (Caja / Bulto)	Al por Mayor (Caja / Bulto)	\N	\N	\N
iitem_01M6VRP89F6NG3CWJYRSFQ6K45	2026-11-07 14:45:10.959-05	2026-11-07 14:45:10.959-05	\N	DETAL-7702025102004	\N	\N	\N	\N	\N	\N	\N	\N	t	Al Detal (Unidad)	Al Detal (Unidad)	\N	\N	\N
iitem_01M6VRP89FA5756PX1E58M8S1G	2026-11-07 14:45:10.96-05	2026-11-07 14:45:10.96-05	\N	MAYOR-7702025102004	\N	\N	\N	\N	\N	\N	\N	\N	t	Al por Mayor (Caja / Bulto)	Al por Mayor (Caja / Bulto)	\N	\N	\N
\.


--
-- Data for Name: inventory_level; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventory_level (id, created_at, updated_at, deleted_at, inventory_item_id, location_id, stocked_quantity, reserved_quantity, incoming_quantity, metadata, raw_stocked_quantity, raw_reserved_quantity, raw_incoming_quantity) FROM stdin;
ilev_01M6Q03F2CCCTF6ZWTSNPEDZ8Z	2026-11-05 18:18:31.759-05	2026-11-06 10:08:27.781-05	2026-11-06 10:08:27.752-05	iitem_01M6Q03EYRYQ9WM5GFVX9APPJX	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000000	0	0	\N	{"value": "1000000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6Q03F2CJVGA2TCQ59METZR7	2026-11-05 18:18:31.759-05	2026-11-06 10:08:27.791-05	2026-11-06 10:08:27.752-05	iitem_01M6Q03EYRV27GF4AM70QYDSPB	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000000	0	0	\N	{"value": "1000000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6Q03F2BPNNZ8EYVWEF2FS2Q	2026-11-05 18:18:31.758-05	2026-11-06 10:08:27.797-05	2026-11-06 10:08:27.752-05	iitem_01M6Q03EYQCQN75F89RCP140ZM	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000000	0	0	\N	{"value": "1000000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6Q03F2BQJT3FSRFHWAMCEQ9	2026-11-05 18:18:31.759-05	2026-11-06 10:08:27.807-05	2026-11-06 10:08:27.752-05	iitem_01M6Q03EYQTB6M5DTG22A12BJY	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000000	0	0	\N	{"value": "1000000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6Q03F2AEB61EWPHQW7HP6E2	2026-11-05 18:18:31.758-05	2026-11-06 10:08:27.813-05	2026-11-06 10:08:27.752-05	iitem_01M6Q03EYQCH7AQAVVRDH2S9B2	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000000	0	0	\N	{"value": "1000000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6Q03F2BCERY8PJ1D70H9T22	2026-11-05 18:18:31.758-05	2026-11-06 10:08:27.817-05	2026-11-06 10:08:27.752-05	iitem_01M6Q03EYQM3V7JWNHRJQCBM22	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000000	0	0	\N	{"value": "1000000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6Q03F2BTJASPAZCF713VRZP	2026-11-05 18:18:31.759-05	2026-11-06 10:08:27.821-05	2026-11-06 10:08:27.752-05	iitem_01M6Q03EYR1CN9D2JGQQMN80V8	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000000	0	0	\N	{"value": "1000000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6Q03F2B6B3G0FM7E31D1WAQ	2026-11-05 18:18:31.759-05	2026-11-06 10:08:27.825-05	2026-11-06 10:08:27.752-05	iitem_01M6Q03EYR3FH2MH3NZP1AQA3R	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000000	0	0	\N	{"value": "1000000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6Q03F2DEBZZ54A15TNG3SA0	2026-11-05 18:18:31.759-05	2026-11-06 10:08:27.83-05	2026-11-06 10:08:27.752-05	iitem_01M6Q03EYS656HR3PCYCMYGGHW	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000000	0	0	\N	{"value": "1000000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6Q03F2DQ3N4PZJF4CXD7MAA	2026-11-05 18:18:31.759-05	2026-11-06 10:08:27.834-05	2026-11-06 10:08:27.752-05	iitem_01M6Q03EYSXV1BEWHJNYKNT305	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000000	0	0	\N	{"value": "1000000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6Q03F2D9KM4JWV7886DTD23	2026-11-05 18:18:31.759-05	2026-11-06 10:08:27.838-05	2026-11-06 10:08:27.752-05	iitem_01M6Q03EYSF600HCF33W4MQYGS	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000000	0	0	\N	{"value": "1000000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6Q03F2DZ643TKWJ7A20JT0T	2026-11-05 18:18:31.759-05	2026-11-06 10:08:27.842-05	2026-11-06 10:08:27.752-05	iitem_01M6Q03EYSSXFR2MEHJM6EBR2H	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000000	0	0	\N	{"value": "1000000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6Q0TW1WMJ29N0QBTKTN1J66	2026-11-05 18:31:18.717-05	2026-11-06 10:08:27.846-05	2026-11-06 10:08:27.752-05	iitem_01M6Q0TVTD3CND3QS2E9QJ54W4	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	500	0	0	\N	{"value": "500", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6Q0TW1WP9AJDHJYPX4A0931	2026-11-05 18:31:18.717-05	2026-11-06 10:08:27.85-05	2026-11-06 10:08:27.752-05	iitem_01M6Q0TVTC2MV4SHXAXHMV9Y8W	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	500	0	0	\N	{"value": "500", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6Q0TW1X17YV02VM20BY3HV4	2026-11-05 18:31:18.717-05	2026-11-06 10:08:27.853-05	2026-11-06 10:08:27.752-05	iitem_01M6Q0TVTD4N4SCF2WM0TFZG1V	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	500	0	0	\N	{"value": "500", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6Q0TW1WDDNGQY6V353MTD9A	2026-11-05 18:31:18.717-05	2026-11-06 10:08:27.857-05	2026-11-06 10:08:27.752-05	iitem_01M6Q0TVTCV858N47E53EN1WZC	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	500	0	0	\N	{"value": "500", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6Q0TW1X27TG98P0F3HC4RN9	2026-11-05 18:31:18.717-05	2026-11-06 10:08:27.861-05	2026-11-06 10:08:27.752-05	iitem_01M6Q0TVTD7JXSKV83DE45V1Z6	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	500	0	0	\N	{"value": "500", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6Q0TW1XGWKJV58K67GDTA8T	2026-11-05 18:31:18.717-05	2026-11-06 10:08:27.867-05	2026-11-06 10:08:27.752-05	iitem_01M6Q0TVTDDSJET4BN7X4P0NFE	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	500	0	0	\N	{"value": "500", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6Q0TW1X29PMJ07H8JBREFEY	2026-11-05 18:31:18.717-05	2026-11-06 10:08:27.871-05	2026-11-06 10:08:27.752-05	iitem_01M6Q0TVTDKTGN3JWBBD7MVBNQ	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	500	0	0	\N	{"value": "500", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6Q0TW1WQ46CEGE3XAT1P30W	2026-11-05 18:31:18.717-05	2026-11-06 10:08:27.875-05	2026-11-06 10:08:27.752-05	iitem_01M6Q0TVTD1X4GFQJ1WGH72TTJ	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	500	0	0	\N	{"value": "500", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6Q03F2DTQHSFP1YDJ21WJ06	2026-11-05 18:18:31.759-05	2026-11-06 10:08:27.879-05	2026-11-06 10:08:27.752-05	iitem_01M6Q03EYSE5RBA1R6F88CC6CB	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000000	0	0	\N	{"value": "1000000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6Q03F2EX4N6HGT8M86FXHZM	2026-11-05 18:18:31.759-05	2026-11-06 10:08:27.883-05	2026-11-06 10:08:27.752-05	iitem_01M6Q03EYSZQRSSC9P53X05V1E	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000000	0	0	\N	{"value": "1000000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6Q03F2D58WS0HV6T302RPPY	2026-11-05 18:18:31.759-05	2026-11-06 10:08:27.887-05	2026-11-06 10:08:27.752-05	iitem_01M6Q03EYRZB88VNWMBXG9YKNR	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000000	0	0	\N	{"value": "1000000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6Q03F2DHX3A0CY5WYGZ00YG	2026-11-05 18:18:31.759-05	2026-11-06 10:08:27.892-05	2026-11-06 10:08:27.752-05	iitem_01M6Q03EYSMKZJ8J3BK5ZF9BSZ	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000000	0	0	\N	{"value": "1000000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6Q03F2C4GV75T908ZK7BAQZ	2026-11-05 18:18:31.759-05	2026-11-06 10:08:27.896-05	2026-11-06 10:08:27.752-05	iitem_01M6Q03EYRE460RWTP2E9ECXDG	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000000	0	0	\N	{"value": "1000000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6Q03F2CP2E9ZJR6V97AKXCG	2026-11-05 18:18:31.759-05	2026-11-06 10:08:27.9-05	2026-11-06 10:08:27.752-05	iitem_01M6Q03EYRZ2PW3R16VQW10QQJ	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000000	0	0	\N	{"value": "1000000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6Q03F2BEBSTVJPQ4JWGAGW0	2026-11-05 18:18:31.759-05	2026-11-06 10:08:27.904-05	2026-11-06 10:08:27.752-05	iitem_01M6Q03EYR120J2NDKPFGTY868	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000000	0	0	\N	{"value": "1000000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6Q03F2CGFRT1TRNZVXSWFF2	2026-11-05 18:18:31.759-05	2026-11-06 10:08:27.908-05	2026-11-06 10:08:27.752-05	iitem_01M6Q03EYRSH7XQ19BN5C5X9PZ	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000000	0	0	\N	{"value": "1000000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RPEWMXYTPW2ST79CYR833J	2026-11-06 10:08:29.216-05	2026-11-06 11:29:21.767-05	2026-11-06 11:29:21.757-05	iitem_01M6RPEW5ZMMJZ5MH97EEF3JBP	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RPEWMXRR4PGDA1AVMTP2BX	2026-11-06 10:08:29.216-05	2026-11-06 11:29:21.792-05	2026-11-06 11:29:21.757-05	iitem_01M6RPEW5ZGMH4KEDFXX4FETW9	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RPEWMXW5G5JJ6SWGNW8HES	2026-11-06 10:08:29.216-05	2026-11-06 11:29:21.797-05	2026-11-06 11:29:21.757-05	iitem_01M6RPEW5ZJXA7VESNBFHGFWPK	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RPEWMY899HHWHMNXVJW2N6	2026-11-06 10:08:29.216-05	2026-11-06 11:29:21.802-05	2026-11-06 11:29:21.757-05	iitem_01M6RPEW5ZVZ0WQ92WJV6G57ZB	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RPEWMX65K8S8FWCPT4VFK5	2026-11-06 10:08:29.216-05	2026-11-06 11:29:21.807-05	2026-11-06 11:29:21.757-05	iitem_01M6RPEW5ZS833WBBFJQ34387V	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RPEWMXC4VNV9APENN1RWSQ	2026-11-06 10:08:29.216-05	2026-11-06 11:29:21.811-05	2026-11-06 11:29:21.757-05	iitem_01M6RPEW5Z7VTNDM6T5EMJQ0SH	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RPEWMXBR1E3FKATMKKQ86X	2026-11-06 10:08:29.216-05	2026-11-06 11:29:21.815-05	2026-11-06 11:29:21.757-05	iitem_01M6RPEW5Z57K9FZBNQY0QAC16	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RPEWMYM5ZB5JFQD4Q1FK3W	2026-11-06 10:08:29.216-05	2026-11-06 11:29:21.821-05	2026-11-06 11:29:21.757-05	iitem_01M6RPEW60YZETMDSF92WE9Q0J	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RPEWMYPMZF5SMF6AMNEJ2V	2026-11-06 10:08:29.216-05	2026-11-06 11:29:21.826-05	2026-11-06 11:29:21.757-05	iitem_01M6RPEW602BXXKD7W9SWXF3TH	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RPEWMYC1CK1V8B1RM0QKY5	2026-11-06 10:08:29.216-05	2026-11-06 11:29:21.83-05	2026-11-06 11:29:21.757-05	iitem_01M6RPEW60HBYFNH744Q0Q21NE	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RPEWMY2AB0230YJVMEZ5EA	2026-11-06 10:08:29.216-05	2026-11-06 11:29:21.834-05	2026-11-06 11:29:21.757-05	iitem_01M6RPEW60A788Q9QJJF3DGCXD	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RPEWMYE4NZVD33Y92YSW92	2026-11-06 10:08:29.216-05	2026-11-06 11:29:21.838-05	2026-11-06 11:29:21.757-05	iitem_01M6RPEW6014SP2219A17VG8E0	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RPEWMYX2HQZXWRVNQJEXST	2026-11-06 10:08:29.216-05	2026-11-06 11:29:21.843-05	2026-11-06 11:29:21.757-05	iitem_01M6RPEW604DH168JTS9T55YJN	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RPEWMY0WS7S86MR3QHG2J7	2026-11-06 10:08:29.216-05	2026-11-06 11:29:21.847-05	2026-11-06 11:29:21.757-05	iitem_01M6RPEW605G72QWTA6F6MWCKV	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RPEWMYE9VVHDQ2TXPGWHY7	2026-11-06 10:08:29.216-05	2026-11-06 11:29:21.851-05	2026-11-06 11:29:21.757-05	iitem_01M6RPEW60F4ZTF2BEJH6GSY82	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RPEWMYGHHXATKGAK5KK0VM	2026-11-06 10:08:29.216-05	2026-11-06 11:29:21.856-05	2026-11-06 11:29:21.757-05	iitem_01M6RPEW6131DNDY8TBDNZHXND	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RPEWMZH35B6MSQN8ZY8R3J	2026-11-06 10:08:29.216-05	2026-11-06 11:29:21.86-05	2026-11-06 11:29:21.757-05	iitem_01M6RPEW61S782F03DHCXCDDR7	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RPEWMZ8JGJCWHQG6ZP7320	2026-11-06 10:08:29.216-05	2026-11-06 11:29:21.864-05	2026-11-06 11:29:21.757-05	iitem_01M6RPEW61NFD3S34A8281569X	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RPEWMZFTRS7ZM220621282	2026-11-06 10:08:29.216-05	2026-11-06 11:29:21.869-05	2026-11-06 11:29:21.757-05	iitem_01M6RPEW613HDTVKVH8351FJKS	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RPEWMZ0W5H6N6EA7DVZG9C	2026-11-06 10:08:29.216-05	2026-11-06 11:29:21.874-05	2026-11-06 11:29:21.757-05	iitem_01M6RPEW619WZDZ2SP9HG5KYFR	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RPEWMZ0Y621PXH59P19KT8	2026-11-06 10:08:29.216-05	2026-11-06 11:29:21.879-05	2026-11-06 11:29:21.757-05	iitem_01M6RPEW61NDVJMGW3HWHZY9T1	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RPEWMZZCEN3JRDP9DV4WVZ	2026-11-06 10:08:29.216-05	2026-11-06 11:29:21.884-05	2026-11-06 11:29:21.757-05	iitem_01M6RPEW61ZAMCG6AVBM2QKFX4	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RPEWMY5ME12KSPSJJKRDRQ	2026-11-06 10:08:29.216-05	2026-11-06 11:29:21.888-05	2026-11-06 11:29:21.757-05	iitem_01M6RPEW6121CDA31NRA87AA40	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RPEWMZMJK38FBPKH45CWFQ	2026-11-06 10:08:29.216-05	2026-11-06 11:29:21.893-05	2026-11-06 11:29:21.757-05	iitem_01M6RPEW61A9C6XC13F7VZJDWA	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RPEWMZK237YJ4FACK87KQX	2026-11-06 10:08:29.216-05	2026-11-06 11:29:21.905-05	2026-11-06 11:29:21.757-05	iitem_01M6RPEW61YHF61SSD29FM58HK	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RPEWMZX38KS9HVPDSDW2DQ	2026-11-06 10:08:29.216-05	2026-11-06 11:29:21.909-05	2026-11-06 11:29:21.757-05	iitem_01M6RPEW62NRXPJEWEDADA926Q	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RPEWMZ1NVCSWNGP6WW3B6Q	2026-11-06 10:08:29.216-05	2026-11-06 11:29:21.913-05	2026-11-06 11:29:21.757-05	iitem_01M6RPEW625WT6FF2R10TW8NT3	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RPEWN0T1PGA94G0C1DZCGG	2026-11-06 10:08:29.216-05	2026-11-06 11:29:21.918-05	2026-11-06 11:29:21.757-05	iitem_01M6RPEW62TK7C4ERNX6T9SFA0	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RPEWMZT5YRGBMW1QNQKWC2	2026-11-06 10:08:29.216-05	2026-11-06 11:29:21.923-05	2026-11-06 11:29:21.757-05	iitem_01M6RPEW62C5X092Z3CAKJJPCZ	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RPEWN0CYFCFHEYP3V1TENS	2026-11-06 10:08:29.216-05	2026-11-06 11:29:21.927-05	2026-11-06 11:29:21.757-05	iitem_01M6RPEW62Q3Y6BNEZDKHBBN9A	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RPEWMZTPN7KSDV6N9QWW58	2026-11-06 10:08:29.216-05	2026-11-06 11:29:21.931-05	2026-11-06 11:29:21.757-05	iitem_01M6RPEW62PSAQ2WMC8T3F48PH	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RPEWN0AN90DWMFAMEXQRKX	2026-11-06 10:08:29.216-05	2026-11-06 11:29:21.936-05	2026-11-06 11:29:21.757-05	iitem_01M6RPEW62ZSRBXA2T55XNY11J	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RV43V5M7973711HMX12PDK	2026-11-06 11:29:59.016-05	2026-11-06 11:29:59.016-05	\N	iitem_01M6RV439XF008GP00GQKT2N7E	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RV43V518763B3MADCW3XM4	2026-11-06 11:29:59.017-05	2026-11-06 11:29:59.017-05	\N	iitem_01M6RV439XM629J2W67DTV929B	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RV43V5D9SD975DGFWENEFP	2026-11-06 11:29:59.017-05	2026-11-06 11:29:59.017-05	\N	iitem_01M6RV439XQNKF4MA8TRFYT6K5	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RV43V5Q5THH0T43JRQWN89	2026-11-06 11:29:59.017-05	2026-11-06 11:29:59.017-05	\N	iitem_01M6RV439XS3J0XKTKYX8J1M2K	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RV43V6DYEQV4FEEH5RAPJ7	2026-11-06 11:29:59.017-05	2026-11-06 11:29:59.017-05	\N	iitem_01M6RV439Y08C5WDPJF3PYTHJP	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RV43V6ZVWEF1AK7CD3ZCC7	2026-11-06 11:29:59.017-05	2026-11-06 11:29:59.017-05	\N	iitem_01M6RV439Y1P551YKDPFYZEKTS	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RV43V69HMSV4T8V6MXKCYS	2026-11-06 11:29:59.017-05	2026-11-06 11:29:59.017-05	\N	iitem_01M6RV439YCT9Y2KH49TH3B54A	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RV43V6KRJTRASD0ZTMBBWJ	2026-11-06 11:29:59.017-05	2026-11-06 11:29:59.017-05	\N	iitem_01M6RV439YEMQBWB1K4SQXT81R	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RV43V6NSKSX8XQ2KJR4WHE	2026-11-06 11:29:59.017-05	2026-11-06 11:29:59.017-05	\N	iitem_01M6RV439YG3SWBN0KJSVA46DZ	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RV43V6MXBQ6XXAYWSS2JG7	2026-11-06 11:29:59.017-05	2026-11-06 11:29:59.017-05	\N	iitem_01M6RV439YGVAPYPMN55HEZM62	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RV43V64CBMH1DN217V70TC	2026-11-06 11:29:59.017-05	2026-11-06 11:29:59.017-05	\N	iitem_01M6RV439YNGWKCF1ERHXG23SH	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RV43V6R6TT35ZZRE6TFTKG	2026-11-06 11:29:59.017-05	2026-11-06 11:29:59.017-05	\N	iitem_01M6RV439Z3JY3BHRK2K9J8QTZ	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RV43V6S1SCSDZQ905CM2N4	2026-11-06 11:29:59.017-05	2026-11-06 11:29:59.017-05	\N	iitem_01M6RV439Z4YGKFSMP7SX8ZTNE	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RV43V7TKQ5J5GDN7BWG4G2	2026-11-06 11:29:59.017-05	2026-11-06 11:29:59.017-05	\N	iitem_01M6RV439Z5R5SWHXEYS5D2124	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RV43V7NMF93P4RR01DA1MF	2026-11-06 11:29:59.017-05	2026-11-06 11:29:59.017-05	\N	iitem_01M6RV439Z6EQFMAC1RSRB0ME7	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RV43V7QRCNNXD7PBA8BB5N	2026-11-06 11:29:59.017-05	2026-11-06 11:29:59.017-05	\N	iitem_01M6RV439Z7D8XX7RY0H61P7WF	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RV43V711J00HDCR8SSSQ64	2026-11-06 11:29:59.017-05	2026-11-06 11:29:59.017-05	\N	iitem_01M6RV439ZCMKFZJKKEF1SCPY4	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RV43V7P25GN5JE7ZZ71K52	2026-11-06 11:29:59.017-05	2026-11-06 11:29:59.017-05	\N	iitem_01M6RV439ZMBXK2EPJXA344XK6	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RV43V77GGVBYZFC6PH536H	2026-11-06 11:29:59.017-05	2026-11-06 11:29:59.017-05	\N	iitem_01M6RV439ZPB7WNZ0ERAEPDDYP	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RV43V7RVKS42M0T7K3Q8DZ	2026-11-06 11:29:59.017-05	2026-11-06 11:29:59.017-05	\N	iitem_01M6RV439ZQAJ5D2S4DQ73KF93	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RV43V795VSSM011EX7C1HX	2026-11-06 11:29:59.017-05	2026-11-06 11:29:59.017-05	\N	iitem_01M6RV439ZXB9KBYPPFK9JPZJM	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RV43V77HBRZNY9GS8C8RAZ	2026-11-06 11:29:59.017-05	2026-11-06 11:29:59.017-05	\N	iitem_01M6RV43A00DSBMSYN3J485BG7	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RV43V72H3AVSEX58YAM43E	2026-11-06 11:29:59.017-05	2026-11-06 11:29:59.017-05	\N	iitem_01M6RV43A059BZ9RFGVBX7FK7G	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RV43V7G6RCAG622V1WNJN6	2026-11-06 11:29:59.017-05	2026-11-06 11:29:59.017-05	\N	iitem_01M6RV43A0CE1XXG7J1KP5S7ZV	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RV43V8JHRWRGD25CHDYXCY	2026-11-06 11:29:59.017-05	2026-11-06 11:29:59.017-05	\N	iitem_01M6RV43A0FXDQKHYZM5P1FZDX	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RV43V8E5PAYA6ASSQ525GT	2026-11-06 11:29:59.017-05	2026-11-06 11:29:59.017-05	\N	iitem_01M6RV43A0HQ97JSMCFFCBBZJ0	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RV43V8MR3Y4H032EE6ZJQM	2026-11-06 11:29:59.017-05	2026-11-06 11:29:59.017-05	\N	iitem_01M6RV43A0Q16DHWHNV44Y16JJ	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RV43V82FAZ351W1XWEWEF8	2026-11-06 11:29:59.017-05	2026-11-06 11:29:59.017-05	\N	iitem_01M6RV43A0TGDSD2M9QB5C82ZR	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RV43V8W8TCHXWRZE2K8NAE	2026-11-06 11:29:59.017-05	2026-11-06 11:29:59.017-05	\N	iitem_01M6RV43A0YRMED8HC4RE4GHPR	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RV43V83A8ZH8FK3TYXFHYF	2026-11-06 11:29:59.017-05	2026-11-06 11:29:59.017-05	\N	iitem_01M6RV43A1B5HDFHRSPD8HKP85	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RV43V8V9QABDQRW09KR7EJ	2026-11-06 11:29:59.017-05	2026-11-06 11:29:59.017-05	\N	iitem_01M6RV43A1C5EEXGYE9G7SH84A	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6RV43V8KSPCVFDJTYSY0N3H	2026-11-06 11:29:59.017-05	2026-11-06 11:29:59.017-05	\N	iitem_01M6RV43A1EQTDJ4WVDMY1JP5G	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	1000	0	0	\N	{"value": "1000", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6VRP8E169PV9G7E8CW0ZEV1	2026-11-07 14:45:11.106-05	2026-11-07 14:45:11.106-05	\N	iitem_01M6VRP89F6NG3CWJYRSFQ6K45	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	500	0	0	\N	{"value": "500", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
ilev_01M6VRP8E13MDC07AX00VPFVMR	2026-11-07 14:45:11.106-05	2026-11-07 14:45:11.106-05	\N	iitem_01M6VRP89FA5756PX1E58M8S1G	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	500	0	0	\N	{"value": "500", "precision": 20}	{"value": "0", "precision": 20}	{"value": "0", "precision": 20}
\.


--
-- Data for Name: invite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invite (id, email, accepted, token, expires_at, metadata, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: invite_rbac_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invite_rbac_role (invite_id, rbac_role_id, id, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: layout_configuration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.layout_configuration (id, zone, user_id, is_system_default, configuration, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: link_module_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.link_module_migrations (id, table_name, link_descriptor, created_at) FROM stdin;
1	cart_payment_collection	{"toModel": "payment_collection", "toModule": "payment", "fromModel": "cart", "fromModule": "cart"}	2026-11-05 18:18:06.52044
2	cart_promotion	{"toModel": "promotions", "toModule": "promotion", "fromModel": "cart", "fromModule": "cart"}	2026-11-05 18:18:06.596979
3	customer_account_holder	{"toModel": "account_holder", "toModule": "payment", "fromModel": "customer", "fromModule": "customer"}	2026-11-05 18:18:06.60869
4	location_fulfillment_provider	{"toModel": "fulfillment_provider", "toModule": "fulfillment", "fromModel": "location", "fromModule": "stock_location"}	2026-11-05 18:18:06.619758
5	location_fulfillment_set	{"toModel": "fulfillment_set", "toModule": "fulfillment", "fromModel": "location", "fromModule": "stock_location"}	2026-11-05 18:18:06.629291
6	invite_rbac_role	{"toModel": "rbac_role", "toModule": "rbac", "fromModel": "invite", "fromModule": "user"}	2026-11-05 18:18:06.63979
7	order_cart	{"toModel": "cart", "toModule": "cart", "fromModel": "order", "fromModule": "order"}	2026-11-05 18:18:06.650072
8	order_fulfillment	{"toModel": "fulfillments", "toModule": "fulfillment", "fromModel": "order", "fromModule": "order"}	2026-11-05 18:18:06.663823
9	order_payment_collection	{"toModel": "payment_collection", "toModule": "payment", "fromModel": "order", "fromModule": "order"}	2026-11-05 18:18:06.684481
10	order_promotion	{"toModel": "promotions", "toModule": "promotion", "fromModel": "order", "fromModule": "order"}	2026-11-05 18:18:06.700673
11	return_fulfillment	{"toModel": "fulfillments", "toModule": "fulfillment", "fromModel": "return", "fromModule": "order"}	2026-11-05 18:18:06.720654
12	product_sales_channel	{"toModel": "sales_channel", "toModule": "sales_channel", "fromModel": "product", "fromModule": "product"}	2026-11-05 18:18:06.746397
13	product_shipping_profile	{"toModel": "shipping_profile", "toModule": "fulfillment", "fromModel": "product", "fromModule": "product"}	2026-11-05 18:18:06.77253
14	product_variant_inventory_item	{"toModel": "inventory", "toModule": "inventory", "fromModel": "variant", "fromModule": "product"}	2026-11-05 18:18:06.796603
15	product_variant_price_set	{"toModel": "price_set", "toModule": "pricing", "fromModel": "variant", "fromModule": "product"}	2026-11-05 18:18:06.817718
16	publishable_api_key_sales_channel	{"toModel": "sales_channel", "toModule": "sales_channel", "fromModel": "api_key", "fromModule": "api_key"}	2026-11-05 18:18:06.833356
17	region_payment_provider	{"toModel": "payment_provider", "toModule": "payment", "fromModel": "region", "fromModule": "region"}	2026-11-05 18:18:06.846616
18	sales_channel_stock_location	{"toModel": "location", "toModule": "stock_location", "fromModel": "sales_channel", "fromModule": "sales_channel"}	2026-11-05 18:18:06.859705
19	shipping_option_price_set	{"toModel": "price_set", "toModule": "pricing", "fromModel": "shipping_option", "fromModule": "fulfillment"}	2026-11-05 18:18:06.872685
20	user_rbac_role	{"toModel": "rbac_role", "toModule": "rbac", "fromModel": "user", "fromModule": "user"}	2026-11-05 18:18:06.884738
\.


--
-- Data for Name: location_fulfillment_provider; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.location_fulfillment_provider (stock_location_id, fulfillment_provider_id, id, created_at, updated_at, deleted_at) FROM stdin;
sloc_01M6Q03ENBW67DKHCPC7ERY5PA	manual_manual	locfp_01M6Q03ENMPM98NQ4K449345YW	2026-11-05 18:18:31.348643-05	2026-11-05 18:18:31.348643-05	\N
\.


--
-- Data for Name: location_fulfillment_set; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.location_fulfillment_set (stock_location_id, fulfillment_set_id, id, created_at, updated_at, deleted_at) FROM stdin;
sloc_01M6Q03ENBW67DKHCPC7ERY5PA	fuset_01M6Q03ENZT5BNBAFGS5C4YKAK	locfs_01M6Q03EPE0CNYK1G7B9GJQTWJ	2026-11-05 18:18:31.375419-05	2026-11-05 18:18:31.375419-05	\N
sloc_01M6Q03ENBW67DKHCPC7ERY5PA	fuset_01M6RV2Z8KMHK4Y8RG8NBYEXG7	locfs_01M6RV2Z97ANB0VZE9MN7VRYS9	2026-11-06 11:29:21.586487-05	2026-11-06 11:29:21.586487-05	\N
\.


--
-- Data for Name: mikro_orm_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mikro_orm_migrations (id, name, executed_at) FROM stdin;
1	Migration20240307161216	2026-11-05 18:17:58.227188-05
2	Migration20241210073813	2026-11-05 18:17:58.227188-05
3	Migration20250106142624	2026-11-05 18:17:58.227188-05
4	Migration20250120110820	2026-11-05 18:17:58.227188-05
5	Migration20240307132720	2026-11-05 18:17:58.442046-05
6	Migration20240719123015	2026-11-05 18:17:58.442046-05
7	Migration20241213063611	2026-11-05 18:17:58.442046-05
8	Migration20251010131115	2026-11-05 18:17:58.442046-05
9	Migration20260815185216	2026-11-05 18:17:58.442046-05
10	InitialSetup20240401153642	2026-11-05 18:17:58.701007-05
11	Migration20240601111544	2026-11-05 18:17:58.701007-05
12	Migration202408271511	2026-11-05 18:17:58.701007-05
13	Migration20241122120331	2026-11-05 18:17:58.701007-05
14	Migration20241125090957	2026-11-05 18:17:58.701007-05
15	Migration20250411073236	2026-11-05 18:17:58.701007-05
16	Migration20250516081326	2026-11-05 18:17:58.701007-05
17	Migration20250910154539	2026-11-05 18:17:58.701007-05
18	Migration20250911092221	2026-11-05 18:17:58.701007-05
19	Migration20250929204438	2026-11-05 18:17:58.701007-05
20	Migration20251008132218	2026-11-05 18:17:58.701007-05
21	Migration20251011090511	2026-11-05 18:17:58.701007-05
22	Migration20251022153442	2026-11-05 18:17:58.701007-05
23	Migration20251029150809	2026-11-05 18:17:58.701007-05
24	Migration20251110180907	2026-11-05 18:17:58.701007-05
25	Migration20251113183352	2026-11-05 18:17:58.701007-05
26	Migration20260224120000	2026-11-05 18:17:58.701007-05
27	Migration20260301002050	2026-11-05 18:17:58.701007-05
28	Migration20260306120000	2026-11-05 18:17:58.701007-05
29	Migration20260623180000	2026-11-05 18:17:58.701007-05
30	Migration20260730104846	2026-11-05 18:17:58.701007-05
31	Migration20230929122253	2026-11-05 18:17:59.707798-05
32	Migration20240322094407	2026-11-05 18:17:59.707798-05
33	Migration20240322113359	2026-11-05 18:17:59.707798-05
34	Migration20240322120125	2026-11-05 18:17:59.707798-05
35	Migration20240626133555	2026-11-05 18:17:59.707798-05
36	Migration20240704094505	2026-11-05 18:17:59.707798-05
37	Migration20241127114534	2026-11-05 18:17:59.707798-05
38	Migration20241127223829	2026-11-05 18:17:59.707798-05
39	Migration20241128055359	2026-11-05 18:17:59.707798-05
40	Migration20241212190401	2026-11-05 18:17:59.707798-05
41	Migration20250408145122	2026-11-05 18:17:59.707798-05
42	Migration20250409122219	2026-11-05 18:17:59.707798-05
43	Migration20251009110625	2026-11-05 18:17:59.707798-05
44	Migration20251112192723	2026-11-05 18:17:59.707798-05
45	Migration20260429163502	2026-11-05 18:17:59.707798-05
46	Migration20240227120221	2026-11-05 18:18:00.261525-05
47	Migration20240617102917	2026-11-05 18:18:00.261525-05
48	Migration20240624153824	2026-11-05 18:18:00.261525-05
49	Migration20241211061114	2026-11-05 18:18:00.261525-05
50	Migration20250113094144	2026-11-05 18:18:00.261525-05
51	Migration20250120110700	2026-11-05 18:18:00.261525-05
52	Migration20250226130616	2026-11-05 18:18:00.261525-05
53	Migration20250508081510	2026-11-05 18:18:00.261525-05
54	Migration20250828075407	2026-11-05 18:18:00.261525-05
55	Migration20250909083125	2026-11-05 18:18:00.261525-05
56	Migration20250916120552	2026-11-05 18:18:00.261525-05
57	Migration20250917143818	2026-11-05 18:18:00.261525-05
58	Migration20250919122137	2026-11-05 18:18:00.261525-05
59	Migration20251006000000	2026-11-05 18:18:00.261525-05
60	Migration20251015113934	2026-11-05 18:18:00.261525-05
61	Migration20251107050148	2026-11-05 18:18:00.261525-05
62	Migration20240124154000	2026-11-05 18:18:00.797877-05
63	Migration20240524123112	2026-11-05 18:18:00.797877-05
64	Migration20240602110946	2026-11-05 18:18:00.797877-05
65	Migration20241211074630	2026-11-05 18:18:00.797877-05
66	Migration20251010130829	2026-11-05 18:18:00.797877-05
67	Migration20240115152146	2026-11-05 18:18:01.029513-05
68	Migration20240222170223	2026-11-05 18:18:01.125583-05
69	Migration20240831125857	2026-11-05 18:18:01.125583-05
70	Migration20241106085918	2026-11-05 18:18:01.125583-05
71	Migration20241205095237	2026-11-05 18:18:01.125583-05
72	Migration20241216183049	2026-11-05 18:18:01.125583-05
73	Migration20241218091938	2026-11-05 18:18:01.125583-05
74	Migration20250120115059	2026-11-05 18:18:01.125583-05
75	Migration20250212131240	2026-11-05 18:18:01.125583-05
76	Migration20250326151602	2026-11-05 18:18:01.125583-05
77	Migration20250508081553	2026-11-05 18:18:01.125583-05
78	Migration20251017153909	2026-11-05 18:18:01.125583-05
79	Migration20251208130704	2026-11-05 18:18:01.125583-05
80	Migration20260626000000	2026-11-05 18:18:01.125583-05
81	Migration20240205173216	2026-11-05 18:18:01.577658-05
82	Migration20240624200006	2026-11-05 18:18:01.577658-05
83	Migration20250120110744	2026-11-05 18:18:01.577658-05
84	InitialSetup20240221144943	2026-11-05 18:18:01.729588-05
85	Migration20240604080145	2026-11-05 18:18:01.729588-05
86	Migration20241205122700	2026-11-05 18:18:01.729588-05
87	Migration20251015123842	2026-11-05 18:18:01.729588-05
88	InitialSetup20240227075933	2026-11-05 18:18:01.875475-05
89	Migration20240621145944	2026-11-05 18:18:01.875475-05
90	Migration20241206083313	2026-11-05 18:18:01.875475-05
91	Migration20251202184737	2026-11-05 18:18:01.875475-05
92	Migration20251212161429	2026-11-05 18:18:01.875475-05
93	Migration20240227090331	2026-11-05 18:18:02.058132-05
94	Migration20240710135844	2026-11-05 18:18:02.058132-05
95	Migration20240924114005	2026-11-05 18:18:02.058132-05
96	Migration20241212052837	2026-11-05 18:18:02.058132-05
97	InitialSetup20240228133303	2026-11-05 18:18:02.25287-05
98	Migration20240624082354	2026-11-05 18:18:02.25287-05
99	Migration20240225134525	2026-11-05 18:18:02.354979-05
100	Migration20240806072619	2026-11-05 18:18:02.354979-05
101	Migration20241211151053	2026-11-05 18:18:02.354979-05
102	Migration20250115160517	2026-11-05 18:18:02.354979-05
103	Migration20250120110552	2026-11-05 18:18:02.354979-05
104	Migration20250123122334	2026-11-05 18:18:02.354979-05
105	Migration20250206105639	2026-11-05 18:18:02.354979-05
106	Migration20250207132723	2026-11-05 18:18:02.354979-05
107	Migration20250625084134	2026-11-05 18:18:02.354979-05
108	Migration20250924135437	2026-11-05 18:18:02.354979-05
109	Migration20250929124701	2026-11-05 18:18:02.354979-05
110	Migration20260411223700	2026-11-05 18:18:02.354979-05
111	Migration20260924125937	2026-11-05 18:18:02.354979-05
112	Migration20240219102530	2026-11-05 18:18:02.761547-05
113	Migration20240604100512	2026-11-05 18:18:02.761547-05
114	Migration20240715102100	2026-11-05 18:18:02.761547-05
115	Migration20240715174100	2026-11-05 18:18:02.761547-05
116	Migration20240716081800	2026-11-05 18:18:02.761547-05
117	Migration20240801085921	2026-11-05 18:18:02.761547-05
118	Migration20240821164505	2026-11-05 18:18:02.761547-05
119	Migration20240821170920	2026-11-05 18:18:02.761547-05
120	Migration20240827133639	2026-11-05 18:18:02.761547-05
121	Migration20240902195921	2026-11-05 18:18:02.761547-05
122	Migration20240913092514	2026-11-05 18:18:02.761547-05
123	Migration20240930122627	2026-11-05 18:18:02.761547-05
124	Migration20241014142943	2026-11-05 18:18:02.761547-05
125	Migration20241106085223	2026-11-05 18:18:02.761547-05
126	Migration20241129124827	2026-11-05 18:18:02.761547-05
127	Migration20241217162224	2026-11-05 18:18:02.761547-05
128	Migration20250326151554	2026-11-05 18:18:02.761547-05
129	Migration20250522181137	2026-11-05 18:18:02.761547-05
130	Migration20250702095353	2026-11-05 18:18:02.761547-05
131	Migration20250704120229	2026-11-05 18:18:02.761547-05
132	Migration20250910130000	2026-11-05 18:18:02.761547-05
133	Migration20251016160403	2026-11-05 18:18:02.761547-05
134	Migration20251016182939	2026-11-05 18:18:02.761547-05
135	Migration20251017155709	2026-11-05 18:18:02.761547-05
136	Migration20251114100559	2026-11-05 18:18:02.761547-05
137	Migration20251125164002	2026-11-05 18:18:02.761547-05
138	Migration20251210112909	2026-11-05 18:18:02.761547-05
139	Migration20251210112924	2026-11-05 18:18:02.761547-05
140	Migration20251225120947	2026-11-05 18:18:02.761547-05
141	Migration20260106185528	2026-11-05 18:18:02.761547-05
142	Migration20260625000000	2026-11-05 18:18:02.761547-05
143	Migration20260729154253	2026-11-05 18:18:02.761547-05
144	Migration20250717162007	2026-11-05 18:18:03.883285-05
145	Migration20260127081758	2026-11-05 18:18:03.883285-05
146	Migration20260615151246	2026-11-05 18:18:03.883285-05
147	Migration20240205025928	2026-11-05 18:18:04.166129-05
148	Migration20240529080336	2026-11-05 18:18:04.166129-05
149	Migration20241202100304	2026-11-05 18:18:04.166129-05
150	Migration20260514083900	2026-11-05 18:18:04.166129-05
151	Migration20260525090000	2026-11-05 18:18:04.166129-05
152	Migration20260604120000	2026-11-05 18:18:04.166129-05
153	Migration20260616075929	2026-11-05 18:18:04.166129-05
154	Migration20240214033943	2026-11-05 18:18:04.530476-05
155	Migration20240703095850	2026-11-05 18:18:04.530476-05
156	Migration20241202103352	2026-11-05 18:18:04.530476-05
157	Migration20240311145700_InitialSetupMigration	2026-11-05 18:18:04.697056-05
158	Migration20240821170957	2026-11-05 18:18:04.697056-05
159	Migration20240917161003	2026-11-05 18:18:04.697056-05
160	Migration20241217110416	2026-11-05 18:18:04.697056-05
161	Migration20250113122235	2026-11-05 18:18:04.697056-05
162	Migration20250120115002	2026-11-05 18:18:04.697056-05
163	Migration20250822130931	2026-11-05 18:18:04.697056-05
164	Migration20250825132614	2026-11-05 18:18:04.697056-05
165	Migration20251114133146	2026-11-05 18:18:04.697056-05
166	Migration20240509083918_InitialSetupMigration	2026-11-05 18:18:05.13148-05
167	Migration20240628075401	2026-11-05 18:18:05.13148-05
168	Migration20240830094712	2026-11-05 18:18:05.13148-05
169	Migration20250120110514	2026-11-05 18:18:05.13148-05
170	Migration20251028172715	2026-11-05 18:18:05.13148-05
171	Migration20251121123942	2026-11-05 18:18:05.13148-05
172	Migration20251121150408	2026-11-05 18:18:05.13148-05
173	Migration20260805085626	2026-11-05 18:18:05.534786-05
174	Migration20260903085616	2026-11-05 18:18:05.534786-05
175	Migration20260911115931	2026-11-05 18:18:05.534786-05
176	Migration20260807120000	2026-11-05 18:18:05.771669-05
177	Migration20231228143900	2026-11-05 18:18:05.97033-05
178	Migration20241206101446	2026-11-05 18:18:05.97033-05
179	Migration20250128174331	2026-11-05 18:18:05.97033-05
180	Migration20250505092459	2026-11-05 18:18:05.97033-05
181	Migration20250819104213	2026-11-05 18:18:05.97033-05
182	Migration20250819110924	2026-11-05 18:18:05.97033-05
183	Migration20250908080305	2026-11-05 18:18:05.97033-05
\.


--
-- Data for Name: notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notification (id, "to", channel, template, data, trigger_type, resource_id, resource_type, receiver_id, original_notification_id, idempotency_key, external_id, provider_id, created_at, updated_at, deleted_at, status, "from", provider_data) FROM stdin;
\.


--
-- Data for Name: notification_provider; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notification_provider (id, handle, name, is_enabled, channels, created_at, updated_at, deleted_at) FROM stdin;
local	local	local	t	{feed}	2026-11-05 18:18:11.949-05	2026-11-05 18:18:11.949-05	\N
\.


--
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."order" (id, region_id, display_id, customer_id, version, sales_channel_id, status, is_draft_order, email, currency_code, shipping_address_id, billing_address_id, no_notification, metadata, created_at, updated_at, deleted_at, canceled_at, custom_display_id, locale) FROM stdin;
\.


--
-- Data for Name: order_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_address (id, customer_id, company, first_name, last_name, address_1, address_2, city, country_code, province, postal_code, phone, metadata, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: order_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_cart (order_id, cart_id, id, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: order_change; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_change (id, order_id, version, description, status, internal_note, created_by, requested_by, requested_at, confirmed_by, confirmed_at, declined_by, declined_reason, metadata, declined_at, canceled_by, canceled_at, created_at, updated_at, change_type, deleted_at, return_id, claim_id, exchange_id, carry_over_promotions, no_notification) FROM stdin;
\.


--
-- Data for Name: order_change_action; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_change_action (id, order_id, version, ordering, order_change_id, reference, reference_id, action, details, amount, raw_amount, internal_note, applied, created_at, updated_at, deleted_at, return_id, claim_id, exchange_id) FROM stdin;
\.


--
-- Data for Name: order_claim; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_claim (id, order_id, return_id, order_version, display_id, type, no_notification, refund_amount, raw_refund_amount, metadata, created_at, updated_at, deleted_at, canceled_at, created_by) FROM stdin;
\.


--
-- Data for Name: order_claim_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_claim_item (id, claim_id, item_id, is_additional_item, reason, quantity, raw_quantity, note, metadata, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: order_claim_item_image; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_claim_item_image (id, claim_item_id, url, metadata, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: order_credit_line; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_credit_line (id, order_id, reference, reference_id, amount, raw_amount, metadata, created_at, updated_at, deleted_at, version) FROM stdin;
\.


--
-- Data for Name: order_exchange; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_exchange (id, order_id, return_id, order_version, display_id, no_notification, allow_backorder, difference_due, raw_difference_due, metadata, created_at, updated_at, deleted_at, canceled_at, created_by) FROM stdin;
\.


--
-- Data for Name: order_exchange_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_exchange_item (id, exchange_id, item_id, quantity, raw_quantity, note, metadata, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: order_fulfillment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_fulfillment (order_id, fulfillment_id, id, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: order_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_item (id, order_id, version, item_id, quantity, raw_quantity, fulfilled_quantity, raw_fulfilled_quantity, shipped_quantity, raw_shipped_quantity, return_requested_quantity, raw_return_requested_quantity, return_received_quantity, raw_return_received_quantity, return_dismissed_quantity, raw_return_dismissed_quantity, written_off_quantity, raw_written_off_quantity, metadata, created_at, updated_at, deleted_at, delivered_quantity, raw_delivered_quantity, unit_price, raw_unit_price, compare_at_unit_price, raw_compare_at_unit_price) FROM stdin;
\.


--
-- Data for Name: order_line_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_line_item (id, totals_id, title, subtitle, thumbnail, variant_id, product_id, product_title, product_description, product_subtitle, product_type, product_collection, product_handle, variant_sku, variant_barcode, variant_title, variant_option_values, requires_shipping, is_discountable, is_tax_inclusive, compare_at_unit_price, raw_compare_at_unit_price, unit_price, raw_unit_price, metadata, created_at, updated_at, deleted_at, is_custom_price, product_type_id, is_giftcard) FROM stdin;
\.


--
-- Data for Name: order_line_item_adjustment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_line_item_adjustment (id, description, promotion_id, code, amount, raw_amount, provider_id, created_at, updated_at, item_id, deleted_at, is_tax_inclusive, version) FROM stdin;
\.


--
-- Data for Name: order_line_item_tax_line; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_line_item_tax_line (id, description, tax_rate_id, code, rate, raw_rate, provider_id, created_at, updated_at, item_id, deleted_at, metadata, data) FROM stdin;
\.


--
-- Data for Name: order_payment_collection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_payment_collection (order_id, payment_collection_id, id, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: order_promotion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_promotion (order_id, promotion_id, id, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: order_shipping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_shipping (id, order_id, version, shipping_method_id, created_at, updated_at, deleted_at, return_id, claim_id, exchange_id) FROM stdin;
\.


--
-- Data for Name: order_shipping_method; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_shipping_method (id, name, description, amount, raw_amount, is_tax_inclusive, shipping_option_id, data, metadata, created_at, updated_at, deleted_at, is_custom_amount) FROM stdin;
\.


--
-- Data for Name: order_shipping_method_adjustment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_shipping_method_adjustment (id, description, promotion_id, code, amount, raw_amount, provider_id, created_at, updated_at, shipping_method_id, deleted_at, version) FROM stdin;
\.


--
-- Data for Name: order_shipping_method_tax_line; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_shipping_method_tax_line (id, description, tax_rate_id, code, rate, raw_rate, provider_id, created_at, updated_at, shipping_method_id, deleted_at, metadata, data) FROM stdin;
\.


--
-- Data for Name: order_summary; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_summary (id, order_id, version, totals, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: order_transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_transaction (id, order_id, version, amount, raw_amount, currency_code, reference, reference_id, created_at, updated_at, deleted_at, return_id, claim_id, exchange_id) FROM stdin;
\.


--
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment (id, amount, raw_amount, currency_code, provider_id, data, created_at, updated_at, deleted_at, captured_at, canceled_at, payment_collection_id, payment_session_id, metadata) FROM stdin;
\.


--
-- Data for Name: payment_collection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_collection (id, currency_code, amount, raw_amount, authorized_amount, raw_authorized_amount, captured_amount, raw_captured_amount, refunded_amount, raw_refunded_amount, created_at, updated_at, deleted_at, completed_at, status, metadata) FROM stdin;
\.


--
-- Data for Name: payment_collection_payment_providers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_collection_payment_providers (payment_collection_id, payment_provider_id) FROM stdin;
\.


--
-- Data for Name: payment_provider; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_provider (id, is_enabled, created_at, updated_at, deleted_at) FROM stdin;
pp_system_default	t	2026-11-05 18:18:11.947-05	2026-11-05 18:18:11.947-05	\N
\.


--
-- Data for Name: payment_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_session (id, currency_code, amount, raw_amount, provider_id, data, context, status, authorized_at, payment_collection_id, metadata, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: price; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.price (id, title, price_set_id, currency_code, raw_amount, rules_count, created_at, updated_at, deleted_at, price_list_id, amount, min_quantity, max_quantity, raw_min_quantity, raw_max_quantity) FROM stdin;
price_01M6Q03ER0GBFBMGMHQQP6DVA5	\N	pset_01M6Q03ER1S2XE4CM5FA0G7RKQ	usd	{"value": "10", "precision": 20}	0	2026-11-05 18:18:31.426-05	2026-11-05 18:18:31.426-05	\N	\N	10	\N	\N	\N	\N
price_01M6Q03ER173EQ956XCKH7SRK3	\N	pset_01M6Q03ER1S2XE4CM5FA0G7RKQ	eur	{"value": "10", "precision": 20}	0	2026-11-05 18:18:31.426-05	2026-11-05 18:18:31.426-05	\N	\N	10	\N	\N	\N	\N
price_01M6Q03ER1GBYBK5HGV0P9BH6S	\N	pset_01M6Q03ER1S2XE4CM5FA0G7RKQ	eur	{"value": "10", "precision": 20}	1	2026-11-05 18:18:31.427-05	2026-11-05 18:18:31.427-05	\N	\N	10	\N	\N	\N	\N
price_01M6Q03ER1PVTPHFC7S15P199A	\N	pset_01M6Q03ER234G9QW9PB819DGPC	usd	{"value": "10", "precision": 20}	0	2026-11-05 18:18:31.427-05	2026-11-05 18:18:31.427-05	\N	\N	10	\N	\N	\N	\N
price_01M6Q03ER1M356V604044JS51T	\N	pset_01M6Q03ER234G9QW9PB819DGPC	eur	{"value": "10", "precision": 20}	0	2026-11-05 18:18:31.427-05	2026-11-05 18:18:31.427-05	\N	\N	10	\N	\N	\N	\N
price_01M6Q03ER2GTPH3K2XM5KS7BSK	\N	pset_01M6Q03ER234G9QW9PB819DGPC	eur	{"value": "10", "precision": 20}	1	2026-11-05 18:18:31.427-05	2026-11-05 18:18:31.427-05	\N	\N	10	\N	\N	\N	\N
price_01M6VHSM7RMJNJ3FH9NPRKJ3AE	\N	pset_01M6RV43BJZFTP7VEG1Q33SBEF	cop	{"value": "83750", "precision": 20}	0	2026-11-07 12:44:41.478-05	2026-11-07 12:44:41.478-05	\N	\N	83750	\N	\N	\N	\N
price_01M6VHSM7RBTE4KFB9E6C01JMZ	\N	pset_01M6RV43BJZFTP7VEG1Q33SBEF	eur	{"value": "20", "precision": 20}	0	2026-11-07 12:44:41.479-05	2026-11-07 12:44:41.479-05	\N	\N	20	\N	\N	\N	\N
price_01M6VHSM7R9AA1R5R9SBCR9EDK	\N	pset_01M6RV43BJZFTP7VEG1Q33SBEF	usd	{"value": "21", "precision": 20}	0	2026-11-07 12:44:41.479-05	2026-11-07 12:44:41.479-05	\N	\N	21	\N	\N	\N	\N
price_01M6VHSMAGZ1XR203AF4TFRE12	\N	pset_01M6RV43BJDJMAVZBR5V6DRG2M	cop	{"value": "744444", "precision": 20}	0	2026-11-07 12:44:41.557-05	2026-11-07 12:44:41.557-05	\N	\N	744444	\N	\N	\N	\N
price_01M6VHSMAG43KTMZ64WST1P6S9	\N	pset_01M6RV43BJDJMAVZBR5V6DRG2M	eur	{"value": "177", "precision": 20}	0	2026-11-07 12:44:41.557-05	2026-11-07 12:44:41.557-05	\N	\N	177	\N	\N	\N	\N
price_01M6VHSMAGGTD4M7A5VA9NKDPN	\N	pset_01M6RV43BJDJMAVZBR5V6DRG2M	usd	{"value": "191", "precision": 20}	0	2026-11-07 12:44:41.557-05	2026-11-07 12:44:41.557-05	\N	\N	191	\N	\N	\N	\N
price_01M6Q03F03R9HM9Y5C13AAR1KR	\N	pset_01M6Q03F0306PBNZ0NW0ETZEJ3	eur	{"value": "10", "precision": 20}	0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:27.994-05	2026-11-06 10:08:27.98-05	\N	10	\N	\N	\N	\N
price_01M6Q03F038EZGVVQXVTFJ9YX2	\N	pset_01M6Q03F0306PBNZ0NW0ETZEJ3	usd	{"value": "15", "precision": 20}	0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:27.994-05	2026-11-06 10:08:27.98-05	\N	15	\N	\N	\N	\N
price_01M6Q03F03QWD8PM6JKD9S72FV	\N	pset_01M6Q03F04S0YQ8H7GRKC8M7AB	eur	{"value": "10", "precision": 20}	0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.015-05	2026-11-06 10:08:27.98-05	\N	10	\N	\N	\N	\N
price_01M6Q03F047BXKXRPGAE1098RK	\N	pset_01M6Q03F04S0YQ8H7GRKC8M7AB	usd	{"value": "15", "precision": 20}	0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.015-05	2026-11-06 10:08:27.98-05	\N	15	\N	\N	\N	\N
price_01M6Q03F0495EXEMZKKZTY8GTH	\N	pset_01M6Q03F042F9A0PJSN1AAP0BY	eur	{"value": "10", "precision": 20}	0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.025-05	2026-11-06 10:08:27.98-05	\N	10	\N	\N	\N	\N
price_01M6Q03F04KSW993GKJ2G8TNTJ	\N	pset_01M6Q03F042F9A0PJSN1AAP0BY	usd	{"value": "15", "precision": 20}	0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.025-05	2026-11-06 10:08:27.98-05	\N	15	\N	\N	\N	\N
price_01M6Q03F04TVXHS9BS45P5H4V6	\N	pset_01M6Q03F04WC99XK9NFXHYQ89Z	eur	{"value": "10", "precision": 20}	0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.034-05	2026-11-06 10:08:27.98-05	\N	10	\N	\N	\N	\N
price_01M6Q03F04VQV8MG5QHKVYMH03	\N	pset_01M6Q03F04WC99XK9NFXHYQ89Z	usd	{"value": "15", "precision": 20}	0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.034-05	2026-11-06 10:08:27.98-05	\N	15	\N	\N	\N	\N
price_01M6Q03F04PJEW26R6ZTX12FSD	\N	pset_01M6Q03F0401T5Z9N3Z0682MW3	eur	{"value": "10", "precision": 20}	0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.044-05	2026-11-06 10:08:27.98-05	\N	10	\N	\N	\N	\N
price_01M6Q03F04TW7M916TTJ89TN7P	\N	pset_01M6Q03F0401T5Z9N3Z0682MW3	usd	{"value": "15", "precision": 20}	0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.044-05	2026-11-06 10:08:27.98-05	\N	15	\N	\N	\N	\N
price_01M6Q03F05MFKJ54D496V8EEDC	\N	pset_01M6Q03F05G3D779T5CNBRT7CV	eur	{"value": "10", "precision": 20}	0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.054-05	2026-11-06 10:08:27.98-05	\N	10	\N	\N	\N	\N
price_01M6Q03F05J15N5M40C2VZGZJK	\N	pset_01M6Q03F05G3D779T5CNBRT7CV	usd	{"value": "15", "precision": 20}	0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.054-05	2026-11-06 10:08:27.98-05	\N	15	\N	\N	\N	\N
price_01M6Q03F05J6PCSYPCS7PCYEBN	\N	pset_01M6Q03F0513VYMGF9BDCN19S6	eur	{"value": "10", "precision": 20}	0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.064-05	2026-11-06 10:08:27.98-05	\N	10	\N	\N	\N	\N
price_01M6Q03F0502N00JJV3ZA8TD52	\N	pset_01M6Q03F0513VYMGF9BDCN19S6	usd	{"value": "15", "precision": 20}	0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.064-05	2026-11-06 10:08:27.98-05	\N	15	\N	\N	\N	\N
price_01M6Q03F055ZCDV0MSDQ91WAPC	\N	pset_01M6Q03F0565WR743WX9HHYV6Q	eur	{"value": "10", "precision": 20}	0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.074-05	2026-11-06 10:08:27.98-05	\N	10	\N	\N	\N	\N
price_01M6Q03F057A4G2PVJFA38TENJ	\N	pset_01M6Q03F0565WR743WX9HHYV6Q	usd	{"value": "15", "precision": 20}	0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.074-05	2026-11-06 10:08:27.98-05	\N	15	\N	\N	\N	\N
price_01M6Q03F05Z1V9WPZG68ZRA64G	\N	pset_01M6Q03F0587K7D5PFB8XRMJA9	eur	{"value": "10", "precision": 20}	0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.084-05	2026-11-06 10:08:27.98-05	\N	10	\N	\N	\N	\N
price_01M6Q03F053EK4WXWFXKTN09AW	\N	pset_01M6Q03F0587K7D5PFB8XRMJA9	usd	{"value": "15", "precision": 20}	0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.084-05	2026-11-06 10:08:27.98-05	\N	15	\N	\N	\N	\N
price_01M6Q03F06MP2F608AN7X06A8F	\N	pset_01M6Q03F06A9C3XQ58B7S012W3	eur	{"value": "10", "precision": 20}	0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.091-05	2026-11-06 10:08:27.98-05	\N	10	\N	\N	\N	\N
price_01M6Q03F06DCTRX8CNTD8GRJYW	\N	pset_01M6Q03F06A9C3XQ58B7S012W3	usd	{"value": "15", "precision": 20}	0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.091-05	2026-11-06 10:08:27.98-05	\N	15	\N	\N	\N	\N
price_01M6Q03F06CA7K4J8642HQ2ZYM	\N	pset_01M6Q03F06F4THMQRFYRKMKBV3	eur	{"value": "10", "precision": 20}	0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.098-05	2026-11-06 10:08:27.98-05	\N	10	\N	\N	\N	\N
price_01M6Q03F06VG23P9P7R10R7XKW	\N	pset_01M6Q03F06F4THMQRFYRKMKBV3	usd	{"value": "15", "precision": 20}	0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.098-05	2026-11-06 10:08:27.98-05	\N	15	\N	\N	\N	\N
price_01M6Q03F06FFQ58S62P858E01G	\N	pset_01M6Q03F0667N5YPEMTXR39252	eur	{"value": "10", "precision": 20}	0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.104-05	2026-11-06 10:08:27.98-05	\N	10	\N	\N	\N	\N
price_01M6Q03F065821ZTJ001PY14HZ	\N	pset_01M6Q03F0667N5YPEMTXR39252	usd	{"value": "15", "precision": 20}	0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.104-05	2026-11-06 10:08:27.98-05	\N	15	\N	\N	\N	\N
price_01M6Q03F06NJP9DBCK8MW2RP2R	\N	pset_01M6Q03F06AM34S6BXFDJXX293	eur	{"value": "10", "precision": 20}	0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.112-05	2026-11-06 10:08:27.98-05	\N	10	\N	\N	\N	\N
price_01M6Q03F06YK94KKF2FTNPK3AK	\N	pset_01M6Q03F06AM34S6BXFDJXX293	usd	{"value": "15", "precision": 20}	0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.112-05	2026-11-06 10:08:27.98-05	\N	15	\N	\N	\N	\N
price_01M6Q03F07A8WWEXWSQD362T5V	\N	pset_01M6Q03F07KRP1HBHTHRTWM7JQ	eur	{"value": "10", "precision": 20}	0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.118-05	2026-11-06 10:08:27.98-05	\N	10	\N	\N	\N	\N
price_01M6Q03F0761YJJRWNEAD247WB	\N	pset_01M6Q03F07KRP1HBHTHRTWM7JQ	usd	{"value": "15", "precision": 20}	0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.118-05	2026-11-06 10:08:27.98-05	\N	15	\N	\N	\N	\N
price_01M6Q03F07P541X09BF6D3N8X5	\N	pset_01M6Q03F07S3D1Q0BRSVNBZYC9	eur	{"value": "10", "precision": 20}	0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.125-05	2026-11-06 10:08:27.98-05	\N	10	\N	\N	\N	\N
price_01M6Q03F073BTDKW4KMV90C5YA	\N	pset_01M6Q03F07S3D1Q0BRSVNBZYC9	usd	{"value": "15", "precision": 20}	0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.125-05	2026-11-06 10:08:27.98-05	\N	15	\N	\N	\N	\N
price_01M6Q03F0723PJM9FG5NAPGBP5	\N	pset_01M6Q03F07KMA01J73CT98AAR3	eur	{"value": "10", "precision": 20}	0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.132-05	2026-11-06 10:08:27.98-05	\N	10	\N	\N	\N	\N
price_01M6Q03F07HWGBHJKYKFTS86W1	\N	pset_01M6Q03F07KMA01J73CT98AAR3	usd	{"value": "15", "precision": 20}	0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.132-05	2026-11-06 10:08:27.98-05	\N	15	\N	\N	\N	\N
price_01M6Q03F07H6Y4G0GVHM4333R3	\N	pset_01M6Q03F07HV48YM7W7BGVY3AF	eur	{"value": "10", "precision": 20}	0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.138-05	2026-11-06 10:08:27.98-05	\N	10	\N	\N	\N	\N
price_01M6Q03F07G34KDKQ39ZB25WSM	\N	pset_01M6Q03F07HV48YM7W7BGVY3AF	usd	{"value": "15", "precision": 20}	0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.138-05	2026-11-06 10:08:27.98-05	\N	15	\N	\N	\N	\N
price_01M6Q03F07GSBV0H04BTNYRD88	\N	pset_01M6Q03F086FGP4BP02FE8RJM0	eur	{"value": "10", "precision": 20}	0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.146-05	2026-11-06 10:08:27.98-05	\N	10	\N	\N	\N	\N
price_01M6Q03F08M36DAG4G43GYMV9B	\N	pset_01M6Q03F086FGP4BP02FE8RJM0	usd	{"value": "15", "precision": 20}	0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.146-05	2026-11-06 10:08:27.98-05	\N	15	\N	\N	\N	\N
price_01M6Q03F08A4M1G5E49DR0WR8C	\N	pset_01M6Q03F08SY9GTZJZ9ME5KYP6	eur	{"value": "10", "precision": 20}	0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.153-05	2026-11-06 10:08:27.98-05	\N	10	\N	\N	\N	\N
price_01M6Q03F0875638M16N6W8KYHV	\N	pset_01M6Q03F08SY9GTZJZ9ME5KYP6	usd	{"value": "15", "precision": 20}	0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.153-05	2026-11-06 10:08:27.98-05	\N	15	\N	\N	\N	\N
price_01M6Q03F08QJQCZKGN6TQEE5WM	\N	pset_01M6Q03F089MRPX0PTRZ75RFK6	eur	{"value": "10", "precision": 20}	0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.162-05	2026-11-06 10:08:27.98-05	\N	10	\N	\N	\N	\N
price_01M6Q03F08RF09XMF3Y1KMC1E5	\N	pset_01M6Q03F089MRPX0PTRZ75RFK6	usd	{"value": "15", "precision": 20}	0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.162-05	2026-11-06 10:08:27.98-05	\N	15	\N	\N	\N	\N
price_01M6Q0TVV5WKV4DA4H0PMY5847	\N	pset_01M6Q0TVV5XYWPHH4NHFBX5ZZ3	eur	{"value": "4", "precision": 20}	0	2026-11-05 18:31:18.504-05	2026-11-06 10:08:28.168-05	2026-11-06 10:08:27.98-05	\N	4	\N	\N	\N	\N
price_01M6Q0TVV54YZNVWBS4MYZYSNM	\N	pset_01M6Q0TVV5XYWPHH4NHFBX5ZZ3	usd	{"value": "5", "precision": 20}	0	2026-11-05 18:31:18.505-05	2026-11-06 10:08:28.168-05	2026-11-06 10:08:27.98-05	\N	5	\N	\N	\N	\N
price_01M6Q0TVV501VVVW5MTS40C3VR	\N	pset_01M6Q0TVV58HD9NT3Y45HA77B1	eur	{"value": "3", "precision": 20}	0	2026-11-05 18:31:18.505-05	2026-11-06 10:08:28.175-05	2026-11-06 10:08:27.98-05	\N	3	\N	\N	\N	\N
price_01M6Q0TVV5AF4GZZHM0E4NW3S0	\N	pset_01M6Q0TVV58HD9NT3Y45HA77B1	usd	{"value": "4", "precision": 20}	0	2026-11-05 18:31:18.505-05	2026-11-06 10:08:28.175-05	2026-11-06 10:08:27.98-05	\N	4	\N	\N	\N	\N
price_01M6Q0TVV65XTNBJ2C7HE1783R	\N	pset_01M6Q0TVV6QRPHPJCAHWKZ3V7Y	eur	{"value": "9", "precision": 20}	0	2026-11-05 18:31:18.505-05	2026-11-06 10:08:28.183-05	2026-11-06 10:08:27.98-05	\N	9	\N	\N	\N	\N
price_01M6Q0TVV6A1XQ98ZX1CA3Z5K5	\N	pset_01M6Q0TVV6QRPHPJCAHWKZ3V7Y	usd	{"value": "11", "precision": 20}	0	2026-11-05 18:31:18.505-05	2026-11-06 10:08:28.183-05	2026-11-06 10:08:27.98-05	\N	11	\N	\N	\N	\N
price_01M6Q0TVV69KV15FKTPG8JHGPJ	\N	pset_01M6Q0TVV683B3JC3MENSWY3RK	eur	{"value": "12", "precision": 20}	0	2026-11-05 18:31:18.505-05	2026-11-06 10:08:28.19-05	2026-11-06 10:08:27.98-05	\N	12	\N	\N	\N	\N
price_01M6Q0TVV6M2JST0S9NPVGSNYS	\N	pset_01M6Q0TVV683B3JC3MENSWY3RK	usd	{"value": "14", "precision": 20}	0	2026-11-05 18:31:18.505-05	2026-11-06 10:08:28.19-05	2026-11-06 10:08:27.98-05	\N	14	\N	\N	\N	\N
price_01M6Q0TVV6BSDYN8XBHQ44YYX4	\N	pset_01M6Q0TVV7N8TXSB5QM5JB6717	eur	{"value": "2", "precision": 20}	0	2026-11-05 18:31:18.505-05	2026-11-06 10:08:28.198-05	2026-11-06 10:08:27.98-05	\N	2	\N	\N	\N	\N
price_01M6Q0TVV67ZWSK538GWACBBD0	\N	pset_01M6Q0TVV7N8TXSB5QM5JB6717	usd	{"value": "3", "precision": 20}	0	2026-11-05 18:31:18.505-05	2026-11-06 10:08:28.198-05	2026-11-06 10:08:27.98-05	\N	3	\N	\N	\N	\N
price_01M6Q0TVV7N6FK8QBSWFN7EEZJ	\N	pset_01M6Q0TVV7HGCAV54BPGXJB6WB	eur	{"value": "4", "precision": 20}	0	2026-11-05 18:31:18.505-05	2026-11-06 10:08:28.204-05	2026-11-06 10:08:27.98-05	\N	4	\N	\N	\N	\N
price_01M6Q0TVV7QWWEKPC73MP6Y7X5	\N	pset_01M6Q0TVV7HGCAV54BPGXJB6WB	usd	{"value": "5", "precision": 20}	0	2026-11-05 18:31:18.505-05	2026-11-06 10:08:28.204-05	2026-11-06 10:08:27.98-05	\N	5	\N	\N	\N	\N
price_01M6Q0TVV7EW16WA7GCNQRHG73	\N	pset_01M6Q0TVV7E0HQ6EEXFZ356V6W	eur	{"value": "3", "precision": 20}	0	2026-11-05 18:31:18.505-05	2026-11-06 10:08:28.212-05	2026-11-06 10:08:27.98-05	\N	3	\N	\N	\N	\N
price_01M6Q0TVV7EGQ2WPV7HMKQCAXF	\N	pset_01M6Q0TVV7E0HQ6EEXFZ356V6W	usd	{"value": "4", "precision": 20}	0	2026-11-05 18:31:18.505-05	2026-11-06 10:08:28.212-05	2026-11-06 10:08:27.98-05	\N	4	\N	\N	\N	\N
price_01M6Q0TVV7SSHGD9YRHK1B3QF5	\N	pset_01M6Q0TVV8WN4MJ4YG6WS5KNMS	eur	{"value": "5", "precision": 20}	0	2026-11-05 18:31:18.505-05	2026-11-06 10:08:28.218-05	2026-11-06 10:08:27.98-05	\N	5	\N	\N	\N	\N
price_01M6Q0TVV79GMYNDPN4JVH9YVW	\N	pset_01M6Q0TVV8WN4MJ4YG6WS5KNMS	usd	{"value": "6", "precision": 20}	0	2026-11-05 18:31:18.505-05	2026-11-06 10:08:28.219-05	2026-11-06 10:08:27.98-05	\N	6	\N	\N	\N	\N
price_01M6VRP8AYX16GCEVXSXXJ9NNY	\N	pset_01M6VRP8AZPBWS44X17S8HCDSS	eur	{"value": "1", "precision": 20}	0	2026-11-07 14:45:11.008-05	2026-11-07 14:45:11.008-05	\N	\N	1	\N	\N	\N	\N
price_01M6VRP8AZF243219RV5VDK7JP	\N	pset_01M6VRP8AZPBWS44X17S8HCDSS	usd	{"value": "1", "precision": 20}	0	2026-11-07 14:45:11.008-05	2026-11-07 14:45:11.008-05	\N	\N	1	\N	\N	\N	\N
price_01M6VRP8AZ8JBK4X69AHFSFTH2	\N	pset_01M6VRP8AZPAD4RVAQS4PWFD3P	eur	{"value": "1", "precision": 20}	0	2026-11-07 14:45:11.008-05	2026-11-07 14:45:11.008-05	\N	\N	1	\N	\N	\N	\N
price_01M6VRP8AZXE5JGJ2ZZST92KHA	\N	pset_01M6VRP8AZPAD4RVAQS4PWFD3P	usd	{"value": "1", "precision": 20}	0	2026-11-07 14:45:11.008-05	2026-11-07 14:45:11.008-05	\N	\N	1	\N	\N	\N	\N
price_01M6VRP8AYR8CWR7ZVAHQ4T99Z	\N	pset_01M6VRP8AZPBWS44X17S8HCDSS	cop	{"value": "12000", "precision": 20}	0	2026-11-07 14:45:11.008-05	2026-11-07 14:45:11.008-05	\N	\N	12000	\N	\N	\N	\N
price_01M6VRP8AZYBVQGH16RYAVXJJS	\N	pset_01M6VRP8AZPAD4RVAQS4PWFD3P	cop	{"value": "135500", "precision": 20}	0	2026-11-07 14:45:11.008-05	2026-11-07 14:45:11.008-05	\N	\N	135500	\N	\N	\N	\N
price_01M6VF7G01NVSHK0SBA43W88EW	\N	pset_01M6RV43BFPH4J75BQ9JGCJ0P5	cop	{"value": "1250", "precision": 20}	0	2026-11-07 11:59:50.15-05	2026-11-07 11:59:50.15-05	\N	\N	1250	\N	\N	\N	\N
price_01M6VF7G01ARSANA4C6P3EJAF4	\N	pset_01M6RV43BFPH4J75BQ9JGCJ0P5	eur	{"value": "1", "precision": 20}	0	2026-11-07 11:59:50.15-05	2026-11-07 11:59:50.15-05	\N	\N	1	\N	\N	\N	\N
price_01M6VF7G014NDSMJNADB2A2Y19	\N	pset_01M6RV43BFPH4J75BQ9JGCJ0P5	usd	{"value": "1", "precision": 20}	0	2026-11-07 11:59:50.15-05	2026-11-07 11:59:50.15-05	\N	\N	1	\N	\N	\N	\N
price_01M6VF7GA0BFPTWJ5ZRAJ5MY2G	\N	pset_01M6RV43BJGR7XZ5Z81CV7JN3S	cop	{"value": "9500", "precision": 20}	0	2026-11-07 11:59:50.47-05	2026-11-07 11:59:50.47-05	\N	\N	9500	\N	\N	\N	\N
price_01M6VF7GA0RZEJDGNS9NXGEC5C	\N	pset_01M6RV43BJGR7XZ5Z81CV7JN3S	eur	{"value": "2", "precision": 20}	0	2026-11-07 11:59:50.47-05	2026-11-07 11:59:50.47-05	\N	\N	2	\N	\N	\N	\N
price_01M6VF7GA05MQA3GJF5CF42TNN	\N	pset_01M6RV43BJGR7XZ5Z81CV7JN3S	usd	{"value": "2", "precision": 20}	0	2026-11-07 11:59:50.47-05	2026-11-07 11:59:50.47-05	\N	\N	2	\N	\N	\N	\N
price_01M6VF7GF3MBV927YNDFS2E96R	\N	pset_01M6RV43BGR8TNZJ2DBZFKJF2J	cop	{"value": "22900", "precision": 20}	0	2026-11-07 11:59:50.631-05	2026-11-07 11:59:50.631-05	\N	\N	22900	\N	\N	\N	\N
price_01M6VF7GF3TY4D02634KVF95DN	\N	pset_01M6RV43BGR8TNZJ2DBZFKJF2J	eur	{"value": "5", "precision": 20}	0	2026-11-07 11:59:50.631-05	2026-11-07 11:59:50.631-05	\N	\N	5	\N	\N	\N	\N
price_01M6VF7GF44YJBVE2JPSPRZW83	\N	pset_01M6RV43BGR8TNZJ2DBZFKJF2J	usd	{"value": "6", "precision": 20}	0	2026-11-07 11:59:50.631-05	2026-11-07 11:59:50.631-05	\N	\N	6	\N	\N	\N	\N
price_01M6VF7GNZRYZ292PCZB20GWCS	\N	pset_01M6RV43BEQKKSWAGGAHGEED2H	cop	{"value": "5800", "precision": 20}	0	2026-11-07 11:59:50.851-05	2026-11-07 11:59:50.851-05	\N	\N	5800	\N	\N	\N	\N
price_01M6VF7GNZEKDXPQ52DN47JYVS	\N	pset_01M6RV43BEQKKSWAGGAHGEED2H	eur	{"value": "1", "precision": 20}	0	2026-11-07 11:59:50.851-05	2026-11-07 11:59:50.851-05	\N	\N	1	\N	\N	\N	\N
price_01M6VF7GNZ815T57233ECN8DV0	\N	pset_01M6RV43BEQKKSWAGGAHGEED2H	usd	{"value": "1", "precision": 20}	0	2026-11-07 11:59:50.851-05	2026-11-07 11:59:50.851-05	\N	\N	1	\N	\N	\N	\N
price_01M6VF7GRY3C98BHGZVEWCMBBB	\N	pset_01M6RV43BK0XV8105MW01FAXCK	usd	{"value": "1", "precision": 20}	0	2026-11-07 11:59:50.946-05	2026-11-07 11:59:50.946-05	\N	\N	1	\N	\N	\N	\N
price_01M6RV2ZAV4938J0XDDDYGYY6Q	\N	pset_01M6RV2ZAWJFHV75X154DPQ06N	cop	{"value": "6000", "precision": 20}	0	2026-11-06 11:29:21.628-05	2026-11-06 11:29:21.629-05	\N	\N	6000	\N	\N	\N	\N
price_01M6RV2ZAW0BET0ZB9SA5JJT2N	\N	pset_01M6RV2ZAWJFHV75X154DPQ06N	cop	{"value": "6000", "precision": 20}	1	2026-11-06 11:29:21.629-05	2026-11-06 11:29:21.629-05	\N	\N	6000	\N	\N	\N	\N
price_01M6RPEW7DJE5PYYPZK7VCE890	\N	pset_01M6RPEW7DEC83CMTND4XZQKXW	eur	{"value": "4", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.006-05	2026-11-06 11:29:21.998-05	\N	4	\N	\N	\N	\N
price_01M6RPEW7DY18RNA08AM781GJG	\N	pset_01M6RPEW7DEC83CMTND4XZQKXW	usd	{"value": "5", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.006-05	2026-11-06 11:29:21.998-05	\N	5	\N	\N	\N	\N
price_01M6RPEW7DJQHM6YZTPXFKCX85	\N	pset_01M6RPEW7D47TXZAMEVTBYXZPA	eur	{"value": "32", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.02-05	2026-11-06 11:29:21.998-05	\N	32	\N	\N	\N	\N
price_01M6RPEW7DHHDZS00S425DP4J4	\N	pset_01M6RPEW7D47TXZAMEVTBYXZPA	usd	{"value": "37", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.02-05	2026-11-06 11:29:21.998-05	\N	37	\N	\N	\N	\N
price_01M6RPEW7DD4N50ENBXFZ2VBA1	\N	pset_01M6RPEW7EAFZWF1VAMVRW47W6	eur	{"value": "3", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.03-05	2026-11-06 11:29:21.998-05	\N	3	\N	\N	\N	\N
price_01M6RPEW7EFW4QYRW3QSJH3VRP	\N	pset_01M6RPEW7EAFZWF1VAMVRW47W6	usd	{"value": "3", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.03-05	2026-11-06 11:29:21.998-05	\N	3	\N	\N	\N	\N
price_01M6RPEW7ESWE8A08Z4NF4HWD6	\N	pset_01M6RPEW7E6ZTRDDN10V1FVKRQ	eur	{"value": "24", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.041-05	2026-11-06 11:29:21.998-05	\N	24	\N	\N	\N	\N
price_01M6RPEW7E6V3JA6XM3K78VGD8	\N	pset_01M6RPEW7E6ZTRDDN10V1FVKRQ	usd	{"value": "28", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.041-05	2026-11-06 11:29:21.998-05	\N	28	\N	\N	\N	\N
price_01M6RPEW7ECZS1K21X50G4H78Z	\N	pset_01M6RPEW7EDJG4K8M0PS75CJTQ	eur	{"value": "2", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.048-05	2026-11-06 11:29:21.998-05	\N	2	\N	\N	\N	\N
price_01M6RPEW7E1B0QD0QK7RZ8MHDP	\N	pset_01M6RPEW7EDJG4K8M0PS75CJTQ	usd	{"value": "2", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.048-05	2026-11-06 11:29:21.998-05	\N	2	\N	\N	\N	\N
price_01M6RPEW7E1G1SD051W0G8DRHJ	\N	pset_01M6RPEW7FXT9MJ7J5FK2E3GJF	eur	{"value": "18", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.059-05	2026-11-06 11:29:21.998-05	\N	18	\N	\N	\N	\N
price_01M6RPEW7F34882JM537GCWR5S	\N	pset_01M6RPEW7FXT9MJ7J5FK2E3GJF	usd	{"value": "21", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.059-05	2026-11-06 11:29:21.998-05	\N	21	\N	\N	\N	\N
price_01M6RPEW7F2V2FKPDN2YYJYNAF	\N	pset_01M6RPEW7F86ZPH5R87CQDVBHS	eur	{"value": "9", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.071-05	2026-11-06 11:29:21.998-05	\N	9	\N	\N	\N	\N
price_01M6RPEW7FX9X24RP0Q5WG59YZ	\N	pset_01M6RPEW7F86ZPH5R87CQDVBHS	usd	{"value": "10", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.071-05	2026-11-06 11:29:21.998-05	\N	10	\N	\N	\N	\N
price_01M6RPEW7FJ634P79FMQAFD65S	\N	pset_01M6RPEW7FXBN3HQ63NWXEBJZ4	eur	{"value": "85", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.083-05	2026-11-06 11:29:21.998-05	\N	85	\N	\N	\N	\N
price_01M6RPEW7F8FN3SWHJAWGDCTEP	\N	pset_01M6RPEW7FXBN3HQ63NWXEBJZ4	usd	{"value": "98", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.083-05	2026-11-06 11:29:21.998-05	\N	98	\N	\N	\N	\N
price_01M6RPEW7FQ6K6B15MVS6C683Z	\N	pset_01M6RPEW7FKDN0XSV8AY50GDJB	eur	{"value": "12", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.093-05	2026-11-06 11:29:21.998-05	\N	12	\N	\N	\N	\N
price_01M6RPEW7FBKGYW38YTY50DKNF	\N	pset_01M6RPEW7FKDN0XSV8AY50GDJB	usd	{"value": "14", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.093-05	2026-11-06 11:29:21.998-05	\N	14	\N	\N	\N	\N
price_01M6RPEW7F5HB3AH5MX8TYF51C	\N	pset_01M6RPEW7G7CWW1SAMSE3KWZQA	eur	{"value": "58", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.103-05	2026-11-06 11:29:21.998-05	\N	58	\N	\N	\N	\N
price_01M6RPEW7GYAFQWC1NXZGHBGFA	\N	pset_01M6RPEW7G7CWW1SAMSE3KWZQA	usd	{"value": "67", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.103-05	2026-11-06 11:29:21.998-05	\N	67	\N	\N	\N	\N
price_01M6RPEW7GRFHRWZ50Y1CQVSYE	\N	pset_01M6RPEW7GKHP3250FGF62D8FN	eur	{"value": "2", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.113-05	2026-11-06 11:29:21.998-05	\N	2	\N	\N	\N	\N
price_01M6RPEW7GW8WWM1HQY563K2XN	\N	pset_01M6RPEW7GKHP3250FGF62D8FN	usd	{"value": "2", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.113-05	2026-11-06 11:29:21.998-05	\N	2	\N	\N	\N	\N
price_01M6RPEW7GY6W7CBCKXQZ7FCJV	\N	pset_01M6RPEW7G1VP13TF6Z7VH5SS4	eur	{"value": "38", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.124-05	2026-11-06 11:29:21.998-05	\N	38	\N	\N	\N	\N
price_01M6RPEW7G3CWBPRMPH9JH0MHN	\N	pset_01M6RPEW7G1VP13TF6Z7VH5SS4	usd	{"value": "44", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.124-05	2026-11-06 11:29:21.998-05	\N	44	\N	\N	\N	\N
price_01M6RPEW7G4HJ89V8YX1R1AY0F	\N	pset_01M6RPEW7GMP355K5KWB8Q7ND3	eur	{"value": "5", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.134-05	2026-11-06 11:29:21.998-05	\N	5	\N	\N	\N	\N
price_01M6RPEW7GEYEJXC10KEP2DREY	\N	pset_01M6RPEW7GMP355K5KWB8Q7ND3	usd	{"value": "6", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.134-05	2026-11-06 11:29:21.998-05	\N	6	\N	\N	\N	\N
price_01M6RPEW7G3GCSY0DRPJG16W0J	\N	pset_01M6RPEW7HJN3ES6BX12P34EX6	eur	{"value": "40", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.144-05	2026-11-06 11:29:21.998-05	\N	40	\N	\N	\N	\N
price_01M6RPEW7HPDAGNGD9NYAD86R2	\N	pset_01M6RPEW7HJN3ES6BX12P34EX6	usd	{"value": "46", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.144-05	2026-11-06 11:29:21.998-05	\N	46	\N	\N	\N	\N
price_01M6RPEW7HJC65Y30CYJJSHZNE	\N	pset_01M6RPEW7HBJDGMHFK1E8WX4G0	eur	{"value": "2", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.155-05	2026-11-06 11:29:21.998-05	\N	2	\N	\N	\N	\N
price_01M6RPEW7H3H5K898936V4XMKM	\N	pset_01M6RPEW7HBJDGMHFK1E8WX4G0	usd	{"value": "2", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.155-05	2026-11-06 11:29:21.998-05	\N	2	\N	\N	\N	\N
price_01M6RPEW7HRRV0G3MG1JNBE9DY	\N	pset_01M6RPEW7HC7Y8ENR2J82SFTMC	eur	{"value": "19", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.165-05	2026-11-06 11:29:21.998-05	\N	19	\N	\N	\N	\N
price_01M6RPEW7HTFGDRSB3CKVD9TYZ	\N	pset_01M6RPEW7HC7Y8ENR2J82SFTMC	usd	{"value": "22", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.165-05	2026-11-06 11:29:21.998-05	\N	22	\N	\N	\N	\N
price_01M6RPEW7HVBDX57DMSH4GPRW1	\N	pset_01M6RPEW7H8D19YCY7ABKAYN3B	eur	{"value": "4", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.173-05	2026-11-06 11:29:21.998-05	\N	4	\N	\N	\N	\N
price_01M6RPEW7HA9YZY44WHYTX7MD8	\N	pset_01M6RPEW7H8D19YCY7ABKAYN3B	usd	{"value": "5", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.173-05	2026-11-06 11:29:21.998-05	\N	5	\N	\N	\N	\N
price_01M6RPEW7HV8Y2NMSVJT3MR4NJ	\N	pset_01M6RPEW7JPGHJC39KKQBZK5FG	eur	{"value": "72", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.179-05	2026-11-06 11:29:21.998-05	\N	72	\N	\N	\N	\N
price_01M6RPEW7JCWVV5MJRNXSDCS4X	\N	pset_01M6RPEW7JPGHJC39KKQBZK5FG	usd	{"value": "83", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.179-05	2026-11-06 11:29:21.998-05	\N	83	\N	\N	\N	\N
price_01M6RPEW7J20DYQ3R04V1P2H0B	\N	pset_01M6RPEW7J5AADXYDDQAX6Z1ES	eur	{"value": "6", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.187-05	2026-11-06 11:29:21.998-05	\N	6	\N	\N	\N	\N
price_01M6VF7FY40TZXTB8SW67KT6V9	\N	pset_01M6RV43BF1F63YETZCN4E5RN8	cop	{"value": "11765", "precision": 20}	0	2026-11-07 11:59:50.092-05	2026-11-07 11:59:50.092-05	\N	\N	11765	\N	\N	\N	\N
price_01M6RPEW7J7GMW62WJ0Z15Y1R5	\N	pset_01M6RPEW7J5AADXYDDQAX6Z1ES	usd	{"value": "7", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.187-05	2026-11-06 11:29:21.998-05	\N	7	\N	\N	\N	\N
price_01M6RPEW7JAJPJQBDF5Y9S3BFY	\N	pset_01M6RPEW7JZ04GQT4DMSHJE1C2	eur	{"value": "48", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.194-05	2026-11-06 11:29:21.998-05	\N	48	\N	\N	\N	\N
price_01M6RPEW7JRG7M0EHCFPYMG3PW	\N	pset_01M6RPEW7JZ04GQT4DMSHJE1C2	usd	{"value": "55", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.194-05	2026-11-06 11:29:21.998-05	\N	55	\N	\N	\N	\N
price_01M6RPEW7J4MN8QN4AT48J3HVA	\N	pset_01M6RPEW7JRFJ4C73R9FF8CBEM	eur	{"value": "14", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.201-05	2026-11-06 11:29:21.998-05	\N	14	\N	\N	\N	\N
price_01M6RPEW7J59JFEX9XQJRR9Q43	\N	pset_01M6RPEW7JRFJ4C73R9FF8CBEM	usd	{"value": "16", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.201-05	2026-11-06 11:29:21.998-05	\N	16	\N	\N	\N	\N
price_01M6RPEW7JJF8G5FK8CDB7C6V6	\N	pset_01M6RPEW7KMQMQ2EF5930F9FR3	eur	{"value": "110", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.208-05	2026-11-06 11:29:21.998-05	\N	110	\N	\N	\N	\N
price_01M6RPEW7JS1ENJ3ANZ2M2TH87	\N	pset_01M6RPEW7KMQMQ2EF5930F9FR3	usd	{"value": "126", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.208-05	2026-11-06 11:29:21.998-05	\N	126	\N	\N	\N	\N
price_01M6RPEW7KH7SHPNFN4WP6CPRZ	\N	pset_01M6RPEW7KNJC7WXAQSXJW9F84	eur	{"value": "7", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.215-05	2026-11-06 11:29:21.998-05	\N	7	\N	\N	\N	\N
price_01M6RPEW7K9GHKV45F57ES5K04	\N	pset_01M6RPEW7KNJC7WXAQSXJW9F84	usd	{"value": "8", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.215-05	2026-11-06 11:29:21.998-05	\N	8	\N	\N	\N	\N
price_01M6RPEW7KS9STMJJ0VKWD7S18	\N	pset_01M6RPEW7KY6DXBX39TKW8PPSM	eur	{"value": "55", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.223-05	2026-11-06 11:29:21.998-05	\N	55	\N	\N	\N	\N
price_01M6RPEW7K7NGVEW4T5K2EVS46	\N	pset_01M6RPEW7KY6DXBX39TKW8PPSM	usd	{"value": "63", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.223-05	2026-11-06 11:29:21.998-05	\N	63	\N	\N	\N	\N
price_01M6RPEW7KCDWVJS1T5YRYZFH6	\N	pset_01M6RPEW7KZ07EFZW0RXEQRNM8	eur	{"value": "3", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.23-05	2026-11-06 11:29:21.998-05	\N	3	\N	\N	\N	\N
price_01M6RPEW7KN8ZGX8D2G82ZFCZB	\N	pset_01M6RPEW7KZ07EFZW0RXEQRNM8	usd	{"value": "3", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.23-05	2026-11-06 11:29:21.998-05	\N	3	\N	\N	\N	\N
price_01M6RPEW7KFAK20Z547MHSPN2R	\N	pset_01M6RPEW7K9TDZFNZHKPXAMF74	eur	{"value": "28", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.237-05	2026-11-06 11:29:21.998-05	\N	28	\N	\N	\N	\N
price_01M6RPEW7KE61NDS8MA7H7GFRA	\N	pset_01M6RPEW7K9TDZFNZHKPXAMF74	usd	{"value": "32", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.237-05	2026-11-06 11:29:21.998-05	\N	32	\N	\N	\N	\N
price_01M6RPEW7MMQ7JQ0SN2JJMFG8E	\N	pset_01M6RPEW7MFKZ9TKS74CNPEXYT	eur	{"value": "1", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.245-05	2026-11-06 11:29:21.998-05	\N	1	\N	\N	\N	\N
price_01M6RPEW7MF5WT105P9KNF8NCE	\N	pset_01M6RPEW7MFKZ9TKS74CNPEXYT	usd	{"value": "1", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.245-05	2026-11-06 11:29:21.998-05	\N	1	\N	\N	\N	\N
price_01M6RPEW7M0QWPC4BFCE348FWZ	\N	pset_01M6RPEW7MXX23XW4F5XJGZ3WV	eur	{"value": "16", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.252-05	2026-11-06 11:29:21.998-05	\N	16	\N	\N	\N	\N
price_01M6RPEW7MNGY0XGZMJ21YZ0JK	\N	pset_01M6RPEW7MXX23XW4F5XJGZ3WV	usd	{"value": "18", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.252-05	2026-11-06 11:29:21.998-05	\N	18	\N	\N	\N	\N
price_01M6RPEW7M9HFECX4CEBJVJYYJ	\N	pset_01M6RPEW7MQEKSSN7EZFGZK0S6	eur	{"value": "8", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.26-05	2026-11-06 11:29:21.998-05	\N	8	\N	\N	\N	\N
price_01M6RPEW7M71JZJRY0NF4QEXCW	\N	pset_01M6RPEW7MQEKSSN7EZFGZK0S6	usd	{"value": "9", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.26-05	2026-11-06 11:29:21.998-05	\N	9	\N	\N	\N	\N
price_01M6RPEW7MTKAJP55JRDN47HV9	\N	pset_01M6RPEW7MQV5NN9DM5N17JEEW	eur	{"value": "58", "precision": 20}	0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.267-05	2026-11-06 11:29:21.998-05	\N	58	\N	\N	\N	\N
price_01M6RPEW7MSCDE2DTJ1TA5PVAY	\N	pset_01M6RPEW7MQV5NN9DM5N17JEEW	usd	{"value": "67", "precision": 20}	0	2026-11-06 10:08:28.791-05	2026-11-06 11:29:22.267-05	2026-11-06 11:29:21.998-05	\N	67	\N	\N	\N	\N
price_01M6RPEW7MS737PJVPX4ZZKABD	\N	pset_01M6RPEW7NHK36GGEG1KTWYGEB	eur	{"value": "6", "precision": 20}	0	2026-11-06 10:08:28.791-05	2026-11-06 11:29:22.276-05	2026-11-06 11:29:21.998-05	\N	6	\N	\N	\N	\N
price_01M6RPEW7NSCRYDBG73QPFA2Y5	\N	pset_01M6RPEW7NHK36GGEG1KTWYGEB	usd	{"value": "7", "precision": 20}	0	2026-11-06 10:08:28.791-05	2026-11-06 11:29:22.277-05	2026-11-06 11:29:21.998-05	\N	7	\N	\N	\N	\N
price_01M6RPEW7NTNKPAW0DVS7PYKQX	\N	pset_01M6RPEW7N4Y95A3V51A42D0M7	eur	{"value": "45", "precision": 20}	0	2026-11-06 10:08:28.791-05	2026-11-06 11:29:22.284-05	2026-11-06 11:29:21.998-05	\N	45	\N	\N	\N	\N
price_01M6RPEW7N44Q5G7ET8ATY8PKP	\N	pset_01M6RPEW7N4Y95A3V51A42D0M7	usd	{"value": "52", "precision": 20}	0	2026-11-06 10:08:28.791-05	2026-11-06 11:29:22.284-05	2026-11-06 11:29:21.998-05	\N	52	\N	\N	\N	\N
price_01M6VF7FY4HQHKFVYM8YJ80B6S	\N	pset_01M6RV43BF1F63YETZCN4E5RN8	eur	{"value": "3", "precision": 20}	0	2026-11-07 11:59:50.092-05	2026-11-07 11:59:50.092-05	\N	\N	3	\N	\N	\N	\N
price_01M6VF7FY475K3KRFWAR870R3C	\N	pset_01M6RV43BF1F63YETZCN4E5RN8	usd	{"value": "3", "precision": 20}	0	2026-11-07 11:59:50.092-05	2026-11-07 11:59:50.092-05	\N	\N	3	\N	\N	\N	\N
price_01M6VF7GBSQ8T6P6AMSRNSS65X	\N	pset_01M6RV43BK71704A1NZBJKKVHB	cop	{"value": "89412", "precision": 20}	0	2026-11-07 11:59:50.527-05	2026-11-07 11:59:50.527-05	\N	\N	89412	\N	\N	\N	\N
price_01M6VF7GBTJVBZAVBTDCG8KTJ4	\N	pset_01M6RV43BK71704A1NZBJKKVHB	eur	{"value": "21", "precision": 20}	0	2026-11-07 11:59:50.527-05	2026-11-07 11:59:50.527-05	\N	\N	21	\N	\N	\N	\N
price_01M6VF7GBT02FDEHN5MQ76H3GX	\N	pset_01M6RV43BK71704A1NZBJKKVHB	usd	{"value": "23", "precision": 20}	0	2026-11-07 11:59:50.527-05	2026-11-07 11:59:50.527-05	\N	\N	23	\N	\N	\N	\N
price_01M6VF7GGKFR09Z0B9R1C87GWX	\N	pset_01M6RV43BG9R5E0HRR60FE3WC9	cop	{"value": "215529", "precision": 20}	0	2026-11-07 11:59:50.679-05	2026-11-07 11:59:50.679-05	\N	\N	215529	\N	\N	\N	\N
price_01M6VF7GGK4MSHD1Z2P5SJ9233	\N	pset_01M6RV43BG9R5E0HRR60FE3WC9	eur	{"value": "51", "precision": 20}	0	2026-11-07 11:59:50.679-05	2026-11-07 11:59:50.679-05	\N	\N	51	\N	\N	\N	\N
price_01M6VF7GGKQ3SHEV19CKCX5R6N	\N	pset_01M6RV43BG9R5E0HRR60FE3WC9	usd	{"value": "55", "precision": 20}	0	2026-11-07 11:59:50.679-05	2026-11-07 11:59:50.679-05	\N	\N	55	\N	\N	\N	\N
price_01M6VF7GM3DT80GEDX6SGYP6R2	\N	pset_01M6RV43BEBP0HQ4P546GEYM8Y	cop	{"value": "54588", "precision": 20}	0	2026-11-07 11:59:50.794-05	2026-11-07 11:59:50.794-05	\N	\N	54588	\N	\N	\N	\N
price_01M6VF7GM344REVF29Z9WD8B25	\N	pset_01M6RV43BEBP0HQ4P546GEYM8Y	eur	{"value": "13", "precision": 20}	0	2026-11-07 11:59:50.794-05	2026-11-07 11:59:50.794-05	\N	\N	13	\N	\N	\N	\N
price_01M6VF7GM4E1FF2BSWB27S70C0	\N	pset_01M6RV43BEBP0HQ4P546GEYM8Y	usd	{"value": "14", "precision": 20}	0	2026-11-07 11:59:50.794-05	2026-11-07 11:59:50.794-05	\N	\N	14	\N	\N	\N	\N
price_01M6VF7GRY5WGSNEH06FTQPXGD	\N	pset_01M6RV43BK0XV8105MW01FAXCK	cop	{"value": "4800", "precision": 20}	0	2026-11-07 11:59:50.946-05	2026-11-07 11:59:50.946-05	\N	\N	4800	\N	\N	\N	\N
price_01M6VF7GRYAAMENHC7V0GRWK6Z	\N	pset_01M6RV43BK0XV8105MW01FAXCK	eur	{"value": "1", "precision": 20}	0	2026-11-07 11:59:50.946-05	2026-11-07 11:59:50.946-05	\N	\N	1	\N	\N	\N	\N
price_01M6VF7GTH4T075054NME19GYS	\N	pset_01M6RV43BKB21295GB1AZP8A0V	cop	{"value": "45176", "precision": 20}	0	2026-11-07 11:59:50.997-05	2026-11-07 11:59:50.997-05	\N	\N	45176	\N	\N	\N	\N
price_01M6VF7GTHFS4FZ4QRAXRZ94ZR	\N	pset_01M6RV43BKB21295GB1AZP8A0V	eur	{"value": "11", "precision": 20}	0	2026-11-07 11:59:50.997-05	2026-11-07 11:59:50.997-05	\N	\N	11	\N	\N	\N	\N
price_01M6VF7GTHM1C5STYJS20WZ18J	\N	pset_01M6RV43BKB21295GB1AZP8A0V	usd	{"value": "12", "precision": 20}	0	2026-11-07 11:59:50.997-05	2026-11-07 11:59:50.997-05	\N	\N	12	\N	\N	\N	\N
price_01M6VF7HHVA9TXZ38RN6VHYEV9	\N	pset_01M6RV43BECAVH4ZB7NVP7HP88	cop	{"value": "64941", "precision": 20}	0	2026-11-07 11:59:51.746-05	2026-11-07 11:59:51.746-05	\N	\N	64941	\N	\N	\N	\N
price_01M6VF7HHVXMZ27BYPG9YBN7WC	\N	pset_01M6RV43BECAVH4ZB7NVP7HP88	eur	{"value": "15", "precision": 20}	0	2026-11-07 11:59:51.746-05	2026-11-07 11:59:51.746-05	\N	\N	15	\N	\N	\N	\N
price_01M6VF7HHV3NW0FMVVEB7EVQW0	\N	pset_01M6RV43BECAVH4ZB7NVP7HP88	usd	{"value": "17", "precision": 20}	0	2026-11-07 11:59:51.746-05	2026-11-07 11:59:51.746-05	\N	\N	17	\N	\N	\N	\N
price_01M6VF7HT5R6NCGEQVJC9B1113	\N	pset_01M6RV43BMPFNFR218P6114BJA	cop	{"value": "16900", "precision": 20}	0	2026-11-07 11:59:52.013-05	2026-11-07 11:59:52.013-05	\N	\N	16900	\N	\N	\N	\N
price_01M6VF7HT53J1NAHTA32V8Y4F1	\N	pset_01M6RV43BMPFNFR218P6114BJA	eur	{"value": "4", "precision": 20}	0	2026-11-07 11:59:52.013-05	2026-11-07 11:59:52.013-05	\N	\N	4	\N	\N	\N	\N
price_01M6VF7HT5CZQBJ7YT7R00WE95	\N	pset_01M6RV43BMPFNFR218P6114BJA	usd	{"value": "4", "precision": 20}	0	2026-11-07 11:59:52.013-05	2026-11-07 11:59:52.013-05	\N	\N	4	\N	\N	\N	\N
price_01M6VF7J1RYNEHHSDTE1RWBWZY	\N	pset_01M6RV43BQYXVXA41AWTTK02Y0	cop	{"value": "26353", "precision": 20}	0	2026-11-07 11:59:52.252-05	2026-11-07 11:59:52.252-05	\N	\N	26353	\N	\N	\N	\N
price_01M6VF7J1R362EVWKZ7HE9RM95	\N	pset_01M6RV43BQYXVXA41AWTTK02Y0	eur	{"value": "6", "precision": 20}	0	2026-11-07 11:59:52.252-05	2026-11-07 11:59:52.252-05	\N	\N	6	\N	\N	\N	\N
price_01M6VF7J1R2K8G50A0Y5T3BNFG	\N	pset_01M6RV43BQYXVXA41AWTTK02Y0	usd	{"value": "7", "precision": 20}	0	2026-11-07 11:59:52.252-05	2026-11-07 11:59:52.252-05	\N	\N	7	\N	\N	\N	\N
price_01M6VF7JBKYR4JJ2M5SE507F82	\N	pset_01M6RV43BRSRSGQ7896HNZGWSQ	cop	{"value": "21900", "precision": 20}	0	2026-11-07 11:59:52.568-05	2026-11-07 11:59:52.568-05	\N	\N	21900	\N	\N	\N	\N
price_01M6VF7JBKPVH2HGMBRK6S1ADQ	\N	pset_01M6RV43BRSRSGQ7896HNZGWSQ	eur	{"value": "5", "precision": 20}	0	2026-11-07 11:59:52.568-05	2026-11-07 11:59:52.568-05	\N	\N	5	\N	\N	\N	\N
price_01M6VF7JBK960C64WV56CHSDAD	\N	pset_01M6RV43BRSRSGQ7896HNZGWSQ	usd	{"value": "6", "precision": 20}	0	2026-11-07 11:59:52.568-05	2026-11-07 11:59:52.568-05	\N	\N	6	\N	\N	\N	\N
price_01M6VF7JMFK4T1YZQF7BRS384Q	\N	pset_01M6RV43BPK0XZDET9ZC9NPMBG	cop	{"value": "155294", "precision": 20}	0	2026-11-07 11:59:52.852-05	2026-11-07 11:59:52.852-05	\N	\N	155294	\N	\N	\N	\N
price_01M6VF7JMFESAE3CF71QV4CH61	\N	pset_01M6RV43BPK0XZDET9ZC9NPMBG	eur	{"value": "37", "precision": 20}	0	2026-11-07 11:59:52.852-05	2026-11-07 11:59:52.852-05	\N	\N	37	\N	\N	\N	\N
price_01M6VF7JMGTZFZCYRQ8BMXJY2S	\N	pset_01M6RV43BPK0XZDET9ZC9NPMBG	usd	{"value": "40", "precision": 20}	0	2026-11-07 11:59:52.852-05	2026-11-07 11:59:52.852-05	\N	\N	40	\N	\N	\N	\N
price_01M6VF7JR7PN4ZTPPWTRTVDHVX	\N	pset_01M6RV43BR8KAG1J4V2G2AD3P4	cop	{"value": "18900", "precision": 20}	0	2026-11-07 11:59:52.973-05	2026-11-07 11:59:52.973-05	\N	\N	18900	\N	\N	\N	\N
price_01M6VF7JR8XR4F2V1N5C34BWY3	\N	pset_01M6RV43BR8KAG1J4V2G2AD3P4	eur	{"value": "5", "precision": 20}	0	2026-11-07 11:59:52.973-05	2026-11-07 11:59:52.973-05	\N	\N	5	\N	\N	\N	\N
price_01M6VF7JR81CX4K2YKXWRH2JA7	\N	pset_01M6RV43BR8KAG1J4V2G2AD3P4	usd	{"value": "5", "precision": 20}	0	2026-11-07 11:59:52.973-05	2026-11-07 11:59:52.973-05	\N	\N	5	\N	\N	\N	\N
price_01M6VF7K3500GKRGKS55EGCS8V	\N	pset_01M6RV43BPWDS4BJZXJKKAFMQE	cop	{"value": "8900", "precision": 20}	0	2026-11-07 11:59:53.323-05	2026-11-07 11:59:53.323-05	\N	\N	8900	\N	\N	\N	\N
price_01M6VF7K354AQEX0W52JEV3Q29	\N	pset_01M6RV43BPWDS4BJZXJKKAFMQE	eur	{"value": "2", "precision": 20}	0	2026-11-07 11:59:53.323-05	2026-11-07 11:59:53.323-05	\N	\N	2	\N	\N	\N	\N
price_01M6VF7K359MT9YFF33RETMK9M	\N	pset_01M6RV43BPWDS4BJZXJKKAFMQE	usd	{"value": "2", "precision": 20}	0	2026-11-07 11:59:53.323-05	2026-11-07 11:59:53.323-05	\N	\N	2	\N	\N	\N	\N
price_01M6VF7GZ1Q9Q78D0BGPY4QHWD	\N	pset_01M6RV43BHHR7JQZ2RD267EH81	cop	{"value": "28500", "precision": 20}	0	2026-11-07 11:59:51.142-05	2026-11-07 11:59:51.142-05	\N	\N	28500	\N	\N	\N	\N
price_01M6VF7GZ12R0QTDGCYWPK528W	\N	pset_01M6RV43BHHR7JQZ2RD267EH81	eur	{"value": "7", "precision": 20}	0	2026-11-07 11:59:51.142-05	2026-11-07 11:59:51.142-05	\N	\N	7	\N	\N	\N	\N
price_01M6VF7GZ2FZ4XY9DTS9EEX3MT	\N	pset_01M6RV43BHHR7JQZ2RD267EH81	usd	{"value": "7", "precision": 20}	0	2026-11-07 11:59:51.142-05	2026-11-07 11:59:51.142-05	\N	\N	7	\N	\N	\N	\N
price_01M6VF7HWNGJYKJJ59A4JFZVCZ	\N	pset_01M6RV43BM0H4SC00N16E6DTV8	cop	{"value": "159059", "precision": 20}	0	2026-11-07 11:59:52.091-05	2026-11-07 11:59:52.091-05	\N	\N	159059	\N	\N	\N	\N
price_01M6VF7HWP1MADA9C4NVJH7CYY	\N	pset_01M6RV43BM0H4SC00N16E6DTV8	eur	{"value": "38", "precision": 20}	0	2026-11-07 11:59:52.091-05	2026-11-07 11:59:52.091-05	\N	\N	38	\N	\N	\N	\N
price_01M6VF7HWPB1APB10J60TMS8PM	\N	pset_01M6RV43BM0H4SC00N16E6DTV8	usd	{"value": "41", "precision": 20}	0	2026-11-07 11:59:52.091-05	2026-11-07 11:59:52.091-05	\N	\N	41	\N	\N	\N	\N
price_01M6VF7J5A9YS86YC5DV5ENDTJ	\N	pset_01M6RV43BMPS4T68C6WMZDT8YS	cop	{"value": "14500", "precision": 20}	0	2026-11-07 11:59:52.368-05	2026-11-07 11:59:52.368-05	\N	\N	14500	\N	\N	\N	\N
price_01M6VF7J5AN5XFS8JTVPWYJ4GT	\N	pset_01M6RV43BMPS4T68C6WMZDT8YS	eur	{"value": "3", "precision": 20}	0	2026-11-07 11:59:52.368-05	2026-11-07 11:59:52.368-05	\N	\N	3	\N	\N	\N	\N
price_01M6VF7J5AT7Q8WJKVJZZTH0ET	\N	pset_01M6RV43BMPS4T68C6WMZDT8YS	usd	{"value": "4", "precision": 20}	0	2026-11-07 11:59:52.368-05	2026-11-07 11:59:52.368-05	\N	\N	4	\N	\N	\N	\N
price_01M6VF7JDC4AXJSYC5MMETWKG1	\N	pset_01M6RV43BRSBPC10D36HWWW4XX	cop	{"value": "206118", "precision": 20}	0	2026-11-07 11:59:52.625-05	2026-11-07 11:59:52.625-05	\N	\N	206118	\N	\N	\N	\N
price_01M6VF7JDCJZWNNYCQN5AZVEZJ	\N	pset_01M6RV43BRSBPC10D36HWWW4XX	eur	{"value": "49", "precision": 20}	0	2026-11-07 11:59:52.625-05	2026-11-07 11:59:52.625-05	\N	\N	49	\N	\N	\N	\N
price_01M6VF7JDDYB6Z8XQAD91TY923	\N	pset_01M6RV43BRSBPC10D36HWWW4XX	usd	{"value": "53", "precision": 20}	0	2026-11-07 11:59:52.625-05	2026-11-07 11:59:52.625-05	\N	\N	53	\N	\N	\N	\N
price_01M6VF7JXX5MSCXV959EF6V9YK	\N	pset_01M6RV43BN2AN3DKRRY2ATF4VJ	cop	{"value": "26900", "precision": 20}	0	2026-11-07 11:59:53.153-05	2026-11-07 11:59:53.153-05	\N	\N	26900	\N	\N	\N	\N
price_01M6VF7JXX8KWR42AGD931SPS9	\N	pset_01M6RV43BN2AN3DKRRY2ATF4VJ	eur	{"value": "6", "precision": 20}	0	2026-11-07 11:59:53.153-05	2026-11-07 11:59:53.153-05	\N	\N	6	\N	\N	\N	\N
price_01M6VF7JXX5SMWRJQSMW3AC80Q	\N	pset_01M6RV43BN2AN3DKRRY2ATF4VJ	usd	{"value": "7", "precision": 20}	0	2026-11-07 11:59:53.153-05	2026-11-07 11:59:53.153-05	\N	\N	7	\N	\N	\N	\N
price_01M6VF7K5GSZQ6XV2KKVJZ15SX	\N	pset_01M6RV43BQW7YY8ZJ8JJV3S3XM	cop	{"value": "83765", "precision": 20}	0	2026-11-07 11:59:53.396-05	2026-11-07 11:59:53.396-05	\N	\N	83765	\N	\N	\N	\N
price_01M6VF7K5GVZ403SAT7YNRRVVA	\N	pset_01M6RV43BQW7YY8ZJ8JJV3S3XM	eur	{"value": "20", "precision": 20}	0	2026-11-07 11:59:53.396-05	2026-11-07 11:59:53.396-05	\N	\N	20	\N	\N	\N	\N
price_01M6VF7K5GXENSBNH83BF9YT7S	\N	pset_01M6RV43BQW7YY8ZJ8JJV3S3XM	usd	{"value": "21", "precision": 20}	0	2026-11-07 11:59:53.396-05	2026-11-07 11:59:53.396-05	\N	\N	21	\N	\N	\N	\N
price_01M6VF7H1FTHRYHMC5MT713S3W	\N	pset_01M6RV43BH81KHHXAE3K0KSM86	cop	{"value": "268235", "precision": 20}	0	2026-11-07 11:59:51.223-05	2026-11-07 11:59:51.223-05	\N	\N	268235	\N	\N	\N	\N
price_01M6VF7H1FF01VRN51MC968FQJ	\N	pset_01M6RV43BH81KHHXAE3K0KSM86	eur	{"value": "64", "precision": 20}	0	2026-11-07 11:59:51.223-05	2026-11-07 11:59:51.223-05	\N	\N	64	\N	\N	\N	\N
price_01M6VF7H1FT36TMX7AGHJ1M5EY	\N	pset_01M6RV43BH81KHHXAE3K0KSM86	usd	{"value": "69", "precision": 20}	0	2026-11-07 11:59:51.223-05	2026-11-07 11:59:51.223-05	\N	\N	69	\N	\N	\N	\N
price_01M6VF7HBV5WN4W70HRNNS1WYH	\N	pset_01M6RV43BD3JNDQWSS6GA78VN6	cop	{"value": "6900", "precision": 20}	0	2026-11-07 11:59:51.558-05	2026-11-07 11:59:51.558-05	\N	\N	6900	\N	\N	\N	\N
price_01M6VF7HBVQ0HFD0P6KZFDG07B	\N	pset_01M6RV43BD3JNDQWSS6GA78VN6	eur	{"value": "2", "precision": 20}	0	2026-11-07 11:59:51.558-05	2026-11-07 11:59:51.558-05	\N	\N	2	\N	\N	\N	\N
price_01M6VF7HBW2YD00Z4ZX6817DJP	\N	pset_01M6RV43BD3JNDQWSS6GA78VN6	usd	{"value": "2", "precision": 20}	0	2026-11-07 11:59:51.558-05	2026-11-07 11:59:51.558-05	\N	\N	2	\N	\N	\N	\N
price_01M6VF7J0456KEZB4CW1JS7YGX	\N	pset_01M6RV43BQ6PTD9J01MWFASXBY	cop	{"value": "2800", "precision": 20}	0	2026-11-07 11:59:52.199-05	2026-11-07 11:59:52.199-05	\N	\N	2800	\N	\N	\N	\N
price_01M6VF7J049N2DN15BYGVWZM2S	\N	pset_01M6RV43BQ6PTD9J01MWFASXBY	eur	{"value": "1", "precision": 20}	0	2026-11-07 11:59:52.199-05	2026-11-07 11:59:52.199-05	\N	\N	1	\N	\N	\N	\N
price_01M6VF7J048JXTZ7F5FP9G4WPW	\N	pset_01M6RV43BQ6PTD9J01MWFASXBY	usd	{"value": "1", "precision": 20}	0	2026-11-07 11:59:52.199-05	2026-11-07 11:59:52.199-05	\N	\N	1	\N	\N	\N	\N
price_01M6VF7J7FQN0Q1P2TH1BYD3QY	\N	pset_01M6RV43BN1RN5SVYVBP75DJS8	cop	{"value": "136471", "precision": 20}	0	2026-11-07 11:59:52.436-05	2026-11-07 11:59:52.436-05	\N	\N	136471	\N	\N	\N	\N
price_01M6VF7J7FENHNF1KTN307PHED	\N	pset_01M6RV43BN1RN5SVYVBP75DJS8	eur	{"value": "32", "precision": 20}	0	2026-11-07 11:59:52.436-05	2026-11-07 11:59:52.436-05	\N	\N	32	\N	\N	\N	\N
price_01M6VF7J7F3ZHQZRSWF6JHMK0Q	\N	pset_01M6RV43BN1RN5SVYVBP75DJS8	usd	{"value": "35", "precision": 20}	0	2026-11-07 11:59:52.436-05	2026-11-07 11:59:52.436-05	\N	\N	35	\N	\N	\N	\N
price_01M6VF7JJ9QBC30WGA82CPMYDY	\N	pset_01M6RV43BPT41G70CWM1AAWG9T	cop	{"value": "16500", "precision": 20}	0	2026-11-07 11:59:52.783-05	2026-11-07 11:59:52.783-05	\N	\N	16500	\N	\N	\N	\N
price_01M6VF7JJ99AMJHHP8042G133K	\N	pset_01M6RV43BPT41G70CWM1AAWG9T	eur	{"value": "4", "precision": 20}	0	2026-11-07 11:59:52.783-05	2026-11-07 11:59:52.783-05	\N	\N	4	\N	\N	\N	\N
price_01M6VF7JJ92V9D8YE038075HZB	\N	pset_01M6RV43BPT41G70CWM1AAWG9T	usd	{"value": "4", "precision": 20}	0	2026-11-07 11:59:52.783-05	2026-11-07 11:59:52.783-05	\N	\N	4	\N	\N	\N	\N
price_01M6VF7JST14G7SWGCD1M6QXAZ	\N	pset_01M6RV43BS13PGE8FW9XB4P5PA	cop	{"value": "177882", "precision": 20}	0	2026-11-07 11:59:53.024-05	2026-11-07 11:59:53.024-05	\N	\N	177882	\N	\N	\N	\N
price_01M6VF7JSVN92NF3RRNHNJQ12H	\N	pset_01M6RV43BS13PGE8FW9XB4P5PA	eur	{"value": "42", "precision": 20}	0	2026-11-07 11:59:53.024-05	2026-11-07 11:59:53.024-05	\N	\N	42	\N	\N	\N	\N
price_01M6VF7JSVXBHBXKCZZC7K2PDV	\N	pset_01M6RV43BS13PGE8FW9XB4P5PA	usd	{"value": "46", "precision": 20}	0	2026-11-07 11:59:53.024-05	2026-11-07 11:59:53.024-05	\N	\N	46	\N	\N	\N	\N
price_01M6VF7JZJ16XW87FJZNH6GXAJ	\N	pset_01M6RV43BN47FFNFEE063V2CB0	cop	{"value": "253176", "precision": 20}	0	2026-11-07 11:59:53.207-05	2026-11-07 11:59:53.207-05	\N	\N	253176	\N	\N	\N	\N
price_01M6VF7JZJSVK7EQAAWTTMZMBZ	\N	pset_01M6RV43BN47FFNFEE063V2CB0	eur	{"value": "60", "precision": 20}	0	2026-11-07 11:59:53.207-05	2026-11-07 11:59:53.207-05	\N	\N	60	\N	\N	\N	\N
price_01M6VF7JZJNSE9V67WCQEA801K	\N	pset_01M6RV43BN47FFNFEE063V2CB0	usd	{"value": "65", "precision": 20}	0	2026-11-07 11:59:53.207-05	2026-11-07 11:59:53.207-05	\N	\N	65	\N	\N	\N	\N
\.


--
-- Data for Name: price_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.price_list (id, status, starts_at, ends_at, rules_count, title, description, type, created_at, updated_at, deleted_at, metadata) FROM stdin;
\.


--
-- Data for Name: price_list_rule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.price_list_rule (id, price_list_id, created_at, updated_at, deleted_at, value, attribute) FROM stdin;
\.


--
-- Data for Name: price_preference; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.price_preference (id, attribute, value, is_tax_inclusive, created_at, updated_at, deleted_at) FROM stdin;
prpref_01M6Q03EKRE3G5VMT6G1BH2YP3	currency_code	eur	f	2026-11-05 18:18:31.289-05	2026-11-05 18:18:31.289-05	\N
prpref_01M6Q03EKRZ4S17SGD72R22B1F	currency_code	usd	f	2026-11-05 18:18:31.289-05	2026-11-05 18:18:31.289-05	\N
prpref_01M6Q03EMPZWP5EWH3P4N0VBD4	region_id	reg_01M6Q03EM0ED42M95E5T6K27Z2	f	2026-11-05 18:18:31.318-05	2026-11-05 18:18:31.318-05	\N
prpref_01M6RV2Z620WJFMG20W19QFJ7T	currency_code	cop	f	2026-11-06 11:29:21.475-05	2026-11-06 11:29:21.475-05	\N
prpref_01M6RV2Z7MMF5YSESP1SDJNPZK	region_id	reg_01M6RV2Z6Y49SJ7X8247E44P84	f	2026-11-06 11:29:21.524-05	2026-11-06 11:29:21.524-05	\N
\.


--
-- Data for Name: price_rule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.price_rule (id, value, priority, price_id, created_at, updated_at, deleted_at, attribute, operator) FROM stdin;
prule_01M6Q03ER1KD5SDGEZTE7GFRQJ	reg_01M6Q03EM0ED42M95E5T6K27Z2	0	price_01M6Q03ER1GBYBK5HGV0P9BH6S	2026-11-05 18:18:31.427-05	2026-11-05 18:18:31.427-05	\N	region_id	eq
prule_01M6Q03ER2WGSRVENJV8BC79DB	reg_01M6Q03EM0ED42M95E5T6K27Z2	0	price_01M6Q03ER2GTPH3K2XM5KS7BSK	2026-11-05 18:18:31.427-05	2026-11-05 18:18:31.427-05	\N	region_id	eq
prule_01M6RV2ZAWF11PNDN2K55WZSZJ	reg_01M6RV2Z6Y49SJ7X8247E44P84	0	price_01M6RV2ZAW0BET0ZB9SA5JJT2N	2026-11-06 11:29:21.629-05	2026-11-06 11:29:21.629-05	\N	region_id	eq
\.


--
-- Data for Name: price_set; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.price_set (id, created_at, updated_at, deleted_at) FROM stdin;
pset_01M6Q03ER1S2XE4CM5FA0G7RKQ	2026-11-05 18:18:31.426-05	2026-11-05 18:18:31.426-05	\N
pset_01M6Q03ER234G9QW9PB819DGPC	2026-11-05 18:18:31.426-05	2026-11-05 18:18:31.426-05	\N
pset_01M6Q03F0306PBNZ0NW0ETZEJ3	2026-11-05 18:18:31.689-05	2026-11-06 10:08:27.981-05	2026-11-06 10:08:27.98-05
pset_01M6Q03F04S0YQ8H7GRKC8M7AB	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.01-05	2026-11-06 10:08:27.98-05
pset_01M6Q03F042F9A0PJSN1AAP0BY	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.02-05	2026-11-06 10:08:27.98-05
pset_01M6Q03F04WC99XK9NFXHYQ89Z	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.03-05	2026-11-06 10:08:27.98-05
pset_01M6Q03F0401T5Z9N3Z0682MW3	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.039-05	2026-11-06 10:08:27.98-05
pset_01M6Q03F05G3D779T5CNBRT7CV	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.051-05	2026-11-06 10:08:27.98-05
pset_01M6Q03F0513VYMGF9BDCN19S6	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.061-05	2026-11-06 10:08:27.98-05
pset_01M6Q03F0565WR743WX9HHYV6Q	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.07-05	2026-11-06 10:08:27.98-05
pset_01M6Q03F0587K7D5PFB8XRMJA9	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.081-05	2026-11-06 10:08:27.98-05
pset_01M6Q03F06A9C3XQ58B7S012W3	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.088-05	2026-11-06 10:08:27.98-05
pset_01M6Q03F06F4THMQRFYRKMKBV3	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.095-05	2026-11-06 10:08:27.98-05
pset_01M6Q03F0667N5YPEMTXR39252	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.102-05	2026-11-06 10:08:27.98-05
pset_01M6Q03F06AM34S6BXFDJXX293	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.108-05	2026-11-06 10:08:27.98-05
pset_01M6Q03F07KRP1HBHTHRTWM7JQ	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.116-05	2026-11-06 10:08:27.98-05
pset_01M6Q03F07S3D1Q0BRSVNBZYC9	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.122-05	2026-11-06 10:08:27.98-05
pset_01M6Q03F07KMA01J73CT98AAR3	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.129-05	2026-11-06 10:08:27.98-05
pset_01M6Q03F07HV48YM7W7BGVY3AF	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.136-05	2026-11-06 10:08:27.98-05
pset_01M6Q03F086FGP4BP02FE8RJM0	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.143-05	2026-11-06 10:08:27.98-05
pset_01M6Q03F08SY9GTZJZ9ME5KYP6	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.15-05	2026-11-06 10:08:27.98-05
pset_01M6Q03F089MRPX0PTRZ75RFK6	2026-11-05 18:18:31.689-05	2026-11-06 10:08:28.158-05	2026-11-06 10:08:27.98-05
pset_01M6Q0TVV5XYWPHH4NHFBX5ZZ3	2026-11-05 18:31:18.504-05	2026-11-06 10:08:28.166-05	2026-11-06 10:08:27.98-05
pset_01M6Q0TVV58HD9NT3Y45HA77B1	2026-11-05 18:31:18.504-05	2026-11-06 10:08:28.172-05	2026-11-06 10:08:27.98-05
pset_01M6Q0TVV6QRPHPJCAHWKZ3V7Y	2026-11-05 18:31:18.504-05	2026-11-06 10:08:28.18-05	2026-11-06 10:08:27.98-05
pset_01M6Q0TVV683B3JC3MENSWY3RK	2026-11-05 18:31:18.504-05	2026-11-06 10:08:28.187-05	2026-11-06 10:08:27.98-05
pset_01M6Q0TVV7N8TXSB5QM5JB6717	2026-11-05 18:31:18.504-05	2026-11-06 10:08:28.195-05	2026-11-06 10:08:27.98-05
pset_01M6Q0TVV7HGCAV54BPGXJB6WB	2026-11-05 18:31:18.504-05	2026-11-06 10:08:28.201-05	2026-11-06 10:08:27.98-05
pset_01M6Q0TVV7E0HQ6EEXFZ356V6W	2026-11-05 18:31:18.504-05	2026-11-06 10:08:28.208-05	2026-11-06 10:08:27.98-05
pset_01M6Q0TVV8WN4MJ4YG6WS5KNMS	2026-11-05 18:31:18.504-05	2026-11-06 10:08:28.216-05	2026-11-06 10:08:27.98-05
pset_01M6RV2ZAWJFHV75X154DPQ06N	2026-11-06 11:29:21.628-05	2026-11-06 11:29:21.628-05	\N
pset_01M6RPEW7DEC83CMTND4XZQKXW	2026-11-06 10:08:28.789-05	2026-11-06 11:29:21.998-05	2026-11-06 11:29:21.998-05
pset_01M6RPEW7D47TXZAMEVTBYXZPA	2026-11-06 10:08:28.789-05	2026-11-06 11:29:22.016-05	2026-11-06 11:29:21.998-05
pset_01M6RPEW7EAFZWF1VAMVRW47W6	2026-11-06 10:08:28.789-05	2026-11-06 11:29:22.027-05	2026-11-06 11:29:21.998-05
pset_01M6RPEW7E6ZTRDDN10V1FVKRQ	2026-11-06 10:08:28.789-05	2026-11-06 11:29:22.038-05	2026-11-06 11:29:21.998-05
pset_01M6RPEW7EDJG4K8M0PS75CJTQ	2026-11-06 10:08:28.789-05	2026-11-06 11:29:22.045-05	2026-11-06 11:29:21.998-05
pset_01M6RPEW7FXT9MJ7J5FK2E3GJF	2026-11-06 10:08:28.789-05	2026-11-06 11:29:22.055-05	2026-11-06 11:29:21.998-05
pset_01M6RPEW7F86ZPH5R87CQDVBHS	2026-11-06 10:08:28.789-05	2026-11-06 11:29:22.066-05	2026-11-06 11:29:21.998-05
pset_01M6RPEW7FXBN3HQ63NWXEBJZ4	2026-11-06 10:08:28.789-05	2026-11-06 11:29:22.079-05	2026-11-06 11:29:21.998-05
pset_01M6RPEW7FKDN0XSV8AY50GDJB	2026-11-06 10:08:28.789-05	2026-11-06 11:29:22.09-05	2026-11-06 11:29:21.998-05
pset_01M6RPEW7G7CWW1SAMSE3KWZQA	2026-11-06 10:08:28.789-05	2026-11-06 11:29:22.099-05	2026-11-06 11:29:21.998-05
pset_01M6RPEW7GKHP3250FGF62D8FN	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.11-05	2026-11-06 11:29:21.998-05
pset_01M6RPEW7G1VP13TF6Z7VH5SS4	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.121-05	2026-11-06 11:29:21.998-05
pset_01M6RPEW7GMP355K5KWB8Q7ND3	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.13-05	2026-11-06 11:29:21.998-05
pset_01M6RPEW7HJN3ES6BX12P34EX6	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.141-05	2026-11-06 11:29:21.998-05
pset_01M6RPEW7HBJDGMHFK1E8WX4G0	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.151-05	2026-11-06 11:29:21.998-05
pset_01M6RPEW7HC7Y8ENR2J82SFTMC	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.162-05	2026-11-06 11:29:21.998-05
pset_01M6RPEW7H8D19YCY7ABKAYN3B	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.169-05	2026-11-06 11:29:21.998-05
pset_01M6RPEW7JPGHJC39KKQBZK5FG	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.177-05	2026-11-06 11:29:21.998-05
pset_01M6RPEW7J5AADXYDDQAX6Z1ES	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.184-05	2026-11-06 11:29:21.998-05
pset_01M6RPEW7JZ04GQT4DMSHJE1C2	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.191-05	2026-11-06 11:29:21.998-05
pset_01M6RPEW7JRFJ4C73R9FF8CBEM	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.198-05	2026-11-06 11:29:21.998-05
pset_01M6RPEW7KMQMQ2EF5930F9FR3	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.205-05	2026-11-06 11:29:21.998-05
pset_01M6RPEW7KNJC7WXAQSXJW9F84	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.212-05	2026-11-06 11:29:21.998-05
pset_01M6RPEW7KY6DXBX39TKW8PPSM	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.22-05	2026-11-06 11:29:21.998-05
pset_01M6RPEW7KZ07EFZW0RXEQRNM8	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.227-05	2026-11-06 11:29:21.998-05
pset_01M6RPEW7K9TDZFNZHKPXAMF74	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.234-05	2026-11-06 11:29:21.998-05
pset_01M6RPEW7MFKZ9TKS74CNPEXYT	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.242-05	2026-11-06 11:29:21.998-05
pset_01M6RPEW7MXX23XW4F5XJGZ3WV	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.249-05	2026-11-06 11:29:21.998-05
pset_01M6RPEW7MQEKSSN7EZFGZK0S6	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.256-05	2026-11-06 11:29:21.998-05
pset_01M6RPEW7MQV5NN9DM5N17JEEW	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.264-05	2026-11-06 11:29:21.998-05
pset_01M6RPEW7NHK36GGEG1KTWYGEB	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.273-05	2026-11-06 11:29:21.998-05
pset_01M6RPEW7N4Y95A3V51A42D0M7	2026-11-06 10:08:28.79-05	2026-11-06 11:29:22.281-05	2026-11-06 11:29:21.998-05
pset_01M6RV43BD3JNDQWSS6GA78VN6	2026-11-06 11:29:58.522-05	2026-11-06 11:29:58.522-05	\N
pset_01M6RV43BECAVH4ZB7NVP7HP88	2026-11-06 11:29:58.522-05	2026-11-06 11:29:58.522-05	\N
pset_01M6RV43BEQKKSWAGGAHGEED2H	2026-11-06 11:29:58.522-05	2026-11-06 11:29:58.522-05	\N
pset_01M6RV43BEBP0HQ4P546GEYM8Y	2026-11-06 11:29:58.522-05	2026-11-06 11:29:58.522-05	\N
pset_01M6RV43BFPH4J75BQ9JGCJ0P5	2026-11-06 11:29:58.522-05	2026-11-06 11:29:58.522-05	\N
pset_01M6RV43BF1F63YETZCN4E5RN8	2026-11-06 11:29:58.522-05	2026-11-06 11:29:58.522-05	\N
pset_01M6RV43BGR8TNZJ2DBZFKJF2J	2026-11-06 11:29:58.522-05	2026-11-06 11:29:58.522-05	\N
pset_01M6RV43BG9R5E0HRR60FE3WC9	2026-11-06 11:29:58.522-05	2026-11-06 11:29:58.522-05	\N
pset_01M6RV43BHHR7JQZ2RD267EH81	2026-11-06 11:29:58.522-05	2026-11-06 11:29:58.522-05	\N
pset_01M6RV43BH81KHHXAE3K0KSM86	2026-11-06 11:29:58.522-05	2026-11-06 11:29:58.522-05	\N
pset_01M6RV43BJZFTP7VEG1Q33SBEF	2026-11-06 11:29:58.522-05	2026-11-06 11:29:58.522-05	\N
pset_01M6RV43BJDJMAVZBR5V6DRG2M	2026-11-06 11:29:58.522-05	2026-11-06 11:29:58.522-05	\N
pset_01M6RV43BJGR7XZ5Z81CV7JN3S	2026-11-06 11:29:58.522-05	2026-11-06 11:29:58.522-05	\N
pset_01M6RV43BK71704A1NZBJKKVHB	2026-11-06 11:29:58.522-05	2026-11-06 11:29:58.522-05	\N
pset_01M6RV43BK0XV8105MW01FAXCK	2026-11-06 11:29:58.522-05	2026-11-06 11:29:58.522-05	\N
pset_01M6RV43BKB21295GB1AZP8A0V	2026-11-06 11:29:58.522-05	2026-11-06 11:29:58.522-05	\N
pset_01M6RV43BMPFNFR218P6114BJA	2026-11-06 11:29:58.522-05	2026-11-06 11:29:58.522-05	\N
pset_01M6RV43BM0H4SC00N16E6DTV8	2026-11-06 11:29:58.522-05	2026-11-06 11:29:58.522-05	\N
pset_01M6RV43BMPS4T68C6WMZDT8YS	2026-11-06 11:29:58.522-05	2026-11-06 11:29:58.522-05	\N
pset_01M6RV43BN1RN5SVYVBP75DJS8	2026-11-06 11:29:58.522-05	2026-11-06 11:29:58.522-05	\N
pset_01M6RV43BN2AN3DKRRY2ATF4VJ	2026-11-06 11:29:58.522-05	2026-11-06 11:29:58.522-05	\N
pset_01M6RV43BN47FFNFEE063V2CB0	2026-11-06 11:29:58.522-05	2026-11-06 11:29:58.522-05	\N
pset_01M6RV43BPT41G70CWM1AAWG9T	2026-11-06 11:29:58.522-05	2026-11-06 11:29:58.522-05	\N
pset_01M6RV43BPK0XZDET9ZC9NPMBG	2026-11-06 11:29:58.522-05	2026-11-06 11:29:58.522-05	\N
pset_01M6RV43BPWDS4BJZXJKKAFMQE	2026-11-06 11:29:58.522-05	2026-11-06 11:29:58.522-05	\N
pset_01M6RV43BQW7YY8ZJ8JJV3S3XM	2026-11-06 11:29:58.522-05	2026-11-06 11:29:58.522-05	\N
pset_01M6RV43BQ6PTD9J01MWFASXBY	2026-11-06 11:29:58.522-05	2026-11-06 11:29:58.522-05	\N
pset_01M6RV43BQYXVXA41AWTTK02Y0	2026-11-06 11:29:58.522-05	2026-11-06 11:29:58.522-05	\N
pset_01M6RV43BRSRSGQ7896HNZGWSQ	2026-11-06 11:29:58.522-05	2026-11-06 11:29:58.522-05	\N
pset_01M6RV43BRSBPC10D36HWWW4XX	2026-11-06 11:29:58.522-05	2026-11-06 11:29:58.522-05	\N
pset_01M6RV43BR8KAG1J4V2G2AD3P4	2026-11-06 11:29:58.522-05	2026-11-06 11:29:58.522-05	\N
pset_01M6RV43BS13PGE8FW9XB4P5PA	2026-11-06 11:29:58.522-05	2026-11-06 11:29:58.522-05	\N
pset_01M6VRP8AZPBWS44X17S8HCDSS	2026-11-07 14:45:11.007-05	2026-11-07 14:45:11.007-05	\N
pset_01M6VRP8AZPAD4RVAQS4PWFD3P	2026-11-07 14:45:11.008-05	2026-11-07 14:45:11.008-05	\N
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, title, handle, subtitle, description, is_giftcard, status, thumbnail, weight, length, height, width, origin_country, hs_code, mid_code, material, collection_id, type_id, discountable, external_id, created_at, updated_at, deleted_at, metadata) FROM stdin;
prod_01M6Q03ETMVSFYX1YFMRV52WFM	Medusa T-Shirt	t-shirt	\N	Reimagine the feeling of a classic T-shirt. With our cotton T-shirts, everyday essentials no longer have to be ordinary.	f	published	https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png	400	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-05 18:18:31.518-05	2026-11-06 10:08:27.947-05	2026-11-06 10:08:27.945-05	\N
prod_01M6Q03ETMPNV54YAX30PF5MP4	Medusa Sweatshirt	sweatshirt	\N	Reimagine the feeling of a classic sweatshirt. With our cotton sweatshirt, everyday essentials no longer have to be ordinary.	f	published	https://medusa-public-images.s3.eu-west-1.amazonaws.com/sweatshirt-vintage-front.png	400	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-05 18:18:31.519-05	2026-11-06 10:08:27.969-05	2026-11-06 10:08:27.945-05	\N
prod_01M6Q03ETNKKC3J2PQ8J5HX3X1	Medusa Sweatpants	sweatpants	\N	Reimagine the feeling of classic sweatpants. With our cotton sweatpants, everyday essentials no longer have to be ordinary.	f	published	https://medusa-public-images.s3.eu-west-1.amazonaws.com/sweatpants-gray-front.png	400	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-05 18:18:31.519-05	2026-11-06 10:08:27.984-05	2026-11-06 10:08:27.945-05	\N
prod_01M6Q03ETNJS6M4Y5RV946030B	Medusa Shorts	shorts	\N	Reimagine the feeling of classic shorts. With our cotton shorts, everyday essentials no longer have to be ordinary.	f	published	https://medusa-public-images.s3.eu-west-1.amazonaws.com/shorts-vintage-front.png	400	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-05 18:18:31.519-05	2026-11-06 10:08:27.991-05	2026-11-06 10:08:27.945-05	\N
prod_01M6Q0TVNVJF38J8BV2MB49QH0	Aguacate Hass Orgánico (Malla 500g)	aguacate-hass-organico	\N	Aguacates Hass frescos seleccionados en su punto óptimo de maduración. Ideales para ensaladas, tostadas y guacamole.	f	published	https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-05 18:31:18.347-05	2026-11-06 10:08:28.004-05	2026-11-06 10:08:27.945-05	\N
prod_01M6Q0TVNV9Y6GBVRV7MFM7ZJV	Fresas Frescas Seleccionadas (500g)	fresas-frescas-500g	\N	Fresas dulces de cosecha local, lavadas y listas para consumir o preparar postres y batidos.	f	published	https://images.unsplash.com/photo-1464965911861-746a04b4bca6?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-05 18:31:18.347-05	2026-11-06 10:08:28.012-05	2026-11-06 10:08:27.945-05	\N
prod_01M6Q0TVNV2PJR6Q3NWMDR5B75	Café en Grano Tostado Artesanal (500g)	cafe-grano-artesanal	\N	Café 100% Arábica de altura con notas achocolatadas y aroma intenso. Tostado medio ideal para espresso o prensa francesa.	f	published	https://images.unsplash.com/photo-1559056199-641a0ac8b55e?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-05 18:31:18.347-05	2026-11-06 10:08:28.021-05	2026-11-06 10:08:27.945-05	\N
prod_01M6Q0TVNVZR9YGNY0KZBMAX7W	Aceite de Oliva Virgen Extra (750ml)	aceite-oliva-virgen-extra	\N	Extracción en frío de aceitunas seleccionadas. Sabor equilibrado para aderezos y alta cocina.	f	published	https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-05 18:31:18.347-05	2026-11-06 10:08:28.031-05	2026-11-06 10:08:27.945-05	\N
prod_01M6Q0TVNVFFWGQ5Y1B80VW3V3	Leche Entera Fresca Pasteurizada (1L)	leche-entera-fresca-1l	\N	Leche 100% natural de granjas certificadas, rica en calcio y vitaminas A y D.	f	published	https://images.unsplash.com/photo-1563636619-e9143da7973b?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-05 18:31:18.347-05	2026-11-06 10:08:28.041-05	2026-11-06 10:08:27.945-05	\N
prod_01M6Q0TVNVGK5HCTWXPDWAWQR1	Huevos Camperos Orgánicos (Docena)	huevos-camperos-docena	\N	Estuche de 12 huevos frescos de gallinas libres de jaula alimentadas con granos naturales.	f	published	https://images.unsplash.com/photo-1582722872445-44dc5f7e3c8f?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-05 18:31:18.347-05	2026-11-06 10:08:28.05-05	2026-11-06 10:08:27.945-05	\N
prod_01M6Q0TVNVAZY133GAN1HH5XEW	Jugo de Naranja 100% Exprimido (1L)	jugo-naranja-exprimido	\N	Sin azúcar añadida ni conservantes. Exprimido de naranjas frescas recién recolectadas.	f	published	https://images.unsplash.com/photo-1600271886742-f049cd451bba?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-05 18:31:18.347-05	2026-11-06 10:08:28.059-05	2026-11-06 10:08:27.945-05	\N
prod_01M6Q0TVNVR8Q95SX58M1A1PR8	Pan Artesanal de Masa Madre (Hogaza)	pan-artesanal-masa-madre	\N	Horneado diariamente con fermentación lenta de 24 horas. Corteza crujiente y miga suave.	f	published	https://images.unsplash.com/photo-1509440159596-0249088772ff?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-05 18:31:18.347-05	2026-11-06 10:08:28.069-05	2026-11-06 10:08:27.945-05	\N
prod_01M6RPEW07RE5HGX8MNWG22ACV	Aguacate Hass Orgánico Seleccionado	aguacate-hass-organico	\N	Aguacates Hass cremosos de exportación. Disponibles por malla individual para el hogar o por canastilla de 10kg para restaurantes y negocios.	f	published	https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-06 10:08:28.568-05	2026-11-06 11:29:21.97-05	2026-11-06 11:29:21.969-05	{"detal_label": "Malla x 500g", "mayor_label": "Canastilla x 10kg (Ahorra 20%)", "category_name": "Frutas y Verduras"}
prod_01M6RPEW08B012SRX8884NNF8R	Fresas Frescas Premium del Valle	fresas-frescas-500g	\N	Fresas dulces recién recolectadas, lavadas y clasificadas. Venta al detal en bandeja o caja mayorista para repostería y juguerías.	f	published	https://images.unsplash.com/photo-1464965911861-746a04b4bca6?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-06 10:08:28.568-05	2026-11-06 11:29:21.994-05	2026-11-06 11:29:21.969-05	{"detal_label": "Bandeja x 500g", "mayor_label": "Caja x 10 Bandejas (Ahorra 20%)", "category_name": "Frutas y Verduras"}
prod_01M6RPEW08BDRRNWA2XHA9PDWN	Plátano / Banano Orgánico de Exportación	banano-organico-exportacion	\N	Bananos dulces ricos en potasio y energía natural. Llévalos por mano familiar o por caja cerrada a precio de distribuidor.	f	published	https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-06 10:08:28.568-05	2026-11-06 11:29:22.003-05	2026-11-06 11:29:21.969-05	{"detal_label": "Mano x 1kg", "mayor_label": "Caja Mayorista x 12kg", "category_name": "Frutas y Verduras"}
prod_01M6RPEW081153HWTZ3RP6EZ5V	Café en Grano Tostado Artesanal	cafe-grano-artesanal	\N	Café 100% Arábica de altura con notas achocolatadas. Ideal para el hogar o abastecimiento mayorista de cafeterías y oficinas.	f	published	https://images.unsplash.com/photo-1559056199-641a0ac8b55e?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-06 10:08:28.568-05	2026-11-06 11:29:22.013-05	2026-11-06 11:29:21.969-05	{"detal_label": "Bolsa x 500g", "mayor_label": "Paca x 12 Bolsas (6kg)", "category_name": "Despensa y Abarrotes"}
prod_01M6RPEW08Q3WJXN2D5T6MJ68R	Aceite de Oliva Virgen Extra Gourmet	aceite-oliva-virgen-extra	\N	Primera extracción en frío de aceitunas seleccionadas. Disponible por botella de 750ml o caja de 6 unidades para cocinas profesionales.	f	published	https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-06 10:08:28.568-05	2026-11-06 11:29:22.025-05	2026-11-06 11:29:21.969-05	{"detal_label": "Botella x 750ml", "mayor_label": "Caja x 6 Botellas", "category_name": "Despensa y Abarrotes"}
prod_01M6RPEW08NBPN2008PFPYB34Q	Arroz Blanco Extra Grano Entero	arroz-blanco-extra-grano	\N	Arroz seleccionado que rinde más y queda suelto siempre. Compra por bolsa de kilo o por arroba/paca mayorista al mejor precio.	f	published	https://images.unsplash.com/photo-1586201375761-83865001e31c?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-06 10:08:28.568-05	2026-11-06 11:29:22.036-05	2026-11-06 11:29:21.969-05	{"detal_label": "Bolsa x 1kg", "mayor_label": "Paca Mayorista x 25kg", "category_name": "Despensa y Abarrotes"}
prod_01M6RPEW084PYH5PFP7RKQC28G	Pan Artesanal de Masa Madre	pan-artesanal-masa-madre	\N	Horneado diariamente con fermentación lenta de 24 horas. Corteza crujiente y miga suave para el hogar o restaurantes.	f	published	https://images.unsplash.com/photo-1509440159596-0249088772ff?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-06 10:08:28.568-05	2026-11-06 11:29:22.053-05	2026-11-06 11:29:21.969-05	{"detal_label": "Hogaza x 650g", "mayor_label": "Lote x 10 Hogazas", "category_name": "Despensa y Abarrotes"}
prod_01M6RPEW086EP0YGHQXYZXMH0D	Leche Entera Fresca Pasteurizada	leche-entera-fresca-1l	\N	Leche 100% natural de granjas certificadas, rica en calcio y vitaminas A y D. Lleva por litro o paca cerrada de 12 litros.	f	published	https://images.unsplash.com/photo-1563636619-e9143da7973b?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-06 10:08:28.568-05	2026-11-06 11:29:22.063-05	2026-11-06 11:29:21.969-05	{"detal_label": "Caja x 1 Litro", "mayor_label": "Paca x 12 Litros", "category_name": "Lácteos y Huevos"}
prod_01M6RPEW08XDN4YM5CJZA5BJ18	Huevos Camperos Orgánicos AA	huevos-camperos-docena	\N	Huevos frescos de gallinas libres de jaula alimentadas con maíz natural. Disponibles por docena o por caja de 12 panales (360 uds).	f	published	https://images.unsplash.com/photo-1582722872445-44dc5f7e3c8f?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-06 10:08:28.568-05	2026-11-06 11:29:22.077-05	2026-11-06 11:29:21.969-05	{"detal_label": "Cubeta x 12 uds", "mayor_label": "Caja Mayorista x 360 uds", "category_name": "Lácteos y Huevos"}
prod_01M6RPEW08GBEJSDYN8AHKK790	Queso Mozzarella Fresco Artesanal	queso-mozzarella-fresco	\N	Queso doble crema y mozzarella de fundido perfecto. Ideal para sándwiches en casa o pizzerías y negocios de comida rápida.	f	published	https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-06 10:08:28.568-05	2026-11-06 11:29:22.088-05	2026-11-06 11:29:21.969-05	{"detal_label": "Bloque x 500g", "mayor_label": "Barra Mayorista x 5kg", "category_name": "Lácteos y Huevos"}
prod_01M6RPEW082VFHFT1FWY02275R	Corte Premium Lomo de Res Madurado	lomo-res-madurado	\N	Carne de res seleccionada con maduración controlada al vacío para máxima suavidad y jugosidad en parrilla o sartén.	f	published	https://images.unsplash.com/photo-1607623814075-e51df1bdc82f?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-06 10:08:28.568-05	2026-11-06 11:29:22.098-05	2026-11-06 11:29:21.969-05	{"detal_label": "Bandeja x 500g", "mayor_label": "Pieza Entera al Vacío x 5kg", "category_name": "Carnes y Charcutería"}
prod_01M6RPEW08CNRNJSHV2P1ZT5QW	Pechuga de Pollo Fresca Sin Hueso	pechuga-pollo-fresca	\N	Filetes de pechuga limpia de granja, sin hormonas ni marinados artificiales. Lista para porcionar en casa o negocio.	f	published	https://images.unsplash.com/photo-1604503468506-a8da13d82791?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-06 10:08:28.568-05	2026-11-06 11:29:22.109-05	2026-11-06 11:29:21.969-05	{"detal_label": "Bandeja x 1kg", "mayor_label": "Caja Mayorista x 10kg", "category_name": "Carnes y Charcutería"}
prod_01M6RPEW08AMZS17MYD0A0XQV9	Jugo de Naranja 100% Exprimido Natural	jugo-naranja-exprimido	\N	Sin azúcar añadida ni conservantes. Exprimido de naranjas frescas recién recolectadas en botella individual o six-pack.	f	published	https://images.unsplash.com/photo-1600271886742-f049cd451bba?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-06 10:08:28.568-05	2026-11-06 11:29:22.119-05	2026-11-06 11:29:21.969-05	{"detal_label": "Botella x 1L", "mayor_label": "Caja x 12 Botellas", "category_name": "Bebidas y Licores"}
prod_01M6RPEW08K7G5BQ2AJVBNWSD8	Agua Mineral Natural de Manantial	agua-mineral-manantial	\N	Agua pura de manantial de montaña con minerales equilibrados. Venta individual o por paca mayorista para eventos y comercios.	f	published	https://images.unsplash.com/photo-1548839140-29a749e1cf4d?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-06 10:08:28.568-05	2026-11-06 11:29:22.129-05	2026-11-06 11:29:21.969-05	{"detal_label": "Botella x 1.5L", "mayor_label": "Paca Mayorista x 24 uds", "category_name": "Bebidas y Licores"}
prod_01M6RPEW08KKFEMGCR8DHA8253	Detergente Líquido Ecológico Concentrado	detergente-liquido-ecologico	\N	Fórmula biodegradable de alto poder quitamanchas y aroma fresco duradero. Cuida tu ropa y el medio ambiente.	f	published	https://images.unsplash.com/photo-1583947215259-38e31be8751f?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-06 10:08:28.568-05	2026-11-06 11:29:22.139-05	2026-11-06 11:29:21.969-05	{"detal_label": "Galón x 3 Litros", "mayor_label": "Bidón Institucional x 20L", "category_name": "Aseo y Hogar"}
prod_01M6RPEW089JG2ZHZMY25K7FKE	Papel Higiénico Triple Hoja Ultra Suave	papel-higienico-triple-hoja	\N	Máxima suavidad, absorción y rendimiento con extracto de algodón. Disponible en paquete familiar o fardo mayorista.	f	published	https://images.unsplash.com/photo-1584556812952-905ffd0c611a?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-06 10:08:28.568-05	2026-11-06 11:29:22.149-05	2026-11-06 11:29:21.969-05	{"detal_label": "Paquete x 12 Rollos", "mayor_label": "Fardo Mayorista x 96 Rollos", "category_name": "Aseo y Hogar"}
prod_01M6RV433V6XR5MWQQ2R2HZK77	Pan Artesanal Fresco de Masa Madre	pan-artesanal-masa-madre	\N	Horneado todas las mañanas con fermentación lenta. Corteza dorada y miga suave para desayunos o restaurantes.	f	published	https://images.unsplash.com/photo-1509440159596-0249088772ff?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-06 11:29:58.286-05	2026-11-07 11:59:50.411-05	\N	{"sede": "Sede Principal", "barcode": "7702002002046", "cost_cop": 7600, "stock_qty": 150, "detal_label": "Hogaza x 650g", "mayor_label": "Canasta x 10 Hogazas", "mayor_units": 10, "discount_pct": 15, "category_name": "Despensa y Abarrotes", "detal_margin_pct": 20, "mayor_margin_pct": 15}
prod_01M6RV433VBXFP15V95A7WYZJ7	Fresas Sabaneras Extra Dulces	fresas-frescas-500g	\N	Fresas recién recolectadas de la Sabana de Bogotá, clasificadas y listas para jugo, postres o negocio.	f	published	https://images.unsplash.com/photo-1464965911861-746a04b4bca6?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-06 11:29:58.286-05	2026-11-07 11:59:50.717-05	\N	{"sede": "Sede Principal", "barcode": "7701001001025", "cost_cop": 4640, "stock_qty": 150, "detal_label": "Bandeja x 500g", "mayor_label": "Caja x 10 Bandejas (5kg)", "mayor_units": 10, "discount_pct": 15, "category_name": "Frutas y Verduras", "detal_margin_pct": 20, "mayor_margin_pct": 15}
prod_01M6RV433VFVQK8CJ13HYDBF8C	Leche Entera de la Sabana UHT	leche-entera-fresca-1l	\N	Leche 100% pura de vaca de hatos certificados en Cundinamarca y Antioquia. Venta por bolsa/caja o paca x 12 litros.	f	published	https://images.unsplash.com/photo-1563636619-e9143da7973b?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-06 11:29:58.286-05	2026-11-07 11:59:50.888-05	\N	{"sede": "Sede Principal", "barcode": "7703003003012", "cost_cop": 3840, "stock_qty": 150, "detal_label": "Caja x 1 Litro", "mayor_label": "Paca x 12 Litros", "mayor_units": 10, "discount_pct": 15, "category_name": "Lácteos y Huevos", "detal_margin_pct": 20, "mayor_margin_pct": 15}
prod_01M6RV433VH280P701DXANFBRN	Aceite Gourmet Vegetal / Oliva Extra	aceite-oliva-virgen-extra	\N	Aceite puro libre de colesterol para cocina familiar o fritura limpia en restaurantes. Botella o caja cerrada.	f	published	https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-06 11:29:58.286-05	2026-11-07 11:59:51.04-05	\N	{"sede": "Sede Principal", "barcode": "7702002002022", "cost_cop": 22800, "stock_qty": 150, "detal_label": "Botella x 1000ml", "mayor_label": "Caja x 6 Botellas", "mayor_units": 10, "discount_pct": 15, "category_name": "Despensa y Abarrotes", "detal_margin_pct": 20, "mayor_margin_pct": 15}
prod_01M6RV433W5X97CNW0881T4HVS	Huevos Rojos Camperos AA	huevos-camperos-docena	\N	Huevos frescos AA de granja avícola colombiana. Llévalos por cubeta de 30 unidades o caja mayorista de 12 cubetas (360 uds).	f	published	https://images.unsplash.com/photo-1582722872445-44dc5f7e3c8f?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-06 11:29:58.286-05	2026-11-07 11:59:51.88-05	\N	{"sede": "Sede Principal", "barcode": "7703003003029", "cost_cop": 13520, "stock_qty": 150, "detal_label": "Cubeta x 30 Unidades AA", "mayor_label": "Caja Mayorista x 360 uds (12 Cubetas)", "mayor_units": 10, "discount_pct": 0, "category_name": "Lácteos y Huevos", "detal_margin_pct": 20, "mayor_margin_pct": 15}
prod_01M6RV433W9FM6BGE5SP0V9VXE	Agua Manantial de Páramo Sin Gas	agua-mineral-manantial	\N	Agua cristalina de manantial colombiano en botella individual o paca termoencogida para tiendas y eventos.	f	published	https://images.unsplash.com/photo-1548839140-29a749e1cf4d?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-06 11:29:58.286-05	2026-11-07 11:59:52.14-05	\N	{"sede": "Sede Principal", "barcode": "7705005005023", "cost_cop": 2240, "stock_qty": 150, "detal_label": "Botella x 1.5L", "mayor_label": "Paca Mayorista x 24 uds", "mayor_units": 10, "discount_pct": 0, "category_name": "Bebidas y Licores", "detal_margin_pct": 20, "mayor_margin_pct": 15}
prod_01M6RV433WFGYYK1YXC74TA0VY	Detergente Líquido Concentrado Multiusos	detergente-liquido-ecologico	\N	Máximo poder desmanchador y fragancia fresca duradera. Disponible en galón para hogar o pimpina institucional.	f	published	https://images.unsplash.com/photo-1583947215259-38e31be8751f?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-06 11:29:58.287-05	2026-11-07 11:59:52.49-05	\N	{"sede": "Sede Principal", "barcode": "7706006006013", "cost_cop": 17520, "stock_qty": 150, "detal_label": "Galón x 3 Litros", "mayor_label": "Pimpina Mayorista x 20L", "mayor_units": 10, "discount_pct": 0, "category_name": "Aseo y Hogar", "detal_margin_pct": 20, "mayor_margin_pct": 15}
prod_01M6RV433WTRZ4DGQ5HHJCEV93	Jugo de Naranja Tangelo 100% Natural	jugo-naranja-exprimido	\N	Exprimido de naranjas frescas del Eje Cafetero sin azúcar añadida ni conservantes.	f	published	https://images.unsplash.com/photo-1600271886742-f049cd451bba?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-06 11:29:58.286-05	2026-11-07 11:59:53.251-05	\N	{"sede": "Sede Principal", "barcode": "7705005005016", "cost_cop": 7120, "stock_qty": 150, "detal_label": "Botella x 1L", "mayor_label": "Caja x 12 Botellas", "mayor_units": 10, "discount_pct": 0, "category_name": "Bebidas y Licores", "detal_margin_pct": 20, "mayor_margin_pct": 15}
prod_01M6RV433V3S45S2XK53QKXJG7	Arroz Blanco del Tolima Grano Entero	arroz-blanco-extra-grano	\N	Arroz colombiano seleccionado que crece y queda suelto. Lleva por kilo o por arroba/paca mayorista de 25 bolsas.	f	published	https://images.unsplash.com/photo-1586201375761-83865001e31c?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-06 11:29:58.286-05	2026-11-07 12:44:41.338-05	\N	{"sede": "Sede Principal", "barcode": "7702002002039", "cost_cop": 67000, "stock_qty": 150, "detal_label": "Bolsa x 1kg", "mayor_label": "Paca Mayorista x 25kg (2 Arrobas)", "mayor_units": 10, "discount_pct": 0, "category_name": "Despensa y Abarrotes", "detal_margin_pct": 20, "mayor_margin_pct": 10}
prod_01M6RV433V2SMZXSHC9ET34Q7P	Banano Urabá Tipo Exportación	banano-organico-exportacion	\N	Bananos dulces ricos en potasio de Urabá. Disponibles por mano familiar o caja cerrada para tiendas y restaurantes.	f	published	https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-06 11:29:58.286-05	2026-11-07 11:59:49.968-05	\N	{"sede": "Sede Principal", "barcode": "7701001001032", "cost_cop": 1000, "stock_qty": 150, "detal_label": "Mano x 1kg", "mayor_label": "Caja Mayorista x 12kg", "mayor_units": 10, "discount_pct": 0, "category_name": "Frutas y Verduras", "detal_margin_pct": 20, "mayor_margin_pct": 15}
prod_01M6RV433V8QZPH3PNVY46ZNEP	Café de Colombia Origen Huila Tostado	cafe-grano-artesanal	\N	Café 100% Colombiano Excelso de altura con notas a panela y cacao. Disponible por libra o paca mayorista x 12 libras.	f	published	https://images.unsplash.com/photo-1559056199-641a0ac8b55e?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-06 11:29:58.286-05	2026-11-07 11:59:50.567-05	\N	{"sede": "Sede Principal", "barcode": "7702002002015", "cost_cop": 18320, "stock_qty": 150, "detal_label": "Bolsa x 500g (1 Libra)", "mayor_label": "Paca x 12 Libras (6kg)", "mayor_units": 10, "discount_pct": 0, "category_name": "Despensa y Abarrotes", "detal_margin_pct": 20, "mayor_margin_pct": 15}
prod_01M6RV433VXTN0Q3M4KFEPFEVY	Aguacate Hass de Antioquia Seleccionado	aguacate-hass-organico	\N	Aguacates Hass cremosos de exportación cultivados en el Oriente Antioqueño. Lleva por malla familiar o canastilla mayorista de 10kg.	f	published	https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-06 11:29:58.286-05	2026-11-07 11:59:51.312-05	\N	{"sede": "Sede Principal", "barcode": "7701001001018", "cost_cop": 5520, "stock_qty": 150, "detal_label": "Malla x 1kg", "mayor_label": "Canastilla x 10kg (Ahorra 20%)", "mayor_units": 10, "discount_pct": 0, "category_name": "Frutas y Verduras", "detal_margin_pct": 20, "mayor_margin_pct": 15}
prod_01M6RV433WAC11MFF8J8MYGGXV	Queso Doble Crema / Mozzarella Tajado	queso-mozzarella-fresco	\N	Queso fresco colombiano de hilado suave que estira perfecto en arepas, sanduches, pizzas y panadería.	f	published	https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-06 11:29:58.286-05	2026-11-07 11:59:52.299-05	\N	{"sede": "Sede Principal", "barcode": "7703003003036", "cost_cop": 11600, "stock_qty": 150, "detal_label": "Bloque x 500g", "mayor_label": "Barra Mayorista x 2.5kg (x2 barras)", "mayor_units": 10, "discount_pct": 0, "category_name": "Lácteos y Huevos", "detal_margin_pct": 20, "mayor_margin_pct": 15}
prod_01M6RV433WKGNMKY7EYCP575XW	Papel Higiénico Triple Hoja Rinde Más	papel-higienico-triple-hoja	\N	Suavidad acolchada con extracto de algodón y metraje extra. Paquete familiar o paca distribuidora.	f	published	https://images.unsplash.com/photo-1584556812952-905ffd0c611a?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-06 11:29:58.287-05	2026-11-07 11:59:52.903-05	\N	{"sede": "Sede Principal", "barcode": "7706006006020", "cost_cop": 15120, "stock_qty": 150, "detal_label": "Paquete x 12 Rollos", "mayor_label": "Fardo Mayorista x 96 Rollos", "mayor_units": 10, "discount_pct": 0, "category_name": "Aseo y Hogar", "detal_margin_pct": 20, "mayor_margin_pct": 15}
prod_01M6VRP832RAWH9B74NB480E0K	Aceite Premier Puro Girasol	aceite-premier-puro-girasol-721	\N	Producto fresco disponible al detal y por mayor.	f	published	https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-07 14:45:10.759-05	2026-11-07 14:45:10.759-05	\N	{"sede": "Sede Principal", "barcode": "7702025102004", "pasillo": "Góndola Central", "cost_cop": 9600, "stock_qty": 150, "detal_label": "Unidad Estándar", "mayor_label": "Caja Mayorista x 12 uds", "mayor_units": 12, "discount_pct": 0, "detal_margin_pct": 20, "mayor_margin_pct": 15}
prod_01M6RV433WSANFXX1A1XPDAKKT	Churrasco / Lomo de Res Madurado	lomo-res-madurado	\N	Corte premium de ganado seleccionado en los Llanos y Córdoba, empacado al vacío con cadena de frío garantizada.	f	published	https://images.unsplash.com/photo-1607623814075-e51df1bdc82f?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-06 11:29:58.286-05	2026-11-07 11:59:53.083-05	\N	{"sede": "Sede Principal", "barcode": "7704004004019", "cost_cop": 21520, "stock_qty": 150, "detal_label": "Bandeja x 500g", "mayor_label": "Pieza Entera al Vacío x 5kg", "mayor_units": 10, "discount_pct": 0, "category_name": "Carnes y Charcutería", "detal_margin_pct": 20, "mayor_margin_pct": 15}
prod_01M6RV433WHK3TK8WS4BB3NCD0	Pechuga de Pollo Campesino Sin Hueso	pechuga-pollo-fresca	\N	Filetes de pechuga fresca limpia sin marinado artificial. Ideal para el mercado semanal o asaderos y restaurantes.	f	published	https://images.unsplash.com/photo-1604503468506-a8da13d82791?auto=format&fit=crop&w=800&q=80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-11-06 11:29:58.286-05	2026-11-07 11:59:52.689-05	\N	{"sede": "Sede Principal", "barcode": "7704004004026", "cost_cop": 13200, "stock_qty": 150, "detal_label": "Bandeja x 1kg", "mayor_label": "Canastilla Mayorista x 10kg", "mayor_units": 10, "discount_pct": 15, "category_name": "Carnes y Charcutería", "detal_margin_pct": 20, "mayor_margin_pct": 15}
\.


--
-- Data for Name: product_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_category (id, name, description, handle, mpath, is_active, is_internal, rank, parent_category_id, created_at, updated_at, deleted_at, metadata, external_id) FROM stdin;
pcat_01M6RV432P6DDVQTTE4FHKK8A2	Lácteos y Huevos		lacteos-y-huevos	pcat_01M6RV432P6DDVQTTE4FHKK8A2	t	f	2	\N	2026-11-06 11:29:58.232-05	2026-11-06 11:29:58.232-05	\N	\N	\N
pcat_01M6RV432Q9W6SR9JJBHHAJTZT	Carnes y Charcutería		carnes-y-charcuteria	pcat_01M6RV432Q9W6SR9JJBHHAJTZT	t	f	3	\N	2026-11-06 11:29:58.232-05	2026-11-06 11:29:58.232-05	\N	\N	\N
pcat_01M6RV432Q6Y910JA2N9WMG2AJ	Bebidas y Licores		bebidas-y-licores	pcat_01M6RV432Q6Y910JA2N9WMG2AJ	t	f	4	\N	2026-11-06 11:29:58.232-05	2026-11-06 11:29:58.232-05	\N	\N	\N
pcat_01M6RV432Q1EDEV8B8R5TTR5XW	Aseo y Hogar		aseo-y-hogar	pcat_01M6RV432Q1EDEV8B8R5TTR5XW	t	f	5	\N	2026-11-06 11:29:58.232-05	2026-11-06 11:29:58.232-05	\N	\N	\N
pcat_01M6RV303PBZVGCXVDF6ZGEWEQ	Despensa y Abarrotes		despensa-y-abarrotes	pcat_01M6RV303PBZVGCXVDF6ZGEWEQ	t	f	0	\N	2026-11-06 11:29:22.424-05	2026-11-06 11:29:58.173-05	2026-11-06 11:29:58.173-05	\N	\N
pcat_01M6RV303QD9GZ049ND5CE9T37	Lácteos y Huevos		lacteos-y-huevos	pcat_01M6RV303QD9GZ049ND5CE9T37	t	f	0	\N	2026-11-06 11:29:22.424-05	2026-11-06 11:29:58.176-05	2026-11-06 11:29:58.175-05	\N	\N
pcat_01M6Q03ESNJNW5EFD6KERQWB3R	Sweatshirts		sweatshirts	pcat_01M6Q03ESNJNW5EFD6KERQWB3R	t	f	0	\N	2026-11-05 18:18:31.478-05	2026-11-06 10:08:28.339-05	2026-11-06 10:08:28.339-05	\N	\N
pcat_01M6Q03ESPYE5TDVJ79ZTVG5EK	Pants		pants	pcat_01M6Q03ESPYE5TDVJ79ZTVG5EK	t	f	0	\N	2026-11-05 18:18:31.478-05	2026-11-06 10:08:28.341-05	2026-11-06 10:08:28.34-05	\N	\N
pcat_01M6Q03ESPAYRD70R717Z74Q5X	Merch		merch	pcat_01M6Q03ESPAYRD70R717Z74Q5X	t	f	0	\N	2026-11-05 18:18:31.478-05	2026-11-06 10:08:28.341-05	2026-11-06 10:08:28.339-05	\N	\N
pcat_01M6Q0TVJ025A75WPP3HPQW87X	Frutas y Verduras		frutas-y-verduras	pcat_01M6Q0TVJ025A75WPP3HPQW87X	t	f	0	\N	2026-11-05 18:31:18.21-05	2026-11-06 10:08:28.344-05	2026-11-06 10:08:28.342-05	\N	\N
pcat_01M6Q0TVJ15X24XZ9MQY1QTH37	Lácteos y Huevos		lácteos-y-huevos	pcat_01M6Q0TVJ15X24XZ9MQY1QTH37	t	f	0	\N	2026-11-05 18:31:18.21-05	2026-11-06 10:08:28.345-05	2026-11-06 10:08:28.344-05	\N	\N
pcat_01M6Q03ESN4NY6W7657VQ3MWJB	Shirts		shirts	pcat_01M6Q03ESN4NY6W7657VQ3MWJB	t	f	0	\N	2026-11-05 18:18:31.478-05	2026-11-06 10:08:28.345-05	2026-11-06 10:08:28.345-05	\N	\N
pcat_01M6Q0TVJ1E1Y2GS1H3C36PEWA	Despensa y Abarrotes		despensa-y-abarrotes	pcat_01M6Q0TVJ1E1Y2GS1H3C36PEWA	t	f	0	\N	2026-11-05 18:31:18.21-05	2026-11-06 10:08:28.346-05	2026-11-06 10:08:28.345-05	\N	\N
pcat_01M6Q0TVJ1T1ASN3ERKZRN9JX5	Bebidas y Snacks		bebidas-y-snacks	pcat_01M6Q0TVJ1T1ASN3ERKZRN9JX5	t	f	0	\N	2026-11-05 18:31:18.21-05	2026-11-06 10:08:28.346-05	2026-11-06 10:08:28.345-05	\N	\N
pcat_01M6RPEVVS96RH55GV25JRB1AH	Lácteos y Huevos		lacteos-y-huevos	pcat_01M6RPEVVS96RH55GV25JRB1AH	t	f	0	\N	2026-11-06 10:08:28.41-05	2026-11-06 11:29:22.367-05	2026-11-06 11:29:22.367-05	\N	\N
pcat_01M6RPEVVSJ3XDA19R8DJP6X99	Despensa y Abarrotes		despensa-y-abarrotes	pcat_01M6RPEVVSJ3XDA19R8DJP6X99	t	f	0	\N	2026-11-06 10:08:28.41-05	2026-11-06 11:29:22.369-05	2026-11-06 11:29:22.367-05	\N	\N
pcat_01M6RPEVVTCR92X74SQWT003TZ	Aseo y Hogar		aseo-y-hogar	pcat_01M6RPEVVTCR92X74SQWT003TZ	t	f	0	\N	2026-11-06 10:08:28.41-05	2026-11-06 11:29:22.369-05	2026-11-06 11:29:22.367-05	\N	\N
pcat_01M6RPEVVR81DCNGA26G9JJD4Z	Frutas y Verduras		frutas-y-verduras	pcat_01M6RPEVVR81DCNGA26G9JJD4Z	t	f	0	\N	2026-11-06 10:08:28.41-05	2026-11-06 11:29:22.37-05	2026-11-06 11:29:22.37-05	\N	\N
pcat_01M6RPEVVTK1QCNP1VMB5CZ63D	Carnes y Charcutería		carnes-y-charcuteria	pcat_01M6RPEVVTK1QCNP1VMB5CZ63D	t	f	0	\N	2026-11-06 10:08:28.41-05	2026-11-06 11:29:22.37-05	2026-11-06 11:29:22.369-05	\N	\N
pcat_01M6RPEVVTNCTM4AGFEK2TE84G	Bebidas y Licores		bebidas-y-licores	pcat_01M6RPEVVTNCTM4AGFEK2TE84G	t	f	0	\N	2026-11-06 10:08:28.41-05	2026-11-06 11:29:22.37-05	2026-11-06 11:29:22.37-05	\N	\N
pcat_01M6RV303Q7KWYZ6CDDY5GDG05	Carnes y Charcutería		carnes-y-charcuteria	pcat_01M6RV303Q7KWYZ6CDDY5GDG05	t	f	0	\N	2026-11-06 11:29:22.424-05	2026-11-06 11:29:58.176-05	2026-11-06 11:29:58.174-05	\N	\N
pcat_01M6RV303QFTHVT9G7W9XZ7CRZ	Bebidas y Licores		bebidas-y-licores	pcat_01M6RV303QFTHVT9G7W9XZ7CRZ	t	f	0	\N	2026-11-06 11:29:22.424-05	2026-11-06 11:29:58.178-05	2026-11-06 11:29:58.177-05	\N	\N
pcat_01M6RV303QQBTH2B5D7T531TXM	Aseo y Hogar		aseo-y-hogar	pcat_01M6RV303QQBTH2B5D7T531TXM	t	f	0	\N	2026-11-06 11:29:22.424-05	2026-11-06 11:29:58.178-05	2026-11-06 11:29:58.178-05	\N	\N
pcat_01M6RV303MGNCHMXKVAGSNFSP0	Frutas y Verduras		frutas-y-verduras	pcat_01M6RV303MGNCHMXKVAGSNFSP0	t	f	0	\N	2026-11-06 11:29:22.424-05	2026-11-06 11:29:58.178-05	2026-11-06 11:29:58.178-05	\N	\N
pcat_01M6RV432HW26R69N5B21TD5ZM	Frutas y Verduras		frutas-y-verduras	pcat_01M6RV432HW26R69N5B21TD5ZM	t	f	0	\N	2026-11-06 11:29:58.232-05	2026-11-06 11:29:58.232-05	\N	\N	\N
pcat_01M6RV432P6NCYX5RB64FFSWQ0	Despensa y Abarrotes		despensa-y-abarrotes	pcat_01M6RV432P6NCYX5RB64FFSWQ0	t	f	1	\N	2026-11-06 11:29:58.232-05	2026-11-06 11:29:58.232-05	\N	\N	\N
\.


--
-- Data for Name: product_category_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_category_product (product_id, product_category_id) FROM stdin;
prod_01M6Q03ETMVSFYX1YFMRV52WFM	pcat_01M6Q03ESN4NY6W7657VQ3MWJB
prod_01M6Q03ETMPNV54YAX30PF5MP4	pcat_01M6Q03ESNJNW5EFD6KERQWB3R
prod_01M6Q03ETNKKC3J2PQ8J5HX3X1	pcat_01M6Q03ESPYE5TDVJ79ZTVG5EK
prod_01M6Q03ETNJS6M4Y5RV946030B	pcat_01M6Q03ESPAYRD70R717Z74Q5X
prod_01M6Q0TVNVJF38J8BV2MB49QH0	pcat_01M6Q0TVJ025A75WPP3HPQW87X
prod_01M6Q0TVNV9Y6GBVRV7MFM7ZJV	pcat_01M6Q0TVJ025A75WPP3HPQW87X
prod_01M6Q0TVNV2PJR6Q3NWMDR5B75	pcat_01M6Q0TVJ1E1Y2GS1H3C36PEWA
prod_01M6Q0TVNVZR9YGNY0KZBMAX7W	pcat_01M6Q0TVJ1E1Y2GS1H3C36PEWA
prod_01M6Q0TVNVFFWGQ5Y1B80VW3V3	pcat_01M6Q0TVJ15X24XZ9MQY1QTH37
prod_01M6Q0TVNVGK5HCTWXPDWAWQR1	pcat_01M6Q0TVJ15X24XZ9MQY1QTH37
prod_01M6Q0TVNVAZY133GAN1HH5XEW	pcat_01M6Q0TVJ1T1ASN3ERKZRN9JX5
prod_01M6Q0TVNVR8Q95SX58M1A1PR8	pcat_01M6Q0TVJ1E1Y2GS1H3C36PEWA
prod_01M6RPEW07RE5HGX8MNWG22ACV	pcat_01M6RPEVVR81DCNGA26G9JJD4Z
prod_01M6RPEW08B012SRX8884NNF8R	pcat_01M6RPEVVR81DCNGA26G9JJD4Z
prod_01M6RPEW08BDRRNWA2XHA9PDWN	pcat_01M6RPEVVR81DCNGA26G9JJD4Z
prod_01M6RPEW081153HWTZ3RP6EZ5V	pcat_01M6RPEVVSJ3XDA19R8DJP6X99
prod_01M6RPEW08Q3WJXN2D5T6MJ68R	pcat_01M6RPEVVSJ3XDA19R8DJP6X99
prod_01M6RPEW08NBPN2008PFPYB34Q	pcat_01M6RPEVVSJ3XDA19R8DJP6X99
prod_01M6RPEW084PYH5PFP7RKQC28G	pcat_01M6RPEVVSJ3XDA19R8DJP6X99
prod_01M6RPEW086EP0YGHQXYZXMH0D	pcat_01M6RPEVVS96RH55GV25JRB1AH
prod_01M6RPEW08XDN4YM5CJZA5BJ18	pcat_01M6RPEVVS96RH55GV25JRB1AH
prod_01M6RPEW08GBEJSDYN8AHKK790	pcat_01M6RPEVVS96RH55GV25JRB1AH
prod_01M6RPEW082VFHFT1FWY02275R	pcat_01M6RPEVVTK1QCNP1VMB5CZ63D
prod_01M6RPEW08CNRNJSHV2P1ZT5QW	pcat_01M6RPEVVTK1QCNP1VMB5CZ63D
prod_01M6RPEW08AMZS17MYD0A0XQV9	pcat_01M6RPEVVTNCTM4AGFEK2TE84G
prod_01M6RPEW08K7G5BQ2AJVBNWSD8	pcat_01M6RPEVVTNCTM4AGFEK2TE84G
prod_01M6RPEW08KKFEMGCR8DHA8253	pcat_01M6RPEVVTCR92X74SQWT003TZ
prod_01M6RPEW089JG2ZHZMY25K7FKE	pcat_01M6RPEVVTCR92X74SQWT003TZ
prod_01M6RV433VXTN0Q3M4KFEPFEVY	pcat_01M6RV432HW26R69N5B21TD5ZM
prod_01M6RV433VBXFP15V95A7WYZJ7	pcat_01M6RV432HW26R69N5B21TD5ZM
prod_01M6RV433V2SMZXSHC9ET34Q7P	pcat_01M6RV432HW26R69N5B21TD5ZM
prod_01M6RV433V8QZPH3PNVY46ZNEP	pcat_01M6RV432P6NCYX5RB64FFSWQ0
prod_01M6RV433VH280P701DXANFBRN	pcat_01M6RV432P6NCYX5RB64FFSWQ0
prod_01M6RV433V3S45S2XK53QKXJG7	pcat_01M6RV432P6NCYX5RB64FFSWQ0
prod_01M6RV433V6XR5MWQQ2R2HZK77	pcat_01M6RV432P6NCYX5RB64FFSWQ0
prod_01M6RV433VFVQK8CJ13HYDBF8C	pcat_01M6RV432P6DDVQTTE4FHKK8A2
prod_01M6RV433W5X97CNW0881T4HVS	pcat_01M6RV432P6DDVQTTE4FHKK8A2
prod_01M6RV433WAC11MFF8J8MYGGXV	pcat_01M6RV432P6DDVQTTE4FHKK8A2
prod_01M6RV433WSANFXX1A1XPDAKKT	pcat_01M6RV432Q9W6SR9JJBHHAJTZT
prod_01M6RV433WHK3TK8WS4BB3NCD0	pcat_01M6RV432Q9W6SR9JJBHHAJTZT
prod_01M6RV433WTRZ4DGQ5HHJCEV93	pcat_01M6RV432Q6Y910JA2N9WMG2AJ
prod_01M6RV433W9FM6BGE5SP0V9VXE	pcat_01M6RV432Q6Y910JA2N9WMG2AJ
prod_01M6RV433WFGYYK1YXC74TA0VY	pcat_01M6RV432Q1EDEV8B8R5TTR5XW
prod_01M6RV433WKGNMKY7EYCP575XW	pcat_01M6RV432Q1EDEV8B8R5TTR5XW
prod_01M6VRP832RAWH9B74NB480E0K	pcat_01M6RV432Q1EDEV8B8R5TTR5XW
\.


--
-- Data for Name: product_collection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_collection (id, title, handle, metadata, created_at, updated_at, deleted_at, external_id) FROM stdin;
\.


--
-- Data for Name: product_option; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_option (id, title, metadata, created_at, updated_at, deleted_at, is_exclusive) FROM stdin;
opt_01M6Q03ESYJKFKAC2D5NNPF8G4	Size	\N	2026-11-05 18:18:31.486-05	2026-11-05 18:18:31.486-05	\N	f
opt_01M6Q03ESY8EQCRADHA36JNPWV	Color	\N	2026-11-05 18:18:31.487-05	2026-11-05 18:18:31.487-05	\N	f
opt_01M6Q0TVJJEW1WXMGA2J1TDHYX	Presentación	\N	2026-11-05 18:31:18.226-05	2026-11-05 18:31:18.226-05	\N	f
opt_01M6RPEVW497V2GJSVCSM9R6C2	Modalidad	\N	2026-11-06 10:08:28.42-05	2026-11-06 10:08:28.42-05	\N	f
opt_01M6VRP832R4S6RNXPE8528V3Q	Modalidad	\N	2026-11-07 14:45:10.76-05	2026-11-07 14:45:10.76-05	\N	t
\.


--
-- Data for Name: product_option_value; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_option_value (id, value, option_id, metadata, created_at, updated_at, deleted_at, rank) FROM stdin;
optval_01M6Q03ESYYRY86ESF5FDQC69B	S	opt_01M6Q03ESYJKFKAC2D5NNPF8G4	\N	2026-11-05 18:18:31.487-05	2026-11-05 18:18:31.487-05	\N	\N
optval_01M6Q03ESYJZS92ERHB1F72ZN8	M	opt_01M6Q03ESYJKFKAC2D5NNPF8G4	\N	2026-11-05 18:18:31.487-05	2026-11-05 18:18:31.487-05	\N	\N
optval_01M6Q03ESYSXJBMANY51PRJTW7	L	opt_01M6Q03ESYJKFKAC2D5NNPF8G4	\N	2026-11-05 18:18:31.487-05	2026-11-05 18:18:31.487-05	\N	\N
optval_01M6Q03ESYRBCF4Q5KNE74ZYV4	XL	opt_01M6Q03ESYJKFKAC2D5NNPF8G4	\N	2026-11-05 18:18:31.487-05	2026-11-05 18:18:31.487-05	\N	\N
optval_01M6Q03ESYECXRZN80MWGCEP99	Black	opt_01M6Q03ESY8EQCRADHA36JNPWV	\N	2026-11-05 18:18:31.487-05	2026-11-05 18:18:31.487-05	\N	\N
optval_01M6Q03ESYS0RT4J6J5AKEQE0C	White	opt_01M6Q03ESY8EQCRADHA36JNPWV	\N	2026-11-05 18:18:31.487-05	2026-11-05 18:18:31.487-05	\N	\N
optval_01M6Q0TVJH3VBTJQCPN4HBVAWX	Unidad	opt_01M6Q0TVJJEW1WXMGA2J1TDHYX	\N	2026-11-05 18:31:18.226-05	2026-11-05 18:31:18.226-05	\N	\N
optval_01M6Q0TVJHY7N9KXJATTERP5DJ	Pack Ahorro	opt_01M6Q0TVJJEW1WXMGA2J1TDHYX	\N	2026-11-05 18:31:18.226-05	2026-11-05 18:31:18.226-05	\N	\N
optval_01M6RPEVW33Q58ZGSK94N0GV9K	Al Detal (Unidad)	opt_01M6RPEVW497V2GJSVCSM9R6C2	\N	2026-11-06 10:08:28.42-05	2026-11-06 10:08:28.42-05	\N	\N
optval_01M6RPEVW3T5RXC7JHF3SA8GHQ	Al por Mayor (Caja / Bulto)	opt_01M6RPEVW497V2GJSVCSM9R6C2	\N	2026-11-06 10:08:28.42-05	2026-11-06 10:08:28.42-05	\N	\N
optval_01M6VRP8379EAY8W649GRSRZX4	Al Detal (Unidad)	opt_01M6VRP832R4S6RNXPE8528V3Q	\N	2026-11-07 14:45:10.76-05	2026-11-07 14:45:10.76-05	\N	\N
optval_01M6VRP837KP2TCHKSSS5FNDCQ	Al por Mayor (Caja / Bulto)	opt_01M6VRP832R4S6RNXPE8528V3Q	\N	2026-11-07 14:45:10.76-05	2026-11-07 14:45:10.76-05	\N	\N
\.


--
-- Data for Name: product_product_option; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_product_option (id, product_id, product_option_id, created_at, updated_at, deleted_at) FROM stdin;
prodopt_01M6Q03ETW3PT5KFFC9PYC4E0Q	prod_01M6Q03ETMVSFYX1YFMRV52WFM	opt_01M6Q03ESYJKFKAC2D5NNPF8G4	2026-11-05 18:18:31.519-05	2026-11-05 18:18:31.519-05	\N
prodopt_01M6Q03ETWV73FPQJPWMCKJBEG	prod_01M6Q03ETMVSFYX1YFMRV52WFM	opt_01M6Q03ESY8EQCRADHA36JNPWV	2026-11-05 18:18:31.519-05	2026-11-05 18:18:31.519-05	\N
prodopt_01M6Q03ETWV11NG1QMGHCW49D5	prod_01M6Q03ETMPNV54YAX30PF5MP4	opt_01M6Q03ESYJKFKAC2D5NNPF8G4	2026-11-05 18:18:31.519-05	2026-11-05 18:18:31.519-05	\N
prodopt_01M6Q03ETW9WPZXQJ9T8CS7RZP	prod_01M6Q03ETNKKC3J2PQ8J5HX3X1	opt_01M6Q03ESYJKFKAC2D5NNPF8G4	2026-11-05 18:18:31.519-05	2026-11-05 18:18:31.519-05	\N
prodopt_01M6Q03ETWBDTBTT2PVFP7D7FJ	prod_01M6Q03ETNJS6M4Y5RV946030B	opt_01M6Q03ESYJKFKAC2D5NNPF8G4	2026-11-05 18:18:31.519-05	2026-11-05 18:18:31.519-05	\N
prodopt_01M6Q0TVP8MWQRYSWEWPZGJN3W	prod_01M6Q0TVNVJF38J8BV2MB49QH0	opt_01M6Q0TVJJEW1WXMGA2J1TDHYX	2026-11-05 18:31:18.347-05	2026-11-05 18:31:18.347-05	\N
prodopt_01M6Q0TVP8J7YQF0HJN6N0QX5G	prod_01M6Q0TVNV9Y6GBVRV7MFM7ZJV	opt_01M6Q0TVJJEW1WXMGA2J1TDHYX	2026-11-05 18:31:18.348-05	2026-11-05 18:31:18.348-05	\N
prodopt_01M6Q0TVP80A0ZMNMBMJNHD5BS	prod_01M6Q0TVNV2PJR6Q3NWMDR5B75	opt_01M6Q0TVJJEW1WXMGA2J1TDHYX	2026-11-05 18:31:18.348-05	2026-11-05 18:31:18.348-05	\N
prodopt_01M6Q0TVP8XSA3319PMRF85DBN	prod_01M6Q0TVNVZR9YGNY0KZBMAX7W	opt_01M6Q0TVJJEW1WXMGA2J1TDHYX	2026-11-05 18:31:18.348-05	2026-11-05 18:31:18.348-05	\N
prodopt_01M6Q0TVP8QVCK2GPK4ATW9YGK	prod_01M6Q0TVNVFFWGQ5Y1B80VW3V3	opt_01M6Q0TVJJEW1WXMGA2J1TDHYX	2026-11-05 18:31:18.348-05	2026-11-05 18:31:18.348-05	\N
prodopt_01M6Q0TVP8FKRD723A906RTF69	prod_01M6Q0TVNVGK5HCTWXPDWAWQR1	opt_01M6Q0TVJJEW1WXMGA2J1TDHYX	2026-11-05 18:31:18.348-05	2026-11-05 18:31:18.348-05	\N
prodopt_01M6Q0TVP8BM0XTZWWWYC6ZCDF	prod_01M6Q0TVNVAZY133GAN1HH5XEW	opt_01M6Q0TVJJEW1WXMGA2J1TDHYX	2026-11-05 18:31:18.348-05	2026-11-05 18:31:18.348-05	\N
prodopt_01M6Q0TVP8JYM7V6CNYS0RW6JN	prod_01M6Q0TVNVR8Q95SX58M1A1PR8	opt_01M6Q0TVJJEW1WXMGA2J1TDHYX	2026-11-05 18:31:18.348-05	2026-11-05 18:31:18.348-05	\N
prodopt_01M6RPEW0KXJH69G6YZTMAZGN4	prod_01M6RPEW07RE5HGX8MNWG22ACV	opt_01M6RPEVW497V2GJSVCSM9R6C2	2026-11-06 10:08:28.568-05	2026-11-06 10:08:28.568-05	\N
prodopt_01M6RPEW0KH7XRA9G3XSV4VEGN	prod_01M6RPEW08B012SRX8884NNF8R	opt_01M6RPEVW497V2GJSVCSM9R6C2	2026-11-06 10:08:28.568-05	2026-11-06 10:08:28.568-05	\N
prodopt_01M6RPEW0KD05TFJF6W9GD7HV4	prod_01M6RPEW08BDRRNWA2XHA9PDWN	opt_01M6RPEVW497V2GJSVCSM9R6C2	2026-11-06 10:08:28.568-05	2026-11-06 10:08:28.568-05	\N
prodopt_01M6RPEW0KZ6QX8V5MKCZB3KN0	prod_01M6RPEW081153HWTZ3RP6EZ5V	opt_01M6RPEVW497V2GJSVCSM9R6C2	2026-11-06 10:08:28.568-05	2026-11-06 10:08:28.568-05	\N
prodopt_01M6RPEW0K8PGHG16VYEH86QW7	prod_01M6RPEW08Q3WJXN2D5T6MJ68R	opt_01M6RPEVW497V2GJSVCSM9R6C2	2026-11-06 10:08:28.568-05	2026-11-06 10:08:28.568-05	\N
prodopt_01M6RPEW0KAGTPPQM59MP98MVV	prod_01M6RPEW08NBPN2008PFPYB34Q	opt_01M6RPEVW497V2GJSVCSM9R6C2	2026-11-06 10:08:28.568-05	2026-11-06 10:08:28.568-05	\N
prodopt_01M6RPEW0KWC1181285KJN2M8F	prod_01M6RPEW084PYH5PFP7RKQC28G	opt_01M6RPEVW497V2GJSVCSM9R6C2	2026-11-06 10:08:28.568-05	2026-11-06 10:08:28.568-05	\N
prodopt_01M6RPEW0KFCV0K34ZPHNAQYWF	prod_01M6RPEW086EP0YGHQXYZXMH0D	opt_01M6RPEVW497V2GJSVCSM9R6C2	2026-11-06 10:08:28.568-05	2026-11-06 10:08:28.568-05	\N
prodopt_01M6RPEW0M3KH0QH4YC7PZ7JHM	prod_01M6RPEW08XDN4YM5CJZA5BJ18	opt_01M6RPEVW497V2GJSVCSM9R6C2	2026-11-06 10:08:28.568-05	2026-11-06 10:08:28.568-05	\N
prodopt_01M6RPEW0MH9F9V1X07K8H3Y8Y	prod_01M6RPEW08GBEJSDYN8AHKK790	opt_01M6RPEVW497V2GJSVCSM9R6C2	2026-11-06 10:08:28.568-05	2026-11-06 10:08:28.568-05	\N
prodopt_01M6RPEW0MGAZT4SGGQDFKEJ71	prod_01M6RPEW082VFHFT1FWY02275R	opt_01M6RPEVW497V2GJSVCSM9R6C2	2026-11-06 10:08:28.568-05	2026-11-06 10:08:28.568-05	\N
prodopt_01M6RPEW0M7H2NCKTWBNNRH36E	prod_01M6RPEW08CNRNJSHV2P1ZT5QW	opt_01M6RPEVW497V2GJSVCSM9R6C2	2026-11-06 10:08:28.568-05	2026-11-06 10:08:28.568-05	\N
prodopt_01M6RPEW0MZVM2C4PC0KT0RSGJ	prod_01M6RPEW08AMZS17MYD0A0XQV9	opt_01M6RPEVW497V2GJSVCSM9R6C2	2026-11-06 10:08:28.568-05	2026-11-06 10:08:28.568-05	\N
prodopt_01M6RPEW0MXGP2KG3YE7029PNT	prod_01M6RPEW08K7G5BQ2AJVBNWSD8	opt_01M6RPEVW497V2GJSVCSM9R6C2	2026-11-06 10:08:28.568-05	2026-11-06 10:08:28.568-05	\N
prodopt_01M6RPEW0M2FP99W94SBBW8TK3	prod_01M6RPEW08KKFEMGCR8DHA8253	opt_01M6RPEVW497V2GJSVCSM9R6C2	2026-11-06 10:08:28.568-05	2026-11-06 10:08:28.568-05	\N
prodopt_01M6RPEW0MRZ4HQMD0CKXC0Z2M	prod_01M6RPEW089JG2ZHZMY25K7FKE	opt_01M6RPEVW497V2GJSVCSM9R6C2	2026-11-06 10:08:28.568-05	2026-11-06 10:08:28.568-05	\N
prodopt_01M6RV43481JBRDHFHDCYHXNM3	prod_01M6RV433VXTN0Q3M4KFEPFEVY	opt_01M6RPEVW497V2GJSVCSM9R6C2	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodopt_01M6RV4349C3ZF0DA10H4SD1D6	prod_01M6RV433VBXFP15V95A7WYZJ7	opt_01M6RPEVW497V2GJSVCSM9R6C2	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodopt_01M6RV434914GC54HNDESJ1VS1	prod_01M6RV433V2SMZXSHC9ET34Q7P	opt_01M6RPEVW497V2GJSVCSM9R6C2	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodopt_01M6RV4349QK01XQAT4RD3QH49	prod_01M6RV433V8QZPH3PNVY46ZNEP	opt_01M6RPEVW497V2GJSVCSM9R6C2	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodopt_01M6RV4349B9S401J4E941MYMC	prod_01M6RV433VH280P701DXANFBRN	opt_01M6RPEVW497V2GJSVCSM9R6C2	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodopt_01M6RV4349QMB0D7658DYRJ8XV	prod_01M6RV433V3S45S2XK53QKXJG7	opt_01M6RPEVW497V2GJSVCSM9R6C2	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodopt_01M6RV4349GYKY71EM8HCFPV01	prod_01M6RV433V6XR5MWQQ2R2HZK77	opt_01M6RPEVW497V2GJSVCSM9R6C2	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodopt_01M6RV4349G10V6R01JD6GY1YG	prod_01M6RV433VFVQK8CJ13HYDBF8C	opt_01M6RPEVW497V2GJSVCSM9R6C2	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodopt_01M6RV43496J3N4HMH3921CGE6	prod_01M6RV433W5X97CNW0881T4HVS	opt_01M6RPEVW497V2GJSVCSM9R6C2	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodopt_01M6RV43491CSAY7T9CNS7G9DG	prod_01M6RV433WAC11MFF8J8MYGGXV	opt_01M6RPEVW497V2GJSVCSM9R6C2	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodopt_01M6RV4349EF0BS2C89C0JCGP0	prod_01M6RV433WSANFXX1A1XPDAKKT	opt_01M6RPEVW497V2GJSVCSM9R6C2	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodopt_01M6RV434APS4Z5GHY98W662AB	prod_01M6RV433WHK3TK8WS4BB3NCD0	opt_01M6RPEVW497V2GJSVCSM9R6C2	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodopt_01M6RV434AMT02TTNYKMA0YSKA	prod_01M6RV433WTRZ4DGQ5HHJCEV93	opt_01M6RPEVW497V2GJSVCSM9R6C2	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodopt_01M6RV434A8Q7R476RA6PV84C4	prod_01M6RV433W9FM6BGE5SP0V9VXE	opt_01M6RPEVW497V2GJSVCSM9R6C2	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodopt_01M6RV434AKZZ48RCYG9DE4BDY	prod_01M6RV433WFGYYK1YXC74TA0VY	opt_01M6RPEVW497V2GJSVCSM9R6C2	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodopt_01M6RV434A83W6XNA7BTERGQNT	prod_01M6RV433WKGNMKY7EYCP575XW	opt_01M6RPEVW497V2GJSVCSM9R6C2	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodopt_01M6VRP855AQNWN2TVQD6J6A3N	prod_01M6VRP832RAWH9B74NB480E0K	opt_01M6VRP832R4S6RNXPE8528V3Q	2026-11-07 14:45:10.823-05	2026-11-07 14:45:10.823-05	\N
\.


--
-- Data for Name: product_product_option_value; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_product_option_value (id, product_product_option_id, product_option_value_id, created_at, updated_at, deleted_at) FROM stdin;
prodoptval_01M6Q03ETXA7YM49BB9FM201K7	prodopt_01M6Q03ETW3PT5KFFC9PYC4E0Q	optval_01M6Q03ESYYRY86ESF5FDQC69B	2026-11-05 18:18:31.519-05	2026-11-05 18:18:31.519-05	\N
prodoptval_01M6Q03ETXQFKDAGB3GDKVMZGZ	prodopt_01M6Q03ETW3PT5KFFC9PYC4E0Q	optval_01M6Q03ESYJZS92ERHB1F72ZN8	2026-11-05 18:18:31.519-05	2026-11-05 18:18:31.519-05	\N
prodoptval_01M6Q03ETX3BF8XBEXVGVETW1G	prodopt_01M6Q03ETW3PT5KFFC9PYC4E0Q	optval_01M6Q03ESYSXJBMANY51PRJTW7	2026-11-05 18:18:31.519-05	2026-11-05 18:18:31.519-05	\N
prodoptval_01M6Q03ETXRA0PS737T4K00RH0	prodopt_01M6Q03ETW3PT5KFFC9PYC4E0Q	optval_01M6Q03ESYRBCF4Q5KNE74ZYV4	2026-11-05 18:18:31.519-05	2026-11-05 18:18:31.519-05	\N
prodoptval_01M6Q03ETXD0DACTVDBN6PZS1M	prodopt_01M6Q03ETWV73FPQJPWMCKJBEG	optval_01M6Q03ESYECXRZN80MWGCEP99	2026-11-05 18:18:31.519-05	2026-11-05 18:18:31.519-05	\N
prodoptval_01M6Q03ETXB5T5PFPVJ8NG4NES	prodopt_01M6Q03ETWV73FPQJPWMCKJBEG	optval_01M6Q03ESYS0RT4J6J5AKEQE0C	2026-11-05 18:18:31.519-05	2026-11-05 18:18:31.519-05	\N
prodoptval_01M6Q03ETXMM77ETBVNW8S7ZHR	prodopt_01M6Q03ETWV11NG1QMGHCW49D5	optval_01M6Q03ESYYRY86ESF5FDQC69B	2026-11-05 18:18:31.519-05	2026-11-05 18:18:31.519-05	\N
prodoptval_01M6Q03ETXZJ6HHF49B2KF0GR0	prodopt_01M6Q03ETWV11NG1QMGHCW49D5	optval_01M6Q03ESYJZS92ERHB1F72ZN8	2026-11-05 18:18:31.519-05	2026-11-05 18:18:31.519-05	\N
prodoptval_01M6Q03ETXVB0QMGZG25723E0G	prodopt_01M6Q03ETWV11NG1QMGHCW49D5	optval_01M6Q03ESYSXJBMANY51PRJTW7	2026-11-05 18:18:31.519-05	2026-11-05 18:18:31.519-05	\N
prodoptval_01M6Q03ETXE0SP00H033HG6C3T	prodopt_01M6Q03ETWV11NG1QMGHCW49D5	optval_01M6Q03ESYRBCF4Q5KNE74ZYV4	2026-11-05 18:18:31.519-05	2026-11-05 18:18:31.519-05	\N
prodoptval_01M6Q03ETXQG0ZKH2X1A50WTW6	prodopt_01M6Q03ETW9WPZXQJ9T8CS7RZP	optval_01M6Q03ESYYRY86ESF5FDQC69B	2026-11-05 18:18:31.519-05	2026-11-05 18:18:31.519-05	\N
prodoptval_01M6Q03ETXXCWP60NRH3YVWB9S	prodopt_01M6Q03ETW9WPZXQJ9T8CS7RZP	optval_01M6Q03ESYJZS92ERHB1F72ZN8	2026-11-05 18:18:31.519-05	2026-11-05 18:18:31.519-05	\N
prodoptval_01M6Q03ETX8NRKGQBX05Y0ZJVQ	prodopt_01M6Q03ETW9WPZXQJ9T8CS7RZP	optval_01M6Q03ESYSXJBMANY51PRJTW7	2026-11-05 18:18:31.519-05	2026-11-05 18:18:31.519-05	\N
prodoptval_01M6Q03ETYAEBY5R585S60JWHC	prodopt_01M6Q03ETW9WPZXQJ9T8CS7RZP	optval_01M6Q03ESYRBCF4Q5KNE74ZYV4	2026-11-05 18:18:31.519-05	2026-11-05 18:18:31.519-05	\N
prodoptval_01M6Q03ETY2JA2JRYW36BSM8XQ	prodopt_01M6Q03ETWBDTBTT2PVFP7D7FJ	optval_01M6Q03ESYYRY86ESF5FDQC69B	2026-11-05 18:18:31.519-05	2026-11-05 18:18:31.519-05	\N
prodoptval_01M6Q03ETY2ZE3JC68D6NH6ZWA	prodopt_01M6Q03ETWBDTBTT2PVFP7D7FJ	optval_01M6Q03ESYJZS92ERHB1F72ZN8	2026-11-05 18:18:31.519-05	2026-11-05 18:18:31.519-05	\N
prodoptval_01M6Q03ETYPJJMFEPJRZ7W8146	prodopt_01M6Q03ETWBDTBTT2PVFP7D7FJ	optval_01M6Q03ESYSXJBMANY51PRJTW7	2026-11-05 18:18:31.519-05	2026-11-05 18:18:31.519-05	\N
prodoptval_01M6Q03ETYBTETXVSZP84G3BXB	prodopt_01M6Q03ETWBDTBTT2PVFP7D7FJ	optval_01M6Q03ESYRBCF4Q5KNE74ZYV4	2026-11-05 18:18:31.519-05	2026-11-05 18:18:31.519-05	\N
prodoptval_01M6Q0TVP96C90DCNBHGJNKEG5	prodopt_01M6Q0TVP8MWQRYSWEWPZGJN3W	optval_01M6Q0TVJHY7N9KXJATTERP5DJ	2026-11-05 18:31:18.348-05	2026-11-05 18:31:18.348-05	\N
prodoptval_01M6Q0TVP9B897404CZTQRPERG	prodopt_01M6Q0TVP8MWQRYSWEWPZGJN3W	optval_01M6Q0TVJH3VBTJQCPN4HBVAWX	2026-11-05 18:31:18.348-05	2026-11-05 18:31:18.348-05	\N
prodoptval_01M6Q0TVP9FASBJBSCSRQRKYYD	prodopt_01M6Q0TVP8J7YQF0HJN6N0QX5G	optval_01M6Q0TVJHY7N9KXJATTERP5DJ	2026-11-05 18:31:18.348-05	2026-11-05 18:31:18.348-05	\N
prodoptval_01M6Q0TVP9YQ0E355QZ1VA8BBP	prodopt_01M6Q0TVP8J7YQF0HJN6N0QX5G	optval_01M6Q0TVJH3VBTJQCPN4HBVAWX	2026-11-05 18:31:18.348-05	2026-11-05 18:31:18.348-05	\N
prodoptval_01M6Q0TVP9FVEQNNFX4VGBE0FV	prodopt_01M6Q0TVP80A0ZMNMBMJNHD5BS	optval_01M6Q0TVJHY7N9KXJATTERP5DJ	2026-11-05 18:31:18.348-05	2026-11-05 18:31:18.348-05	\N
prodoptval_01M6Q0TVP9AT5FWXP45NGDT9GF	prodopt_01M6Q0TVP80A0ZMNMBMJNHD5BS	optval_01M6Q0TVJH3VBTJQCPN4HBVAWX	2026-11-05 18:31:18.348-05	2026-11-05 18:31:18.348-05	\N
prodoptval_01M6Q0TVP9BBS8N9GBYNXBWYE1	prodopt_01M6Q0TVP8XSA3319PMRF85DBN	optval_01M6Q0TVJHY7N9KXJATTERP5DJ	2026-11-05 18:31:18.348-05	2026-11-05 18:31:18.348-05	\N
prodoptval_01M6Q0TVP9EEDHEM90K6CHG68Q	prodopt_01M6Q0TVP8XSA3319PMRF85DBN	optval_01M6Q0TVJH3VBTJQCPN4HBVAWX	2026-11-05 18:31:18.348-05	2026-11-05 18:31:18.348-05	\N
prodoptval_01M6Q0TVPASP51AE3A3NVJ21WW	prodopt_01M6Q0TVP8QVCK2GPK4ATW9YGK	optval_01M6Q0TVJHY7N9KXJATTERP5DJ	2026-11-05 18:31:18.348-05	2026-11-05 18:31:18.348-05	\N
prodoptval_01M6Q0TVPAQP8659YJVA25SN7N	prodopt_01M6Q0TVP8QVCK2GPK4ATW9YGK	optval_01M6Q0TVJH3VBTJQCPN4HBVAWX	2026-11-05 18:31:18.348-05	2026-11-05 18:31:18.348-05	\N
prodoptval_01M6Q0TVPACKHTRTX39ZF0MQA7	prodopt_01M6Q0TVP8FKRD723A906RTF69	optval_01M6Q0TVJHY7N9KXJATTERP5DJ	2026-11-05 18:31:18.348-05	2026-11-05 18:31:18.348-05	\N
prodoptval_01M6Q0TVPABKG1E0KXSZ79716V	prodopt_01M6Q0TVP8FKRD723A906RTF69	optval_01M6Q0TVJH3VBTJQCPN4HBVAWX	2026-11-05 18:31:18.348-05	2026-11-05 18:31:18.348-05	\N
prodoptval_01M6Q0TVPA3GZVKVMEBBSPDXDB	prodopt_01M6Q0TVP8BM0XTZWWWYC6ZCDF	optval_01M6Q0TVJHY7N9KXJATTERP5DJ	2026-11-05 18:31:18.348-05	2026-11-05 18:31:18.348-05	\N
prodoptval_01M6Q0TVPA23JT8N34K04S9G53	prodopt_01M6Q0TVP8BM0XTZWWWYC6ZCDF	optval_01M6Q0TVJH3VBTJQCPN4HBVAWX	2026-11-05 18:31:18.348-05	2026-11-05 18:31:18.348-05	\N
prodoptval_01M6Q0TVPA5AJCGKWEGYZJ4GNX	prodopt_01M6Q0TVP8JYM7V6CNYS0RW6JN	optval_01M6Q0TVJHY7N9KXJATTERP5DJ	2026-11-05 18:31:18.348-05	2026-11-05 18:31:18.348-05	\N
prodoptval_01M6Q0TVPARD735NZM113ZZRX3	prodopt_01M6Q0TVP8JYM7V6CNYS0RW6JN	optval_01M6Q0TVJH3VBTJQCPN4HBVAWX	2026-11-05 18:31:18.348-05	2026-11-05 18:31:18.348-05	\N
prodoptval_01M6RPEW0ND4PBXZDV1QMKJSD4	prodopt_01M6RPEW0KXJH69G6YZTMAZGN4	optval_01M6RPEVW33Q58ZGSK94N0GV9K	2026-11-06 10:08:28.568-05	2026-11-06 10:08:28.568-05	\N
prodoptval_01M6RPEW0N61JXKDX02PG6WTRS	prodopt_01M6RPEW0KXJH69G6YZTMAZGN4	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ	2026-11-06 10:08:28.568-05	2026-11-06 10:08:28.568-05	\N
prodoptval_01M6RPEW0NQTY5NPY3X3S9T2HK	prodopt_01M6RPEW0KH7XRA9G3XSV4VEGN	optval_01M6RPEVW33Q58ZGSK94N0GV9K	2026-11-06 10:08:28.568-05	2026-11-06 10:08:28.568-05	\N
prodoptval_01M6RPEW0NFAASQEK733AM1MSQ	prodopt_01M6RPEW0KH7XRA9G3XSV4VEGN	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ	2026-11-06 10:08:28.568-05	2026-11-06 10:08:28.568-05	\N
prodoptval_01M6RPEW0NJEQ03JSWK8GPR162	prodopt_01M6RPEW0KD05TFJF6W9GD7HV4	optval_01M6RPEVW33Q58ZGSK94N0GV9K	2026-11-06 10:08:28.568-05	2026-11-06 10:08:28.568-05	\N
prodoptval_01M6RPEW0NPX6S0E4R3C2JZ2PG	prodopt_01M6RPEW0KD05TFJF6W9GD7HV4	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ	2026-11-06 10:08:28.568-05	2026-11-06 10:08:28.568-05	\N
prodoptval_01M6RPEW0NTJFD47GEZ9X8EQBT	prodopt_01M6RPEW0KZ6QX8V5MKCZB3KN0	optval_01M6RPEVW33Q58ZGSK94N0GV9K	2026-11-06 10:08:28.569-05	2026-11-06 10:08:28.569-05	\N
prodoptval_01M6RPEW0N6E1BHEB5V045V2RA	prodopt_01M6RPEW0KZ6QX8V5MKCZB3KN0	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ	2026-11-06 10:08:28.569-05	2026-11-06 10:08:28.569-05	\N
prodoptval_01M6RPEW0NJF8814R0RX6A7YY5	prodopt_01M6RPEW0K8PGHG16VYEH86QW7	optval_01M6RPEVW33Q58ZGSK94N0GV9K	2026-11-06 10:08:28.569-05	2026-11-06 10:08:28.569-05	\N
prodoptval_01M6RPEW0N5507FJBS5PRHX2EF	prodopt_01M6RPEW0K8PGHG16VYEH86QW7	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ	2026-11-06 10:08:28.569-05	2026-11-06 10:08:28.569-05	\N
prodoptval_01M6RPEW0NVQKS6ZYEDEG4HH6Q	prodopt_01M6RPEW0KAGTPPQM59MP98MVV	optval_01M6RPEVW33Q58ZGSK94N0GV9K	2026-11-06 10:08:28.569-05	2026-11-06 10:08:28.569-05	\N
prodoptval_01M6RPEW0NXENJ6R9E2E0JJVEQ	prodopt_01M6RPEW0KAGTPPQM59MP98MVV	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ	2026-11-06 10:08:28.569-05	2026-11-06 10:08:28.569-05	\N
prodoptval_01M6RPEW0N5YV719QQYAEPH28P	prodopt_01M6RPEW0KWC1181285KJN2M8F	optval_01M6RPEVW33Q58ZGSK94N0GV9K	2026-11-06 10:08:28.569-05	2026-11-06 10:08:28.569-05	\N
prodoptval_01M6RPEW0PPVJT6VYFQR3SVN4R	prodopt_01M6RPEW0KWC1181285KJN2M8F	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ	2026-11-06 10:08:28.569-05	2026-11-06 10:08:28.569-05	\N
prodoptval_01M6RPEW0PFHM3HTXEN2YFW2ZF	prodopt_01M6RPEW0KFCV0K34ZPHNAQYWF	optval_01M6RPEVW33Q58ZGSK94N0GV9K	2026-11-06 10:08:28.569-05	2026-11-06 10:08:28.569-05	\N
prodoptval_01M6RPEW0PVSXQ704WQ9R0QX2K	prodopt_01M6RPEW0KFCV0K34ZPHNAQYWF	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ	2026-11-06 10:08:28.569-05	2026-11-06 10:08:28.569-05	\N
prodoptval_01M6RPEW0PP8SGJF6VX0NWS9RN	prodopt_01M6RPEW0M3KH0QH4YC7PZ7JHM	optval_01M6RPEVW33Q58ZGSK94N0GV9K	2026-11-06 10:08:28.569-05	2026-11-06 10:08:28.569-05	\N
prodoptval_01M6RPEW0P2T1PTNV8GSPEHKKJ	prodopt_01M6RPEW0M3KH0QH4YC7PZ7JHM	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ	2026-11-06 10:08:28.569-05	2026-11-06 10:08:28.569-05	\N
prodoptval_01M6RPEW0PQT2A459D6QT3GEJ7	prodopt_01M6RPEW0MH9F9V1X07K8H3Y8Y	optval_01M6RPEVW33Q58ZGSK94N0GV9K	2026-11-06 10:08:28.569-05	2026-11-06 10:08:28.569-05	\N
prodoptval_01M6RPEW0PT4W823ENK0GCRF0F	prodopt_01M6RPEW0MH9F9V1X07K8H3Y8Y	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ	2026-11-06 10:08:28.569-05	2026-11-06 10:08:28.569-05	\N
prodoptval_01M6RPEW0P30KJ8E3824Q9ZF3Q	prodopt_01M6RPEW0MGAZT4SGGQDFKEJ71	optval_01M6RPEVW33Q58ZGSK94N0GV9K	2026-11-06 10:08:28.569-05	2026-11-06 10:08:28.569-05	\N
prodoptval_01M6RPEW0PRXJP9YBJ6FQB4MZE	prodopt_01M6RPEW0MGAZT4SGGQDFKEJ71	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ	2026-11-06 10:08:28.569-05	2026-11-06 10:08:28.569-05	\N
prodoptval_01M6RPEW0PZY50AD47Q8T1QNK1	prodopt_01M6RPEW0M7H2NCKTWBNNRH36E	optval_01M6RPEVW33Q58ZGSK94N0GV9K	2026-11-06 10:08:28.569-05	2026-11-06 10:08:28.569-05	\N
prodoptval_01M6RPEW0PV703G56HK8EBEDPG	prodopt_01M6RPEW0M7H2NCKTWBNNRH36E	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ	2026-11-06 10:08:28.569-05	2026-11-06 10:08:28.569-05	\N
prodoptval_01M6RPEW0PD7S37387DBKYMCGM	prodopt_01M6RPEW0MZVM2C4PC0KT0RSGJ	optval_01M6RPEVW33Q58ZGSK94N0GV9K	2026-11-06 10:08:28.569-05	2026-11-06 10:08:28.569-05	\N
prodoptval_01M6RPEW0PZY9P7WST3ZW5EQRK	prodopt_01M6RPEW0MZVM2C4PC0KT0RSGJ	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ	2026-11-06 10:08:28.569-05	2026-11-06 10:08:28.569-05	\N
prodoptval_01M6RPEW0PS6G90835FM7MSVZ9	prodopt_01M6RPEW0MXGP2KG3YE7029PNT	optval_01M6RPEVW33Q58ZGSK94N0GV9K	2026-11-06 10:08:28.569-05	2026-11-06 10:08:28.569-05	\N
prodoptval_01M6RPEW0Q6M9CFRRZ4AH29ZY6	prodopt_01M6RPEW0MXGP2KG3YE7029PNT	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ	2026-11-06 10:08:28.569-05	2026-11-06 10:08:28.569-05	\N
prodoptval_01M6RPEW0Q8PAX7X5CHP7RNFHM	prodopt_01M6RPEW0M2FP99W94SBBW8TK3	optval_01M6RPEVW33Q58ZGSK94N0GV9K	2026-11-06 10:08:28.569-05	2026-11-06 10:08:28.569-05	\N
prodoptval_01M6RPEW0Q35PEZAK7629129P3	prodopt_01M6RPEW0M2FP99W94SBBW8TK3	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ	2026-11-06 10:08:28.569-05	2026-11-06 10:08:28.569-05	\N
prodoptval_01M6RPEW0QQM7J5NBA6NBJZZQ3	prodopt_01M6RPEW0MRZ4HQMD0CKXC0Z2M	optval_01M6RPEVW33Q58ZGSK94N0GV9K	2026-11-06 10:08:28.569-05	2026-11-06 10:08:28.569-05	\N
prodoptval_01M6RPEW0Q7HCD209DHMQ38WTT	prodopt_01M6RPEW0MRZ4HQMD0CKXC0Z2M	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ	2026-11-06 10:08:28.569-05	2026-11-06 10:08:28.569-05	\N
prodoptval_01M6RV434AN72YMWSPQDQ97CX4	prodopt_01M6RV43481JBRDHFHDCYHXNM3	optval_01M6RPEVW33Q58ZGSK94N0GV9K	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodoptval_01M6RV434A8GYKBRP02D8MVVB1	prodopt_01M6RV43481JBRDHFHDCYHXNM3	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodoptval_01M6RV434BK6VCQM0G3CV9W2WJ	prodopt_01M6RV4349C3ZF0DA10H4SD1D6	optval_01M6RPEVW33Q58ZGSK94N0GV9K	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodoptval_01M6RV434BVYKPJK1FSK515VN3	prodopt_01M6RV4349C3ZF0DA10H4SD1D6	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodoptval_01M6RV434BXZXF0ZZRKQCGSJKP	prodopt_01M6RV434914GC54HNDESJ1VS1	optval_01M6RPEVW33Q58ZGSK94N0GV9K	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodoptval_01M6RV434B1FRC0J5JRDP0MBY1	prodopt_01M6RV434914GC54HNDESJ1VS1	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodoptval_01M6RV434BMNWQS30A9KN9EGXZ	prodopt_01M6RV4349QK01XQAT4RD3QH49	optval_01M6RPEVW33Q58ZGSK94N0GV9K	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodoptval_01M6RV434BW9NNP5J1J3A1ZFVA	prodopt_01M6RV4349QK01XQAT4RD3QH49	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodoptval_01M6RV434B5C1829X24SR1Z8QC	prodopt_01M6RV4349B9S401J4E941MYMC	optval_01M6RPEVW33Q58ZGSK94N0GV9K	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodoptval_01M6RV434BVZH6DKYHT85FDXR2	prodopt_01M6RV4349B9S401J4E941MYMC	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodoptval_01M6RV434B6RV2TS2QFE6X63QQ	prodopt_01M6RV4349QMB0D7658DYRJ8XV	optval_01M6RPEVW33Q58ZGSK94N0GV9K	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodoptval_01M6RV434B17K6G97DAMEY5WH8	prodopt_01M6RV4349QMB0D7658DYRJ8XV	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodoptval_01M6RV434BW4VY961AMM2B8BZM	prodopt_01M6RV4349GYKY71EM8HCFPV01	optval_01M6RPEVW33Q58ZGSK94N0GV9K	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodoptval_01M6RV434B2S02R857SG2NJP5R	prodopt_01M6RV4349GYKY71EM8HCFPV01	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodoptval_01M6RV434C6Z4MTQQ2CSG3X4KP	prodopt_01M6RV4349G10V6R01JD6GY1YG	optval_01M6RPEVW33Q58ZGSK94N0GV9K	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodoptval_01M6RV434CF1GMNGRVV7W2VVMX	prodopt_01M6RV4349G10V6R01JD6GY1YG	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodoptval_01M6RV434CN68C4S52GC3HWXFT	prodopt_01M6RV43496J3N4HMH3921CGE6	optval_01M6RPEVW33Q58ZGSK94N0GV9K	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodoptval_01M6RV434C8WKDX5PFBG8JAVYX	prodopt_01M6RV43496J3N4HMH3921CGE6	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodoptval_01M6RV434C0WCR3739EGZ0W1PB	prodopt_01M6RV43491CSAY7T9CNS7G9DG	optval_01M6RPEVW33Q58ZGSK94N0GV9K	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodoptval_01M6RV434CTP51CT1T90QETB0F	prodopt_01M6RV43491CSAY7T9CNS7G9DG	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodoptval_01M6RV434CQ9JV144ZJ4QS5Y8W	prodopt_01M6RV4349EF0BS2C89C0JCGP0	optval_01M6RPEVW33Q58ZGSK94N0GV9K	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodoptval_01M6RV434CNVF3TPNGWN4HV0F1	prodopt_01M6RV4349EF0BS2C89C0JCGP0	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodoptval_01M6RV434C23W8FWA4M819Z69B	prodopt_01M6RV434APS4Z5GHY98W662AB	optval_01M6RPEVW33Q58ZGSK94N0GV9K	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodoptval_01M6RV434CTD6GMW8XFMX7GWJ0	prodopt_01M6RV434APS4Z5GHY98W662AB	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodoptval_01M6RV434CR96G1Q34BWXNWB11	prodopt_01M6RV434AMT02TTNYKMA0YSKA	optval_01M6RPEVW33Q58ZGSK94N0GV9K	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodoptval_01M6RV434CT15MKKVBG1QX7JWE	prodopt_01M6RV434AMT02TTNYKMA0YSKA	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodoptval_01M6RV434CWFXPQZRMSNJR6MCH	prodopt_01M6RV434A8Q7R476RA6PV84C4	optval_01M6RPEVW33Q58ZGSK94N0GV9K	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodoptval_01M6RV434CG37AHDBQAZY4DV2S	prodopt_01M6RV434A8Q7R476RA6PV84C4	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodoptval_01M6RV434DV0DVPGXS5P04CWRQ	prodopt_01M6RV434AKZZ48RCYG9DE4BDY	optval_01M6RPEVW33Q58ZGSK94N0GV9K	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodoptval_01M6RV434D5AT9WHGCWD7515TD	prodopt_01M6RV434AKZZ48RCYG9DE4BDY	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodoptval_01M6RV434DNDNCVMSYZ2K6E269	prodopt_01M6RV434A83W6XNA7BTERGQNT	optval_01M6RPEVW33Q58ZGSK94N0GV9K	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodoptval_01M6RV434DARPNTYJ1X70SD8S5	prodopt_01M6RV434A83W6XNA7BTERGQNT	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ	2026-11-06 11:29:58.287-05	2026-11-06 11:29:58.287-05	\N
prodoptval_01M6VRP855VPMNRKSTY337ENBS	prodopt_01M6VRP855AQNWN2TVQD6J6A3N	optval_01M6VRP8379EAY8W649GRSRZX4	2026-11-07 14:45:10.823-05	2026-11-07 14:45:10.823-05	\N
prodoptval_01M6VRP856MBPX80VX5KF5GYZA	prodopt_01M6VRP855AQNWN2TVQD6J6A3N	optval_01M6VRP837KP2TCHKSSS5FNDCQ	2026-11-07 14:45:10.823-05	2026-11-07 14:45:10.823-05	\N
\.


--
-- Data for Name: product_sales_channel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_sales_channel (product_id, sales_channel_id, id, created_at, updated_at, deleted_at) FROM stdin;
prod_01M6Q03ETMVSFYX1YFMRV52WFM	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6Q03EWY2SW7STQ511XSGZQY	2026-11-05 18:18:31.582557-05	2026-11-06 10:08:27.958-05	2026-11-06 10:08:27.957-05
prod_01M6Q03ETMPNV54YAX30PF5MP4	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6Q03EWY5B7KVXBF5VCZ4EJK	2026-11-05 18:18:31.582557-05	2026-11-06 10:08:27.958-05	2026-11-06 10:08:27.957-05
prod_01M6Q03ETNKKC3J2PQ8J5HX3X1	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6Q03EWYQGPT16HQW8ATRB92	2026-11-05 18:18:31.582557-05	2026-11-06 10:08:27.958-05	2026-11-06 10:08:27.957-05
prod_01M6Q03ETNJS6M4Y5RV946030B	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6Q03EWYJQHYZEP7V14R47WQ	2026-11-05 18:18:31.582557-05	2026-11-06 10:08:27.958-05	2026-11-06 10:08:27.957-05
prod_01M6Q0TVNVJF38J8BV2MB49QH0	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6Q0TVRN99W6RASN7FTGFPSM	2026-11-05 18:31:18.431368-05	2026-11-06 10:08:27.958-05	2026-11-06 10:08:27.957-05
prod_01M6Q0TVNV9Y6GBVRV7MFM7ZJV	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6Q0TVRPBWWGW8CAYV52WYJC	2026-11-05 18:31:18.431368-05	2026-11-06 10:08:27.958-05	2026-11-06 10:08:27.957-05
prod_01M6Q0TVNV2PJR6Q3NWMDR5B75	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6Q0TVRPAMFVC7TA9Z58VDN0	2026-11-05 18:31:18.431368-05	2026-11-06 10:08:27.958-05	2026-11-06 10:08:27.957-05
prod_01M6Q0TVNVZR9YGNY0KZBMAX7W	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6Q0TVRQ0185BRTMNX5BKCTB	2026-11-05 18:31:18.431368-05	2026-11-06 10:08:27.958-05	2026-11-06 10:08:27.957-05
prod_01M6Q0TVNVFFWGQ5Y1B80VW3V3	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6Q0TVRQM4EY341FFZGR6T83	2026-11-05 18:31:18.431368-05	2026-11-06 10:08:27.958-05	2026-11-06 10:08:27.957-05
prod_01M6Q0TVNVGK5HCTWXPDWAWQR1	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6Q0TVRQA0RM0FPMP7HGBXAS	2026-11-05 18:31:18.431368-05	2026-11-06 10:08:27.958-05	2026-11-06 10:08:27.957-05
prod_01M6Q0TVNVAZY133GAN1HH5XEW	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6Q0TVRQGYM2GR0G0P999HCH	2026-11-05 18:31:18.431368-05	2026-11-06 10:08:27.958-05	2026-11-06 10:08:27.957-05
prod_01M6Q0TVNVR8Q95SX58M1A1PR8	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6Q0TVRQGWCX6584RT4500YS	2026-11-05 18:31:18.431368-05	2026-11-06 10:08:27.958-05	2026-11-06 10:08:27.957-05
prod_01M6RPEW07RE5HGX8MNWG22ACV	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6RPEW3CT610Z1PHRJ4TS5C4	2026-11-06 10:08:28.652636-05	2026-11-06 11:29:21.98-05	2026-11-06 11:29:21.979-05
prod_01M6RPEW08B012SRX8884NNF8R	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6RPEW3D97YMRQ1AT56XP2CC	2026-11-06 10:08:28.652636-05	2026-11-06 11:29:21.98-05	2026-11-06 11:29:21.979-05
prod_01M6RPEW08BDRRNWA2XHA9PDWN	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6RPEW3DDM9X9Y3H15Q9BVJH	2026-11-06 10:08:28.652636-05	2026-11-06 11:29:21.98-05	2026-11-06 11:29:21.979-05
prod_01M6RPEW081153HWTZ3RP6EZ5V	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6RPEW3DNF1VYXYB9TTF8KQX	2026-11-06 10:08:28.652636-05	2026-11-06 11:29:21.98-05	2026-11-06 11:29:21.979-05
prod_01M6RPEW08Q3WJXN2D5T6MJ68R	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6RPEW3D4DX0W4MKRBJ1S6YX	2026-11-06 10:08:28.652636-05	2026-11-06 11:29:21.98-05	2026-11-06 11:29:21.979-05
prod_01M6RPEW08NBPN2008PFPYB34Q	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6RPEW3DV5AJ3J724WZH3N10	2026-11-06 10:08:28.652636-05	2026-11-06 11:29:21.98-05	2026-11-06 11:29:21.979-05
prod_01M6RPEW084PYH5PFP7RKQC28G	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6RPEW3EYJFAB3B0NRP9NZQZ	2026-11-06 10:08:28.652636-05	2026-11-06 11:29:21.98-05	2026-11-06 11:29:21.979-05
prod_01M6RPEW086EP0YGHQXYZXMH0D	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6RPEW3E7QAQHMCV9ACHDP1N	2026-11-06 10:08:28.652636-05	2026-11-06 11:29:21.98-05	2026-11-06 11:29:21.979-05
prod_01M6RPEW08XDN4YM5CJZA5BJ18	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6RPEW3EJ0SVD0KE6KRTN55E	2026-11-06 10:08:28.652636-05	2026-11-06 11:29:21.98-05	2026-11-06 11:29:21.979-05
prod_01M6RPEW08GBEJSDYN8AHKK790	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6RPEW3EHMH3409QNK3FX6FG	2026-11-06 10:08:28.652636-05	2026-11-06 11:29:21.98-05	2026-11-06 11:29:21.979-05
prod_01M6RPEW082VFHFT1FWY02275R	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6RPEW3EH2EEFWRX3WXX047Q	2026-11-06 10:08:28.652636-05	2026-11-06 11:29:21.98-05	2026-11-06 11:29:21.979-05
prod_01M6RPEW08CNRNJSHV2P1ZT5QW	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6RPEW3EXNT786BME2S2YQ1X	2026-11-06 10:08:28.652636-05	2026-11-06 11:29:21.98-05	2026-11-06 11:29:21.979-05
prod_01M6RPEW08AMZS17MYD0A0XQV9	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6RPEW3EPPG4FAD51CXG9HRA	2026-11-06 10:08:28.652636-05	2026-11-06 11:29:21.98-05	2026-11-06 11:29:21.979-05
prod_01M6RPEW08K7G5BQ2AJVBNWSD8	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6RPEW3EAG3177H318D43VAR	2026-11-06 10:08:28.652636-05	2026-11-06 11:29:21.98-05	2026-11-06 11:29:21.979-05
prod_01M6RPEW08KKFEMGCR8DHA8253	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6RPEW3EZA3ZAY1CYC1J6CBW	2026-11-06 10:08:28.652636-05	2026-11-06 11:29:21.98-05	2026-11-06 11:29:21.979-05
prod_01M6RPEW089JG2ZHZMY25K7FKE	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6RPEW3EFT1DHNJ3WVAJ4T88	2026-11-06 10:08:28.652636-05	2026-11-06 11:29:21.98-05	2026-11-06 11:29:21.979-05
prod_01M6RV433VXTN0Q3M4KFEPFEVY	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6RV437ACM4CDC8C2J9PM04E	2026-11-06 11:29:58.378852-05	2026-11-06 11:29:58.378852-05	\N
prod_01M6RV433VBXFP15V95A7WYZJ7	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6RV437BEG464VP22BB6NMJV	2026-11-06 11:29:58.378852-05	2026-11-06 11:29:58.378852-05	\N
prod_01M6RV433V2SMZXSHC9ET34Q7P	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6RV437BPF5SKTGFV85P33QZ	2026-11-06 11:29:58.378852-05	2026-11-06 11:29:58.378852-05	\N
prod_01M6RV433V8QZPH3PNVY46ZNEP	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6RV437BXZZH2K95SDFDPZ18	2026-11-06 11:29:58.378852-05	2026-11-06 11:29:58.378852-05	\N
prod_01M6RV433VH280P701DXANFBRN	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6RV437B9PBNH5K8RCRQMH6A	2026-11-06 11:29:58.378852-05	2026-11-06 11:29:58.378852-05	\N
prod_01M6RV433V3S45S2XK53QKXJG7	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6RV437C0KY8G2PZ9TFWXRW5	2026-11-06 11:29:58.378852-05	2026-11-06 11:29:58.378852-05	\N
prod_01M6RV433V6XR5MWQQ2R2HZK77	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6RV437CTK7GDEAGEA0KV4XE	2026-11-06 11:29:58.378852-05	2026-11-06 11:29:58.378852-05	\N
prod_01M6RV433VFVQK8CJ13HYDBF8C	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6RV437CPS1DCSH02CNCH6FG	2026-11-06 11:29:58.378852-05	2026-11-06 11:29:58.378852-05	\N
prod_01M6RV433W5X97CNW0881T4HVS	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6RV437CRE93E45RZQXC3NRW	2026-11-06 11:29:58.378852-05	2026-11-06 11:29:58.378852-05	\N
prod_01M6RV433WAC11MFF8J8MYGGXV	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6RV437CHD4VHZJG1QDXGPHM	2026-11-06 11:29:58.378852-05	2026-11-06 11:29:58.378852-05	\N
prod_01M6RV433WSANFXX1A1XPDAKKT	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6RV437CS7DGC8DYHNAYWMPH	2026-11-06 11:29:58.378852-05	2026-11-06 11:29:58.378852-05	\N
prod_01M6RV433WHK3TK8WS4BB3NCD0	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6RV437CFK2GJJ3FCG23JY16	2026-11-06 11:29:58.378852-05	2026-11-06 11:29:58.378852-05	\N
prod_01M6RV433WTRZ4DGQ5HHJCEV93	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6RV437CBHB1P3A3CA7JENP8	2026-11-06 11:29:58.378852-05	2026-11-06 11:29:58.378852-05	\N
prod_01M6RV433W9FM6BGE5SP0V9VXE	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6RV437CGGVX0DBD6SSHC7KE	2026-11-06 11:29:58.378852-05	2026-11-06 11:29:58.378852-05	\N
prod_01M6RV433WFGYYK1YXC74TA0VY	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6RV437DH3DHGD9BHHNWX7XS	2026-11-06 11:29:58.378852-05	2026-11-06 11:29:58.378852-05	\N
prod_01M6RV433WKGNMKY7EYCP575XW	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6RV437DEC5S0FTTXVBZFY4V	2026-11-06 11:29:58.378852-05	2026-11-06 11:29:58.378852-05	\N
prod_01M6VRP832RAWH9B74NB480E0K	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	prodsc_01M6VRP86G9A1PZ2EJN0C9PW8J	2026-11-07 14:45:10.864584-05	2026-11-07 14:45:10.864584-05	\N
\.


--
-- Data for Name: product_shipping_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_shipping_profile (product_id, shipping_profile_id, id, created_at, updated_at, deleted_at) FROM stdin;
prod_01M6Q03ETMVSFYX1YFMRV52WFM	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6Q03EXAQTPAJ8M8R6WG3XV3	2026-11-05 18:18:31.595344-05	2026-11-06 10:08:27.961-05	2026-11-06 10:08:27.96-05
prod_01M6Q03ETMPNV54YAX30PF5MP4	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6Q03EXB52W9ZWDNKV9H06ED	2026-11-05 18:18:31.595344-05	2026-11-06 10:08:27.961-05	2026-11-06 10:08:27.96-05
prod_01M6Q03ETNKKC3J2PQ8J5HX3X1	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6Q03EXBNB89TVSGKBYG0JTJ	2026-11-05 18:18:31.595344-05	2026-11-06 10:08:27.961-05	2026-11-06 10:08:27.96-05
prod_01M6Q03ETNJS6M4Y5RV946030B	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6Q03EXBJY19D8AYK2NDX6WH	2026-11-05 18:18:31.595344-05	2026-11-06 10:08:27.961-05	2026-11-06 10:08:27.96-05
prod_01M6Q0TVNVJF38J8BV2MB49QH0	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6Q0TVS8GYGDKFVDFD853MH6	2026-11-05 18:31:18.450238-05	2026-11-06 10:08:27.961-05	2026-11-06 10:08:27.96-05
prod_01M6Q0TVNV9Y6GBVRV7MFM7ZJV	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6Q0TVS8R87WKKK8VVCWS3QM	2026-11-05 18:31:18.450238-05	2026-11-06 10:08:27.961-05	2026-11-06 10:08:27.96-05
prod_01M6Q0TVNV2PJR6Q3NWMDR5B75	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6Q0TVS8TF9PFW9B0G9XCFHV	2026-11-05 18:31:18.450238-05	2026-11-06 10:08:27.961-05	2026-11-06 10:08:27.96-05
prod_01M6Q0TVNVZR9YGNY0KZBMAX7W	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6Q0TVS946AEWQ8DE4YS0G34	2026-11-05 18:31:18.450238-05	2026-11-06 10:08:27.961-05	2026-11-06 10:08:27.96-05
prod_01M6Q0TVNVFFWGQ5Y1B80VW3V3	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6Q0TVS90K3QPX1SXPMCCWY3	2026-11-05 18:31:18.450238-05	2026-11-06 10:08:27.961-05	2026-11-06 10:08:27.96-05
prod_01M6Q0TVNVGK5HCTWXPDWAWQR1	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6Q0TVS9ZBH9R775D5PA704M	2026-11-05 18:31:18.450238-05	2026-11-06 10:08:27.961-05	2026-11-06 10:08:27.96-05
prod_01M6Q0TVNVAZY133GAN1HH5XEW	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6Q0TVS9DBGVGAGFC4K0KGEA	2026-11-05 18:31:18.450238-05	2026-11-06 10:08:27.961-05	2026-11-06 10:08:27.96-05
prod_01M6Q0TVNVR8Q95SX58M1A1PR8	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6Q0TVS9Y43ZN8FZZ50FFENK	2026-11-05 18:31:18.450238-05	2026-11-06 10:08:27.961-05	2026-11-06 10:08:27.96-05
prod_01M6RPEW07RE5HGX8MNWG22ACV	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6RPEW41ZEA3MP7C68ZHPZHA	2026-11-06 10:08:28.673112-05	2026-11-06 11:29:21.983-05	2026-11-06 11:29:21.982-05
prod_01M6RPEW08B012SRX8884NNF8R	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6RPEW41GWM9YR9VX7W3TATS	2026-11-06 10:08:28.673112-05	2026-11-06 11:29:21.983-05	2026-11-06 11:29:21.982-05
prod_01M6RPEW08BDRRNWA2XHA9PDWN	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6RPEW41W1GMCGPHFE0B0DGT	2026-11-06 10:08:28.673112-05	2026-11-06 11:29:21.983-05	2026-11-06 11:29:21.982-05
prod_01M6RPEW081153HWTZ3RP6EZ5V	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6RPEW42AZ1X0WDB8Z8JP70R	2026-11-06 10:08:28.673112-05	2026-11-06 11:29:21.983-05	2026-11-06 11:29:21.982-05
prod_01M6RPEW08Q3WJXN2D5T6MJ68R	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6RPEW42GNFM2GSR9N5D962G	2026-11-06 10:08:28.673112-05	2026-11-06 11:29:21.983-05	2026-11-06 11:29:21.982-05
prod_01M6RPEW08NBPN2008PFPYB34Q	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6RPEW42R2477N30FZHMJPSH	2026-11-06 10:08:28.673112-05	2026-11-06 11:29:21.983-05	2026-11-06 11:29:21.982-05
prod_01M6RPEW084PYH5PFP7RKQC28G	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6RPEW42GSW66FK32FQVSZHM	2026-11-06 10:08:28.673112-05	2026-11-06 11:29:21.983-05	2026-11-06 11:29:21.982-05
prod_01M6RPEW086EP0YGHQXYZXMH0D	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6RPEW42WWY70AAHS305T74T	2026-11-06 10:08:28.673112-05	2026-11-06 11:29:21.983-05	2026-11-06 11:29:21.982-05
prod_01M6RPEW08XDN4YM5CJZA5BJ18	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6RPEW42WX7Y6FZJDJRB9F23	2026-11-06 10:08:28.673112-05	2026-11-06 11:29:21.983-05	2026-11-06 11:29:21.982-05
prod_01M6RPEW08GBEJSDYN8AHKK790	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6RPEW42NP1SKQAPX73MW4FQ	2026-11-06 10:08:28.673112-05	2026-11-06 11:29:21.983-05	2026-11-06 11:29:21.982-05
prod_01M6RPEW082VFHFT1FWY02275R	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6RPEW4270GA4F2MTBJPJ352	2026-11-06 10:08:28.673112-05	2026-11-06 11:29:21.983-05	2026-11-06 11:29:21.982-05
prod_01M6RPEW08CNRNJSHV2P1ZT5QW	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6RPEW42BY66FSWDTHR4MG8Z	2026-11-06 10:08:28.673112-05	2026-11-06 11:29:21.983-05	2026-11-06 11:29:21.982-05
prod_01M6RPEW08AMZS17MYD0A0XQV9	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6RPEW42VMB6N3FZ4X16HXBG	2026-11-06 10:08:28.673112-05	2026-11-06 11:29:21.983-05	2026-11-06 11:29:21.982-05
prod_01M6RPEW08K7G5BQ2AJVBNWSD8	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6RPEW42ZWJNJFX98GM817JP	2026-11-06 10:08:28.673112-05	2026-11-06 11:29:21.983-05	2026-11-06 11:29:21.982-05
prod_01M6RPEW08KKFEMGCR8DHA8253	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6RPEW4312EHCKB0H1HC5HV6	2026-11-06 10:08:28.673112-05	2026-11-06 11:29:21.983-05	2026-11-06 11:29:21.982-05
prod_01M6RPEW089JG2ZHZMY25K7FKE	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6RPEW43GG6XAMDJGD617PEX	2026-11-06 10:08:28.673112-05	2026-11-06 11:29:21.983-05	2026-11-06 11:29:21.982-05
prod_01M6RV433VXTN0Q3M4KFEPFEVY	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6RV43810BQ9D92K65PW5Y7E	2026-11-06 11:29:58.402085-05	2026-11-06 11:29:58.402085-05	\N
prod_01M6RV433VBXFP15V95A7WYZJ7	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6RV43814VC60THEENQWE8PV	2026-11-06 11:29:58.402085-05	2026-11-06 11:29:58.402085-05	\N
prod_01M6RV433V2SMZXSHC9ET34Q7P	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6RV43817DCFRH3412DJ0BT6	2026-11-06 11:29:58.402085-05	2026-11-06 11:29:58.402085-05	\N
prod_01M6RV433V8QZPH3PNVY46ZNEP	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6RV4381FH5GBXXR88RY7HNW	2026-11-06 11:29:58.402085-05	2026-11-06 11:29:58.402085-05	\N
prod_01M6RV433VH280P701DXANFBRN	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6RV4381K7VP8RC2PN60Z5R5	2026-11-06 11:29:58.402085-05	2026-11-06 11:29:58.402085-05	\N
prod_01M6RV433V3S45S2XK53QKXJG7	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6RV4382SXJM0JWXK5VYPP4S	2026-11-06 11:29:58.402085-05	2026-11-06 11:29:58.402085-05	\N
prod_01M6RV433V6XR5MWQQ2R2HZK77	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6RV4382Z8WWZXSR7KEENTJ5	2026-11-06 11:29:58.402085-05	2026-11-06 11:29:58.402085-05	\N
prod_01M6RV433VFVQK8CJ13HYDBF8C	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6RV4382XE7737Q7YXT42GNE	2026-11-06 11:29:58.402085-05	2026-11-06 11:29:58.402085-05	\N
prod_01M6RV433W5X97CNW0881T4HVS	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6RV438218DK79G632NPNAFT	2026-11-06 11:29:58.402085-05	2026-11-06 11:29:58.402085-05	\N
prod_01M6RV433WAC11MFF8J8MYGGXV	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6RV4382660T14HG5VGRDMB1	2026-11-06 11:29:58.402085-05	2026-11-06 11:29:58.402085-05	\N
prod_01M6RV433WSANFXX1A1XPDAKKT	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6RV4382RA0QD55VAJ406DC0	2026-11-06 11:29:58.402085-05	2026-11-06 11:29:58.402085-05	\N
prod_01M6RV433WHK3TK8WS4BB3NCD0	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6RV4382BJ37Q7X50SZKM1DH	2026-11-06 11:29:58.402085-05	2026-11-06 11:29:58.402085-05	\N
prod_01M6RV433WTRZ4DGQ5HHJCEV93	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6RV43824KYD87ZZT6BQ86ST	2026-11-06 11:29:58.402085-05	2026-11-06 11:29:58.402085-05	\N
prod_01M6RV433W9FM6BGE5SP0V9VXE	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6RV4382V6ZZ0JCRXASH5B0T	2026-11-06 11:29:58.402085-05	2026-11-06 11:29:58.402085-05	\N
prod_01M6RV433WFGYYK1YXC74TA0VY	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6RV438356Q2NKKMQ85TT7GT	2026-11-06 11:29:58.402085-05	2026-11-06 11:29:58.402085-05	\N
prod_01M6RV433WKGNMKY7EYCP575XW	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6RV43830R02FDDNARVRAM30	2026-11-06 11:29:58.402085-05	2026-11-06 11:29:58.402085-05	\N
prod_01M6VRP832RAWH9B74NB480E0K	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	prodsp_01M6VRP87EP5TWTEME9TEYEJVG	2026-11-07 14:45:10.894343-05	2026-11-07 14:45:10.894343-05	\N
\.


--
-- Data for Name: product_tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_tag (id, value, metadata, created_at, updated_at, deleted_at, external_id) FROM stdin;
\.


--
-- Data for Name: product_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_tags (product_id, product_tag_id) FROM stdin;
\.


--
-- Data for Name: product_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_type (id, value, metadata, created_at, updated_at, deleted_at, external_id) FROM stdin;
\.


--
-- Data for Name: product_variant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_variant (id, title, sku, barcode, ean, upc, allow_backorder, manage_inventory, hs_code, origin_country, mid_code, material, weight, length, height, width, metadata, variant_rank, product_id, created_at, updated_at, deleted_at, thumbnail) FROM stdin;
variant_01M6VRP8806KMGC80QGV9EREHN	Al Detal (Unidad)	DETAL-7702025102004	7702025102004	77020251020041	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6VRP832RAWH9B74NB480E0K	2026-11-07 14:45:10.913-05	2026-11-07 14:45:10.913-05	\N	\N
variant_01M6VRP880Y4KY9B7BPGWRQ2BX	Al por Mayor (Caja / Bulto)	MAYOR-7702025102004	7702025102004-M	77020251020042	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6VRP832RAWH9B74NB480E0K	2026-11-07 14:45:10.913-05	2026-11-07 14:45:10.913-05	\N	\N
variant_01M6Q03EXWMVBBE73BJT5D7GY8	S / Black	SHIRT-S-BLACK	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6Q03ETMVSFYX1YFMRV52WFM	2026-11-05 18:18:31.616-05	2026-11-06 10:08:27.969-05	2026-11-06 10:08:27.945-05	\N
variant_01M6Q03EXXMBYP27A71VN2TDCD	S / White	SHIRT-S-WHITE	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6Q03ETMVSFYX1YFMRV52WFM	2026-11-05 18:18:31.616-05	2026-11-06 10:08:27.969-05	2026-11-06 10:08:27.945-05	\N
variant_01M6Q03EXXWZ6EPAE1EJPG30TK	M / Black	SHIRT-M-BLACK	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6Q03ETMVSFYX1YFMRV52WFM	2026-11-05 18:18:31.616-05	2026-11-06 10:08:27.969-05	2026-11-06 10:08:27.945-05	\N
variant_01M6Q03EXX8XG5AG02RGCGKQFH	M / White	SHIRT-M-WHITE	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6Q03ETMVSFYX1YFMRV52WFM	2026-11-05 18:18:31.616-05	2026-11-06 10:08:27.969-05	2026-11-06 10:08:27.945-05	\N
variant_01M6Q03EXXT7SVEDAYKJ8K060X	L / Black	SHIRT-L-BLACK	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6Q03ETMVSFYX1YFMRV52WFM	2026-11-05 18:18:31.616-05	2026-11-06 10:08:27.969-05	2026-11-06 10:08:27.945-05	\N
variant_01M6Q03EXXTNBT3PYNJQG12WQS	L / White	SHIRT-L-WHITE	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6Q03ETMVSFYX1YFMRV52WFM	2026-11-05 18:18:31.616-05	2026-11-06 10:08:27.969-05	2026-11-06 10:08:27.945-05	\N
variant_01M6Q03EXX42SGF4TVKHJEYD6Q	XL / Black	SHIRT-XL-BLACK	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6Q03ETMVSFYX1YFMRV52WFM	2026-11-05 18:18:31.616-05	2026-11-06 10:08:27.969-05	2026-11-06 10:08:27.945-05	\N
variant_01M6Q03EXYMCP52GGG527GA3V7	XL / White	SHIRT-XL-WHITE	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6Q03ETMVSFYX1YFMRV52WFM	2026-11-05 18:18:31.616-05	2026-11-06 10:08:27.969-05	2026-11-06 10:08:27.945-05	\N
variant_01M6Q03EXYJ8MZX5AME8KC1YV9	S	SWEATSHIRT-S	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6Q03ETMPNV54YAX30PF5MP4	2026-11-05 18:18:31.616-05	2026-11-06 10:08:27.983-05	2026-11-06 10:08:27.945-05	\N
variant_01M6Q03EXY6PVNT7HNF37ZWSRC	M	SWEATSHIRT-M	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6Q03ETMPNV54YAX30PF5MP4	2026-11-05 18:18:31.616-05	2026-11-06 10:08:27.983-05	2026-11-06 10:08:27.945-05	\N
variant_01M6Q03EXY71J1Y9R52YX04H17	L	SWEATSHIRT-L	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6Q03ETMPNV54YAX30PF5MP4	2026-11-05 18:18:31.616-05	2026-11-06 10:08:27.983-05	2026-11-06 10:08:27.945-05	\N
variant_01M6Q03EXYCP33XNMGKKAPDN4Q	XL	SWEATSHIRT-XL	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6Q03ETMPNV54YAX30PF5MP4	2026-11-05 18:18:31.616-05	2026-11-06 10:08:27.983-05	2026-11-06 10:08:27.945-05	\N
variant_01M6Q03EXYZXWH0KQMB7GHMJ14	S	SWEATPANTS-S	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6Q03ETNKKC3J2PQ8J5HX3X1	2026-11-05 18:18:31.616-05	2026-11-06 10:08:27.99-05	2026-11-06 10:08:27.945-05	\N
variant_01M6Q03EXZD2YM327TCH4NN48N	M	SWEATPANTS-M	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6Q03ETNKKC3J2PQ8J5HX3X1	2026-11-05 18:18:31.616-05	2026-11-06 10:08:27.99-05	2026-11-06 10:08:27.945-05	\N
variant_01M6Q03EXZQ35KT90E2XTXJN16	L	SWEATPANTS-L	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6Q03ETNKKC3J2PQ8J5HX3X1	2026-11-05 18:18:31.616-05	2026-11-06 10:08:27.99-05	2026-11-06 10:08:27.945-05	\N
variant_01M6Q03EXZCJJ9S3X2TK6XCM8G	XL	SWEATPANTS-XL	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6Q03ETNKKC3J2PQ8J5HX3X1	2026-11-05 18:18:31.617-05	2026-11-06 10:08:27.99-05	2026-11-06 10:08:27.945-05	\N
variant_01M6Q03EXZ3036EAWD65VZ5NPN	S	SHORTS-S	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6Q03ETNJS6M4Y5RV946030B	2026-11-05 18:18:31.617-05	2026-11-06 10:08:28.004-05	2026-11-06 10:08:27.945-05	\N
variant_01M6Q03EXZB50XTYV0CBR399ZA	M	SHORTS-M	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6Q03ETNJS6M4Y5RV946030B	2026-11-05 18:18:31.617-05	2026-11-06 10:08:28.004-05	2026-11-06 10:08:27.945-05	\N
variant_01M6Q03EXZ8K79535S657RBZJH	L	SHORTS-L	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6Q03ETNJS6M4Y5RV946030B	2026-11-05 18:18:31.617-05	2026-11-06 10:08:28.004-05	2026-11-06 10:08:27.945-05	\N
variant_01M6Q03EXZ5JPGSQG3E61T3Q3N	XL	SHORTS-XL	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6Q03ETNJS6M4Y5RV946030B	2026-11-05 18:18:31.617-05	2026-11-06 10:08:28.004-05	2026-11-06 10:08:27.945-05	\N
variant_01M6Q0TVSVPGKZQQ5BC03VACKA	Unidad	SKU-AGUACATE-HASS-ORGANICO-1	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6Q0TVNVJF38J8BV2MB49QH0	2026-11-05 18:31:18.461-05	2026-11-06 10:08:28.012-05	2026-11-06 10:08:27.945-05	\N
variant_01M6Q0TVSVE6RBW8JG0DQYZQZB	Unidad	SKU-FRESAS-FRESCAS-500G-1	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6Q0TVNV9Y6GBVRV7MFM7ZJV	2026-11-05 18:31:18.461-05	2026-11-06 10:08:28.021-05	2026-11-06 10:08:27.945-05	\N
variant_01M6Q0TVSVN4FP6C3XPNRB6G19	Unidad	SKU-CAFE-GRANO-ARTESANAL-1	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6Q0TVNV2PJR6Q3NWMDR5B75	2026-11-05 18:31:18.461-05	2026-11-06 10:08:28.031-05	2026-11-06 10:08:27.945-05	\N
variant_01M6Q0TVSWQN4M90303YT5F4E3	Unidad	SKU-ACEITE-OLIVA-VIRGEN-EXTRA-1	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6Q0TVNVZR9YGNY0KZBMAX7W	2026-11-05 18:31:18.461-05	2026-11-06 10:08:28.04-05	2026-11-06 10:08:27.945-05	\N
variant_01M6Q0TVSWDP2C14ARWDV7RS82	Unidad	SKU-LECHE-ENTERA-FRESCA-1L-1	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6Q0TVNVFFWGQ5Y1B80VW3V3	2026-11-05 18:31:18.461-05	2026-11-06 10:08:28.05-05	2026-11-06 10:08:27.945-05	\N
variant_01M6Q0TVSWTKCQRTQ85B9FN3FJ	Unidad	SKU-HUEVOS-CAMPEROS-DOCENA-1	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6Q0TVNVGK5HCTWXPDWAWQR1	2026-11-05 18:31:18.461-05	2026-11-06 10:08:28.059-05	2026-11-06 10:08:27.945-05	\N
variant_01M6Q0TVSWQTE12VDJBKYMKSFE	Unidad	SKU-JUGO-NARANJA-EXPRIMIDO-1	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6Q0TVNVAZY133GAN1HH5XEW	2026-11-05 18:31:18.461-05	2026-11-06 10:08:28.068-05	2026-11-06 10:08:27.945-05	\N
variant_01M6Q0TVSWGVFP9Y8T73777M4H	Unidad	SKU-PAN-ARTESANAL-MASA-MADRE-1	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6Q0TVNVR8Q95SX58M1A1PR8	2026-11-05 18:31:18.461-05	2026-11-06 10:08:28.079-05	2026-11-06 10:08:27.945-05	\N
variant_01M6RPEW4QV0T09N9QSKV6A4D7	Al Detal (Unidad)	DETAL-AGUACATE-HASS-ORGANICO	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RPEW07RE5HGX8MNWG22ACV	2026-11-06 10:08:28.7-05	2026-11-06 11:29:21.993-05	2026-11-06 11:29:21.969-05	\N
variant_01M6RPEW4QTZNY278QRX15CDFF	Al por Mayor (Caja / Bulto)	MAYOR-AGUACATE-HASS-ORGANICO	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RPEW07RE5HGX8MNWG22ACV	2026-11-06 10:08:28.7-05	2026-11-06 11:29:21.993-05	2026-11-06 11:29:21.969-05	\N
variant_01M6RPEW4QMK28407427CPP97G	Al Detal (Unidad)	DETAL-FRESAS-FRESCAS-500G	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RPEW08B012SRX8884NNF8R	2026-11-06 10:08:28.7-05	2026-11-06 11:29:22.003-05	2026-11-06 11:29:21.969-05	\N
variant_01M6RPEW4QHGKD6HNZKRKYDHYJ	Al por Mayor (Caja / Bulto)	MAYOR-FRESAS-FRESCAS-500G	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RPEW08B012SRX8884NNF8R	2026-11-06 10:08:28.7-05	2026-11-06 11:29:22.003-05	2026-11-06 11:29:21.969-05	\N
variant_01M6RPEW4Q2RBE9C1CQ586Y6G0	Al Detal (Unidad)	DETAL-BANANO-ORGANICO-EXPORTACION	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RPEW08BDRRNWA2XHA9PDWN	2026-11-06 10:08:28.7-05	2026-11-06 11:29:22.012-05	2026-11-06 11:29:21.969-05	\N
variant_01M6RPEW4Q58K7JEN29VJPR78Z	Al por Mayor (Caja / Bulto)	MAYOR-BANANO-ORGANICO-EXPORTACION	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RPEW08BDRRNWA2XHA9PDWN	2026-11-06 10:08:28.7-05	2026-11-06 11:29:22.012-05	2026-11-06 11:29:21.969-05	\N
variant_01M6RPEW4R21S9RX1KNZN05FFF	Al Detal (Unidad)	DETAL-CAFE-GRANO-ARTESANAL	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RPEW081153HWTZ3RP6EZ5V	2026-11-06 10:08:28.7-05	2026-11-06 11:29:22.025-05	2026-11-06 11:29:21.969-05	\N
variant_01M6RPEW4RK5WYSCZ0ZC5E32G5	Al por Mayor (Caja / Bulto)	MAYOR-CAFE-GRANO-ARTESANAL	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RPEW081153HWTZ3RP6EZ5V	2026-11-06 10:08:28.7-05	2026-11-06 11:29:22.025-05	2026-11-06 11:29:21.969-05	\N
variant_01M6RPEW4RFMEJ2B9NWEX28N6Y	Al Detal (Unidad)	DETAL-ACEITE-OLIVA-VIRGEN-EXTRA	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RPEW08Q3WJXN2D5T6MJ68R	2026-11-06 10:08:28.7-05	2026-11-06 11:29:22.035-05	2026-11-06 11:29:21.969-05	\N
variant_01M6RPEW4RH1KN5T23FT4DFMPV	Al por Mayor (Caja / Bulto)	MAYOR-ACEITE-OLIVA-VIRGEN-EXTRA	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RPEW08Q3WJXN2D5T6MJ68R	2026-11-06 10:08:28.7-05	2026-11-06 11:29:22.035-05	2026-11-06 11:29:21.969-05	\N
variant_01M6RPEW4R387TVJ1A59987EBJ	Al Detal (Unidad)	DETAL-ARROZ-BLANCO-EXTRA-GRANO	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RPEW08NBPN2008PFPYB34Q	2026-11-06 10:08:28.7-05	2026-11-06 11:29:22.053-05	2026-11-06 11:29:21.969-05	\N
variant_01M6RPEW4S02NDJNY1CN2KZJZQ	Al por Mayor (Caja / Bulto)	MAYOR-ARROZ-BLANCO-EXTRA-GRANO	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RPEW08NBPN2008PFPYB34Q	2026-11-06 10:08:28.7-05	2026-11-06 11:29:22.053-05	2026-11-06 11:29:21.969-05	\N
variant_01M6RPEW4S19152HNT332ND42K	Al Detal (Unidad)	DETAL-PAN-ARTESANAL-MASA-MADRE	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RPEW084PYH5PFP7RKQC28G	2026-11-06 10:08:28.7-05	2026-11-06 11:29:22.063-05	2026-11-06 11:29:21.969-05	\N
variant_01M6RPEW4SH40BQ3P0AXDKDEJP	Al por Mayor (Caja / Bulto)	MAYOR-PAN-ARTESANAL-MASA-MADRE	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RPEW084PYH5PFP7RKQC28G	2026-11-06 10:08:28.7-05	2026-11-06 11:29:22.063-05	2026-11-06 11:29:21.969-05	\N
variant_01M6RPEW4S5HEDHRJ71NWP0BF8	Al Detal (Unidad)	DETAL-LECHE-ENTERA-FRESCA-1L	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RPEW086EP0YGHQXYZXMH0D	2026-11-06 10:08:28.7-05	2026-11-06 11:29:22.076-05	2026-11-06 11:29:21.969-05	\N
variant_01M6RPEW4SH5GZJF7YQD4YH61S	Al por Mayor (Caja / Bulto)	MAYOR-LECHE-ENTERA-FRESCA-1L	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RPEW086EP0YGHQXYZXMH0D	2026-11-06 10:08:28.7-05	2026-11-06 11:29:22.076-05	2026-11-06 11:29:21.969-05	\N
variant_01M6RPEW4SNYFRBEM22F4YPXXM	Al Detal (Unidad)	DETAL-HUEVOS-CAMPEROS-DOCENA	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RPEW08XDN4YM5CJZA5BJ18	2026-11-06 10:08:28.7-05	2026-11-06 11:29:22.088-05	2026-11-06 11:29:21.969-05	\N
variant_01M6RPEW4SEF8JXBN7J0N3CN2N	Al por Mayor (Caja / Bulto)	MAYOR-HUEVOS-CAMPEROS-DOCENA	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RPEW08XDN4YM5CJZA5BJ18	2026-11-06 10:08:28.7-05	2026-11-06 11:29:22.088-05	2026-11-06 11:29:21.969-05	\N
variant_01M6RPEW4S1MSCHMG3B7APMFXJ	Al Detal (Unidad)	DETAL-QUESO-MOZZARELLA-FRESCO	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RPEW08GBEJSDYN8AHKK790	2026-11-06 10:08:28.7-05	2026-11-06 11:29:22.097-05	2026-11-06 11:29:21.969-05	\N
variant_01M6RPEW4TQTBVVZTCEDJGN7MF	Al por Mayor (Caja / Bulto)	MAYOR-QUESO-MOZZARELLA-FRESCO	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RPEW08GBEJSDYN8AHKK790	2026-11-06 10:08:28.7-05	2026-11-06 11:29:22.097-05	2026-11-06 11:29:21.969-05	\N
variant_01M6RPEW4T09E18AZZXNY8K1YE	Al Detal (Unidad)	DETAL-LOMO-RES-MADURADO	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RPEW082VFHFT1FWY02275R	2026-11-06 10:08:28.7-05	2026-11-06 11:29:22.108-05	2026-11-06 11:29:21.969-05	\N
variant_01M6RPEW4T2RE7P6QG6Z9WW7KF	Al por Mayor (Caja / Bulto)	MAYOR-LOMO-RES-MADURADO	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RPEW082VFHFT1FWY02275R	2026-11-06 10:08:28.7-05	2026-11-06 11:29:22.108-05	2026-11-06 11:29:21.969-05	\N
variant_01M6RPEW4TDVKNV2X6NWWVJJMY	Al Detal (Unidad)	DETAL-PECHUGA-POLLO-FRESCA	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RPEW08CNRNJSHV2P1ZT5QW	2026-11-06 10:08:28.7-05	2026-11-06 11:29:22.118-05	2026-11-06 11:29:21.969-05	\N
variant_01M6RPEW4T28QDSY0QV2RCF15P	Al por Mayor (Caja / Bulto)	MAYOR-PECHUGA-POLLO-FRESCA	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RPEW08CNRNJSHV2P1ZT5QW	2026-11-06 10:08:28.7-05	2026-11-06 11:29:22.118-05	2026-11-06 11:29:21.969-05	\N
variant_01M6RPEW4VGSSPBQ9HCWWZ4KK3	Al Detal (Unidad)	DETAL-JUGO-NARANJA-EXPRIMIDO	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RPEW08AMZS17MYD0A0XQV9	2026-11-06 10:08:28.7-05	2026-11-06 11:29:22.128-05	2026-11-06 11:29:21.969-05	\N
variant_01M6RPEW4VSJX7FS1SB8TRGZDE	Al por Mayor (Caja / Bulto)	MAYOR-JUGO-NARANJA-EXPRIMIDO	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RPEW08AMZS17MYD0A0XQV9	2026-11-06 10:08:28.7-05	2026-11-06 11:29:22.128-05	2026-11-06 11:29:21.969-05	\N
variant_01M6RPEW4VX4J3SR8CR1D2KW0M	Al Detal (Unidad)	DETAL-AGUA-MINERAL-MANANTIAL	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RPEW08K7G5BQ2AJVBNWSD8	2026-11-06 10:08:28.7-05	2026-11-06 11:29:22.139-05	2026-11-06 11:29:21.969-05	\N
variant_01M6RPEW4V4MAJF6S4PAM5G2S8	Al por Mayor (Caja / Bulto)	MAYOR-AGUA-MINERAL-MANANTIAL	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RPEW08K7G5BQ2AJVBNWSD8	2026-11-06 10:08:28.7-05	2026-11-06 11:29:22.139-05	2026-11-06 11:29:21.969-05	\N
variant_01M6RPEW4VYA9WKTPKGF5E1B70	Al Detal (Unidad)	DETAL-DETERGENTE-LIQUIDO-ECOLOGICO	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RPEW08KKFEMGCR8DHA8253	2026-11-06 10:08:28.7-05	2026-11-06 11:29:22.148-05	2026-11-06 11:29:21.969-05	\N
variant_01M6RPEW4VESD7JMA603EJY2ZJ	Al por Mayor (Caja / Bulto)	MAYOR-DETERGENTE-LIQUIDO-ECOLOGICO	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RPEW08KKFEMGCR8DHA8253	2026-11-06 10:08:28.7-05	2026-11-06 11:29:22.148-05	2026-11-06 11:29:21.969-05	\N
variant_01M6RPEW4V6SBSHSR8ZJ8AT4SJ	Al Detal (Unidad)	DETAL-PAPEL-HIGIENICO-TRIPLE-HOJA	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RPEW089JG2ZHZMY25K7FKE	2026-11-06 10:08:28.7-05	2026-11-06 11:29:22.159-05	2026-11-06 11:29:21.969-05	\N
variant_01M6RPEW4VQ7HAZ1WN5JF3ZEBC	Al por Mayor (Caja / Bulto)	MAYOR-PAPEL-HIGIENICO-TRIPLE-HOJA	\N	\N	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RPEW089JG2ZHZMY25K7FKE	2026-11-06 10:08:28.7-05	2026-11-06 11:29:22.159-05	2026-11-06 11:29:21.969-05	\N
variant_01M6RV438VF8QQFTSV19FYGW42	Al por Mayor (Caja / Bulto)	MAYOR-ARROZ-BLANCO-EXTRA-GRANO	7702002002039-M	77020020020392	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RV433V3S45S2XK53QKXJG7	2026-11-06 11:29:58.431-05	2026-11-07 12:44:41.517-05	\N	\N
variant_01M6RV438VFVK9DWN42CWQKXJ1	Al Detal (Unidad)	DETAL-PAN-ARTESANAL-MASA-MADRE	7702002002046	77020020020461	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RV433V6XR5MWQQ2R2HZK77	2026-11-06 11:29:58.431-05	2026-11-07 11:59:50.44-05	\N	\N
variant_01M6RV438VZSHK9WWJRH71R4EW	Al por Mayor (Caja / Bulto)	MAYOR-PAN-ARTESANAL-MASA-MADRE	7702002002046-M	77020020020462	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RV433V6XR5MWQQ2R2HZK77	2026-11-06 11:29:58.431-05	2026-11-07 11:59:50.493-05	\N	\N
variant_01M6RV438T853C3FF9N4XHJ8HS	Al Detal (Unidad)	DETAL-CAFE-GRANO-ARTESANAL	7702002002015	77020020020151	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RV433V8QZPH3PNVY46ZNEP	2026-11-06 11:29:58.431-05	2026-11-07 11:59:50.605-05	\N	\N
variant_01M6RV438TCX28QC97PH70ZPXE	Al por Mayor (Caja / Bulto)	MAYOR-CAFE-GRANO-ARTESANAL	7702002002015-M	77020020020152	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RV433V8QZPH3PNVY46ZNEP	2026-11-06 11:29:58.431-05	2026-11-07 11:59:50.65-05	\N	\N
variant_01M6RV438T1HCR4DFG9GGM64N9	Al por Mayor (Caja / Bulto)	MAYOR-FRESAS-FRESCAS-500G	7701001001025-M	77010010010252	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RV433VBXFP15V95A7WYZJ7	2026-11-06 11:29:58.431-05	2026-11-07 11:59:50.749-05	\N	\N
variant_01M6RV438VCX78CJCYAXK9QNMW	Al Detal (Unidad)	DETAL-LECHE-ENTERA-FRESCA-1L	7703003003012	77030030030121	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RV433VFVQK8CJ13HYDBF8C	2026-11-06 11:29:58.431-05	2026-11-07 11:59:50.918-05	\N	\N
variant_01M6RV438WPAQCDPY1ND3PX146	Al por Mayor (Caja / Bulto)	MAYOR-LECHE-ENTERA-FRESCA-1L	7703003003012-M	77030030030122	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RV433VFVQK8CJ13HYDBF8C	2026-11-06 11:29:58.431-05	2026-11-07 11:59:50.967-05	\N	\N
variant_01M6RV438V2CD3BRK8BH3D816M	Al Detal (Unidad)	DETAL-ACEITE-OLIVA-VIRGEN-EXTRA	7702002002022	77020020020221	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RV433VH280P701DXANFBRN	2026-11-06 11:29:58.431-05	2026-11-07 11:59:51.091-05	\N	\N
variant_01M6RV438SA66M12ECRFBARBHA	Al Detal (Unidad)	DETAL-AGUACATE-HASS-ORGANICO	7701001001018	77010010010181	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RV433VXTN0Q3M4KFEPFEVY	2026-11-06 11:29:58.431-05	2026-11-07 11:59:51.416-05	\N	\N
variant_01M6RV438SWKFM9SKAC7GZGNXB	Al por Mayor (Caja / Bulto)	MAYOR-AGUACATE-HASS-ORGANICO	7701001001018-M	77010010010182	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RV433VXTN0Q3M4KFEPFEVY	2026-11-06 11:29:58.431-05	2026-11-07 11:59:51.652-05	\N	\N
variant_01M6RV438WYJ8BRACD7ME89E3K	Al Detal (Unidad)	DETAL-HUEVOS-CAMPEROS-DOCENA	7703003003029	77030030030291	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RV433W5X97CNW0881T4HVS	2026-11-06 11:29:58.431-05	2026-11-07 11:59:51.97-05	\N	\N
variant_01M6RV438WXQ27KDR4P5VX2YQA	Al por Mayor (Caja / Bulto)	MAYOR-HUEVOS-CAMPEROS-DOCENA	7703003003029-M	77030030030292	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RV433W5X97CNW0881T4HVS	2026-11-06 11:29:58.431-05	2026-11-07 11:59:52.042-05	\N	\N
variant_01M6RV438WT0872HSQH1DTX8HQ	Al Detal (Unidad)	DETAL-QUESO-MOZZARELLA-FRESCO	7703003003036	77030030030361	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RV433WAC11MFF8J8MYGGXV	2026-11-06 11:29:58.431-05	2026-11-07 11:59:52.334-05	\N	\N
variant_01M6RV438WE21JDZT9851MDQMC	Al por Mayor (Caja / Bulto)	MAYOR-QUESO-MOZZARELLA-FRESCO	7703003003036-M	77030030030362	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RV433WAC11MFF8J8MYGGXV	2026-11-06 11:29:58.431-05	2026-11-07 11:59:52.394-05	\N	\N
variant_01M6RV438VRYW3STBR7FJ03VGV	Al Detal (Unidad)	DETAL-ARROZ-BLANCO-EXTRA-GRANO	7702002002039	77020020020391	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RV433V3S45S2XK53QKXJG7	2026-11-06 11:29:58.431-05	2026-11-07 12:44:41.437-05	\N	\N
variant_01M6RV438XJMSCVT1QKRT9G30B	Al por Mayor (Caja / Bulto)	MAYOR-JUGO-NARANJA-EXPRIMIDO	7705005005016-M	77050050050162	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RV433WTRZ4DGQ5HHJCEV93	2026-11-06 11:29:58.432-05	2026-11-07 11:59:53.354-05	\N	\N
variant_01M6RV438TCF06HPPW4FGHV0D3	Al por Mayor (Caja / Bulto)	MAYOR-BANANO-ORGANICO-EXPORTACION	7701001001032-M	77010010010322	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RV433V2SMZXSHC9ET34Q7P	2026-11-06 11:29:58.431-05	2026-11-07 11:59:50.048-05	\N	\N
variant_01M6RV438T3T62AHS19DZS6F01	Al Detal (Unidad)	DETAL-BANANO-ORGANICO-EXPORTACION	7701001001032	77010010010321	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RV433V2SMZXSHC9ET34Q7P	2026-11-06 11:29:58.431-05	2026-11-07 11:59:50.127-05	\N	\N
variant_01M6RV438SQB06J75G9HZCXJ4P	Al Detal (Unidad)	DETAL-FRESAS-FRESCAS-500G	7701001001025	77010010010251	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RV433VBXFP15V95A7WYZJ7	2026-11-06 11:29:58.431-05	2026-11-07 11:59:50.825-05	\N	\N
variant_01M6RV438V0GPXE6GFZAZSS25P	Al por Mayor (Caja / Bulto)	MAYOR-ACEITE-OLIVA-VIRGEN-EXTRA	7702002002022-M	77020020020222	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RV433VH280P701DXANFBRN	2026-11-06 11:29:58.431-05	2026-11-07 11:59:51.174-05	\N	\N
variant_01M6RV438X7TVFCK97VN8EN9YB	Al Detal (Unidad)	DETAL-AGUA-MINERAL-MANANTIAL	7705005005023	77050050050231	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RV433W9FM6BGE5SP0V9VXE	2026-11-06 11:29:58.432-05	2026-11-07 11:59:52.171-05	\N	\N
variant_01M6RV438YXBQZBEVYYYYAWJRK	Al por Mayor (Caja / Bulto)	MAYOR-AGUA-MINERAL-MANANTIAL	7705005005023-M	77050050050232	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RV433W9FM6BGE5SP0V9VXE	2026-11-06 11:29:58.432-05	2026-11-07 11:59:52.224-05	\N	\N
variant_01M6RV438Y2JEAYKQRK744DG9Z	Al Detal (Unidad)	DETAL-DETERGENTE-LIQUIDO-ECOLOGICO	7706006006013	77060060060131	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RV433WFGYYK1YXC74TA0VY	2026-11-06 11:29:58.432-05	2026-11-07 11:59:52.528-05	\N	\N
variant_01M6RV438YGVS38R3HZ17X7Y7Y	Al por Mayor (Caja / Bulto)	MAYOR-DETERGENTE-LIQUIDO-ECOLOGICO	7706006006013-M	77060060060132	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RV433WFGYYK1YXC74TA0VY	2026-11-06 11:29:58.432-05	2026-11-07 11:59:52.591-05	\N	\N
variant_01M6RV438XZJD85SZANXMEPSVN	Al Detal (Unidad)	DETAL-PECHUGA-POLLO-FRESCA	7704004004026	77040040040261	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RV433WHK3TK8WS4BB3NCD0	2026-11-06 11:29:58.431-05	2026-11-07 11:59:52.733-05	\N	\N
variant_01M6RV438XX7RR7Y93RG8WEBB3	Al por Mayor (Caja / Bulto)	MAYOR-PECHUGA-POLLO-FRESCA	7704004004026-M	77040040040262	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RV433WHK3TK8WS4BB3NCD0	2026-11-06 11:29:58.432-05	2026-11-07 11:59:52.813-05	\N	\N
variant_01M6RV438YD4WDJVCMWY7K6E0F	Al Detal (Unidad)	DETAL-PAPEL-HIGIENICO-TRIPLE-HOJA	7706006006020	77060060060201	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RV433WKGNMKY7EYCP575XW	2026-11-06 11:29:58.432-05	2026-11-07 11:59:52.937-05	\N	\N
variant_01M6RV438Y28J96X2CMGMW4TNX	Al por Mayor (Caja / Bulto)	MAYOR-PAPEL-HIGIENICO-TRIPLE-HOJA	7706006006020-M	77060060060202	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RV433WKGNMKY7EYCP575XW	2026-11-06 11:29:58.432-05	2026-11-07 11:59:52.992-05	\N	\N
variant_01M6RV438XZGSWSRWXA7SPFGG4	Al Detal (Unidad)	DETAL-LOMO-RES-MADURADO	7704004004019	77040040040191	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RV433WSANFXX1A1XPDAKKT	2026-11-06 11:29:58.431-05	2026-11-07 11:59:53.122-05	\N	\N
variant_01M6RV438XW54Z055JVRTVFVCS	Al por Mayor (Caja / Bulto)	MAYOR-LOMO-RES-MADURADO	7704004004019-M	77040040040192	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RV433WSANFXX1A1XPDAKKT	2026-11-06 11:29:58.431-05	2026-11-07 11:59:53.175-05	\N	\N
variant_01M6RV438XYE826Q1BTQA318RF	Al Detal (Unidad)	DETAL-JUGO-NARANJA-EXPRIMIDO	7705005005016	77050050050161	\N	f	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	prod_01M6RV433WTRZ4DGQ5HHJCEV93	2026-11-06 11:29:58.432-05	2026-11-07 11:59:53.291-05	\N	\N
\.


--
-- Data for Name: product_variant_inventory_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_variant_inventory_item (variant_id, inventory_item_id, id, required_quantity, created_at, updated_at, deleted_at) FROM stdin;
variant_01M6Q03EXWMVBBE73BJT5D7GY8	iitem_01M6Q03EYQCH7AQAVVRDH2S9B2	pvitem_01M6Q03EZFMAP0AVADP21NFSTM	1	2026-11-05 18:18:31.664287-05	2026-11-06 10:08:27.926-05	2026-11-06 10:08:27.924-05
variant_01M6Q03EXXMBYP27A71VN2TDCD	iitem_01M6Q03EYQM3V7JWNHRJQCBM22	pvitem_01M6Q03EZGGZAJMY1ZDT9XRMHP	1	2026-11-05 18:18:31.664287-05	2026-11-06 10:08:27.926-05	2026-11-06 10:08:27.924-05
variant_01M6Q03EXXWZ6EPAE1EJPG30TK	iitem_01M6Q03EYQCQN75F89RCP140ZM	pvitem_01M6Q03EZG4HFYEZ89CMK22769	1	2026-11-05 18:18:31.664287-05	2026-11-06 10:08:27.926-05	2026-11-06 10:08:27.924-05
variant_01M6Q03EXX8XG5AG02RGCGKQFH	iitem_01M6Q03EYQTB6M5DTG22A12BJY	pvitem_01M6Q03EZGP3VM6NGXPR5RKCVD	1	2026-11-05 18:18:31.664287-05	2026-11-06 10:08:27.926-05	2026-11-06 10:08:27.924-05
variant_01M6Q03EXXT7SVEDAYKJ8K060X	iitem_01M6Q03EYRYQ9WM5GFVX9APPJX	pvitem_01M6Q03EZGSW562T4HX8ZE7V49	1	2026-11-05 18:18:31.664287-05	2026-11-06 10:08:27.926-05	2026-11-06 10:08:27.924-05
variant_01M6Q03EXXTNBT3PYNJQG12WQS	iitem_01M6Q03EYRV27GF4AM70QYDSPB	pvitem_01M6Q03EZG5C6SDHECXH1SVAC7	1	2026-11-05 18:18:31.664287-05	2026-11-06 10:08:27.926-05	2026-11-06 10:08:27.924-05
variant_01M6Q03EXX42SGF4TVKHJEYD6Q	iitem_01M6Q03EYR1CN9D2JGQQMN80V8	pvitem_01M6Q03EZGVFWA5E8G0ACRMZMB	1	2026-11-05 18:18:31.664287-05	2026-11-06 10:08:27.926-05	2026-11-06 10:08:27.924-05
variant_01M6Q03EXYMCP52GGG527GA3V7	iitem_01M6Q03EYR3FH2MH3NZP1AQA3R	pvitem_01M6Q03EZH22Q99C8JDCRG34KS	1	2026-11-05 18:18:31.664287-05	2026-11-06 10:08:27.926-05	2026-11-06 10:08:27.924-05
variant_01M6Q03EXYJ8MZX5AME8KC1YV9	iitem_01M6Q03EYR120J2NDKPFGTY868	pvitem_01M6Q03EZH79JKB74C4JCQ9SHR	1	2026-11-05 18:18:31.664287-05	2026-11-06 10:08:27.926-05	2026-11-06 10:08:27.924-05
variant_01M6Q03EXY6PVNT7HNF37ZWSRC	iitem_01M6Q03EYRZ2PW3R16VQW10QQJ	pvitem_01M6Q03EZHHHXQMX84W7M4BRST	1	2026-11-05 18:18:31.664287-05	2026-11-06 10:08:27.926-05	2026-11-06 10:08:27.924-05
variant_01M6Q03EXY71J1Y9R52YX04H17	iitem_01M6Q03EYRE460RWTP2E9ECXDG	pvitem_01M6Q03EZHF92550G6WYNHMY5C	1	2026-11-05 18:18:31.664287-05	2026-11-06 10:08:27.926-05	2026-11-06 10:08:27.924-05
variant_01M6Q03EXYCP33XNMGKKAPDN4Q	iitem_01M6Q03EYRSH7XQ19BN5C5X9PZ	pvitem_01M6Q03EZH16XWT0N7ZG8BV5FS	1	2026-11-05 18:18:31.664287-05	2026-11-06 10:08:27.926-05	2026-11-06 10:08:27.924-05
variant_01M6Q03EXYZXWH0KQMB7GHMJ14	iitem_01M6Q03EYRZB88VNWMBXG9YKNR	pvitem_01M6Q03EZHAM6K4KTWEVGMN86W	1	2026-11-05 18:18:31.664287-05	2026-11-06 10:08:27.926-05	2026-11-06 10:08:27.924-05
variant_01M6Q03EXZD2YM327TCH4NN48N	iitem_01M6Q03EYSZQRSSC9P53X05V1E	pvitem_01M6Q03EZHFH6W9HYFNPHMQ32R	1	2026-11-05 18:18:31.664287-05	2026-11-06 10:08:27.927-05	2026-11-06 10:08:27.924-05
variant_01M6Q03EXZQ35KT90E2XTXJN16	iitem_01M6Q03EYSE5RBA1R6F88CC6CB	pvitem_01M6Q03EZHRDQP54T29PE2FDSM	1	2026-11-05 18:18:31.664287-05	2026-11-06 10:08:27.927-05	2026-11-06 10:08:27.924-05
variant_01M6Q03EXZCJJ9S3X2TK6XCM8G	iitem_01M6Q03EYSMKZJ8J3BK5ZF9BSZ	pvitem_01M6Q03EZHH8J79KACMSHX8YK7	1	2026-11-05 18:18:31.664287-05	2026-11-06 10:08:27.926-05	2026-11-06 10:08:27.924-05
variant_01M6Q03EXZ3036EAWD65VZ5NPN	iitem_01M6Q03EYSF600HCF33W4MQYGS	pvitem_01M6Q03EZJW3X2P079XHK63A96	1	2026-11-05 18:18:31.664287-05	2026-11-06 10:08:27.926-05	2026-11-06 10:08:27.924-05
variant_01M6Q03EXZB50XTYV0CBR399ZA	iitem_01M6Q03EYSXV1BEWHJNYKNT305	pvitem_01M6Q03EZJJADEMRC5Q9M5QW7P	1	2026-11-05 18:18:31.664287-05	2026-11-06 10:08:27.926-05	2026-11-06 10:08:27.924-05
variant_01M6Q03EXZ8K79535S657RBZJH	iitem_01M6Q03EYS656HR3PCYCMYGGHW	pvitem_01M6Q03EZJF2R995BH6MQ5T2CZ	1	2026-11-05 18:18:31.664287-05	2026-11-06 10:08:27.926-05	2026-11-06 10:08:27.924-05
variant_01M6Q03EXZ5JPGSQG3E61T3Q3N	iitem_01M6Q03EYSSXFR2MEHJM6EBR2H	pvitem_01M6Q03EZJJNXP97MDRTEARPQ7	1	2026-11-05 18:18:31.664287-05	2026-11-06 10:08:27.926-05	2026-11-06 10:08:27.924-05
variant_01M6Q0TVSVPGKZQQ5BC03VACKA	iitem_01M6Q0TVTC2MV4SHXAXHMV9Y8W	pvitem_01M6Q0TVTVFBWQTR9B2NTNFN21	1	2026-11-05 18:31:18.501101-05	2026-11-06 10:08:27.927-05	2026-11-06 10:08:27.924-05
variant_01M6Q0TVSVE6RBW8JG0DQYZQZB	iitem_01M6Q0TVTCV858N47E53EN1WZC	pvitem_01M6Q0TVTV7W8R3PD9PM6VFJAR	1	2026-11-05 18:31:18.501101-05	2026-11-06 10:08:27.927-05	2026-11-06 10:08:27.924-05
variant_01M6Q0TVSVN4FP6C3XPNRB6G19	iitem_01M6Q0TVTD4N4SCF2WM0TFZG1V	pvitem_01M6Q0TVTVP4YKVSRSMX7VXVBS	1	2026-11-05 18:31:18.501101-05	2026-11-06 10:08:27.927-05	2026-11-06 10:08:27.924-05
variant_01M6Q0TVSWQN4M90303YT5F4E3	iitem_01M6Q0TVTD3CND3QS2E9QJ54W4	pvitem_01M6Q0TVTV5BJFWT2WZ38AGAZZ	1	2026-11-05 18:31:18.501101-05	2026-11-06 10:08:27.927-05	2026-11-06 10:08:27.924-05
variant_01M6Q0TVSWDP2C14ARWDV7RS82	iitem_01M6Q0TVTDKTGN3JWBBD7MVBNQ	pvitem_01M6Q0TVTVRPEKYWXS4BTEMSMY	1	2026-11-05 18:31:18.501101-05	2026-11-06 10:08:27.927-05	2026-11-06 10:08:27.924-05
variant_01M6Q0TVSWTKCQRTQ85B9FN3FJ	iitem_01M6Q0TVTD7JXSKV83DE45V1Z6	pvitem_01M6Q0TVTW1Q5ERX55PS616869	1	2026-11-05 18:31:18.501101-05	2026-11-06 10:08:27.927-05	2026-11-06 10:08:27.924-05
variant_01M6Q0TVSWQTE12VDJBKYMKSFE	iitem_01M6Q0TVTDDSJET4BN7X4P0NFE	pvitem_01M6Q0TVTW1ZJXBY36PSA9G8GE	1	2026-11-05 18:31:18.501101-05	2026-11-06 10:08:27.927-05	2026-11-06 10:08:27.924-05
variant_01M6Q0TVSWGVFP9Y8T73777M4H	iitem_01M6Q0TVTD1X4GFQJ1WGH72TTJ	pvitem_01M6Q0TVTWBECFKTSWDN81B890	1	2026-11-05 18:31:18.501101-05	2026-11-06 10:08:27.927-05	2026-11-06 10:08:27.924-05
variant_01M6RPEW4QV0T09N9QSKV6A4D7	iitem_01M6RPEW5ZMMJZ5MH97EEF3JBP	pvitem_01M6RPEW6Q21PXMDD7QS7M59FW	1	2026-11-06 10:08:28.759856-05	2026-11-06 11:29:21.946-05	2026-11-06 11:29:21.944-05
variant_01M6RPEW4QTZNY278QRX15CDFF	iitem_01M6RPEW5ZGMH4KEDFXX4FETW9	pvitem_01M6RPEW6R1M7MWC267HG1KVHV	1	2026-11-06 10:08:28.759856-05	2026-11-06 11:29:21.946-05	2026-11-06 11:29:21.944-05
variant_01M6RPEW4QMK28407427CPP97G	iitem_01M6RPEW5ZJXA7VESNBFHGFWPK	pvitem_01M6RPEW6R2AYH7D8JBXG83VCG	1	2026-11-06 10:08:28.759856-05	2026-11-06 11:29:21.946-05	2026-11-06 11:29:21.944-05
variant_01M6RPEW4QHGKD6HNZKRKYDHYJ	iitem_01M6RPEW5ZVZ0WQ92WJV6G57ZB	pvitem_01M6RPEW6R7N90JWWGW2D19YT6	1	2026-11-06 10:08:28.759856-05	2026-11-06 11:29:21.946-05	2026-11-06 11:29:21.944-05
variant_01M6RPEW4Q2RBE9C1CQ586Y6G0	iitem_01M6RPEW5ZS833WBBFJQ34387V	pvitem_01M6RPEW6RXYRCJAZQMTDHX5E2	1	2026-11-06 10:08:28.759856-05	2026-11-06 11:29:21.946-05	2026-11-06 11:29:21.944-05
variant_01M6RPEW4Q58K7JEN29VJPR78Z	iitem_01M6RPEW5Z7VTNDM6T5EMJQ0SH	pvitem_01M6RPEW6RCFEWTKGZ0TTA1V6E	1	2026-11-06 10:08:28.759856-05	2026-11-06 11:29:21.946-05	2026-11-06 11:29:21.944-05
variant_01M6RPEW4R21S9RX1KNZN05FFF	iitem_01M6RPEW5Z57K9FZBNQY0QAC16	pvitem_01M6RPEW6R757FTHNT73D3JY5F	1	2026-11-06 10:08:28.759856-05	2026-11-06 11:29:21.946-05	2026-11-06 11:29:21.944-05
variant_01M6RPEW4RK5WYSCZ0ZC5E32G5	iitem_01M6RPEW60YZETMDSF92WE9Q0J	pvitem_01M6RPEW6RAJPYD2JWMHAZJ0NE	1	2026-11-06 10:08:28.759856-05	2026-11-06 11:29:21.946-05	2026-11-06 11:29:21.944-05
variant_01M6RPEW4RFMEJ2B9NWEX28N6Y	iitem_01M6RPEW602BXXKD7W9SWXF3TH	pvitem_01M6RPEW6S4TKQK4KS7QQD773B	1	2026-11-06 10:08:28.759856-05	2026-11-06 11:29:21.946-05	2026-11-06 11:29:21.944-05
variant_01M6RPEW4RH1KN5T23FT4DFMPV	iitem_01M6RPEW60HBYFNH744Q0Q21NE	pvitem_01M6RPEW6SFFKG1ADBJPN4KRXR	1	2026-11-06 10:08:28.759856-05	2026-11-06 11:29:21.946-05	2026-11-06 11:29:21.944-05
variant_01M6RPEW4R387TVJ1A59987EBJ	iitem_01M6RPEW60A788Q9QJJF3DGCXD	pvitem_01M6RPEW6S15RKY4PP1JBQNA9R	1	2026-11-06 10:08:28.759856-05	2026-11-06 11:29:21.946-05	2026-11-06 11:29:21.944-05
variant_01M6RPEW4S02NDJNY1CN2KZJZQ	iitem_01M6RPEW6014SP2219A17VG8E0	pvitem_01M6RPEW6S3VNBY1HFK3FTYEWY	1	2026-11-06 10:08:28.759856-05	2026-11-06 11:29:21.946-05	2026-11-06 11:29:21.944-05
variant_01M6RPEW4S19152HNT332ND42K	iitem_01M6RPEW604DH168JTS9T55YJN	pvitem_01M6RPEW6SMVQC0YPH8B79QG3P	1	2026-11-06 10:08:28.759856-05	2026-11-06 11:29:21.946-05	2026-11-06 11:29:21.944-05
variant_01M6RPEW4SH40BQ3P0AXDKDEJP	iitem_01M6RPEW605G72QWTA6F6MWCKV	pvitem_01M6RPEW6S4ZTMYSCZZA228RJA	1	2026-11-06 10:08:28.759856-05	2026-11-06 11:29:21.946-05	2026-11-06 11:29:21.944-05
variant_01M6RPEW4S5HEDHRJ71NWP0BF8	iitem_01M6RPEW60F4ZTF2BEJH6GSY82	pvitem_01M6RPEW6SN4XXQ7RZXKFWAR4C	1	2026-11-06 10:08:28.759856-05	2026-11-06 11:29:21.946-05	2026-11-06 11:29:21.944-05
variant_01M6RPEW4SH5GZJF7YQD4YH61S	iitem_01M6RPEW6131DNDY8TBDNZHXND	pvitem_01M6RPEW6SKGZV21T192JY4TXP	1	2026-11-06 10:08:28.759856-05	2026-11-06 11:29:21.946-05	2026-11-06 11:29:21.944-05
variant_01M6RPEW4SNYFRBEM22F4YPXXM	iitem_01M6RPEW61S782F03DHCXCDDR7	pvitem_01M6RPEW6SCTZVAWSFR1V5N7F3	1	2026-11-06 10:08:28.759856-05	2026-11-06 11:29:21.946-05	2026-11-06 11:29:21.944-05
variant_01M6RPEW4SEF8JXBN7J0N3CN2N	iitem_01M6RPEW61NFD3S34A8281569X	pvitem_01M6RPEW6TNCX4XA6MF2C7F9R7	1	2026-11-06 10:08:28.759856-05	2026-11-06 11:29:21.946-05	2026-11-06 11:29:21.944-05
variant_01M6RPEW4S1MSCHMG3B7APMFXJ	iitem_01M6RPEW613HDTVKVH8351FJKS	pvitem_01M6RPEW6TR6RE3EWNAVRRYCX7	1	2026-11-06 10:08:28.759856-05	2026-11-06 11:29:21.946-05	2026-11-06 11:29:21.944-05
variant_01M6RPEW4TQTBVVZTCEDJGN7MF	iitem_01M6RPEW619WZDZ2SP9HG5KYFR	pvitem_01M6RPEW6TATZQGCAW1H75GMG0	1	2026-11-06 10:08:28.759856-05	2026-11-06 11:29:21.946-05	2026-11-06 11:29:21.944-05
variant_01M6RPEW4T09E18AZZXNY8K1YE	iitem_01M6RPEW61NDVJMGW3HWHZY9T1	pvitem_01M6RPEW6TY980DRKQQ6V5D1KF	1	2026-11-06 10:08:28.759856-05	2026-11-06 11:29:21.946-05	2026-11-06 11:29:21.944-05
variant_01M6RPEW4T2RE7P6QG6Z9WW7KF	iitem_01M6RPEW61ZAMCG6AVBM2QKFX4	pvitem_01M6RPEW6TYNJSPPC51EM91A2Z	1	2026-11-06 10:08:28.759856-05	2026-11-06 11:29:21.946-05	2026-11-06 11:29:21.944-05
variant_01M6RPEW4TDVKNV2X6NWWVJJMY	iitem_01M6RPEW6121CDA31NRA87AA40	pvitem_01M6RPEW6TBRZ5RJ55JGBWWJH8	1	2026-11-06 10:08:28.759856-05	2026-11-06 11:29:21.946-05	2026-11-06 11:29:21.944-05
variant_01M6RPEW4T28QDSY0QV2RCF15P	iitem_01M6RPEW61A9C6XC13F7VZJDWA	pvitem_01M6RPEW6TZ0483GQN7FK2TNHD	1	2026-11-06 10:08:28.759856-05	2026-11-06 11:29:21.946-05	2026-11-06 11:29:21.944-05
variant_01M6RPEW4VGSSPBQ9HCWWZ4KK3	iitem_01M6RPEW61YHF61SSD29FM58HK	pvitem_01M6RPEW6T11XN7W1FSQS8QC9T	1	2026-11-06 10:08:28.759856-05	2026-11-06 11:29:21.946-05	2026-11-06 11:29:21.944-05
variant_01M6RPEW4VSJX7FS1SB8TRGZDE	iitem_01M6RPEW62NRXPJEWEDADA926Q	pvitem_01M6RPEW6TWK436MGJ7MD9ZRY6	1	2026-11-06 10:08:28.759856-05	2026-11-06 11:29:21.946-05	2026-11-06 11:29:21.944-05
variant_01M6RPEW4VX4J3SR8CR1D2KW0M	iitem_01M6RPEW625WT6FF2R10TW8NT3	pvitem_01M6RPEW6TEZVJVK4DDX7539K6	1	2026-11-06 10:08:28.759856-05	2026-11-06 11:29:21.946-05	2026-11-06 11:29:21.944-05
variant_01M6RPEW4V4MAJF6S4PAM5G2S8	iitem_01M6RPEW62TK7C4ERNX6T9SFA0	pvitem_01M6RPEW6V5H575V8J5CR87CGT	1	2026-11-06 10:08:28.759856-05	2026-11-06 11:29:21.946-05	2026-11-06 11:29:21.944-05
variant_01M6RPEW4VYA9WKTPKGF5E1B70	iitem_01M6RPEW62C5X092Z3CAKJJPCZ	pvitem_01M6RPEW6VN5932MTZ567GG364	1	2026-11-06 10:08:28.759856-05	2026-11-06 11:29:21.946-05	2026-11-06 11:29:21.944-05
variant_01M6RPEW4VESD7JMA603EJY2ZJ	iitem_01M6RPEW62Q3Y6BNEZDKHBBN9A	pvitem_01M6RPEW6V84RQ3FF77VW0D8B6	1	2026-11-06 10:08:28.759856-05	2026-11-06 11:29:21.946-05	2026-11-06 11:29:21.944-05
variant_01M6RPEW4V6SBSHSR8ZJ8AT4SJ	iitem_01M6RPEW62PSAQ2WMC8T3F48PH	pvitem_01M6RPEW6VM9EW16PWBA5W4TNE	1	2026-11-06 10:08:28.759856-05	2026-11-06 11:29:21.946-05	2026-11-06 11:29:21.944-05
variant_01M6RPEW4VQ7HAZ1WN5JF3ZEBC	iitem_01M6RPEW62ZSRBXA2T55XNY11J	pvitem_01M6RPEW6V853BXKKMW5N3402T	1	2026-11-06 10:08:28.759856-05	2026-11-06 11:29:21.946-05	2026-11-06 11:29:21.944-05
variant_01M6RV438SA66M12ECRFBARBHA	iitem_01M6RV439XM629J2W67DTV929B	pvitem_01M6RV43ASY0TZT54BMXHJ4GRX	1	2026-11-06 11:29:58.49096-05	2026-11-06 11:29:58.49096-05	\N
variant_01M6RV438SWKFM9SKAC7GZGNXB	iitem_01M6RV439XQNKF4MA8TRFYT6K5	pvitem_01M6RV43ATAMFWYEC2RAB55AY1	1	2026-11-06 11:29:58.49096-05	2026-11-06 11:29:58.49096-05	\N
variant_01M6RV438SQB06J75G9HZCXJ4P	iitem_01M6RV439XS3J0XKTKYX8J1M2K	pvitem_01M6RV43ATF3KFWFNR6J7ZJWQS	1	2026-11-06 11:29:58.49096-05	2026-11-06 11:29:58.49096-05	\N
variant_01M6RV438T1HCR4DFG9GGM64N9	iitem_01M6RV439XF008GP00GQKT2N7E	pvitem_01M6RV43ATA10EH5E2AMHMC1W0	1	2026-11-06 11:29:58.49096-05	2026-11-06 11:29:58.49096-05	\N
variant_01M6RV438T3T62AHS19DZS6F01	iitem_01M6RV439YGVAPYPMN55HEZM62	pvitem_01M6RV43AT0TR6ETQVPMF6G8SQ	1	2026-11-06 11:29:58.49096-05	2026-11-06 11:29:58.49096-05	\N
variant_01M6RV438TCF06HPPW4FGHV0D3	iitem_01M6RV439YNGWKCF1ERHXG23SH	pvitem_01M6RV43AV6RWJHA06P8DX6G7A	1	2026-11-06 11:29:58.49096-05	2026-11-06 11:29:58.49096-05	\N
variant_01M6RV438T853C3FF9N4XHJ8HS	iitem_01M6RV439Y08C5WDPJF3PYTHJP	pvitem_01M6RV43AVAXYFR1Z2W0TBRZVM	1	2026-11-06 11:29:58.49096-05	2026-11-06 11:29:58.49096-05	\N
variant_01M6RV438TCX28QC97PH70ZPXE	iitem_01M6RV439YCT9Y2KH49TH3B54A	pvitem_01M6RV43AVWJ7XGKNVVEY6RRNS	1	2026-11-06 11:29:58.49096-05	2026-11-06 11:29:58.49096-05	\N
variant_01M6RV438V2CD3BRK8BH3D816M	iitem_01M6RV439YEMQBWB1K4SQXT81R	pvitem_01M6RV43AVCYRP0AWYRY6BA77N	1	2026-11-06 11:29:58.49096-05	2026-11-06 11:29:58.49096-05	\N
variant_01M6RV438V0GPXE6GFZAZSS25P	iitem_01M6RV439YG3SWBN0KJSVA46DZ	pvitem_01M6RV43AVSBHYHTSJ2BF97EMQ	1	2026-11-06 11:29:58.49096-05	2026-11-06 11:29:58.49096-05	\N
variant_01M6RV438VRYW3STBR7FJ03VGV	iitem_01M6RV439Y1P551YKDPFYZEKTS	pvitem_01M6RV43AV8EHJZPC2B3WH104F	1	2026-11-06 11:29:58.49096-05	2026-11-06 11:29:58.49096-05	\N
variant_01M6RV438VF8QQFTSV19FYGW42	iitem_01M6RV439Z3JY3BHRK2K9J8QTZ	pvitem_01M6RV43AVCMG7VZ3HMQEQGFS6	1	2026-11-06 11:29:58.49096-05	2026-11-06 11:29:58.49096-05	\N
variant_01M6RV438VFVK9DWN42CWQKXJ1	iitem_01M6RV439ZPB7WNZ0ERAEPDDYP	pvitem_01M6RV43AVV85VFQ925258FVAV	1	2026-11-06 11:29:58.49096-05	2026-11-06 11:29:58.49096-05	\N
variant_01M6RV438VZSHK9WWJRH71R4EW	iitem_01M6RV439Z7D8XX7RY0H61P7WF	pvitem_01M6RV43AVEPN6XG733PSV9T11	1	2026-11-06 11:29:58.49096-05	2026-11-06 11:29:58.49096-05	\N
variant_01M6RV438VCX78CJCYAXK9QNMW	iitem_01M6RV439Z4YGKFSMP7SX8ZTNE	pvitem_01M6RV43AWZ3M27WJAXDNQRW5G	1	2026-11-06 11:29:58.49096-05	2026-11-06 11:29:58.49096-05	\N
variant_01M6RV438WPAQCDPY1ND3PX146	iitem_01M6RV439Z6EQFMAC1RSRB0ME7	pvitem_01M6RV43AW1K9CTKR99GSGGT5S	1	2026-11-06 11:29:58.49096-05	2026-11-06 11:29:58.49096-05	\N
variant_01M6RV438WYJ8BRACD7ME89E3K	iitem_01M6RV439ZMBXK2EPJXA344XK6	pvitem_01M6RV43AWBKX1SXAZR0JP3VFB	1	2026-11-06 11:29:58.49096-05	2026-11-06 11:29:58.49096-05	\N
variant_01M6RV438WXQ27KDR4P5VX2YQA	iitem_01M6RV439ZQAJ5D2S4DQ73KF93	pvitem_01M6RV43AWA9W61AV32RFRKAYC	1	2026-11-06 11:29:58.49096-05	2026-11-06 11:29:58.49096-05	\N
variant_01M6RV438WT0872HSQH1DTX8HQ	iitem_01M6RV439Z5R5SWHXEYS5D2124	pvitem_01M6RV43AW4Y13YVB4C1EVQ6RP	1	2026-11-06 11:29:58.49096-05	2026-11-06 11:29:58.49096-05	\N
variant_01M6RV438WE21JDZT9851MDQMC	iitem_01M6RV439ZCMKFZJKKEF1SCPY4	pvitem_01M6RV43AW0D0HKA1YEFRVS4T3	1	2026-11-06 11:29:58.49096-05	2026-11-06 11:29:58.49096-05	\N
variant_01M6RV438XZGSWSRWXA7SPFGG4	iitem_01M6RV439ZXB9KBYPPFK9JPZJM	pvitem_01M6RV43AW25QYTVC7SRGWDWF8	1	2026-11-06 11:29:58.49096-05	2026-11-06 11:29:58.49096-05	\N
variant_01M6RV438XW54Z055JVRTVFVCS	iitem_01M6RV43A0CE1XXG7J1KP5S7ZV	pvitem_01M6RV43AWA9FR3AARSKCGCNVW	1	2026-11-06 11:29:58.49096-05	2026-11-06 11:29:58.49096-05	\N
variant_01M6RV438XZJD85SZANXMEPSVN	iitem_01M6RV43A0TGDSD2M9QB5C82ZR	pvitem_01M6RV43AW85DD481W2YYDKKK5	1	2026-11-06 11:29:58.49096-05	2026-11-06 11:29:58.49096-05	\N
variant_01M6RV438XX7RR7Y93RG8WEBB3	iitem_01M6RV43A059BZ9RFGVBX7FK7G	pvitem_01M6RV43AWPDYPF29GPT99GG3D	1	2026-11-06 11:29:58.49096-05	2026-11-06 11:29:58.49096-05	\N
variant_01M6RV438XYE826Q1BTQA318RF	iitem_01M6RV43A0YRMED8HC4RE4GHPR	pvitem_01M6RV43AXQE36JE60NPVHTZA2	1	2026-11-06 11:29:58.49096-05	2026-11-06 11:29:58.49096-05	\N
variant_01M6RV438XJMSCVT1QKRT9G30B	iitem_01M6RV43A00DSBMSYN3J485BG7	pvitem_01M6RV43AXYKTR7RME23S4T668	1	2026-11-06 11:29:58.49096-05	2026-11-06 11:29:58.49096-05	\N
variant_01M6RV438X7TVFCK97VN8EN9YB	iitem_01M6RV43A0HQ97JSMCFFCBBZJ0	pvitem_01M6RV43AXKNGAB7Z4QVXRAFPB	1	2026-11-06 11:29:58.49096-05	2026-11-06 11:29:58.49096-05	\N
variant_01M6RV438YXBQZBEVYYYYAWJRK	iitem_01M6RV43A0Q16DHWHNV44Y16JJ	pvitem_01M6RV43AX6TC8754FY8KRS01N	1	2026-11-06 11:29:58.49096-05	2026-11-06 11:29:58.49096-05	\N
variant_01M6RV438Y2JEAYKQRK744DG9Z	iitem_01M6RV43A0FXDQKHYZM5P1FZDX	pvitem_01M6RV43AX5C1VF7APKNSG9E99	1	2026-11-06 11:29:58.49096-05	2026-11-06 11:29:58.49096-05	\N
variant_01M6RV438YGVS38R3HZ17X7Y7Y	iitem_01M6RV43A1B5HDFHRSPD8HKP85	pvitem_01M6RV43AXE5DHWXSB124XESHJ	1	2026-11-06 11:29:58.49096-05	2026-11-06 11:29:58.49096-05	\N
variant_01M6RV438YD4WDJVCMWY7K6E0F	iitem_01M6RV43A1EQTDJ4WVDMY1JP5G	pvitem_01M6RV43AXS0PYDWA0KXW0VEKE	1	2026-11-06 11:29:58.49096-05	2026-11-06 11:29:58.49096-05	\N
variant_01M6RV438Y28J96X2CMGMW4TNX	iitem_01M6RV43A1C5EEXGYE9G7SH84A	pvitem_01M6RV43AX74EC7B8PKXF97NBC	1	2026-11-06 11:29:58.49096-05	2026-11-06 11:29:58.49096-05	\N
variant_01M6VRP8806KMGC80QGV9EREHN	iitem_01M6VRP89F6NG3CWJYRSFQ6K45	pvitem_01M6VRP8A9S51QGPX6HCK8G298	1	2026-11-07 14:45:10.985835-05	2026-11-07 14:45:10.985835-05	\N
variant_01M6VRP880Y4KY9B7BPGWRQ2BX	iitem_01M6VRP89FA5756PX1E58M8S1G	pvitem_01M6VRP8AAHG3E6WWT83Y1Q1V8	1	2026-11-07 14:45:10.985835-05	2026-11-07 14:45:10.985835-05	\N
\.


--
-- Data for Name: product_variant_option; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_variant_option (variant_id, option_value_id) FROM stdin;
variant_01M6Q03EXWMVBBE73BJT5D7GY8	optval_01M6Q03ESYYRY86ESF5FDQC69B
variant_01M6Q03EXWMVBBE73BJT5D7GY8	optval_01M6Q03ESYECXRZN80MWGCEP99
variant_01M6Q03EXXMBYP27A71VN2TDCD	optval_01M6Q03ESYYRY86ESF5FDQC69B
variant_01M6Q03EXXMBYP27A71VN2TDCD	optval_01M6Q03ESYS0RT4J6J5AKEQE0C
variant_01M6Q03EXXWZ6EPAE1EJPG30TK	optval_01M6Q03ESYJZS92ERHB1F72ZN8
variant_01M6Q03EXXWZ6EPAE1EJPG30TK	optval_01M6Q03ESYECXRZN80MWGCEP99
variant_01M6Q03EXX8XG5AG02RGCGKQFH	optval_01M6Q03ESYJZS92ERHB1F72ZN8
variant_01M6Q03EXX8XG5AG02RGCGKQFH	optval_01M6Q03ESYS0RT4J6J5AKEQE0C
variant_01M6Q03EXXT7SVEDAYKJ8K060X	optval_01M6Q03ESYSXJBMANY51PRJTW7
variant_01M6Q03EXXT7SVEDAYKJ8K060X	optval_01M6Q03ESYECXRZN80MWGCEP99
variant_01M6Q03EXXTNBT3PYNJQG12WQS	optval_01M6Q03ESYSXJBMANY51PRJTW7
variant_01M6Q03EXXTNBT3PYNJQG12WQS	optval_01M6Q03ESYS0RT4J6J5AKEQE0C
variant_01M6Q03EXX42SGF4TVKHJEYD6Q	optval_01M6Q03ESYRBCF4Q5KNE74ZYV4
variant_01M6Q03EXX42SGF4TVKHJEYD6Q	optval_01M6Q03ESYECXRZN80MWGCEP99
variant_01M6Q03EXYMCP52GGG527GA3V7	optval_01M6Q03ESYRBCF4Q5KNE74ZYV4
variant_01M6Q03EXYMCP52GGG527GA3V7	optval_01M6Q03ESYS0RT4J6J5AKEQE0C
variant_01M6Q03EXYJ8MZX5AME8KC1YV9	optval_01M6Q03ESYYRY86ESF5FDQC69B
variant_01M6Q03EXY6PVNT7HNF37ZWSRC	optval_01M6Q03ESYJZS92ERHB1F72ZN8
variant_01M6Q03EXY71J1Y9R52YX04H17	optval_01M6Q03ESYSXJBMANY51PRJTW7
variant_01M6Q03EXYCP33XNMGKKAPDN4Q	optval_01M6Q03ESYRBCF4Q5KNE74ZYV4
variant_01M6Q03EXYZXWH0KQMB7GHMJ14	optval_01M6Q03ESYYRY86ESF5FDQC69B
variant_01M6Q03EXZD2YM327TCH4NN48N	optval_01M6Q03ESYJZS92ERHB1F72ZN8
variant_01M6Q03EXZQ35KT90E2XTXJN16	optval_01M6Q03ESYSXJBMANY51PRJTW7
variant_01M6Q03EXZCJJ9S3X2TK6XCM8G	optval_01M6Q03ESYRBCF4Q5KNE74ZYV4
variant_01M6Q03EXZ3036EAWD65VZ5NPN	optval_01M6Q03ESYYRY86ESF5FDQC69B
variant_01M6Q03EXZB50XTYV0CBR399ZA	optval_01M6Q03ESYJZS92ERHB1F72ZN8
variant_01M6Q03EXZ8K79535S657RBZJH	optval_01M6Q03ESYSXJBMANY51PRJTW7
variant_01M6Q03EXZ5JPGSQG3E61T3Q3N	optval_01M6Q03ESYRBCF4Q5KNE74ZYV4
variant_01M6Q0TVSVPGKZQQ5BC03VACKA	optval_01M6Q0TVJH3VBTJQCPN4HBVAWX
variant_01M6Q0TVSVE6RBW8JG0DQYZQZB	optval_01M6Q0TVJH3VBTJQCPN4HBVAWX
variant_01M6Q0TVSVN4FP6C3XPNRB6G19	optval_01M6Q0TVJH3VBTJQCPN4HBVAWX
variant_01M6Q0TVSWQN4M90303YT5F4E3	optval_01M6Q0TVJH3VBTJQCPN4HBVAWX
variant_01M6Q0TVSWDP2C14ARWDV7RS82	optval_01M6Q0TVJH3VBTJQCPN4HBVAWX
variant_01M6Q0TVSWTKCQRTQ85B9FN3FJ	optval_01M6Q0TVJH3VBTJQCPN4HBVAWX
variant_01M6Q0TVSWQTE12VDJBKYMKSFE	optval_01M6Q0TVJH3VBTJQCPN4HBVAWX
variant_01M6Q0TVSWGVFP9Y8T73777M4H	optval_01M6Q0TVJH3VBTJQCPN4HBVAWX
variant_01M6RPEW4QV0T09N9QSKV6A4D7	optval_01M6RPEVW33Q58ZGSK94N0GV9K
variant_01M6RPEW4QTZNY278QRX15CDFF	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ
variant_01M6RPEW4QMK28407427CPP97G	optval_01M6RPEVW33Q58ZGSK94N0GV9K
variant_01M6RPEW4QHGKD6HNZKRKYDHYJ	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ
variant_01M6RPEW4Q2RBE9C1CQ586Y6G0	optval_01M6RPEVW33Q58ZGSK94N0GV9K
variant_01M6RPEW4Q58K7JEN29VJPR78Z	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ
variant_01M6RPEW4R21S9RX1KNZN05FFF	optval_01M6RPEVW33Q58ZGSK94N0GV9K
variant_01M6RPEW4RK5WYSCZ0ZC5E32G5	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ
variant_01M6RPEW4RFMEJ2B9NWEX28N6Y	optval_01M6RPEVW33Q58ZGSK94N0GV9K
variant_01M6RPEW4RH1KN5T23FT4DFMPV	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ
variant_01M6RPEW4R387TVJ1A59987EBJ	optval_01M6RPEVW33Q58ZGSK94N0GV9K
variant_01M6RPEW4S02NDJNY1CN2KZJZQ	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ
variant_01M6RPEW4S19152HNT332ND42K	optval_01M6RPEVW33Q58ZGSK94N0GV9K
variant_01M6RPEW4SH40BQ3P0AXDKDEJP	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ
variant_01M6RPEW4S5HEDHRJ71NWP0BF8	optval_01M6RPEVW33Q58ZGSK94N0GV9K
variant_01M6RPEW4SH5GZJF7YQD4YH61S	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ
variant_01M6RPEW4SNYFRBEM22F4YPXXM	optval_01M6RPEVW33Q58ZGSK94N0GV9K
variant_01M6RPEW4SEF8JXBN7J0N3CN2N	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ
variant_01M6RPEW4S1MSCHMG3B7APMFXJ	optval_01M6RPEVW33Q58ZGSK94N0GV9K
variant_01M6RPEW4TQTBVVZTCEDJGN7MF	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ
variant_01M6RPEW4T09E18AZZXNY8K1YE	optval_01M6RPEVW33Q58ZGSK94N0GV9K
variant_01M6RPEW4T2RE7P6QG6Z9WW7KF	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ
variant_01M6RPEW4TDVKNV2X6NWWVJJMY	optval_01M6RPEVW33Q58ZGSK94N0GV9K
variant_01M6RPEW4T28QDSY0QV2RCF15P	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ
variant_01M6RPEW4VGSSPBQ9HCWWZ4KK3	optval_01M6RPEVW33Q58ZGSK94N0GV9K
variant_01M6RPEW4VSJX7FS1SB8TRGZDE	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ
variant_01M6RPEW4VX4J3SR8CR1D2KW0M	optval_01M6RPEVW33Q58ZGSK94N0GV9K
variant_01M6RPEW4V4MAJF6S4PAM5G2S8	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ
variant_01M6RPEW4VYA9WKTPKGF5E1B70	optval_01M6RPEVW33Q58ZGSK94N0GV9K
variant_01M6RPEW4VESD7JMA603EJY2ZJ	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ
variant_01M6RPEW4V6SBSHSR8ZJ8AT4SJ	optval_01M6RPEVW33Q58ZGSK94N0GV9K
variant_01M6RPEW4VQ7HAZ1WN5JF3ZEBC	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ
variant_01M6RV438SA66M12ECRFBARBHA	optval_01M6RPEVW33Q58ZGSK94N0GV9K
variant_01M6RV438SWKFM9SKAC7GZGNXB	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ
variant_01M6RV438SQB06J75G9HZCXJ4P	optval_01M6RPEVW33Q58ZGSK94N0GV9K
variant_01M6RV438T1HCR4DFG9GGM64N9	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ
variant_01M6RV438T3T62AHS19DZS6F01	optval_01M6RPEVW33Q58ZGSK94N0GV9K
variant_01M6RV438TCF06HPPW4FGHV0D3	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ
variant_01M6RV438T853C3FF9N4XHJ8HS	optval_01M6RPEVW33Q58ZGSK94N0GV9K
variant_01M6RV438TCX28QC97PH70ZPXE	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ
variant_01M6RV438V2CD3BRK8BH3D816M	optval_01M6RPEVW33Q58ZGSK94N0GV9K
variant_01M6RV438V0GPXE6GFZAZSS25P	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ
variant_01M6RV438VRYW3STBR7FJ03VGV	optval_01M6RPEVW33Q58ZGSK94N0GV9K
variant_01M6RV438VF8QQFTSV19FYGW42	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ
variant_01M6RV438VFVK9DWN42CWQKXJ1	optval_01M6RPEVW33Q58ZGSK94N0GV9K
variant_01M6RV438VZSHK9WWJRH71R4EW	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ
variant_01M6RV438VCX78CJCYAXK9QNMW	optval_01M6RPEVW33Q58ZGSK94N0GV9K
variant_01M6RV438WPAQCDPY1ND3PX146	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ
variant_01M6RV438WYJ8BRACD7ME89E3K	optval_01M6RPEVW33Q58ZGSK94N0GV9K
variant_01M6RV438WXQ27KDR4P5VX2YQA	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ
variant_01M6RV438WT0872HSQH1DTX8HQ	optval_01M6RPEVW33Q58ZGSK94N0GV9K
variant_01M6RV438WE21JDZT9851MDQMC	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ
variant_01M6RV438XZGSWSRWXA7SPFGG4	optval_01M6RPEVW33Q58ZGSK94N0GV9K
variant_01M6RV438XW54Z055JVRTVFVCS	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ
variant_01M6RV438XZJD85SZANXMEPSVN	optval_01M6RPEVW33Q58ZGSK94N0GV9K
variant_01M6RV438XX7RR7Y93RG8WEBB3	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ
variant_01M6RV438XYE826Q1BTQA318RF	optval_01M6RPEVW33Q58ZGSK94N0GV9K
variant_01M6RV438XJMSCVT1QKRT9G30B	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ
variant_01M6RV438X7TVFCK97VN8EN9YB	optval_01M6RPEVW33Q58ZGSK94N0GV9K
variant_01M6RV438YXBQZBEVYYYYAWJRK	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ
variant_01M6RV438Y2JEAYKQRK744DG9Z	optval_01M6RPEVW33Q58ZGSK94N0GV9K
variant_01M6RV438YGVS38R3HZ17X7Y7Y	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ
variant_01M6RV438YD4WDJVCMWY7K6E0F	optval_01M6RPEVW33Q58ZGSK94N0GV9K
variant_01M6RV438Y28J96X2CMGMW4TNX	optval_01M6RPEVW3T5RXC7JHF3SA8GHQ
variant_01M6VRP8806KMGC80QGV9EREHN	optval_01M6VRP8379EAY8W649GRSRZX4
variant_01M6VRP880Y4KY9B7BPGWRQ2BX	optval_01M6VRP837KP2TCHKSSS5FNDCQ
\.


--
-- Data for Name: product_variant_price_set; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_variant_price_set (variant_id, price_set_id, id, created_at, updated_at, deleted_at) FROM stdin;
variant_01M6Q03EXWMVBBE73BJT5D7GY8	pset_01M6Q03F0306PBNZ0NW0ETZEJ3	pvps_01M6Q03F19NA9E0Q2QT3DEZV8A	2026-11-05 18:18:31.722183-05	2026-11-06 10:08:27.952-05	2026-11-06 10:08:27.951-05
variant_01M6Q03EXXMBYP27A71VN2TDCD	pset_01M6Q03F04S0YQ8H7GRKC8M7AB	pvps_01M6Q03F1AGMKFV2M805J92HG0	2026-11-05 18:18:31.722183-05	2026-11-06 10:08:27.952-05	2026-11-06 10:08:27.951-05
variant_01M6Q03EXXWZ6EPAE1EJPG30TK	pset_01M6Q03F042F9A0PJSN1AAP0BY	pvps_01M6Q03F1A5BZNJKG8QWZR3C5R	2026-11-05 18:18:31.722183-05	2026-11-06 10:08:27.952-05	2026-11-06 10:08:27.951-05
variant_01M6Q03EXX8XG5AG02RGCGKQFH	pset_01M6Q03F04WC99XK9NFXHYQ89Z	pvps_01M6Q03F1AT4A0RZFDA324W71H	2026-11-05 18:18:31.722183-05	2026-11-06 10:08:27.952-05	2026-11-06 10:08:27.951-05
variant_01M6Q03EXXT7SVEDAYKJ8K060X	pset_01M6Q03F0401T5Z9N3Z0682MW3	pvps_01M6Q03F1AWAAGT553PGRCW3Y8	2026-11-05 18:18:31.722183-05	2026-11-06 10:08:27.952-05	2026-11-06 10:08:27.951-05
variant_01M6Q03EXXTNBT3PYNJQG12WQS	pset_01M6Q03F05G3D779T5CNBRT7CV	pvps_01M6Q03F1A43BX6G8BZ2VTATVZ	2026-11-05 18:18:31.722183-05	2026-11-06 10:08:27.952-05	2026-11-06 10:08:27.951-05
variant_01M6Q03EXX42SGF4TVKHJEYD6Q	pset_01M6Q03F0513VYMGF9BDCN19S6	pvps_01M6Q03F1A9ADVJ6BM47PN7RJH	2026-11-05 18:18:31.722183-05	2026-11-06 10:08:27.952-05	2026-11-06 10:08:27.951-05
variant_01M6Q03EXYMCP52GGG527GA3V7	pset_01M6Q03F0565WR743WX9HHYV6Q	pvps_01M6Q03F1AFRQBPSAFJ3A8TWX4	2026-11-05 18:18:31.722183-05	2026-11-06 10:08:27.952-05	2026-11-06 10:08:27.951-05
variant_01M6Q03EXYJ8MZX5AME8KC1YV9	pset_01M6Q03F0587K7D5PFB8XRMJA9	pvps_01M6Q03F1AZ34RQ4YMPFKC1YSZ	2026-11-05 18:18:31.722183-05	2026-11-06 10:08:27.952-05	2026-11-06 10:08:27.951-05
variant_01M6Q03EXY6PVNT7HNF37ZWSRC	pset_01M6Q03F06A9C3XQ58B7S012W3	pvps_01M6Q03F1AV04YHFCEF8H3ZWA2	2026-11-05 18:18:31.722183-05	2026-11-06 10:08:27.952-05	2026-11-06 10:08:27.951-05
variant_01M6Q03EXY71J1Y9R52YX04H17	pset_01M6Q03F06F4THMQRFYRKMKBV3	pvps_01M6Q03F1B995DTJ2H772GRAFP	2026-11-05 18:18:31.722183-05	2026-11-06 10:08:27.952-05	2026-11-06 10:08:27.951-05
variant_01M6Q03EXYCP33XNMGKKAPDN4Q	pset_01M6Q03F0667N5YPEMTXR39252	pvps_01M6Q03F1BY56SGERY38REKY7V	2026-11-05 18:18:31.722183-05	2026-11-06 10:08:27.952-05	2026-11-06 10:08:27.951-05
variant_01M6Q03EXYZXWH0KQMB7GHMJ14	pset_01M6Q03F06AM34S6BXFDJXX293	pvps_01M6Q03F1BAJ6X29HAN1BHHTH1	2026-11-05 18:18:31.722183-05	2026-11-06 10:08:27.952-05	2026-11-06 10:08:27.951-05
variant_01M6Q03EXZD2YM327TCH4NN48N	pset_01M6Q03F07KRP1HBHTHRTWM7JQ	pvps_01M6Q03F1BDVZYBGDFY997FCXJ	2026-11-05 18:18:31.722183-05	2026-11-06 10:08:27.953-05	2026-11-06 10:08:27.951-05
variant_01M6Q03EXZQ35KT90E2XTXJN16	pset_01M6Q03F07S3D1Q0BRSVNBZYC9	pvps_01M6Q03F1BPMNKNN996NM9GHNN	2026-11-05 18:18:31.722183-05	2026-11-06 10:08:27.953-05	2026-11-06 10:08:27.951-05
variant_01M6Q03EXZCJJ9S3X2TK6XCM8G	pset_01M6Q03F07KMA01J73CT98AAR3	pvps_01M6Q03F1B65TK3QJHWMFJY2PA	2026-11-05 18:18:31.722183-05	2026-11-06 10:08:27.952-05	2026-11-06 10:08:27.951-05
variant_01M6Q03EXZ3036EAWD65VZ5NPN	pset_01M6Q03F07HV48YM7W7BGVY3AF	pvps_01M6Q03F1B6ZM2TE83ZBR949XH	2026-11-05 18:18:31.722183-05	2026-11-06 10:08:27.952-05	2026-11-06 10:08:27.951-05
variant_01M6Q03EXZB50XTYV0CBR399ZA	pset_01M6Q03F086FGP4BP02FE8RJM0	pvps_01M6Q03F1BSCC24J9CVF7H5V9D	2026-11-05 18:18:31.722183-05	2026-11-06 10:08:27.953-05	2026-11-06 10:08:27.951-05
variant_01M6Q03EXZ8K79535S657RBZJH	pset_01M6Q03F08SY9GTZJZ9ME5KYP6	pvps_01M6Q03F1BZARAKDFSAD90ERRN	2026-11-05 18:18:31.722183-05	2026-11-06 10:08:27.953-05	2026-11-06 10:08:27.951-05
variant_01M6Q03EXZ5JPGSQG3E61T3Q3N	pset_01M6Q03F089MRPX0PTRZ75RFK6	pvps_01M6Q03F1BQT6DHRQ2NCHZBD9E	2026-11-05 18:18:31.722183-05	2026-11-06 10:08:27.953-05	2026-11-06 10:08:27.951-05
variant_01M6Q0TVSVPGKZQQ5BC03VACKA	pset_01M6Q0TVV5XYWPHH4NHFBX5ZZ3	pvps_01M6Q0TVWAXXBQ79R28NXMV8XQ	2026-11-05 18:31:18.548502-05	2026-11-06 10:08:27.953-05	2026-11-06 10:08:27.951-05
variant_01M6Q0TVSVE6RBW8JG0DQYZQZB	pset_01M6Q0TVV58HD9NT3Y45HA77B1	pvps_01M6Q0TVWAFHAFZB0KBZ9MZPZY	2026-11-05 18:31:18.548502-05	2026-11-06 10:08:27.953-05	2026-11-06 10:08:27.951-05
variant_01M6Q0TVSVN4FP6C3XPNRB6G19	pset_01M6Q0TVV6QRPHPJCAHWKZ3V7Y	pvps_01M6Q0TVWBPRA2KHK5DSHS7PKW	2026-11-05 18:31:18.548502-05	2026-11-06 10:08:27.953-05	2026-11-06 10:08:27.951-05
variant_01M6Q0TVSWQN4M90303YT5F4E3	pset_01M6Q0TVV683B3JC3MENSWY3RK	pvps_01M6Q0TVWBX59VCMPS58ZEG0VR	2026-11-05 18:31:18.548502-05	2026-11-06 10:08:27.953-05	2026-11-06 10:08:27.951-05
variant_01M6Q0TVSWDP2C14ARWDV7RS82	pset_01M6Q0TVV7N8TXSB5QM5JB6717	pvps_01M6Q0TVWBK78F3VDZKDHMKBY0	2026-11-05 18:31:18.548502-05	2026-11-06 10:08:27.953-05	2026-11-06 10:08:27.951-05
variant_01M6Q0TVSWTKCQRTQ85B9FN3FJ	pset_01M6Q0TVV7HGCAV54BPGXJB6WB	pvps_01M6Q0TVWBCPB26ZQ0A46K9PAA	2026-11-05 18:31:18.548502-05	2026-11-06 10:08:27.953-05	2026-11-06 10:08:27.951-05
variant_01M6Q0TVSWQTE12VDJBKYMKSFE	pset_01M6Q0TVV7E0HQ6EEXFZ356V6W	pvps_01M6Q0TVWB3B86NQ7EC3WRFQXZ	2026-11-05 18:31:18.548502-05	2026-11-06 10:08:27.953-05	2026-11-06 10:08:27.951-05
variant_01M6Q0TVSWGVFP9Y8T73777M4H	pset_01M6Q0TVV8WN4MJ4YG6WS5KNMS	pvps_01M6Q0TVWBDQ1NKR6GJR65VTJT	2026-11-05 18:31:18.548502-05	2026-11-06 10:08:27.953-05	2026-11-06 10:08:27.951-05
variant_01M6RPEW4QV0T09N9QSKV6A4D7	pset_01M6RPEW7DEC83CMTND4XZQKXW	pvps_01M6RPEW8XWP1RFXP9YTB08EJ1	2026-11-06 10:08:28.829607-05	2026-11-06 11:29:21.976-05	2026-11-06 11:29:21.975-05
variant_01M6RPEW4QTZNY278QRX15CDFF	pset_01M6RPEW7D47TXZAMEVTBYXZPA	pvps_01M6RPEW8XAGY8GD9J1JMTKM7H	2026-11-06 10:08:28.829607-05	2026-11-06 11:29:21.976-05	2026-11-06 11:29:21.975-05
variant_01M6RPEW4QMK28407427CPP97G	pset_01M6RPEW7EAFZWF1VAMVRW47W6	pvps_01M6RPEW8YNY795STMHFF5A3H1	2026-11-06 10:08:28.829607-05	2026-11-06 11:29:21.976-05	2026-11-06 11:29:21.975-05
variant_01M6RPEW4QHGKD6HNZKRKYDHYJ	pset_01M6RPEW7E6ZTRDDN10V1FVKRQ	pvps_01M6RPEW8YKQ6W8WFMV2NRRF3D	2026-11-06 10:08:28.829607-05	2026-11-06 11:29:21.976-05	2026-11-06 11:29:21.975-05
variant_01M6RPEW4Q2RBE9C1CQ586Y6G0	pset_01M6RPEW7EDJG4K8M0PS75CJTQ	pvps_01M6RPEW8Y5EZ1NBAR20SZ9QKQ	2026-11-06 10:08:28.829607-05	2026-11-06 11:29:21.976-05	2026-11-06 11:29:21.975-05
variant_01M6RPEW4Q58K7JEN29VJPR78Z	pset_01M6RPEW7FXT9MJ7J5FK2E3GJF	pvps_01M6RPEW8Y60D7AJTF7EX4NQ8B	2026-11-06 10:08:28.829607-05	2026-11-06 11:29:21.976-05	2026-11-06 11:29:21.975-05
variant_01M6RPEW4R21S9RX1KNZN05FFF	pset_01M6RPEW7F86ZPH5R87CQDVBHS	pvps_01M6RPEW8YY56RHAQPEJ34XKZ7	2026-11-06 10:08:28.829607-05	2026-11-06 11:29:21.976-05	2026-11-06 11:29:21.975-05
variant_01M6RPEW4RK5WYSCZ0ZC5E32G5	pset_01M6RPEW7FXBN3HQ63NWXEBJZ4	pvps_01M6RPEW8YDM8DA057P9QG81N8	2026-11-06 10:08:28.829607-05	2026-11-06 11:29:21.976-05	2026-11-06 11:29:21.975-05
variant_01M6RPEW4RFMEJ2B9NWEX28N6Y	pset_01M6RPEW7FKDN0XSV8AY50GDJB	pvps_01M6RPEW8Y1DJGVZ6SVEF9GR94	2026-11-06 10:08:28.829607-05	2026-11-06 11:29:21.976-05	2026-11-06 11:29:21.975-05
variant_01M6RPEW4RH1KN5T23FT4DFMPV	pset_01M6RPEW7G7CWW1SAMSE3KWZQA	pvps_01M6RPEW8YYMB9EHZ5TXPG8H29	2026-11-06 10:08:28.829607-05	2026-11-06 11:29:21.976-05	2026-11-06 11:29:21.975-05
variant_01M6RPEW4R387TVJ1A59987EBJ	pset_01M6RPEW7GKHP3250FGF62D8FN	pvps_01M6RPEW8YYBHYKYV5AG01JH5Q	2026-11-06 10:08:28.829607-05	2026-11-06 11:29:21.976-05	2026-11-06 11:29:21.975-05
variant_01M6RPEW4S02NDJNY1CN2KZJZQ	pset_01M6RPEW7G1VP13TF6Z7VH5SS4	pvps_01M6RPEW8YV2TZJAKJ9M5TC1ED	2026-11-06 10:08:28.829607-05	2026-11-06 11:29:21.976-05	2026-11-06 11:29:21.975-05
variant_01M6RPEW4S19152HNT332ND42K	pset_01M6RPEW7GMP355K5KWB8Q7ND3	pvps_01M6RPEW8Z32ETCZ5JABWB135N	2026-11-06 10:08:28.829607-05	2026-11-06 11:29:21.976-05	2026-11-06 11:29:21.975-05
variant_01M6RPEW4SH40BQ3P0AXDKDEJP	pset_01M6RPEW7HJN3ES6BX12P34EX6	pvps_01M6RPEW8ZWA882RGBV0KR6DQ6	2026-11-06 10:08:28.829607-05	2026-11-06 11:29:21.976-05	2026-11-06 11:29:21.975-05
variant_01M6RPEW4S5HEDHRJ71NWP0BF8	pset_01M6RPEW7HBJDGMHFK1E8WX4G0	pvps_01M6RPEW8Z9233WVDVVXZTNV23	2026-11-06 10:08:28.829607-05	2026-11-06 11:29:21.976-05	2026-11-06 11:29:21.975-05
variant_01M6RPEW4SH5GZJF7YQD4YH61S	pset_01M6RPEW7HC7Y8ENR2J82SFTMC	pvps_01M6RPEW8Z43JS7DGBRMFZKP47	2026-11-06 10:08:28.829607-05	2026-11-06 11:29:21.976-05	2026-11-06 11:29:21.975-05
variant_01M6RPEW4SNYFRBEM22F4YPXXM	pset_01M6RPEW7H8D19YCY7ABKAYN3B	pvps_01M6RPEW8Z4JG18W4V1CZ1ZTRQ	2026-11-06 10:08:28.829607-05	2026-11-06 11:29:21.976-05	2026-11-06 11:29:21.975-05
variant_01M6RPEW4SEF8JXBN7J0N3CN2N	pset_01M6RPEW7JPGHJC39KKQBZK5FG	pvps_01M6RPEW8Z417NB8XEVNX4DYA8	2026-11-06 10:08:28.829607-05	2026-11-06 11:29:21.976-05	2026-11-06 11:29:21.975-05
variant_01M6RPEW4S1MSCHMG3B7APMFXJ	pset_01M6RPEW7J5AADXYDDQAX6Z1ES	pvps_01M6RPEW8ZR824EJ2DD879Q164	2026-11-06 10:08:28.829607-05	2026-11-06 11:29:21.976-05	2026-11-06 11:29:21.975-05
variant_01M6RPEW4TQTBVVZTCEDJGN7MF	pset_01M6RPEW7JZ04GQT4DMSHJE1C2	pvps_01M6RPEW8Z0DH0ZXMX6HY9C8ST	2026-11-06 10:08:28.829607-05	2026-11-06 11:29:21.976-05	2026-11-06 11:29:21.975-05
variant_01M6RPEW4T09E18AZZXNY8K1YE	pset_01M6RPEW7JRFJ4C73R9FF8CBEM	pvps_01M6RPEW8ZV8TD8JPPZRFHGJ7F	2026-11-06 10:08:28.829607-05	2026-11-06 11:29:21.976-05	2026-11-06 11:29:21.975-05
variant_01M6RPEW4T2RE7P6QG6Z9WW7KF	pset_01M6RPEW7KMQMQ2EF5930F9FR3	pvps_01M6RPEW8Z40E0Y79DFV54ZGQ1	2026-11-06 10:08:28.829607-05	2026-11-06 11:29:21.976-05	2026-11-06 11:29:21.975-05
variant_01M6RPEW4TDVKNV2X6NWWVJJMY	pset_01M6RPEW7KNJC7WXAQSXJW9F84	pvps_01M6RPEW8ZT0W76VV8GNHJMV0R	2026-11-06 10:08:28.829607-05	2026-11-06 11:29:21.976-05	2026-11-06 11:29:21.975-05
variant_01M6RPEW4T28QDSY0QV2RCF15P	pset_01M6RPEW7KY6DXBX39TKW8PPSM	pvps_01M6RPEW90TJGXWATH28E1PNJD	2026-11-06 10:08:28.829607-05	2026-11-06 11:29:21.976-05	2026-11-06 11:29:21.975-05
variant_01M6RPEW4VGSSPBQ9HCWWZ4KK3	pset_01M6RPEW7KZ07EFZW0RXEQRNM8	pvps_01M6RPEW90K83QAY17JBSZ89V1	2026-11-06 10:08:28.829607-05	2026-11-06 11:29:21.976-05	2026-11-06 11:29:21.975-05
variant_01M6RPEW4VSJX7FS1SB8TRGZDE	pset_01M6RPEW7K9TDZFNZHKPXAMF74	pvps_01M6RPEW90144MACNBYM908736	2026-11-06 10:08:28.829607-05	2026-11-06 11:29:21.976-05	2026-11-06 11:29:21.975-05
variant_01M6RPEW4VX4J3SR8CR1D2KW0M	pset_01M6RPEW7MFKZ9TKS74CNPEXYT	pvps_01M6RPEW90M3YZJ98DXBB02512	2026-11-06 10:08:28.829607-05	2026-11-06 11:29:21.976-05	2026-11-06 11:29:21.975-05
variant_01M6RPEW4V4MAJF6S4PAM5G2S8	pset_01M6RPEW7MXX23XW4F5XJGZ3WV	pvps_01M6RPEW90EYA91ZPJHAMY7J2T	2026-11-06 10:08:28.829607-05	2026-11-06 11:29:21.976-05	2026-11-06 11:29:21.975-05
variant_01M6RPEW4VYA9WKTPKGF5E1B70	pset_01M6RPEW7MQEKSSN7EZFGZK0S6	pvps_01M6RPEW90PKXDC896NDJAQYB9	2026-11-06 10:08:28.829607-05	2026-11-06 11:29:21.976-05	2026-11-06 11:29:21.975-05
variant_01M6RPEW4VESD7JMA603EJY2ZJ	pset_01M6RPEW7MQV5NN9DM5N17JEEW	pvps_01M6RPEW90XC1QDXXK3H4GJQG4	2026-11-06 10:08:28.829607-05	2026-11-06 11:29:21.976-05	2026-11-06 11:29:21.975-05
variant_01M6RPEW4V6SBSHSR8ZJ8AT4SJ	pset_01M6RPEW7NHK36GGEG1KTWYGEB	pvps_01M6RPEW901MY9VJR1WK3VMGS3	2026-11-06 10:08:28.829607-05	2026-11-06 11:29:21.977-05	2026-11-06 11:29:21.975-05
variant_01M6RPEW4VQ7HAZ1WN5JF3ZEBC	pset_01M6RPEW7N4Y95A3V51A42D0M7	pvps_01M6RPEW905ZGP7SZFK6D1WDBH	2026-11-06 10:08:28.829607-05	2026-11-06 11:29:21.977-05	2026-11-06 11:29:21.975-05
variant_01M6RV438SA66M12ECRFBARBHA	pset_01M6RV43BD3JNDQWSS6GA78VN6	pvps_01M6RV43DZEF2M85XD8PYWT3AC	2026-11-06 11:29:58.592355-05	2026-11-06 11:29:58.592355-05	\N
variant_01M6RV438SWKFM9SKAC7GZGNXB	pset_01M6RV43BECAVH4ZB7NVP7HP88	pvps_01M6RV43DZ6FHBCG8RDCMFZK24	2026-11-06 11:29:58.592355-05	2026-11-06 11:29:58.592355-05	\N
variant_01M6RV438SQB06J75G9HZCXJ4P	pset_01M6RV43BEQKKSWAGGAHGEED2H	pvps_01M6RV43DZW1J35TNAGCXJE66C	2026-11-06 11:29:58.592355-05	2026-11-06 11:29:58.592355-05	\N
variant_01M6RV438T1HCR4DFG9GGM64N9	pset_01M6RV43BEBP0HQ4P546GEYM8Y	pvps_01M6RV43E0P7RSNVNDTD0FVDA9	2026-11-06 11:29:58.592355-05	2026-11-06 11:29:58.592355-05	\N
variant_01M6RV438T3T62AHS19DZS6F01	pset_01M6RV43BFPH4J75BQ9JGCJ0P5	pvps_01M6RV43E0AG2WF8HAAWR3DN9B	2026-11-06 11:29:58.592355-05	2026-11-06 11:29:58.592355-05	\N
variant_01M6RV438TCF06HPPW4FGHV0D3	pset_01M6RV43BF1F63YETZCN4E5RN8	pvps_01M6RV43E030ZHAN5BSQFQ6WQK	2026-11-06 11:29:58.592355-05	2026-11-06 11:29:58.592355-05	\N
variant_01M6RV438T853C3FF9N4XHJ8HS	pset_01M6RV43BGR8TNZJ2DBZFKJF2J	pvps_01M6RV43E0WA40DDX540MC15G6	2026-11-06 11:29:58.592355-05	2026-11-06 11:29:58.592355-05	\N
variant_01M6RV438TCX28QC97PH70ZPXE	pset_01M6RV43BG9R5E0HRR60FE3WC9	pvps_01M6RV43E0J4AGJ08X4VWAQ0AN	2026-11-06 11:29:58.592355-05	2026-11-06 11:29:58.592355-05	\N
variant_01M6RV438V2CD3BRK8BH3D816M	pset_01M6RV43BHHR7JQZ2RD267EH81	pvps_01M6RV43E0CG3H1GCRR17VHGDN	2026-11-06 11:29:58.592355-05	2026-11-06 11:29:58.592355-05	\N
variant_01M6RV438V0GPXE6GFZAZSS25P	pset_01M6RV43BH81KHHXAE3K0KSM86	pvps_01M6RV43E0XSXMJK7TB42CSSXF	2026-11-06 11:29:58.592355-05	2026-11-06 11:29:58.592355-05	\N
variant_01M6RV438VRYW3STBR7FJ03VGV	pset_01M6RV43BJZFTP7VEG1Q33SBEF	pvps_01M6RV43E0RQWYDRADQPWNEQ3V	2026-11-06 11:29:58.592355-05	2026-11-06 11:29:58.592355-05	\N
variant_01M6RV438VF8QQFTSV19FYGW42	pset_01M6RV43BJDJMAVZBR5V6DRG2M	pvps_01M6RV43E0BVJF0XWTHAZ8XDY3	2026-11-06 11:29:58.592355-05	2026-11-06 11:29:58.592355-05	\N
variant_01M6RV438VFVK9DWN42CWQKXJ1	pset_01M6RV43BJGR7XZ5Z81CV7JN3S	pvps_01M6RV43E1HQKCWKDQ9CFF4KEN	2026-11-06 11:29:58.592355-05	2026-11-06 11:29:58.592355-05	\N
variant_01M6RV438VZSHK9WWJRH71R4EW	pset_01M6RV43BK71704A1NZBJKKVHB	pvps_01M6RV43E16MSYW302Y2MCTM1B	2026-11-06 11:29:58.592355-05	2026-11-06 11:29:58.592355-05	\N
variant_01M6RV438VCX78CJCYAXK9QNMW	pset_01M6RV43BK0XV8105MW01FAXCK	pvps_01M6RV43E1AFMTQZPPGP550VFX	2026-11-06 11:29:58.592355-05	2026-11-06 11:29:58.592355-05	\N
variant_01M6RV438WPAQCDPY1ND3PX146	pset_01M6RV43BKB21295GB1AZP8A0V	pvps_01M6RV43E1GY3S9JBATPHJZM0D	2026-11-06 11:29:58.592355-05	2026-11-06 11:29:58.592355-05	\N
variant_01M6RV438WYJ8BRACD7ME89E3K	pset_01M6RV43BMPFNFR218P6114BJA	pvps_01M6RV43E1S8CSKGA4EPFSAGG2	2026-11-06 11:29:58.592355-05	2026-11-06 11:29:58.592355-05	\N
variant_01M6RV438WXQ27KDR4P5VX2YQA	pset_01M6RV43BM0H4SC00N16E6DTV8	pvps_01M6RV43E1HJT2BW4ZD4CS4SBP	2026-11-06 11:29:58.592355-05	2026-11-06 11:29:58.592355-05	\N
variant_01M6RV438WT0872HSQH1DTX8HQ	pset_01M6RV43BMPS4T68C6WMZDT8YS	pvps_01M6RV43E1C9WZPSFB8H83B07E	2026-11-06 11:29:58.592355-05	2026-11-06 11:29:58.592355-05	\N
variant_01M6RV438WE21JDZT9851MDQMC	pset_01M6RV43BN1RN5SVYVBP75DJS8	pvps_01M6RV43E1FNGXE5PAFYN39FQW	2026-11-06 11:29:58.592355-05	2026-11-06 11:29:58.592355-05	\N
variant_01M6RV438XZGSWSRWXA7SPFGG4	pset_01M6RV43BN2AN3DKRRY2ATF4VJ	pvps_01M6RV43E1G5C1CTH07C4CYVMT	2026-11-06 11:29:58.592355-05	2026-11-06 11:29:58.592355-05	\N
variant_01M6RV438XW54Z055JVRTVFVCS	pset_01M6RV43BN47FFNFEE063V2CB0	pvps_01M6RV43E1XEDAJNZDGB3FAKMC	2026-11-06 11:29:58.592355-05	2026-11-06 11:29:58.592355-05	\N
variant_01M6RV438XZJD85SZANXMEPSVN	pset_01M6RV43BPT41G70CWM1AAWG9T	pvps_01M6RV43E1X7BH96WGAHAG5NX5	2026-11-06 11:29:58.592355-05	2026-11-06 11:29:58.592355-05	\N
variant_01M6RV438XX7RR7Y93RG8WEBB3	pset_01M6RV43BPK0XZDET9ZC9NPMBG	pvps_01M6RV43E20ADXK7119QBDRSC3	2026-11-06 11:29:58.592355-05	2026-11-06 11:29:58.592355-05	\N
variant_01M6RV438XYE826Q1BTQA318RF	pset_01M6RV43BPWDS4BJZXJKKAFMQE	pvps_01M6RV43E2AHRA207Z3DQNXZPR	2026-11-06 11:29:58.592355-05	2026-11-06 11:29:58.592355-05	\N
variant_01M6RV438XJMSCVT1QKRT9G30B	pset_01M6RV43BQW7YY8ZJ8JJV3S3XM	pvps_01M6RV43E23RJ3VAZ6KTNSRKZR	2026-11-06 11:29:58.592355-05	2026-11-06 11:29:58.592355-05	\N
variant_01M6RV438X7TVFCK97VN8EN9YB	pset_01M6RV43BQ6PTD9J01MWFASXBY	pvps_01M6RV43E2ZCDEF37KD1F12Z6R	2026-11-06 11:29:58.592355-05	2026-11-06 11:29:58.592355-05	\N
variant_01M6RV438YXBQZBEVYYYYAWJRK	pset_01M6RV43BQYXVXA41AWTTK02Y0	pvps_01M6RV43E27T2GQCT2393TVCJ8	2026-11-06 11:29:58.592355-05	2026-11-06 11:29:58.592355-05	\N
variant_01M6RV438Y2JEAYKQRK744DG9Z	pset_01M6RV43BRSRSGQ7896HNZGWSQ	pvps_01M6RV43E2E3C19ZRZHVK9EHSM	2026-11-06 11:29:58.592355-05	2026-11-06 11:29:58.592355-05	\N
variant_01M6RV438YGVS38R3HZ17X7Y7Y	pset_01M6RV43BRSBPC10D36HWWW4XX	pvps_01M6RV43E2WAH696V75DH1BFNF	2026-11-06 11:29:58.592355-05	2026-11-06 11:29:58.592355-05	\N
variant_01M6RV438YD4WDJVCMWY7K6E0F	pset_01M6RV43BR8KAG1J4V2G2AD3P4	pvps_01M6RV43E2HVCAARFH8F505F44	2026-11-06 11:29:58.592355-05	2026-11-06 11:29:58.592355-05	\N
variant_01M6RV438Y28J96X2CMGMW4TNX	pset_01M6RV43BS13PGE8FW9XB4P5PA	pvps_01M6RV43E2M1KJGZDSTV17SAK9	2026-11-06 11:29:58.592355-05	2026-11-06 11:29:58.592355-05	\N
variant_01M6VRP8806KMGC80QGV9EREHN	pset_01M6VRP8AZPBWS44X17S8HCDSS	pvps_01M6VRP8BVXB9YF4GGMJ7WJRRB	2026-11-07 14:45:11.034836-05	2026-11-07 14:45:11.034836-05	\N
variant_01M6VRP880Y4KY9B7BPGWRQ2BX	pset_01M6VRP8AZPAD4RVAQS4PWFD3P	pvps_01M6VRP8BV96ZZPJ2DF010F3V2	2026-11-07 14:45:11.034836-05	2026-11-07 14:45:11.034836-05	\N
\.


--
-- Data for Name: product_variant_product_image; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_variant_product_image (id, variant_id, image_id, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: promotion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.promotion (id, code, campaign_id, is_automatic, type, created_at, updated_at, deleted_at, status, is_tax_inclusive, "limit", used, metadata) FROM stdin;
\.


--
-- Data for Name: promotion_application_method; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.promotion_application_method (id, value, raw_value, max_quantity, apply_to_quantity, buy_rules_min_quantity, type, target_type, allocation, promotion_id, created_at, updated_at, deleted_at, currency_code) FROM stdin;
\.


--
-- Data for Name: promotion_campaign; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.promotion_campaign (id, name, description, campaign_identifier, starts_at, ends_at, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: promotion_campaign_budget; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.promotion_campaign_budget (id, type, campaign_id, "limit", raw_limit, used, raw_used, created_at, updated_at, deleted_at, currency_code, attribute) FROM stdin;
\.


--
-- Data for Name: promotion_campaign_budget_usage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.promotion_campaign_budget_usage (id, attribute_value, used, budget_id, raw_used, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: promotion_promotion_rule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.promotion_promotion_rule (promotion_id, promotion_rule_id) FROM stdin;
\.


--
-- Data for Name: promotion_rule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.promotion_rule (id, description, attribute, operator, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: promotion_rule_value; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.promotion_rule_value (id, promotion_rule_id, value, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: property_label; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.property_label (id, entity, property, label, description, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: provider_identity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.provider_identity (id, entity_id, provider, auth_identity_id, user_metadata, provider_metadata, created_at, updated_at, deleted_at) FROM stdin;
01M6Q03T7ZJPZXW9C8E726FMY1	admin@medusa-test.com	emailpass	authid_01M6Q03T80HKJN1SHTZ3NNX3WT	\N	{"password": "c2NyeXB0AA8AAAAIAAAAARbWU7kBTNlutVYZ9eqiYfA1Mv8BKjNenc9Xw/Ffqu+9g6TGrcijfNVcAwlrTLAmXBAHnepO3Vo7W2RYb8Q2yhWc66Tw48BYKWIcLyaswWU6"}	2026-11-05 18:18:43.201-05	2026-11-05 18:18:43.201-05	\N
\.


--
-- Data for Name: publishable_api_key_sales_channel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.publishable_api_key_sales_channel (publishable_key_id, sales_channel_id, id, created_at, updated_at, deleted_at) FROM stdin;
apk_01M6Q03EJKHPSNQDSM9WH6CQCG	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	pksc_01M6Q03EJY468MSTTWTZ8CX2KZ	2026-11-05 18:18:31.263036-05	2026-11-05 18:18:31.263036-05	\N
\.


--
-- Data for Name: refund; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refund (id, amount, raw_amount, payment_id, created_at, updated_at, deleted_at, created_by, metadata, refund_reason_id, note, status, idempotency_key) FROM stdin;
\.


--
-- Data for Name: refund_reason; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refund_reason (id, label, description, metadata, created_at, updated_at, deleted_at, code) FROM stdin;
refr_01M6Q02JNYGD7MZ4QY7KKFT276	Shipping Issue	Refund due to lost, delayed, or misdelivered shipment	\N	2026-11-05 18:18:02.354979-05	2026-11-05 18:18:02.354979-05	\N	shipping_issue
refr_01M6Q02JP1QWCQFRWMKK78YPF9	Customer Care Adjustment	Refund given as goodwill or compensation for inconvenience	\N	2026-11-05 18:18:02.354979-05	2026-11-05 18:18:02.354979-05	\N	customer_care_adjustment
refr_01M6Q02JP13838PANEAB1SDE99	Pricing Error	Refund to correct an overcharge, missing discount, or incorrect price	\N	2026-11-05 18:18:02.354979-05	2026-11-05 18:18:02.354979-05	\N	pricing_error
\.


--
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.region (id, name, currency_code, metadata, created_at, updated_at, deleted_at, automatic_taxes) FROM stdin;
reg_01M6RV2Z6Y49SJ7X8247E44P84	Colombia	cop	\N	2026-11-06 11:29:21.506-05	2026-11-06 11:29:21.506-05	\N	t
reg_01M6Q03EM0ED42M95E5T6K27Z2	Europe	eur	{"free_returns": false, "shipping_rate": 10, "transit_days_max": 3, "transit_days_min": 2, "handling_days_max": 1, "handling_days_min": 0, "return_window_days": 30}	2026-11-05 18:18:31.303-05	2026-11-05 18:18:31.303-05	2026-11-07 15:14:32.851172-05	t
\.


--
-- Data for Name: region_country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.region_country (iso_2, iso_3, num_code, name, display_name, region_id, metadata, created_at, updated_at, deleted_at) FROM stdin;
af	afg	004	AFGHANISTAN	Afghanistan	\N	\N	2026-11-05 18:18:11.886-05	2026-11-05 18:18:11.886-05	\N
al	alb	008	ALBANIA	Albania	\N	\N	2026-11-05 18:18:11.887-05	2026-11-05 18:18:11.887-05	\N
dz	dza	012	ALGERIA	Algeria	\N	\N	2026-11-05 18:18:11.887-05	2026-11-05 18:18:11.887-05	\N
as	asm	016	AMERICAN SAMOA	American Samoa	\N	\N	2026-11-05 18:18:11.887-05	2026-11-05 18:18:11.887-05	\N
ad	and	020	ANDORRA	Andorra	\N	\N	2026-11-05 18:18:11.887-05	2026-11-05 18:18:11.887-05	\N
ao	ago	024	ANGOLA	Angola	\N	\N	2026-11-05 18:18:11.887-05	2026-11-05 18:18:11.887-05	\N
ai	aia	660	ANGUILLA	Anguilla	\N	\N	2026-11-05 18:18:11.887-05	2026-11-05 18:18:11.887-05	\N
aq	ata	010	ANTARCTICA	Antarctica	\N	\N	2026-11-05 18:18:11.887-05	2026-11-05 18:18:11.887-05	\N
ag	atg	028	ANTIGUA AND BARBUDA	Antigua and Barbuda	\N	\N	2026-11-05 18:18:11.887-05	2026-11-05 18:18:11.887-05	\N
ar	arg	032	ARGENTINA	Argentina	\N	\N	2026-11-05 18:18:11.887-05	2026-11-05 18:18:11.887-05	\N
am	arm	051	ARMENIA	Armenia	\N	\N	2026-11-05 18:18:11.887-05	2026-11-05 18:18:11.887-05	\N
aw	abw	533	ARUBA	Aruba	\N	\N	2026-11-05 18:18:11.887-05	2026-11-05 18:18:11.887-05	\N
au	aus	036	AUSTRALIA	Australia	\N	\N	2026-11-05 18:18:11.887-05	2026-11-05 18:18:11.887-05	\N
at	aut	040	AUSTRIA	Austria	\N	\N	2026-11-05 18:18:11.887-05	2026-11-05 18:18:11.887-05	\N
az	aze	031	AZERBAIJAN	Azerbaijan	\N	\N	2026-11-05 18:18:11.887-05	2026-11-05 18:18:11.887-05	\N
bs	bhs	044	BAHAMAS	Bahamas	\N	\N	2026-11-05 18:18:11.887-05	2026-11-05 18:18:11.887-05	\N
bh	bhr	048	BAHRAIN	Bahrain	\N	\N	2026-11-05 18:18:11.887-05	2026-11-05 18:18:11.887-05	\N
bd	bgd	050	BANGLADESH	Bangladesh	\N	\N	2026-11-05 18:18:11.887-05	2026-11-05 18:18:11.887-05	\N
bb	brb	052	BARBADOS	Barbados	\N	\N	2026-11-05 18:18:11.887-05	2026-11-05 18:18:11.887-05	\N
by	blr	112	BELARUS	Belarus	\N	\N	2026-11-05 18:18:11.887-05	2026-11-05 18:18:11.887-05	\N
be	bel	056	BELGIUM	Belgium	\N	\N	2026-11-05 18:18:11.887-05	2026-11-05 18:18:11.887-05	\N
bz	blz	084	BELIZE	Belize	\N	\N	2026-11-05 18:18:11.887-05	2026-11-05 18:18:11.887-05	\N
bj	ben	204	BENIN	Benin	\N	\N	2026-11-05 18:18:11.887-05	2026-11-05 18:18:11.887-05	\N
bm	bmu	060	BERMUDA	Bermuda	\N	\N	2026-11-05 18:18:11.887-05	2026-11-05 18:18:11.887-05	\N
bt	btn	064	BHUTAN	Bhutan	\N	\N	2026-11-05 18:18:11.887-05	2026-11-05 18:18:11.887-05	\N
bo	bol	068	BOLIVIA	Bolivia	\N	\N	2026-11-05 18:18:11.887-05	2026-11-05 18:18:11.887-05	\N
bq	bes	535	BONAIRE, SINT EUSTATIUS AND SABA	Bonaire, Sint Eustatius and Saba	\N	\N	2026-11-05 18:18:11.887-05	2026-11-05 18:18:11.887-05	\N
ba	bih	070	BOSNIA AND HERZEGOVINA	Bosnia and Herzegovina	\N	\N	2026-11-05 18:18:11.887-05	2026-11-05 18:18:11.887-05	\N
bw	bwa	072	BOTSWANA	Botswana	\N	\N	2026-11-05 18:18:11.887-05	2026-11-05 18:18:11.887-05	\N
bv	bvd	074	BOUVET ISLAND	Bouvet Island	\N	\N	2026-11-05 18:18:11.887-05	2026-11-05 18:18:11.887-05	\N
br	bra	076	BRAZIL	Brazil	\N	\N	2026-11-05 18:18:11.887-05	2026-11-05 18:18:11.887-05	\N
io	iot	086	BRITISH INDIAN OCEAN TERRITORY	British Indian Ocean Territory	\N	\N	2026-11-05 18:18:11.887-05	2026-11-05 18:18:11.887-05	\N
bn	brn	096	BRUNEI DARUSSALAM	Brunei Darussalam	\N	\N	2026-11-05 18:18:11.887-05	2026-11-05 18:18:11.887-05	\N
bg	bgr	100	BULGARIA	Bulgaria	\N	\N	2026-11-05 18:18:11.887-05	2026-11-05 18:18:11.887-05	\N
bf	bfa	854	BURKINA FASO	Burkina Faso	\N	\N	2026-11-05 18:18:11.887-05	2026-11-05 18:18:11.887-05	\N
bi	bdi	108	BURUNDI	Burundi	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
kh	khm	116	CAMBODIA	Cambodia	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
cm	cmr	120	CAMEROON	Cameroon	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
ca	can	124	CANADA	Canada	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
cv	cpv	132	CAPE VERDE	Cape Verde	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
ky	cym	136	CAYMAN ISLANDS	Cayman Islands	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
cf	caf	140	CENTRAL AFRICAN REPUBLIC	Central African Republic	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
td	tcd	148	CHAD	Chad	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
cl	chl	152	CHILE	Chile	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
cn	chn	156	CHINA	China	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
cx	cxr	162	CHRISTMAS ISLAND	Christmas Island	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
cc	cck	166	COCOS (KEELING) ISLANDS	Cocos (Keeling) Islands	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
km	com	174	COMOROS	Comoros	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
cg	cog	178	CONGO	Congo	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
cd	cod	180	CONGO, THE DEMOCRATIC REPUBLIC OF THE	Congo, the Democratic Republic of the	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
ck	cok	184	COOK ISLANDS	Cook Islands	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
cr	cri	188	COSTA RICA	Costa Rica	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
ci	civ	384	COTE D'IVOIRE	Cote D'Ivoire	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
hr	hrv	191	CROATIA	Croatia	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
cu	cub	192	CUBA	Cuba	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
cw	cuw	531	CURAÇAO	Curaçao	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
cy	cyp	196	CYPRUS	Cyprus	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
cz	cze	203	CZECH REPUBLIC	Czech Republic	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
dj	dji	262	DJIBOUTI	Djibouti	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
dm	dma	212	DOMINICA	Dominica	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
do	dom	214	DOMINICAN REPUBLIC	Dominican Republic	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
ec	ecu	218	ECUADOR	Ecuador	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
eg	egy	818	EGYPT	Egypt	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
sv	slv	222	EL SALVADOR	El Salvador	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
gq	gnq	226	EQUATORIAL GUINEA	Equatorial Guinea	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
er	eri	232	ERITREA	Eritrea	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
ee	est	233	ESTONIA	Estonia	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
et	eth	231	ETHIOPIA	Ethiopia	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
fk	flk	238	FALKLAND ISLANDS (MALVINAS)	Falkland Islands (Malvinas)	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
fo	fro	234	FAROE ISLANDS	Faroe Islands	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
fj	fji	242	FIJI	Fiji	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
fi	fin	246	FINLAND	Finland	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
gf	guf	254	FRENCH GUIANA	French Guiana	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
pf	pyf	258	FRENCH POLYNESIA	French Polynesia	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
tf	atf	260	FRENCH SOUTHERN TERRITORIES	French Southern Territories	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
ga	gab	266	GABON	Gabon	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
gm	gmb	270	GAMBIA	Gambia	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
ge	geo	268	GEORGIA	Georgia	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
gh	gha	288	GHANA	Ghana	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
gi	gib	292	GIBRALTAR	Gibraltar	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
gr	grc	300	GREECE	Greece	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
gl	grl	304	GREENLAND	Greenland	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
gd	grd	308	GRENADA	Grenada	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
gp	glp	312	GUADELOUPE	Guadeloupe	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
gu	gum	316	GUAM	Guam	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
gt	gtm	320	GUATEMALA	Guatemala	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
gg	ggy	831	GUERNSEY	Guernsey	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
co	col	170	COLOMBIA	Colombia	reg_01M6RV2Z6Y49SJ7X8247E44P84	\N	2026-11-05 18:18:11.888-05	2026-11-06 11:29:21.506-05	\N
gn	gin	324	GUINEA	Guinea	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
gw	gnb	624	GUINEA-BISSAU	Guinea-Bissau	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
gy	guy	328	GUYANA	Guyana	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
ht	hti	332	HAITI	Haiti	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
hm	hmd	334	HEARD ISLAND AND MCDONALD ISLANDS	Heard Island And Mcdonald Islands	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
va	vat	336	HOLY SEE (VATICAN CITY STATE)	Holy See (Vatican City State)	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
hn	hnd	340	HONDURAS	Honduras	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
hk	hkg	344	HONG KONG	Hong Kong	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
hu	hun	348	HUNGARY	Hungary	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
is	isl	352	ICELAND	Iceland	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
in	ind	356	INDIA	India	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
id	idn	360	INDONESIA	Indonesia	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
ir	irn	364	IRAN, ISLAMIC REPUBLIC OF	Iran, Islamic Republic of	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
iq	irq	368	IRAQ	Iraq	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
ie	irl	372	IRELAND	Ireland	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
im	imn	833	ISLE OF MAN	Isle Of Man	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
il	isr	376	ISRAEL	Israel	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
jm	jam	388	JAMAICA	Jamaica	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
jp	jpn	392	JAPAN	Japan	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
je	jey	832	JERSEY	Jersey	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
jo	jor	400	JORDAN	Jordan	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
kz	kaz	398	KAZAKHSTAN	Kazakhstan	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
ke	ken	404	KENYA	Kenya	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
ki	kir	296	KIRIBATI	Kiribati	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
kp	prk	408	KOREA, DEMOCRATIC PEOPLE'S REPUBLIC OF	Korea, Democratic People's Republic of	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
kr	kor	410	KOREA, REPUBLIC OF	Korea, Republic of	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
xk	xkx	900	KOSOVO	Kosovo	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
kw	kwt	414	KUWAIT	Kuwait	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
kg	kgz	417	KYRGYZSTAN	Kyrgyzstan	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
la	lao	418	LAO PEOPLE'S DEMOCRATIC REPUBLIC	Lao People's Democratic Republic	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
lv	lva	428	LATVIA	Latvia	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
lb	lbn	422	LEBANON	Lebanon	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
ls	lso	426	LESOTHO	Lesotho	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
lr	lbr	430	LIBERIA	Liberia	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
ly	lby	434	LIBYA	Libya	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
li	lie	438	LIECHTENSTEIN	Liechtenstein	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
lt	ltu	440	LITHUANIA	Lithuania	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
lu	lux	442	LUXEMBOURG	Luxembourg	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
mo	mac	446	MACAO	Macao	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
mg	mdg	450	MADAGASCAR	Madagascar	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
mw	mwi	454	MALAWI	Malawi	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
my	mys	458	MALAYSIA	Malaysia	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
mv	mdv	462	MALDIVES	Maldives	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
ml	mli	466	MALI	Mali	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
mt	mlt	470	MALTA	Malta	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
mh	mhl	584	MARSHALL ISLANDS	Marshall Islands	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
mq	mtq	474	MARTINIQUE	Martinique	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
mr	mrt	478	MAURITANIA	Mauritania	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
mu	mus	480	MAURITIUS	Mauritius	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
yt	myt	175	MAYOTTE	Mayotte	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
mx	mex	484	MEXICO	Mexico	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
fm	fsm	583	MICRONESIA, FEDERATED STATES OF	Micronesia, Federated States of	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
md	mda	498	MOLDOVA, REPUBLIC OF	Moldova, Republic of	\N	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:11.888-05	\N
mc	mco	492	MONACO	Monaco	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
mn	mng	496	MONGOLIA	Mongolia	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
me	mne	499	MONTENEGRO	Montenegro	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
ms	msr	500	MONTSERRAT	Montserrat	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
ma	mar	504	MOROCCO	Morocco	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
mz	moz	508	MOZAMBIQUE	Mozambique	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
mm	mmr	104	MYANMAR	Myanmar	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
na	nam	516	NAMIBIA	Namibia	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
nr	nru	520	NAURU	Nauru	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
np	npl	524	NEPAL	Nepal	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
nl	nld	528	NETHERLANDS	Netherlands	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
nc	ncl	540	NEW CALEDONIA	New Caledonia	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
nz	nzl	554	NEW ZEALAND	New Zealand	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
ni	nic	558	NICARAGUA	Nicaragua	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
ne	ner	562	NIGER	Niger	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
ng	nga	566	NIGERIA	Nigeria	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
nu	niu	570	NIUE	Niue	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
nf	nfk	574	NORFOLK ISLAND	Norfolk Island	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
mk	mkd	807	NORTH MACEDONIA	North Macedonia	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
mp	mnp	580	NORTHERN MARIANA ISLANDS	Northern Mariana Islands	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
no	nor	578	NORWAY	Norway	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
om	omn	512	OMAN	Oman	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
pk	pak	586	PAKISTAN	Pakistan	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
pw	plw	585	PALAU	Palau	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
ps	pse	275	PALESTINIAN TERRITORY, OCCUPIED	Palestinian Territory, Occupied	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
pa	pan	591	PANAMA	Panama	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
pg	png	598	PAPUA NEW GUINEA	Papua New Guinea	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
py	pry	600	PARAGUAY	Paraguay	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
pe	per	604	PERU	Peru	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
ph	phl	608	PHILIPPINES	Philippines	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
pn	pcn	612	PITCAIRN	Pitcairn	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
pl	pol	616	POLAND	Poland	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
pt	prt	620	PORTUGAL	Portugal	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
pr	pri	630	PUERTO RICO	Puerto Rico	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
qa	qat	634	QATAR	Qatar	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
re	reu	638	REUNION	Reunion	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
ro	rom	642	ROMANIA	Romania	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
ru	rus	643	RUSSIAN FEDERATION	Russian Federation	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
rw	rwa	646	RWANDA	Rwanda	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
bl	blm	652	SAINT BARTHÉLEMY	Saint Barthélemy	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
sh	shn	654	SAINT HELENA	Saint Helena	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
kn	kna	659	SAINT KITTS AND NEVIS	Saint Kitts and Nevis	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
lc	lca	662	SAINT LUCIA	Saint Lucia	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
mf	maf	663	SAINT MARTIN (FRENCH PART)	Saint Martin (French part)	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
pm	spm	666	SAINT PIERRE AND MIQUELON	Saint Pierre and Miquelon	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
vc	vct	670	SAINT VINCENT AND THE GRENADINES	Saint Vincent and the Grenadines	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
ws	wsm	882	SAMOA	Samoa	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
sm	smr	674	SAN MARINO	San Marino	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
st	stp	678	SAO TOME AND PRINCIPE	Sao Tome and Principe	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
sa	sau	682	SAUDI ARABIA	Saudi Arabia	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
sn	sen	686	SENEGAL	Senegal	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
rs	srb	688	SERBIA	Serbia	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
sc	syc	690	SEYCHELLES	Seychelles	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
sl	sle	694	SIERRA LEONE	Sierra Leone	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
sg	sgp	702	SINGAPORE	Singapore	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
sx	sxm	534	SINT MAARTEN	Sint Maarten	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
sk	svk	703	SLOVAKIA	Slovakia	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
si	svn	705	SLOVENIA	Slovenia	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
sb	slb	090	SOLOMON ISLANDS	Solomon Islands	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
so	som	706	SOMALIA	Somalia	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
za	zaf	710	SOUTH AFRICA	South Africa	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
gs	sgs	239	SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS	South Georgia and the South Sandwich Islands	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
ss	ssd	728	SOUTH SUDAN	South Sudan	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
lk	lka	144	SRI LANKA	Sri Lanka	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
sd	sdn	729	SUDAN	Sudan	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
sr	sur	740	SURINAME	Suriname	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
sj	sjm	744	SVALBARD AND JAN MAYEN	Svalbard and Jan Mayen	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
sz	swz	748	SWAZILAND	Swaziland	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
ch	che	756	SWITZERLAND	Switzerland	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
sy	syr	760	SYRIAN ARAB REPUBLIC	Syrian Arab Republic	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
tw	twn	158	TAIWAN, PROVINCE OF CHINA	Taiwan, Province of China	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
tj	tjk	762	TAJIKISTAN	Tajikistan	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
tz	tza	834	TANZANIA, UNITED REPUBLIC OF	Tanzania, United Republic of	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
th	tha	764	THAILAND	Thailand	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
tl	tls	626	TIMOR LESTE	Timor Leste	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
tg	tgo	768	TOGO	Togo	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
tk	tkl	772	TOKELAU	Tokelau	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
to	ton	776	TONGA	Tonga	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
tt	tto	780	TRINIDAD AND TOBAGO	Trinidad and Tobago	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
tn	tun	788	TUNISIA	Tunisia	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
tr	tur	792	TURKEY	Turkey	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
tm	tkm	795	TURKMENISTAN	Turkmenistan	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
tc	tca	796	TURKS AND CAICOS ISLANDS	Turks and Caicos Islands	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
tv	tuv	798	TUVALU	Tuvalu	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
ug	uga	800	UGANDA	Uganda	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
ua	ukr	804	UKRAINE	Ukraine	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
ae	are	784	UNITED ARAB EMIRATES	United Arab Emirates	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
us	usa	840	UNITED STATES	United States	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
um	umi	581	UNITED STATES MINOR OUTLYING ISLANDS	United States Minor Outlying Islands	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
uy	ury	858	URUGUAY	Uruguay	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
uz	uzb	860	UZBEKISTAN	Uzbekistan	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
vu	vut	548	VANUATU	Vanuatu	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
ve	ven	862	VENEZUELA	Venezuela	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
vn	vnm	704	VIET NAM	Viet Nam	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
vg	vgb	092	VIRGIN ISLANDS, BRITISH	Virgin Islands, British	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
vi	vir	850	VIRGIN ISLANDS, U.S.	Virgin Islands, U.S.	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
wf	wlf	876	WALLIS AND FUTUNA	Wallis and Futuna	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
eh	esh	732	WESTERN SAHARA	Western Sahara	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
ye	yem	887	YEMEN	Yemen	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
zm	zmb	894	ZAMBIA	Zambia	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
zw	zwe	716	ZIMBABWE	Zimbabwe	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
ax	ala	248	ÅLAND ISLANDS	Åland Islands	\N	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:11.889-05	\N
dk	dnk	208	DENMARK	Denmark	reg_01M6Q03EM0ED42M95E5T6K27Z2	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:31.303-05	\N
fr	fra	250	FRANCE	France	reg_01M6Q03EM0ED42M95E5T6K27Z2	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:31.303-05	\N
de	deu	276	GERMANY	Germany	reg_01M6Q03EM0ED42M95E5T6K27Z2	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:31.303-05	\N
it	ita	380	ITALY	Italy	reg_01M6Q03EM0ED42M95E5T6K27Z2	\N	2026-11-05 18:18:11.888-05	2026-11-05 18:18:31.303-05	\N
es	esp	724	SPAIN	Spain	reg_01M6Q03EM0ED42M95E5T6K27Z2	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:31.303-05	\N
se	swe	752	SWEDEN	Sweden	reg_01M6Q03EM0ED42M95E5T6K27Z2	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:31.303-05	\N
gb	gbr	826	UNITED KINGDOM	United Kingdom	reg_01M6Q03EM0ED42M95E5T6K27Z2	\N	2026-11-05 18:18:11.889-05	2026-11-05 18:18:31.303-05	\N
\.


--
-- Data for Name: region_payment_provider; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.region_payment_provider (region_id, payment_provider_id, id, created_at, updated_at, deleted_at) FROM stdin;
reg_01M6Q03EM0ED42M95E5T6K27Z2	pp_system_default	regpp_01M6Q03EMRASPNXQ15H5ANNQCE	2026-11-05 18:18:31.320853-05	2026-11-05 18:18:31.320853-05	\N
reg_01M6RV2Z6Y49SJ7X8247E44P84	pp_system_default	regpp_01M6RV2Z7PXMY09ATG1RSNRK26	2026-11-06 11:29:21.537088-05	2026-11-06 11:29:21.537088-05	\N
\.


--
-- Data for Name: reservation_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservation_item (id, created_at, updated_at, deleted_at, line_item_id, location_id, quantity, external_id, description, created_by, metadata, inventory_item_id, allow_backorder, raw_quantity) FROM stdin;
\.


--
-- Data for Name: return; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.return (id, order_id, claim_id, exchange_id, order_version, display_id, status, no_notification, refund_amount, raw_refund_amount, metadata, created_at, updated_at, deleted_at, received_at, canceled_at, location_id, requested_at, created_by) FROM stdin;
\.


--
-- Data for Name: return_fulfillment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.return_fulfillment (return_id, fulfillment_id, id, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: return_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.return_item (id, return_id, reason_id, item_id, quantity, raw_quantity, received_quantity, raw_received_quantity, note, metadata, created_at, updated_at, deleted_at, damaged_quantity, raw_damaged_quantity) FROM stdin;
\.


--
-- Data for Name: return_reason; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.return_reason (id, value, label, description, metadata, parent_return_reason_id, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: sales_channel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales_channel (id, name, description, is_disabled, metadata, created_at, updated_at, deleted_at) FROM stdin;
sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	Default Sales Channel	Created by Medusa	f	\N	2026-11-05 18:18:31.245-05	2026-11-05 18:18:31.245-05	\N
\.


--
-- Data for Name: sales_channel_stock_location; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales_channel_stock_location (sales_channel_id, stock_location_id, id, created_at, updated_at, deleted_at) FROM stdin;
sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	sloc_01M6Q03ENBW67DKHCPC7ERY5PA	scloc_01M6Q03ES8Q8DA4BTKTTYT6833	2026-11-05 18:18:31.464746-05	2026-11-05 18:18:31.464746-05	\N
\.


--
-- Data for Name: script_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.script_migrations (id, script_name, created_at, finished_at) FROM stdin;
1	backfill-refund-status.js	2026-11-05 18:18:16.969462-05	2026-11-05 18:18:16.98722-05
2	migrate-normalize-currency-codes-normalization.js	2026-11-05 18:18:30.984617-05	2026-11-05 18:18:31.048745-05
3	migrate-product-option-link-ids.js	2026-11-05 18:18:31.068355-05	2026-11-05 18:18:31.074942-05
4	migrate-product-shipping-profile.js	2026-11-05 18:18:31.095589-05	2026-11-05 18:18:31.120555-05
5	migrate-tax-region-provider.js	2026-11-05 18:18:31.157999-05	2026-11-05 18:18:31.166147-05
6	reconcile-inventory-reserved-quantity.js	2026-11-05 18:18:31.185887-05	2026-11-05 18:18:31.194064-05
7	initial-data-seed.ts	2026-11-05 18:18:31.240927-05	2026-11-05 18:18:31.773731-05
8	region-store-policies.ts	2026-11-05 18:18:31.792182-05	2026-11-05 18:18:31.795045-05
\.


--
-- Data for Name: search_index; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.search_index (id, name, created_at, updated_at, deleted_at, active_version) FROM stdin;
srhidx_01M6Q02W0DH4997EFP2Z84CB29	product	2026-11-05 18:18:12.238-05	2026-11-05 18:21:11.136-05	\N	1
\.


--
-- Data for Name: search_index_sync; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.search_index_sync (id, job_id, status, filters, last_key, documents_synced, started_at, completed_at, error, search_index_version_id, created_at, updated_at, deleted_at, resumable) FROM stdin;
srhsync_01M6Q08ANF9V31XA2MP2GYYG6P	2f0a35e5-bd61-44a9-b0db-b81f228a4f97	done	\N	\N	0	2026-11-05 18:21:11.085-05	2026-11-05 18:21:11.106-05	\N	srhver_01M6Q02W0K9Z5XY9P8XYBE6WFS	2026-11-05 18:21:11.087-05	2026-11-05 18:21:11.114-05	\N	f
srhsync_01M6Q087BYMP7D75DJSX8Z4NBY	2f0a35e5-bd61-44a9-b0db-b81f228a4f97	done	\N	prod_01M6Q03ETNKKC3J2PQ8J5HX3X1	4	2026-11-05 18:21:07.703-05	2026-11-05 18:21:11.141-05	\N	srhver_01M6Q02W0K9Z5XY9P8XYBE6WFS	2026-11-05 18:21:07.711-05	2026-11-05 18:21:11.146-05	\N	f
srhsync_01M6RQDMASWE3NSECMK02W3BGZ	95e20f16-2b22-4a91-80e1-c31c118e0c4b	done	\N	\N	0	2026-11-06 10:25:16.504-05	2026-11-06 10:25:16.514-05	\N	srhver_01M6Q02W0K9Z5XY9P8XYBE6WFS	2026-11-06 10:25:16.505-05	2026-11-06 10:25:16.516-05	\N	f
srhsync_01M6RQDM0DQQHDGM31A7JXQVS8	95e20f16-2b22-4a91-80e1-c31c118e0c4b	done	\N	prod_01M6RPEW08XDN4YM5CJZA5BJ18	16	2026-11-06 10:25:16.172-05	2026-11-06 10:25:16.523-05	\N	srhver_01M6Q02W0K9Z5XY9P8XYBE6WFS	2026-11-06 10:25:16.174-05	2026-11-06 10:25:16.525-05	\N	f
srhsync_01M6RV4K3SP77EYJ31WZGJNBEE	15aad455-6cb6-453c-804a-da80e0fe3e5c	done	\N	\N	0	2026-11-06 11:30:14.648-05	2026-11-06 11:30:14.658-05	\N	srhver_01M6Q02W0K9Z5XY9P8XYBE6WFS	2026-11-06 11:30:14.649-05	2026-11-06 11:30:14.66-05	\N	f
srhsync_01M6RV4JTTMDC0AT4DQVTT6WEM	15aad455-6cb6-453c-804a-da80e0fe3e5c	done	\N	prod_01M6RV433WTRZ4DGQ5HHJCEV93	16	2026-11-06 11:30:14.359-05	2026-11-06 11:30:14.667-05	\N	srhver_01M6Q02W0K9Z5XY9P8XYBE6WFS	2026-11-06 11:30:14.363-05	2026-11-06 11:30:14.669-05	\N	f
\.


--
-- Data for Name: search_index_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.search_index_version (id, version, provider, physical_name, definition_hash, status, search_index_id, created_at, updated_at, deleted_at) FROM stdin;
srhver_01M6Q02W0K9Z5XY9P8XYBE6WFS	1	search-postgres	product_v1	324ab6ef68362abc058dc1b556ccf9f4	ready	srhidx_01M6Q02W0DH4997EFP2Z84CB29	2026-11-05 18:18:12.244-05	2026-11-06 11:30:14.665-05	\N
\.


--
-- Data for Name: search_pg_product_v1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.search_pg_product_v1 (id, document, indexed, search_vector, search_text, created_at, updated_at) FROM stdin;
prod_01M6RV433V6XR5MWQQ2R2HZK77	{"id": "prod_01M6RV433V6XR5MWQQ2R2HZK77", "title": "Pan Artesanal Fresco de Masa Madre", "handle": "pan-artesanal-masa-madre", "labels": [], "status": "published", "category": ["Despensa y Abarrotes"], "thumbnail": "https://images.unsplash.com/photo-1509440159596-0249088772ff?auto=format&fit=crop&w=800&q=80", "created_at": "2026-11-06T16:29:58.286Z", "description": "Horneado todas las mañanas con fermentación lenta. Corteza dorada y miga suave para desayunos o restaurantes.", "on_sale_eur": false, "on_sale_usd": false, "max_price_eur": 21, "max_price_usd": 23, "min_price_eur": 2, "min_price_usd": 2, "option_values": ["Modalidad:Al Detal (Unidad)", "Modalidad:Al por Mayor (Caja / Bulto)"], "sales_channel_ids": ["sc_01M6Q03EJC9CS5HCFC8Y1GDNH1"], "original_price_eur": 2, "original_price_usd": 2}	{"id": "prod_01M6RV433V6XR5MWQQ2R2HZK77", "title": "Pan Artesanal Fresco de Masa Madre", "handle": "pan-artesanal-masa-madre", "status": "published", "category": ["Despensa y Abarrotes"], "thumbnail": "https://images.unsplash.com/photo-1509440159596-0249088772ff?auto=format&fit=crop&w=800&q=80", "created_at": 1793982598286, "description": "Horneado todas las mañanas con fermentación lenta. Corteza dorada y miga suave para desayunos o restaurantes.", "on_sale_eur": false, "on_sale_usd": false, "max_price_eur": 21, "max_price_usd": 23, "min_price_eur": 2, "min_price_usd": 2, "option_values": ["Modalidad:Al Detal (Unidad)", "Modalidad:Al por Mayor (Caja / Bulto)"], "sales_channel_ids": ["sc_01M6Q03EJC9CS5HCFC8Y1GDNH1"], "original_price_eur": 2, "original_price_usd": 2}	'al':24B,28B 'artesan':2A 'bulto':32B 'caja':31B 'con':11 'corteza':14 'de':4A 'desayuno':20 'detal':25B 'dorada':15 'fermentacion':12 'fresco':3A 'horneado':7 'las':9 'lenta':13 'madr':6A 'manana':10 'masa':5A 'mayor':30B 'miga':17 'modalidad':23B,27B 'o':21 'pan':1A 'para':19 'por':29B 'restaurant':22 'suav':18 'toda':8 'unidad':26B 'y':16	Pan Artesanal Fresco de Masa Madre Horneado todas las mañanas con fermentación lenta. Corteza dorada y miga suave para desayunos o restaurantes. Modalidad:Al Detal (Unidad) Modalidad:Al por Mayor (Caja / Bulto)	2026-11-06 11:30:14.517598-05	2026-11-07 11:59:50.576062-05
prod_01M6RV433VBXFP15V95A7WYZJ7	{"id": "prod_01M6RV433VBXFP15V95A7WYZJ7", "title": "Fresas Sabaneras Extra Dulces", "handle": "fresas-frescas-500g", "labels": [], "status": "published", "category": ["Frutas y Verduras"], "thumbnail": "https://images.unsplash.com/photo-1464965911861-746a04b4bca6?auto=format&fit=crop&w=800&q=80", "created_at": "2026-11-06T16:29:58.286Z", "description": "Fresas recién recolectadas de la Sabana de Bogotá, clasificadas y listas para jugo, postres o negocio.", "on_sale_eur": false, "on_sale_usd": false, "max_price_eur": 13, "max_price_usd": 14, "min_price_eur": 1, "min_price_usd": 1, "option_values": ["Modalidad:Al Detal (Unidad)", "Modalidad:Al por Mayor (Caja / Bulto)"], "sales_channel_ids": ["sc_01M6Q03EJC9CS5HCFC8Y1GDNH1"], "original_price_eur": 1, "original_price_usd": 1}	{"id": "prod_01M6RV433VBXFP15V95A7WYZJ7", "title": "Fresas Sabaneras Extra Dulces", "handle": "fresas-frescas-500g", "status": "published", "category": ["Frutas y Verduras"], "thumbnail": "https://images.unsplash.com/photo-1464965911861-746a04b4bca6?auto=format&fit=crop&w=800&q=80", "created_at": 1793982598286, "description": "Fresas recién recolectadas de la Sabana de Bogotá, clasificadas y listas para jugo, postres o negocio.", "on_sale_eur": false, "on_sale_usd": false, "max_price_eur": 13, "max_price_usd": 14, "min_price_eur": 1, "min_price_usd": 1, "option_values": ["Modalidad:Al Detal (Unidad)", "Modalidad:Al por Mayor (Caja / Bulto)"], "sales_channel_ids": ["sc_01M6Q03EJC9CS5HCFC8Y1GDNH1"], "original_price_eur": 1, "original_price_usd": 1}	'al':22B,26B 'bogota':12 'bulto':30B 'caja':29B 'clasificada':13 'de':8,11 'detal':23B 'dulc':4A 'extra':3A 'fresa':1A,5 'jugo':17 'la':9 'lista':15 'mayor':28B 'modalidad':21B,25B 'negocio':20 'o':19 'para':16 'por':27B 'postr':18 'recien':6 'recolectada':7 'sabana':10 'sabanera':2A 'unidad':24B 'y':14	Fresas Sabaneras Extra Dulces Fresas recién recolectadas de la Sabana de Bogotá, clasificadas y listas para jugo, postres o negocio. Modalidad:Al Detal (Unidad) Modalidad:Al por Mayor (Caja / Bulto)	2026-11-06 11:30:14.517598-05	2026-11-07 11:59:50.901104-05
prod_01M6RV433V8QZPH3PNVY46ZNEP	{"id": "prod_01M6RV433V8QZPH3PNVY46ZNEP", "title": "Café de Colombia Origen Huila Tostado", "handle": "cafe-grano-artesanal", "labels": [], "status": "published", "category": ["Despensa y Abarrotes"], "thumbnail": "https://images.unsplash.com/photo-1559056199-641a0ac8b55e?auto=format&fit=crop&w=800&q=80", "created_at": "2026-11-06T16:29:58.286Z", "description": "Café 100% Colombiano Excelso de altura con notas a panela y cacao. Disponible por libra o paca mayorista x 12 libras.", "on_sale_eur": false, "on_sale_usd": false, "max_price_eur": 51, "max_price_usd": 55, "min_price_eur": 5, "min_price_usd": 6, "option_values": ["Modalidad:Al Detal (Unidad)", "Modalidad:Al por Mayor (Caja / Bulto)"], "sales_channel_ids": ["sc_01M6Q03EJC9CS5HCFC8Y1GDNH1"], "original_price_eur": 5, "original_price_usd": 6}	{"id": "prod_01M6RV433V8QZPH3PNVY46ZNEP", "title": "Café de Colombia Origen Huila Tostado", "handle": "cafe-grano-artesanal", "status": "published", "category": ["Despensa y Abarrotes"], "thumbnail": "https://images.unsplash.com/photo-1559056199-641a0ac8b55e?auto=format&fit=crop&w=800&q=80", "created_at": 1793982598286, "description": "Café 100% Colombiano Excelso de altura con notas a panela y cacao. Disponible por libra o paca mayorista x 12 libras.", "on_sale_eur": false, "on_sale_usd": false, "max_price_eur": 51, "max_price_usd": 55, "min_price_eur": 5, "min_price_usd": 6, "option_values": ["Modalidad:Al Detal (Unidad)", "Modalidad:Al por Mayor (Caja / Bulto)"], "sales_channel_ids": ["sc_01M6Q03EJC9CS5HCFC8Y1GDNH1"], "original_price_eur": 5, "original_price_usd": 6}	'100':8 '12':26 'al':29B,33B 'altura':12 'bulto':37B 'cacao':18 'cafe':1A,7 'caja':36B 'colombia':3A 'colombiano':9 'con':13 'de':2A,11 'detal':30B 'dispon':19 'excelso':10 'huila':5A 'libra':21,27 'mayor':35B 'mayorista':24 'modalidad':28B,32B 'nota':14 'o':22 'origen':4A 'paca':23 'panela':16 'por':20,34B 'tostado':6A 'unidad':31B 'x':25 'y':17	Café de Colombia Origen Huila Tostado Café 100% Colombiano Excelso de altura con notas a panela y cacao. Disponible por libra o paca mayorista x 12 libras. Modalidad:Al Detal (Unidad) Modalidad:Al por Mayor (Caja / Bulto)	2026-11-06 11:30:14.517598-05	2026-11-07 11:59:50.730569-05
prod_01M6RV433VH280P701DXANFBRN	{"id": "prod_01M6RV433VH280P701DXANFBRN", "title": "Aceite Gourmet Vegetal / Oliva Extra", "handle": "aceite-oliva-virgen-extra", "labels": [], "status": "published", "category": ["Despensa y Abarrotes"], "thumbnail": "https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?auto=format&fit=crop&w=800&q=80", "created_at": "2026-11-06T16:29:58.286Z", "description": "Aceite puro libre de colesterol para cocina familiar o fritura limpia en restaurantes. Botella o caja cerrada.", "on_sale_eur": false, "on_sale_usd": false, "max_price_eur": 64, "max_price_usd": 69, "min_price_eur": 7, "min_price_usd": 7, "option_values": ["Modalidad:Al Detal (Unidad)", "Modalidad:Al por Mayor (Caja / Bulto)"], "sales_channel_ids": ["sc_01M6Q03EJC9CS5HCFC8Y1GDNH1"], "original_price_eur": 7, "original_price_usd": 7}	{"id": "prod_01M6RV433VH280P701DXANFBRN", "title": "Aceite Gourmet Vegetal / Oliva Extra", "handle": "aceite-oliva-virgen-extra", "status": "published", "category": ["Despensa y Abarrotes"], "thumbnail": "https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?auto=format&fit=crop&w=800&q=80", "created_at": 1793982598286, "description": "Aceite puro libre de colesterol para cocina familiar o fritura limpia en restaurantes. Botella o caja cerrada.", "on_sale_eur": false, "on_sale_usd": false, "max_price_eur": 64, "max_price_usd": 69, "min_price_eur": 7, "min_price_usd": 7, "option_values": ["Modalidad:Al Detal (Unidad)", "Modalidad:Al por Mayor (Caja / Bulto)"], "sales_channel_ids": ["sc_01M6Q03EJC9CS5HCFC8Y1GDNH1"], "original_price_eur": 7, "original_price_usd": 7}	'aceit':1A,6 'al':24B,28B 'botella':19 'bulto':32B 'caja':21,31B 'cerrada':22 'cocina':12 'colesterol':10 'de':9 'detal':25B 'en':17 'extra':5A 'familiar':13 'fritura':15 'gourmet':2A 'libr':8 'limpia':16 'mayor':30B 'modalidad':23B,27B 'o':14,20 'oliva':4A 'para':11 'por':29B 'puro':7 'restaurant':18 'unidad':26B 'veget':3A	Aceite Gourmet Vegetal / Oliva Extra Aceite puro libre de colesterol para cocina familiar o fritura limpia en restaurantes. Botella o caja cerrada. Modalidad:Al Detal (Unidad) Modalidad:Al por Mayor (Caja / Bulto)	2026-11-06 11:30:14.517598-05	2026-11-07 11:59:51.349844-05
prod_01M6RV433VXTN0Q3M4KFEPFEVY	{"id": "prod_01M6RV433VXTN0Q3M4KFEPFEVY", "title": "Aguacate Hass de Antioquia Seleccionado", "handle": "aguacate-hass-organico", "labels": [], "status": "published", "category": ["Frutas y Verduras"], "thumbnail": "https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?auto=format&fit=crop&w=800&q=80", "created_at": "2026-11-06T16:29:58.286Z", "description": "Aguacates Hass cremosos de exportación cultivados en el Oriente Antioqueño. Lleva por malla familiar o canastilla mayorista de 10kg.", "on_sale_eur": false, "on_sale_usd": false, "max_price_eur": 15, "max_price_usd": 17, "min_price_eur": 2, "min_price_usd": 2, "option_values": ["Modalidad:Al Detal (Unidad)", "Modalidad:Al por Mayor (Caja / Bulto)"], "sales_channel_ids": ["sc_01M6Q03EJC9CS5HCFC8Y1GDNH1"], "original_price_eur": 2, "original_price_usd": 2}	{"id": "prod_01M6RV433VXTN0Q3M4KFEPFEVY", "title": "Aguacate Hass de Antioquia Seleccionado", "handle": "aguacate-hass-organico", "status": "published", "category": ["Frutas y Verduras"], "thumbnail": "https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?auto=format&fit=crop&w=800&q=80", "created_at": 1793982598286, "description": "Aguacates Hass cremosos de exportación cultivados en el Oriente Antioqueño. Lleva por malla familiar o canastilla mayorista de 10kg.", "on_sale_eur": false, "on_sale_usd": false, "max_price_eur": 15, "max_price_usd": 17, "min_price_eur": 2, "min_price_usd": 2, "option_values": ["Modalidad:Al Detal (Unidad)", "Modalidad:Al por Mayor (Caja / Bulto)"], "sales_channel_ids": ["sc_01M6Q03EJC9CS5HCFC8Y1GDNH1"], "original_price_eur": 2, "original_price_usd": 2}	'10kg':24 'aguac':1A,6 'al':26B,30B 'antioqueno':15 'antioquia':4A 'bulto':34B 'caja':33B 'canastilla':21 'cremoso':8 'cultivado':11 'de':3A,9,23 'detal':27B 'el':13 'en':12 'exportacion':10 'familiar':19 'hass':2A,7 'lleva':16 'malla':18 'mayor':32B 'mayorista':22 'modalidad':25B,29B 'o':20 'orient':14 'por':17,31B 'seleccionado':5A 'unidad':28B	Aguacate Hass de Antioquia Seleccionado Aguacates Hass cremosos de exportación cultivados en el Oriente Antioqueño. Lleva por malla familiar o canastilla mayorista de 10kg. Modalidad:Al Detal (Unidad) Modalidad:Al por Mayor (Caja / Bulto)	2026-11-06 11:30:14.517598-05	2026-11-07 11:59:51.931504-05
prod_01M6RV433W5X97CNW0881T4HVS	{"id": "prod_01M6RV433W5X97CNW0881T4HVS", "title": "Huevos Rojos Camperos AA", "handle": "huevos-camperos-docena", "labels": [], "status": "published", "category": ["Lácteos y Huevos"], "thumbnail": "https://images.unsplash.com/photo-1582722872445-44dc5f7e3c8f?auto=format&fit=crop&w=800&q=80", "created_at": "2026-11-06T16:29:58.286Z", "description": "Huevos frescos AA de granja avícola colombiana. Llévalos por cubeta de 30 unidades o caja mayorista de 12 cubetas (360 uds).", "on_sale_eur": false, "on_sale_usd": false, "max_price_eur": 38, "max_price_usd": 41, "min_price_eur": 4, "min_price_usd": 4, "option_values": ["Modalidad:Al Detal (Unidad)", "Modalidad:Al por Mayor (Caja / Bulto)"], "sales_channel_ids": ["sc_01M6Q03EJC9CS5HCFC8Y1GDNH1"], "original_price_eur": 4, "original_price_usd": 4}	{"id": "prod_01M6RV433W5X97CNW0881T4HVS", "title": "Huevos Rojos Camperos AA", "handle": "huevos-camperos-docena", "status": "published", "category": ["Lácteos y Huevos"], "thumbnail": "https://images.unsplash.com/photo-1582722872445-44dc5f7e3c8f?auto=format&fit=crop&w=800&q=80", "created_at": 1793982598286, "description": "Huevos frescos AA de granja avícola colombiana. Llévalos por cubeta de 30 unidades o caja mayorista de 12 cubetas (360 uds).", "on_sale_eur": false, "on_sale_usd": false, "max_price_eur": 38, "max_price_usd": 41, "min_price_eur": 4, "min_price_usd": 4, "option_values": ["Modalidad:Al Detal (Unidad)", "Modalidad:Al por Mayor (Caja / Bulto)"], "sales_channel_ids": ["sc_01M6Q03EJC9CS5HCFC8Y1GDNH1"], "original_price_eur": 4, "original_price_usd": 4}	'12':22 '30':16 '360':24 'aa':4A,7 'al':27B,31B 'avicola':10 'bulto':35B 'caja':19,34B 'campero':3A 'colombiana':11 'cubeta':14,23 'de':8,15,21 'detal':28B 'fresco':6 'granja':9 'huevo':1A,5 'llevalo':12 'mayor':33B 'mayorista':20 'modalidad':26B,30B 'o':18 'por':13,32B 'rojo':2A 'ud':25 'unidad':17,29B	Huevos Rojos Camperos AA Huevos frescos AA de granja avícola colombiana. Llévalos por cubeta de 30 unidades o caja mayorista de 12 cubetas (360 uds). Modalidad:Al Detal (Unidad) Modalidad:Al por Mayor (Caja / Bulto)	2026-11-06 11:30:14.517598-05	2026-11-07 11:59:52.153373-05
prod_01M6RV433W9FM6BGE5SP0V9VXE	{"id": "prod_01M6RV433W9FM6BGE5SP0V9VXE", "title": "Agua Manantial de Páramo Sin Gas", "handle": "agua-mineral-manantial", "labels": [], "status": "published", "category": ["Bebidas y Licores"], "thumbnail": "https://images.unsplash.com/photo-1548839140-29a749e1cf4d?auto=format&fit=crop&w=800&q=80", "created_at": "2026-11-06T16:29:58.286Z", "description": "Agua cristalina de manantial colombiano en botella individual o paca termoencogida para tiendas y eventos.", "on_sale_eur": false, "on_sale_usd": false, "max_price_eur": 6, "max_price_usd": 7, "min_price_eur": 1, "min_price_usd": 1, "option_values": ["Modalidad:Al Detal (Unidad)", "Modalidad:Al por Mayor (Caja / Bulto)"], "sales_channel_ids": ["sc_01M6Q03EJC9CS5HCFC8Y1GDNH1"], "original_price_eur": 1, "original_price_usd": 1}	{"id": "prod_01M6RV433W9FM6BGE5SP0V9VXE", "title": "Agua Manantial de Páramo Sin Gas", "handle": "agua-mineral-manantial", "status": "published", "category": ["Bebidas y Licores"], "thumbnail": "https://images.unsplash.com/photo-1548839140-29a749e1cf4d?auto=format&fit=crop&w=800&q=80", "created_at": 1793982598286, "description": "Agua cristalina de manantial colombiano en botella individual o paca termoencogida para tiendas y eventos.", "on_sale_eur": false, "on_sale_usd": false, "max_price_eur": 6, "max_price_usd": 7, "min_price_eur": 1, "min_price_usd": 1, "option_values": ["Modalidad:Al Detal (Unidad)", "Modalidad:Al por Mayor (Caja / Bulto)"], "sales_channel_ids": ["sc_01M6Q03EJC9CS5HCFC8Y1GDNH1"], "original_price_eur": 1, "original_price_usd": 1}	'agua':1A,7 'al':23B,27B 'botella':13 'bulto':31B 'caja':30B 'colombiano':11 'cristalina':8 'de':3A,9 'detal':24B 'en':12 'evento':21 'gas':6A 'individu':14 'mananti':2A,10 'mayor':29B 'modalidad':22B,26B 'o':15 'paca':16 'para':18 'paramo':4A 'por':28B 'sin':5A 'termoencogida':17 'tienda':19 'unidad':25B 'y':20	Agua Manantial de Páramo Sin Gas Agua cristalina de manantial colombiano en botella individual o paca termoencogida para tiendas y eventos. Modalidad:Al Detal (Unidad) Modalidad:Al por Mayor (Caja / Bulto)	2026-11-06 11:30:14.517598-05	2026-11-07 11:59:52.314399-05
prod_01M6RV433WFGYYK1YXC74TA0VY	{"id": "prod_01M6RV433WFGYYK1YXC74TA0VY", "title": "Detergente Líquido Concentrado Multiusos", "handle": "detergente-liquido-ecologico", "labels": [], "status": "published", "category": ["Aseo y Hogar"], "thumbnail": "https://images.unsplash.com/photo-1583947215259-38e31be8751f?auto=format&fit=crop&w=800&q=80", "created_at": "2026-11-06T16:29:58.287Z", "description": "Máximo poder desmanchador y fragancia fresca duradera. Disponible en galón para hogar o pimpina institucional.", "on_sale_eur": false, "on_sale_usd": false, "max_price_eur": 49, "max_price_usd": 53, "min_price_eur": 5, "min_price_usd": 6, "option_values": ["Modalidad:Al Detal (Unidad)", "Modalidad:Al por Mayor (Caja / Bulto)"], "sales_channel_ids": ["sc_01M6Q03EJC9CS5HCFC8Y1GDNH1"], "original_price_eur": 5, "original_price_usd": 6}	{"id": "prod_01M6RV433WFGYYK1YXC74TA0VY", "title": "Detergente Líquido Concentrado Multiusos", "handle": "detergente-liquido-ecologico", "status": "published", "category": ["Aseo y Hogar"], "thumbnail": "https://images.unsplash.com/photo-1583947215259-38e31be8751f?auto=format&fit=crop&w=800&q=80", "created_at": 1793982598287, "description": "Máximo poder desmanchador y fragancia fresca duradera. Disponible en galón para hogar o pimpina institucional.", "on_sale_eur": false, "on_sale_usd": false, "max_price_eur": 49, "max_price_usd": 53, "min_price_eur": 5, "min_price_usd": 6, "option_values": ["Modalidad:Al Detal (Unidad)", "Modalidad:Al por Mayor (Caja / Bulto)"], "sales_channel_ids": ["sc_01M6Q03EJC9CS5HCFC8Y1GDNH1"], "original_price_eur": 5, "original_price_usd": 6}	'al':21B,25B 'bulto':29B 'caja':28B 'concentrado':3A 'desmanchador':7 'detal':22B 'detergent':1A 'dispon':12 'duradera':11 'en':13 'fragancia':9 'fresca':10 'galon':14 'hogar':16 'institucion':19 'liquido':2A 'maximo':5 'mayor':27B 'modalidad':20B,24B 'multiuso':4A 'o':17 'para':15 'pimpina':18 'poder':6 'por':26B 'unidad':23B 'y':8	Detergente Líquido Concentrado Multiusos Máximo poder desmanchador y fragancia fresca duradera. Disponible en galón para hogar o pimpina institucional. Modalidad:Al Detal (Unidad) Modalidad:Al por Mayor (Caja / Bulto)	2026-11-06 11:30:14.517598-05	2026-11-07 11:59:52.710207-05
prod_01M6RV433WHK3TK8WS4BB3NCD0	{"id": "prod_01M6RV433WHK3TK8WS4BB3NCD0", "title": "Pechuga de Pollo Campesino Sin Hueso", "handle": "pechuga-pollo-fresca", "labels": [], "status": "published", "category": ["Carnes y Charcutería"], "thumbnail": "https://images.unsplash.com/photo-1604503468506-a8da13d82791?auto=format&fit=crop&w=800&q=80", "created_at": "2026-11-06T16:29:58.286Z", "description": "Filetes de pechuga fresca limpia sin marinado artificial. Ideal para el mercado semanal o asaderos y restaurantes.", "on_sale_eur": false, "on_sale_usd": false, "max_price_eur": 37, "max_price_usd": 40, "min_price_eur": 4, "min_price_usd": 4, "option_values": ["Modalidad:Al Detal (Unidad)", "Modalidad:Al por Mayor (Caja / Bulto)"], "sales_channel_ids": ["sc_01M6Q03EJC9CS5HCFC8Y1GDNH1"], "original_price_eur": 4, "original_price_usd": 4}	{"id": "prod_01M6RV433WHK3TK8WS4BB3NCD0", "title": "Pechuga de Pollo Campesino Sin Hueso", "handle": "pechuga-pollo-fresca", "status": "published", "category": ["Carnes y Charcutería"], "thumbnail": "https://images.unsplash.com/photo-1604503468506-a8da13d82791?auto=format&fit=crop&w=800&q=80", "created_at": 1793982598286, "description": "Filetes de pechuga fresca limpia sin marinado artificial. Ideal para el mercado semanal o asaderos y restaurantes.", "on_sale_eur": false, "on_sale_usd": false, "max_price_eur": 37, "max_price_usd": 40, "min_price_eur": 4, "min_price_usd": 4, "option_values": ["Modalidad:Al Detal (Unidad)", "Modalidad:Al por Mayor (Caja / Bulto)"], "sales_channel_ids": ["sc_01M6Q03EJC9CS5HCFC8Y1GDNH1"], "original_price_eur": 4, "original_price_usd": 4}	'al':25B,29B 'artifici':14 'asadero':21 'bulto':33B 'caja':32B 'campesino':4A 'de':2A,8 'detal':26B 'el':17 'filet':7 'fresca':10 'hueso':6A 'ideal':15 'limpia':11 'marinado':13 'mayor':31B 'mercado':18 'modalidad':24B,28B 'o':20 'para':16 'pechuga':1A,9 'pollo':3A 'por':30B 'restaurant':23 'seman':19 'sin':5A,12 'unidad':27B 'y':22	Pechuga de Pollo Campesino Sin Hueso Filetes de pechuga fresca limpia sin marinado artificial. Ideal para el mercado semanal o asaderos y restaurantes. Modalidad:Al Detal (Unidad) Modalidad:Al por Mayor (Caja / Bulto)	2026-11-06 11:30:14.517598-05	2026-11-07 11:59:52.917443-05
prod_01M6RV433WKGNMKY7EYCP575XW	{"id": "prod_01M6RV433WKGNMKY7EYCP575XW", "title": "Papel Higiénico Triple Hoja Rinde Más", "handle": "papel-higienico-triple-hoja", "labels": [], "status": "published", "category": ["Aseo y Hogar"], "thumbnail": "https://images.unsplash.com/photo-1584556812952-905ffd0c611a?auto=format&fit=crop&w=800&q=80", "created_at": "2026-11-06T16:29:58.287Z", "description": "Suavidad acolchada con extracto de algodón y metraje extra. Paquete familiar o paca distribuidora.", "on_sale_eur": false, "on_sale_usd": false, "max_price_eur": 42, "max_price_usd": 46, "min_price_eur": 5, "min_price_usd": 5, "option_values": ["Modalidad:Al Detal (Unidad)", "Modalidad:Al por Mayor (Caja / Bulto)"], "sales_channel_ids": ["sc_01M6Q03EJC9CS5HCFC8Y1GDNH1"], "original_price_eur": 5, "original_price_usd": 5}	{"id": "prod_01M6RV433WKGNMKY7EYCP575XW", "title": "Papel Higiénico Triple Hoja Rinde Más", "handle": "papel-higienico-triple-hoja", "status": "published", "category": ["Aseo y Hogar"], "thumbnail": "https://images.unsplash.com/photo-1584556812952-905ffd0c611a?auto=format&fit=crop&w=800&q=80", "created_at": 1793982598287, "description": "Suavidad acolchada con extracto de algodón y metraje extra. Paquete familiar o paca distribuidora.", "on_sale_eur": false, "on_sale_usd": false, "max_price_eur": 42, "max_price_usd": 46, "min_price_eur": 5, "min_price_usd": 5, "option_values": ["Modalidad:Al Detal (Unidad)", "Modalidad:Al por Mayor (Caja / Bulto)"], "sales_channel_ids": ["sc_01M6Q03EJC9CS5HCFC8Y1GDNH1"], "original_price_eur": 5, "original_price_usd": 5}	'acolchada':8 'al':22B,26B 'algodon':12 'bulto':30B 'caja':29B 'con':9 'de':11 'detal':23B 'distribuidora':20 'extra':15 'extracto':10 'familiar':17 'higienico':2A 'hoja':4A 'mas':6A 'mayor':28B 'metraj':14 'modalidad':21B,25B 'o':18 'paca':19 'papel':1A 'paquet':16 'por':27B 'rind':5A 'suavidad':7 'tripl':3A 'unidad':24B 'y':13	Papel Higiénico Triple Hoja Rinde Más Suavidad acolchada con extracto de algodón y metraje extra. Paquete familiar o paca distribuidora. Modalidad:Al Detal (Unidad) Modalidad:Al por Mayor (Caja / Bulto)	2026-11-06 11:30:14.517598-05	2026-11-07 11:59:53.100955-05
prod_01M6RV433WSANFXX1A1XPDAKKT	{"id": "prod_01M6RV433WSANFXX1A1XPDAKKT", "title": "Churrasco / Lomo de Res Madurado", "handle": "lomo-res-madurado", "labels": [], "status": "published", "category": ["Carnes y Charcutería"], "thumbnail": "https://images.unsplash.com/photo-1607623814075-e51df1bdc82f?auto=format&fit=crop&w=800&q=80", "created_at": "2026-11-06T16:29:58.286Z", "description": "Corte premium de ganado seleccionado en los Llanos y Córdoba, empacado al vacío con cadena de frío garantizada.", "on_sale_eur": false, "on_sale_usd": false, "max_price_eur": 60, "max_price_usd": 65, "min_price_eur": 6, "min_price_usd": 7, "option_values": ["Modalidad:Al Detal (Unidad)", "Modalidad:Al por Mayor (Caja / Bulto)"], "sales_channel_ids": ["sc_01M6Q03EJC9CS5HCFC8Y1GDNH1"], "original_price_eur": 6, "original_price_usd": 7}	{"id": "prod_01M6RV433WSANFXX1A1XPDAKKT", "title": "Churrasco / Lomo de Res Madurado", "handle": "lomo-res-madurado", "status": "published", "category": ["Carnes y Charcutería"], "thumbnail": "https://images.unsplash.com/photo-1607623814075-e51df1bdc82f?auto=format&fit=crop&w=800&q=80", "created_at": 1793982598286, "description": "Corte premium de ganado seleccionado en los Llanos y Córdoba, empacado al vacío con cadena de frío garantizada.", "on_sale_eur": false, "on_sale_usd": false, "max_price_eur": 60, "max_price_usd": 65, "min_price_eur": 6, "min_price_usd": 7, "option_values": ["Modalidad:Al Detal (Unidad)", "Modalidad:Al por Mayor (Caja / Bulto)"], "sales_channel_ids": ["sc_01M6Q03EJC9CS5HCFC8Y1GDNH1"], "original_price_eur": 6, "original_price_usd": 7}	'al':17,25B,29B 'bulto':33B 'cadena':20 'caja':32B 'churrasco':1A 'con':19 'cordoba':15 'cort':6 'de':3A,8,21 'detal':26B 'empacado':16 'en':11 'frio':22 'ganado':9 'garantizada':23 'llano':13 'lomo':2A 'los':12 'madurado':5A 'mayor':31B 'modalidad':24B,28B 'por':30B 'premium':7 'res':4A 'seleccionado':10 'unidad':27B 'vacio':18 'y':14	Churrasco / Lomo de Res Madurado Corte premium de ganado seleccionado en los Llanos y Córdoba, empacado al vacío con cadena de frío garantizada. Modalidad:Al Detal (Unidad) Modalidad:Al por Mayor (Caja / Bulto)	2026-11-06 11:30:14.517598-05	2026-11-07 11:59:53.270677-05
prod_01M6RV433V2SMZXSHC9ET34Q7P	{"id": "prod_01M6RV433V2SMZXSHC9ET34Q7P", "title": "Banano Urabá Tipo Exportación", "handle": "banano-organico-exportacion", "labels": [], "status": "published", "category": ["Frutas y Verduras"], "thumbnail": "https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?auto=format&fit=crop&w=800&q=80", "created_at": "2026-11-06T16:29:58.286Z", "description": "Bananos dulces ricos en potasio de Urabá. Disponibles por mano familiar o caja cerrada para tiendas y restaurantes.", "on_sale_eur": false, "on_sale_usd": false, "max_price_eur": 3, "max_price_usd": 3, "min_price_eur": 1, "min_price_usd": 1, "option_values": ["Modalidad:Al Detal (Unidad)", "Modalidad:Al por Mayor (Caja / Bulto)"], "sales_channel_ids": ["sc_01M6Q03EJC9CS5HCFC8Y1GDNH1"], "original_price_eur": 1, "original_price_usd": 1}	{"id": "prod_01M6RV433V2SMZXSHC9ET34Q7P", "title": "Banano Urabá Tipo Exportación", "handle": "banano-organico-exportacion", "status": "published", "category": ["Frutas y Verduras"], "thumbnail": "https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?auto=format&fit=crop&w=800&q=80", "created_at": 1793982598286, "description": "Bananos dulces ricos en potasio de Urabá. Disponibles por mano familiar o caja cerrada para tiendas y restaurantes.", "on_sale_eur": false, "on_sale_usd": false, "max_price_eur": 3, "max_price_usd": 3, "min_price_eur": 1, "min_price_usd": 1, "option_values": ["Modalidad:Al Detal (Unidad)", "Modalidad:Al por Mayor (Caja / Bulto)"], "sales_channel_ids": ["sc_01M6Q03EJC9CS5HCFC8Y1GDNH1"], "original_price_eur": 1, "original_price_usd": 1}	'al':24B,28B 'banano':1A,5 'bulto':32B 'caja':17,31B 'cerrada':18 'de':10 'detal':25B 'dispon':12 'dulc':6 'en':8 'exportacion':4A 'familiar':15 'mano':14 'mayor':30B 'modalidad':23B,27B 'o':16 'para':19 'por':13,29B 'potasio':9 'restaurant':22 'rico':7 'tienda':20 'tipo':3A 'unidad':26B 'uraba':2A,11 'y':21	Banano Urabá Tipo Exportación Bananos dulces ricos en potasio de Urabá. Disponibles por mano familiar o caja cerrada para tiendas y restaurantes. Modalidad:Al Detal (Unidad) Modalidad:Al por Mayor (Caja / Bulto)	2026-11-06 11:30:14.517598-05	2026-11-07 11:59:50.241842-05
prod_01M6RV433WTRZ4DGQ5HHJCEV93	{"id": "prod_01M6RV433WTRZ4DGQ5HHJCEV93", "title": "Jugo de Naranja Tangelo 100% Natural", "handle": "jugo-naranja-exprimido", "labels": [], "status": "published", "category": ["Bebidas y Licores"], "thumbnail": "https://images.unsplash.com/photo-1600271886742-f049cd451bba?auto=format&fit=crop&w=800&q=80", "created_at": "2026-11-06T16:29:58.286Z", "description": "Exprimido de naranjas frescas del Eje Cafetero sin azúcar añadida ni conservantes.", "on_sale_eur": false, "on_sale_usd": false, "max_price_eur": 28, "max_price_usd": 32, "min_price_eur": 3, "min_price_usd": 3, "option_values": ["Modalidad:Al Detal (Unidad)", "Modalidad:Al por Mayor (Caja / Bulto)"], "sales_channel_ids": ["sc_01M6Q03EJC9CS5HCFC8Y1GDNH1"], "original_price_eur": 3, "original_price_usd": 3}	{"id": "prod_01M6RV433WTRZ4DGQ5HHJCEV93", "title": "Jugo de Naranja Tangelo 100% Natural", "handle": "jugo-naranja-exprimido", "status": "published", "category": ["Bebidas y Licores"], "thumbnail": "https://images.unsplash.com/photo-1600271886742-f049cd451bba?auto=format&fit=crop&w=800&q=80", "created_at": 1793982598286, "description": "Exprimido de naranjas frescas del Eje Cafetero sin azúcar añadida ni conservantes.", "on_sale_eur": false, "on_sale_usd": false, "max_price_eur": 28, "max_price_usd": 32, "min_price_eur": 3, "min_price_usd": 3, "option_values": ["Modalidad:Al Detal (Unidad)", "Modalidad:Al por Mayor (Caja / Bulto)"], "sales_channel_ids": ["sc_01M6Q03EJC9CS5HCFC8Y1GDNH1"], "original_price_eur": 3, "original_price_usd": 3}	'100':5A 'al':20B,24B 'anadida':16 'azucar':15 'bulto':28B 'cafetero':13 'caja':27B 'conservant':18 'de':2A,8 'del':11 'detal':21B 'eje':12 'exprimido':7 'fresca':10 'jugo':1A 'mayor':26B 'modalidad':19B,23B 'naranja':3A,9 'natur':6A 'ni':17 'por':25B 'sin':14 'tangelo':4A 'unidad':22B	Jugo de Naranja Tangelo 100% Natural Exprimido de naranjas frescas del Eje Cafetero sin azúcar añadida ni conservantes. Modalidad:Al Detal (Unidad) Modalidad:Al por Mayor (Caja / Bulto)	2026-11-06 11:30:14.517598-05	2026-11-07 11:59:53.327315-05
prod_01M6RV433VFVQK8CJ13HYDBF8C	{"id": "prod_01M6RV433VFVQK8CJ13HYDBF8C", "title": "Leche Entera de la Sabana UHT", "handle": "leche-entera-fresca-1l", "labels": [], "status": "published", "category": ["Lácteos y Huevos"], "thumbnail": "https://images.unsplash.com/photo-1563636619-e9143da7973b?auto=format&fit=crop&w=800&q=80", "created_at": "2026-11-06T16:29:58.286Z", "description": "Leche 100% pura de vaca de hatos certificados en Cundinamarca y Antioquia. Venta por bolsa/caja o paca x 12 litros.", "on_sale_eur": false, "on_sale_usd": false, "max_price_eur": 11, "max_price_usd": 12, "min_price_eur": 1, "min_price_usd": 1, "option_values": ["Modalidad:Al Detal (Unidad)", "Modalidad:Al por Mayor (Caja / Bulto)"], "sales_channel_ids": ["sc_01M6Q03EJC9CS5HCFC8Y1GDNH1"], "original_price_eur": 1, "original_price_usd": 1}	{"id": "prod_01M6RV433VFVQK8CJ13HYDBF8C", "title": "Leche Entera de la Sabana UHT", "handle": "leche-entera-fresca-1l", "status": "published", "category": ["Lácteos y Huevos"], "thumbnail": "https://images.unsplash.com/photo-1563636619-e9143da7973b?auto=format&fit=crop&w=800&q=80", "created_at": 1793982598286, "description": "Leche 100% pura de vaca de hatos certificados en Cundinamarca y Antioquia. Venta por bolsa/caja o paca x 12 litros.", "on_sale_eur": false, "on_sale_usd": false, "max_price_eur": 11, "max_price_usd": 12, "min_price_eur": 1, "min_price_usd": 1, "option_values": ["Modalidad:Al Detal (Unidad)", "Modalidad:Al por Mayor (Caja / Bulto)"], "sales_channel_ids": ["sc_01M6Q03EJC9CS5HCFC8Y1GDNH1"], "original_price_eur": 1, "original_price_usd": 1}	'100':8 '12':25 'al':28B,32B 'antioquia':18 'bolsa/caja':21 'bulto':36B 'caja':35B 'certificado':14 'cundinamarca':16 'de':3A,10,12 'detal':29B 'en':15 'entera':2A 'hato':13 'la':4A 'lech':1A,7 'litro':26 'mayor':34B 'modalidad':27B,31B 'o':22 'paca':23 'por':20,33B 'pura':9 'sabana':5A 'uht':6A 'unidad':30B 'vaca':11 'venta':19 'x':24 'y':17	Leche Entera de la Sabana UHT Leche 100% pura de vaca de hatos certificados en Cundinamarca y Antioquia. Venta por bolsa/caja o paca x 12 litros. Modalidad:Al Detal (Unidad) Modalidad:Al por Mayor (Caja / Bulto)	2026-11-06 11:30:14.517598-05	2026-11-07 11:59:51.059268-05
prod_01M6RV433WAC11MFF8J8MYGGXV	{"id": "prod_01M6RV433WAC11MFF8J8MYGGXV", "title": "Queso Doble Crema / Mozzarella Tajado", "handle": "queso-mozzarella-fresco", "labels": [], "status": "published", "category": ["Lácteos y Huevos"], "thumbnail": "https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?auto=format&fit=crop&w=800&q=80", "created_at": "2026-11-06T16:29:58.286Z", "description": "Queso fresco colombiano de hilado suave que estira perfecto en arepas, sanduches, pizzas y panadería.", "on_sale_eur": false, "on_sale_usd": false, "max_price_eur": 32, "max_price_usd": 35, "min_price_eur": 3, "min_price_usd": 4, "option_values": ["Modalidad:Al Detal (Unidad)", "Modalidad:Al por Mayor (Caja / Bulto)"], "sales_channel_ids": ["sc_01M6Q03EJC9CS5HCFC8Y1GDNH1"], "original_price_eur": 3, "original_price_usd": 4}	{"id": "prod_01M6RV433WAC11MFF8J8MYGGXV", "title": "Queso Doble Crema / Mozzarella Tajado", "handle": "queso-mozzarella-fresco", "status": "published", "category": ["Lácteos y Huevos"], "thumbnail": "https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?auto=format&fit=crop&w=800&q=80", "created_at": 1793982598286, "description": "Queso fresco colombiano de hilado suave que estira perfecto en arepas, sanduches, pizzas y panadería.", "on_sale_eur": false, "on_sale_usd": false, "max_price_eur": 32, "max_price_usd": 35, "min_price_eur": 3, "min_price_usd": 4, "option_values": ["Modalidad:Al Detal (Unidad)", "Modalidad:Al por Mayor (Caja / Bulto)"], "sales_channel_ids": ["sc_01M6Q03EJC9CS5HCFC8Y1GDNH1"], "original_price_eur": 3, "original_price_usd": 4}	'al':22B,26B 'arepa':16 'bulto':30B 'caja':29B 'colombiano':8 'crema':3A 'de':9 'detal':23B 'dobl':2A 'en':15 'estira':13 'fresco':7 'hilado':10 'mayor':28B 'modalidad':21B,25B 'mozzarella':4A 'panaderia':20 'perfecto':14 'pizza':18 'por':27B 'que':12 'queso':1A,6 'sanduch':17 'suav':11 'tajado':5A 'unidad':24B 'y':19	Queso Doble Crema / Mozzarella Tajado Queso fresco colombiano de hilado suave que estira perfecto en arepas, sanduches, pizzas y panadería. Modalidad:Al Detal (Unidad) Modalidad:Al por Mayor (Caja / Bulto)	2026-11-06 11:30:14.517598-05	2026-11-07 11:59:52.50551-05
prod_01M6RV433V3S45S2XK53QKXJG7	{"id": "prod_01M6RV433V3S45S2XK53QKXJG7", "title": "Arroz Blanco del Tolima Grano Entero", "handle": "arroz-blanco-extra-grano", "labels": [], "status": "published", "category": ["Despensa y Abarrotes"], "thumbnail": "https://images.unsplash.com/photo-1586201375761-83865001e31c?auto=format&fit=crop&w=800&q=80", "created_at": "2026-11-06T16:29:58.286Z", "description": "Arroz colombiano seleccionado que crece y queda suelto. Lleva por kilo o por arroba/paca mayorista de 25 bolsas.", "on_sale_eur": false, "on_sale_usd": false, "max_price_eur": 177, "max_price_usd": 191, "min_price_eur": 20, "min_price_usd": 21, "option_values": ["Modalidad:Al Detal (Unidad)", "Modalidad:Al por Mayor (Caja / Bulto)"], "sales_channel_ids": ["sc_01M6Q03EJC9CS5HCFC8Y1GDNH1"], "original_price_eur": 20, "original_price_usd": 21}	{"id": "prod_01M6RV433V3S45S2XK53QKXJG7", "title": "Arroz Blanco del Tolima Grano Entero", "handle": "arroz-blanco-extra-grano", "status": "published", "category": ["Despensa y Abarrotes"], "thumbnail": "https://images.unsplash.com/photo-1586201375761-83865001e31c?auto=format&fit=crop&w=800&q=80", "created_at": 1793982598286, "description": "Arroz colombiano seleccionado que crece y queda suelto. Lleva por kilo o por arroba/paca mayorista de 25 bolsas.", "on_sale_eur": false, "on_sale_usd": false, "max_price_eur": 177, "max_price_usd": 191, "min_price_eur": 20, "min_price_usd": 21, "option_values": ["Modalidad:Al Detal (Unidad)", "Modalidad:Al por Mayor (Caja / Bulto)"], "sales_channel_ids": ["sc_01M6Q03EJC9CS5HCFC8Y1GDNH1"], "original_price_eur": 20, "original_price_usd": 21}	'25':23 'al':26B,30B 'arroba/paca':20 'arroz':1A,7 'blanco':2A 'bolsa':24 'bulto':34B 'caja':33B 'colombiano':8 'crece':11 'de':22 'del':3A 'detal':27B 'entero':6A 'grano':5A 'kilo':17 'lleva':15 'mayor':32B 'mayorista':21 'modalidad':25B,29B 'o':18 'por':16,19,31B 'que':10 'queda':13 'seleccionado':9 'suelto':14 'tolima':4A 'unidad':28B 'y':12	Arroz Blanco del Tolima Grano Entero Arroz colombiano seleccionado que crece y queda suelto. Lleva por kilo o por arroba/paca mayorista de 25 bolsas. Modalidad:Al Detal (Unidad) Modalidad:Al por Mayor (Caja / Bulto)	2026-11-06 11:30:14.517598-05	2026-11-07 12:44:41.73064-05
prod_01M6VRP832RAWH9B74NB480E0K	{"id": "prod_01M6VRP832RAWH9B74NB480E0K", "title": "Aceite Premier Puro Girasol", "handle": "aceite-premier-puro-girasol-721", "labels": [], "status": "published", "category": ["Aseo y Hogar"], "thumbnail": "https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?auto=format&fit=crop&w=800&q=80", "created_at": "2026-11-07T19:45:10.759Z", "description": "Producto fresco disponible al detal y por mayor.", "on_sale_eur": false, "on_sale_usd": false, "max_price_eur": 1, "max_price_usd": 1, "min_price_eur": 1, "min_price_usd": 1, "option_values": ["Modalidad:Al Detal (Unidad)", "Modalidad:Al por Mayor (Caja / Bulto)"], "sales_channel_ids": ["sc_01M6Q03EJC9CS5HCFC8Y1GDNH1"], "original_price_eur": 1, "original_price_usd": 1}	{"id": "prod_01M6VRP832RAWH9B74NB480E0K", "title": "Aceite Premier Puro Girasol", "handle": "aceite-premier-puro-girasol-721", "status": "published", "category": ["Aseo y Hogar"], "thumbnail": "https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?auto=format&fit=crop&w=800&q=80", "created_at": 1794080710759, "description": "Producto fresco disponible al detal y por mayor.", "on_sale_eur": false, "on_sale_usd": false, "max_price_eur": 1, "max_price_usd": 1, "min_price_eur": 1, "min_price_usd": 1, "option_values": ["Modalidad:Al Detal (Unidad)", "Modalidad:Al por Mayor (Caja / Bulto)"], "sales_channel_ids": ["sc_01M6Q03EJC9CS5HCFC8Y1GDNH1"], "original_price_eur": 1, "original_price_usd": 1}	'aceit':1A 'al':8,14B,18B 'bulto':22B 'caja':21B 'detal':9,15B 'dispon':7 'fresco':6 'girasol':4A 'mayor':12,20B 'modalidad':13B,17B 'por':11,19B 'premier':2A 'producto':5 'puro':3A 'unidad':16B 'y':10	Aceite Premier Puro Girasol Producto fresco disponible al detal y por mayor. Modalidad:Al Detal (Unidad) Modalidad:Al por Mayor (Caja / Bulto)	2026-11-07 14:45:11.27803-05	2026-11-07 14:45:11.279148-05
\.


--
-- Data for Name: search_postgres_index; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.search_postgres_index (name, table_name, schema_hash, plan, document_count, created_at, updated_at) FROM stdin;
product_v1	search_pg_product_v1	6a867764af1115440210b465fe11db3c1627a9a818c408f9b3c16e778b4b4b40	{"fields": [{"kind": "keyword", "path": "id", "field": {"type": "keyword", "filterable": true, "retrievable": true}, "is_date": false, "is_array": false}, {"kind": "keyword", "path": "status", "field": {"type": "keyword", "filterable": true, "retrievable": false}, "is_date": false, "is_array": false}, {"kind": "keyword", "path": "sales_channel_ids", "field": {"type": "keyword", "array": true, "filterable": true, "retrievable": false}, "is_date": false, "is_array": true}, {"kind": "text", "path": "title", "field": {"type": "text", "sortable": true, "searchable": {"weight": 3}, "retrievable": true}, "is_date": false, "is_array": false}, {"kind": "text", "path": "description", "field": {"type": "text", "searchable": {"weight": 1}}, "is_date": false, "is_array": false}, {"kind": "keyword", "path": "handle", "field": {"type": "keyword", "retrievable": true}, "is_date": false, "is_array": false}, {"kind": "keyword", "path": "thumbnail", "field": {"type": "keyword", "retrievable": true}, "is_date": false, "is_array": false}, {"kind": "number", "path": "created_at", "field": {"type": "date", "sortable": true, "retrievable": true}, "is_date": true, "is_array": false}, {"kind": "keyword", "path": "category", "field": {"type": "keyword", "array": true, "facetable": true, "filterable": true, "retrievable": true}, "is_date": false, "is_array": true}, {"kind": "keyword", "path": "labels", "field": {"type": "keyword", "array": true, "facetable": true, "filterable": true, "retrievable": true}, "is_date": false, "is_array": true}, {"kind": "keyword", "path": "option_values", "field": {"type": "keyword", "array": true, "facetable": true, "filterable": true, "searchable": {"weight": 2}, "retrievable": true}, "is_date": false, "is_array": true}, {"kind": "number", "path": "min_price_eur", "field": {"type": "float", "sortable": true, "facetable": {"types": ["stats"]}, "filterable": true, "retrievable": true}, "is_date": false, "is_array": false}, {"kind": "number", "path": "max_price_eur", "field": {"type": "float", "sortable": true, "facetable": {"types": ["stats"]}, "filterable": true, "retrievable": true}, "is_date": false, "is_array": false}, {"kind": "number", "path": "original_price_eur", "field": {"type": "float", "retrievable": true}, "is_date": false, "is_array": false}, {"kind": "boolean", "path": "on_sale_eur", "field": {"type": "boolean", "facetable": true, "filterable": true, "retrievable": true}, "is_date": false, "is_array": false}, {"kind": "number", "path": "min_price_usd", "field": {"type": "float", "sortable": true, "facetable": {"types": ["stats"]}, "filterable": true, "retrievable": true}, "is_date": false, "is_array": false}, {"kind": "number", "path": "max_price_usd", "field": {"type": "float", "sortable": true, "facetable": {"types": ["stats"]}, "filterable": true, "retrievable": true}, "is_date": false, "is_array": false}, {"kind": "number", "path": "original_price_usd", "field": {"type": "float", "retrievable": true}, "is_date": false, "is_array": false}, {"kind": "boolean", "path": "on_sale_usd", "field": {"type": "boolean", "facetable": true, "filterable": true, "retrievable": true}, "is_date": false, "is_array": false}], "vectors": [], "searchable": ["title", "description", "option_values"], "primary_key": "id", "schema_hash": "6a867764af1115440210b465fe11db3c1627a9a818c408f9b3c16e778b4b4b40"}	17	2026-11-05 18:18:12.199994-05	2026-11-07 14:45:11.27803-05
\.


--
-- Data for Name: service_zone; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_zone (id, name, metadata, fulfillment_set_id, created_at, updated_at, deleted_at) FROM stdin;
serzo_01M6Q03ENZ663NJ98X1G15KW77	Europe	\N	fuset_01M6Q03ENZT5BNBAFGS5C4YKAK	2026-11-05 18:18:31.359-05	2026-11-05 18:18:31.359-05	\N
serzo_01M6RV2Z8K3QD75XF5V8DCFQ9T	Colombia	\N	fuset_01M6RV2Z8KMHK4Y8RG8NBYEXG7	2026-11-06 11:29:21.555-05	2026-11-06 11:29:21.555-05	\N
\.


--
-- Data for Name: shipping_option; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipping_option (id, name, price_type, service_zone_id, shipping_profile_id, provider_id, data, metadata, shipping_option_type_id, created_at, updated_at, deleted_at) FROM stdin;
so_01M6Q03EQJJHN3XS45E8A1XRQ8	Standard Shipping	flat	serzo_01M6Q03ENZ663NJ98X1G15KW77	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	manual_manual	\N	\N	sotype_01M6Q03EQJ1WZ8GBCPZP9MYJQZ	2026-11-05 18:18:31.411-05	2026-11-05 18:18:31.411-05	\N
so_01M6Q03EQKT6NMME4WY569D9TS	Express Shipping	flat	serzo_01M6Q03ENZ663NJ98X1G15KW77	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	manual_manual	\N	\N	sotype_01M6Q03EQKSKZ38JMVERHWBGG5	2026-11-05 18:18:31.412-05	2026-11-05 18:18:31.412-05	\N
so_01M6RV2ZAES2RZJTFZ4R0HFKXE	Domicilio Express (30-45 min)	flat	serzo_01M6RV2Z8K3QD75XF5V8DCFQ9T	sp_01M6Q03EE7BCVGA9WD3BEAAGHS	manual_manual	\N	\N	sotype_01M6RV2ZADSFN0V7HM2VH689D7	2026-11-06 11:29:21.614-05	2026-11-06 11:29:21.614-05	\N
\.


--
-- Data for Name: shipping_option_price_set; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipping_option_price_set (shipping_option_id, price_set_id, id, created_at, updated_at, deleted_at) FROM stdin;
so_01M6Q03EQJJHN3XS45E8A1XRQ8	pset_01M6Q03ER1S2XE4CM5FA0G7RKQ	sops_01M6Q03ES01DWQCAJ2A8KZG9PW	2026-11-05 18:18:31.456988-05	2026-11-05 18:18:31.456988-05	\N
so_01M6Q03EQKT6NMME4WY569D9TS	pset_01M6Q03ER234G9QW9PB819DGPC	sops_01M6Q03ES0DYWNAXENM0R2E9KB	2026-11-05 18:18:31.456988-05	2026-11-05 18:18:31.456988-05	\N
so_01M6RV2ZAES2RZJTFZ4R0HFKXE	pset_01M6RV2ZAWJFHV75X154DPQ06N	sops_01M6RV2ZC5MCV6369V8QG88E1D	2026-11-06 11:29:21.680298-05	2026-11-06 11:29:21.680298-05	\N
\.


--
-- Data for Name: shipping_option_rule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipping_option_rule (id, attribute, operator, value, shipping_option_id, created_at, updated_at, deleted_at) FROM stdin;
sorul_01M6Q03EQJDJC03G64ZKR45NAE	enabled_in_store	eq	"true"	so_01M6Q03EQJJHN3XS45E8A1XRQ8	2026-11-05 18:18:31.412-05	2026-11-05 18:18:31.412-05	\N
sorul_01M6Q03EQJ6WZ0J656EJ5V624B	is_return	eq	"false"	so_01M6Q03EQJJHN3XS45E8A1XRQ8	2026-11-05 18:18:31.412-05	2026-11-05 18:18:31.412-05	\N
sorul_01M6Q03EQKYC913J0CE8RX8WPD	enabled_in_store	eq	"true"	so_01M6Q03EQKT6NMME4WY569D9TS	2026-11-05 18:18:31.412-05	2026-11-05 18:18:31.412-05	\N
sorul_01M6Q03EQKV7VSBWJHP67DCZT6	is_return	eq	"false"	so_01M6Q03EQKT6NMME4WY569D9TS	2026-11-05 18:18:31.412-05	2026-11-05 18:18:31.412-05	\N
sorul_01M6RV2ZAD2BW9K5RSBCKP3QS9	enabled_in_store	eq	"true"	so_01M6RV2ZAES2RZJTFZ4R0HFKXE	2026-11-06 11:29:21.614-05	2026-11-06 11:29:21.614-05	\N
sorul_01M6RV2ZAD3CTTJ2Y48N3FHZGP	is_return	eq	"false"	so_01M6RV2ZAES2RZJTFZ4R0HFKXE	2026-11-06 11:29:21.614-05	2026-11-06 11:29:21.614-05	\N
\.


--
-- Data for Name: shipping_option_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipping_option_type (id, label, description, code, created_at, updated_at, deleted_at) FROM stdin;
sotype_01M6Q03EQJ1WZ8GBCPZP9MYJQZ	Standard	Ship in 2-3 days.	standard	2026-11-05 18:18:31.411-05	2026-11-05 18:18:31.411-05	\N
sotype_01M6Q03EQKSKZ38JMVERHWBGG5	Express	Ship in 24 hours.	express	2026-11-05 18:18:31.412-05	2026-11-05 18:18:31.412-05	\N
sotype_01M6RV2ZADSFN0V7HM2VH689D7	Domicilio Express	Entrega hoy mismo en tu dirección.	express-co	2026-11-06 11:29:21.614-05	2026-11-06 11:29:21.614-05	\N
\.


--
-- Data for Name: shipping_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipping_profile (id, name, type, metadata, created_at, updated_at, deleted_at) FROM stdin;
sp_01M6Q03EE7BCVGA9WD3BEAAGHS	Default Shipping Profile	default	\N	2026-11-05 18:18:31.111-05	2026-11-05 18:18:31.111-05	\N
\.


--
-- Data for Name: stock_location; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stock_location (id, created_at, updated_at, deleted_at, name, address_id, metadata) FROM stdin;
sloc_01M6Q03ENBW67DKHCPC7ERY5PA	2026-11-05 18:18:31.34-05	2026-11-05 18:18:31.34-05	\N	European Warehouse	laddr_01M6Q03ENBGVYC1814YF2HW2C9	\N
\.


--
-- Data for Name: stock_location_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stock_location_address (id, created_at, updated_at, deleted_at, address_1, address_2, company, city, country_code, phone, province, postal_code, metadata) FROM stdin;
laddr_01M6Q03ENBGVYC1814YF2HW2C9	2026-11-05 18:18:31.34-05	2026-11-05 18:18:31.34-05	\N		\N	\N	Copenhagen	DK	\N	\N	\N	\N
\.


--
-- Data for Name: store; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store (id, name, default_sales_channel_id, default_region_id, default_location_id, metadata, created_at, updated_at, deleted_at) FROM stdin;
store_01M6Q03EKAV7154ZKFT3M9VN8R	Súper Express Colombia - Mayor y Detal	sc_01M6Q03EJC9CS5HCFC8Y1GDNH1	\N	\N	\N	2026-11-05 18:18:31.273991-05	2026-11-06 11:29:58.09-05	\N
\.


--
-- Data for Name: store_currency; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_currency (id, currency_code, is_default, store_id, created_at, updated_at, deleted_at) FROM stdin;
stocur_01M6RV42YD3GYQ39H7Z4W5DZGN	cop	t	store_01M6Q03EKAV7154ZKFT3M9VN8R	2026-11-06 11:29:58.08775-05	2026-11-06 11:29:58.08775-05	\N
stocur_01M6RV42YE6YYC8GZKVV5ZWMV4	eur	f	store_01M6Q03EKAV7154ZKFT3M9VN8R	2026-11-06 11:29:58.08775-05	2026-11-06 11:29:58.08775-05	\N
stocur_01M6RV42YEFQGSW3WFHGESG1S4	usd	f	store_01M6Q03EKAV7154ZKFT3M9VN8R	2026-11-06 11:29:58.08775-05	2026-11-06 11:29:58.08775-05	\N
\.


--
-- Data for Name: store_locale; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_locale (id, locale_code, store_id, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: tax_provider; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tax_provider (id, is_enabled, created_at, updated_at, deleted_at) FROM stdin;
tp_system	t	2026-11-05 18:18:11.946-05	2026-11-05 18:18:11.946-05	\N
\.


--
-- Data for Name: tax_rate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tax_rate (id, rate, code, name, is_default, is_combinable, tax_region_id, metadata, created_at, updated_at, created_by, deleted_at) FROM stdin;
\.


--
-- Data for Name: tax_rate_rule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tax_rate_rule (id, tax_rate_id, reference_id, reference, metadata, created_at, updated_at, created_by, deleted_at) FROM stdin;
\.


--
-- Data for Name: tax_region; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tax_region (id, provider_id, country_code, province_code, parent_id, metadata, created_at, updated_at, created_by, deleted_at) FROM stdin;
txreg_01M6Q03EN0FJQNW6BA46W9AZHA	tp_system	gb	\N	\N	\N	2026-11-05 18:18:31.329-05	2026-11-05 18:18:31.329-05	\N	\N
txreg_01M6Q03EN10J85YHCDH0XABERX	tp_system	de	\N	\N	\N	2026-11-05 18:18:31.329-05	2026-11-05 18:18:31.329-05	\N	\N
txreg_01M6Q03EN15MM93VF3KYWQ2VY0	tp_system	dk	\N	\N	\N	2026-11-05 18:18:31.329-05	2026-11-05 18:18:31.329-05	\N	\N
txreg_01M6Q03EN121GMQ2XGYCYRSC4W	tp_system	se	\N	\N	\N	2026-11-05 18:18:31.329-05	2026-11-05 18:18:31.329-05	\N	\N
txreg_01M6Q03EN1N7XN54K15P73K34Q	tp_system	fr	\N	\N	\N	2026-11-05 18:18:31.329-05	2026-11-05 18:18:31.329-05	\N	\N
txreg_01M6Q03EN12JF3BWJJC5H7B1EE	tp_system	es	\N	\N	\N	2026-11-05 18:18:31.329-05	2026-11-05 18:18:31.329-05	\N	\N
txreg_01M6Q03EN14PC6VVK01HPQV6A7	tp_system	it	\N	\N	\N	2026-11-05 18:18:31.329-05	2026-11-05 18:18:31.329-05	\N	\N
txreg_01M6RV2Z80JP5AVT3F8AY3BASX	tp_system	co	\N	\N	\N	2026-11-06 11:29:21.536-05	2026-11-06 11:29:21.536-05	\N	\N
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, first_name, last_name, email, avatar_url, metadata, created_at, updated_at, deleted_at) FROM stdin;
user_01M6Q03T33GR0RX8GX764QHYK1	\N	\N	admin@medusa-test.com	\N	\N	2026-11-05 18:18:43.043-05	2026-11-05 18:18:43.043-05	\N
\.


--
-- Data for Name: user_preference; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_preference (id, user_id, key, value, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: user_rbac_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_rbac_role (user_id, rbac_role_id, id, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: view_configuration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.view_configuration (id, entity, name, user_id, is_system_default, configuration, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: workflow_execution; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.workflow_execution (id, workflow_id, transaction_id, execution, context, state, created_at, updated_at, deleted_at, retention_time, run_id) FROM stdin;
\.


--
-- Name: link_module_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.link_module_migrations_id_seq', 20, true);


--
-- Name: mikro_orm_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mikro_orm_migrations_id_seq', 183, true);


--
-- Name: order_change_action_ordering_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_change_action_ordering_seq', 1, false);


--
-- Name: order_claim_display_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_claim_display_id_seq', 1, false);


--
-- Name: order_display_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_display_id_seq', 1, false);


--
-- Name: order_exchange_display_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_exchange_display_id_seq', 1, false);


--
-- Name: return_display_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.return_display_id_seq', 1, false);


--
-- Name: script_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.script_migrations_id_seq', 8, true);


--
-- Name: account_holder account_holder_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_holder
    ADD CONSTRAINT account_holder_pkey PRIMARY KEY (id);


--
-- Name: api_key api_key_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_key
    ADD CONSTRAINT api_key_pkey PRIMARY KEY (id);


--
-- Name: application_method_buy_rules application_method_buy_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_method_buy_rules
    ADD CONSTRAINT application_method_buy_rules_pkey PRIMARY KEY (application_method_id, promotion_rule_id);


--
-- Name: application_method_target_rules application_method_target_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_method_target_rules
    ADD CONSTRAINT application_method_target_rules_pkey PRIMARY KEY (application_method_id, promotion_rule_id);


--
-- Name: auth_identity auth_identity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_identity
    ADD CONSTRAINT auth_identity_pkey PRIMARY KEY (id);


--
-- Name: auth_mfa_factor auth_mfa_factor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_mfa_factor
    ADD CONSTRAINT auth_mfa_factor_pkey PRIMARY KEY (id);


--
-- Name: auth_mfa_recovery_code auth_mfa_recovery_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_mfa_recovery_code
    ADD CONSTRAINT auth_mfa_recovery_code_pkey PRIMARY KEY (id);


--
-- Name: auth_password_reset_token auth_password_reset_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_password_reset_token
    ADD CONSTRAINT auth_password_reset_token_pkey PRIMARY KEY (id);


--
-- Name: auth_verification auth_verification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_verification
    ADD CONSTRAINT auth_verification_pkey PRIMARY KEY (id);


--
-- Name: capture capture_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.capture
    ADD CONSTRAINT capture_pkey PRIMARY KEY (id);


--
-- Name: cart_address cart_address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_address
    ADD CONSTRAINT cart_address_pkey PRIMARY KEY (id);


--
-- Name: cart_line_item_adjustment cart_line_item_adjustment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_line_item_adjustment
    ADD CONSTRAINT cart_line_item_adjustment_pkey PRIMARY KEY (id);


--
-- Name: cart_line_item cart_line_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_line_item
    ADD CONSTRAINT cart_line_item_pkey PRIMARY KEY (id);


--
-- Name: cart_line_item_tax_line cart_line_item_tax_line_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_line_item_tax_line
    ADD CONSTRAINT cart_line_item_tax_line_pkey PRIMARY KEY (id);


--
-- Name: cart_payment_collection cart_payment_collection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_payment_collection
    ADD CONSTRAINT cart_payment_collection_pkey PRIMARY KEY (cart_id, payment_collection_id);


--
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (id);


--
-- Name: cart_promotion cart_promotion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_promotion
    ADD CONSTRAINT cart_promotion_pkey PRIMARY KEY (cart_id, promotion_id);


--
-- Name: cart_shipping_method_adjustment cart_shipping_method_adjustment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_shipping_method_adjustment
    ADD CONSTRAINT cart_shipping_method_adjustment_pkey PRIMARY KEY (id);


--
-- Name: cart_shipping_method cart_shipping_method_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_shipping_method
    ADD CONSTRAINT cart_shipping_method_pkey PRIMARY KEY (id);


--
-- Name: cart_shipping_method_tax_line cart_shipping_method_tax_line_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_shipping_method_tax_line
    ADD CONSTRAINT cart_shipping_method_tax_line_pkey PRIMARY KEY (id);


--
-- Name: credit_line credit_line_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_line
    ADD CONSTRAINT credit_line_pkey PRIMARY KEY (id);


--
-- Name: currency currency_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency
    ADD CONSTRAINT currency_pkey PRIMARY KEY (code);


--
-- Name: customer_account_holder customer_account_holder_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_account_holder
    ADD CONSTRAINT customer_account_holder_pkey PRIMARY KEY (customer_id, account_holder_id);


--
-- Name: customer_address customer_address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_address
    ADD CONSTRAINT customer_address_pkey PRIMARY KEY (id);


--
-- Name: customer_group_customer customer_group_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_group_customer
    ADD CONSTRAINT customer_group_customer_pkey PRIMARY KEY (id);


--
-- Name: customer_group customer_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_group
    ADD CONSTRAINT customer_group_pkey PRIMARY KEY (id);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- Name: fulfillment_address fulfillment_address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fulfillment_address
    ADD CONSTRAINT fulfillment_address_pkey PRIMARY KEY (id);


--
-- Name: fulfillment_item fulfillment_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fulfillment_item
    ADD CONSTRAINT fulfillment_item_pkey PRIMARY KEY (id);


--
-- Name: fulfillment_label fulfillment_label_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fulfillment_label
    ADD CONSTRAINT fulfillment_label_pkey PRIMARY KEY (id);


--
-- Name: fulfillment fulfillment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fulfillment
    ADD CONSTRAINT fulfillment_pkey PRIMARY KEY (id);


--
-- Name: fulfillment_provider fulfillment_provider_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fulfillment_provider
    ADD CONSTRAINT fulfillment_provider_pkey PRIMARY KEY (id);


--
-- Name: fulfillment_set fulfillment_set_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fulfillment_set
    ADD CONSTRAINT fulfillment_set_pkey PRIMARY KEY (id);


--
-- Name: geo_zone geo_zone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geo_zone
    ADD CONSTRAINT geo_zone_pkey PRIMARY KEY (id);


--
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- Name: inventory_item inventory_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_item
    ADD CONSTRAINT inventory_item_pkey PRIMARY KEY (id);


--
-- Name: inventory_level inventory_level_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_level
    ADD CONSTRAINT inventory_level_pkey PRIMARY KEY (id);


--
-- Name: invite invite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invite
    ADD CONSTRAINT invite_pkey PRIMARY KEY (id);


--
-- Name: invite_rbac_role invite_rbac_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invite_rbac_role
    ADD CONSTRAINT invite_rbac_role_pkey PRIMARY KEY (invite_id, rbac_role_id);


--
-- Name: layout_configuration layout_configuration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.layout_configuration
    ADD CONSTRAINT layout_configuration_pkey PRIMARY KEY (id);


--
-- Name: link_module_migrations link_module_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link_module_migrations
    ADD CONSTRAINT link_module_migrations_pkey PRIMARY KEY (id);


--
-- Name: link_module_migrations link_module_migrations_table_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link_module_migrations
    ADD CONSTRAINT link_module_migrations_table_name_key UNIQUE (table_name);


--
-- Name: location_fulfillment_provider location_fulfillment_provider_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location_fulfillment_provider
    ADD CONSTRAINT location_fulfillment_provider_pkey PRIMARY KEY (stock_location_id, fulfillment_provider_id);


--
-- Name: location_fulfillment_set location_fulfillment_set_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location_fulfillment_set
    ADD CONSTRAINT location_fulfillment_set_pkey PRIMARY KEY (stock_location_id, fulfillment_set_id);


--
-- Name: mikro_orm_migrations mikro_orm_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mikro_orm_migrations
    ADD CONSTRAINT mikro_orm_migrations_pkey PRIMARY KEY (id);


--
-- Name: notification notification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_pkey PRIMARY KEY (id);


--
-- Name: notification_provider notification_provider_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification_provider
    ADD CONSTRAINT notification_provider_pkey PRIMARY KEY (id);


--
-- Name: order_address order_address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_address
    ADD CONSTRAINT order_address_pkey PRIMARY KEY (id);


--
-- Name: order_cart order_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_cart
    ADD CONSTRAINT order_cart_pkey PRIMARY KEY (order_id, cart_id);


--
-- Name: order_change_action order_change_action_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_change_action
    ADD CONSTRAINT order_change_action_pkey PRIMARY KEY (id);


--
-- Name: order_change order_change_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_change
    ADD CONSTRAINT order_change_pkey PRIMARY KEY (id);


--
-- Name: order_claim_item_image order_claim_item_image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_claim_item_image
    ADD CONSTRAINT order_claim_item_image_pkey PRIMARY KEY (id);


--
-- Name: order_claim_item order_claim_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_claim_item
    ADD CONSTRAINT order_claim_item_pkey PRIMARY KEY (id);


--
-- Name: order_claim order_claim_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_claim
    ADD CONSTRAINT order_claim_pkey PRIMARY KEY (id);


--
-- Name: order_credit_line order_credit_line_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_credit_line
    ADD CONSTRAINT order_credit_line_pkey PRIMARY KEY (id);


--
-- Name: order_exchange_item order_exchange_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_exchange_item
    ADD CONSTRAINT order_exchange_item_pkey PRIMARY KEY (id);


--
-- Name: order_exchange order_exchange_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_exchange
    ADD CONSTRAINT order_exchange_pkey PRIMARY KEY (id);


--
-- Name: order_fulfillment order_fulfillment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_fulfillment
    ADD CONSTRAINT order_fulfillment_pkey PRIMARY KEY (order_id, fulfillment_id);


--
-- Name: order_item order_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_pkey PRIMARY KEY (id);


--
-- Name: order_line_item_adjustment order_line_item_adjustment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_line_item_adjustment
    ADD CONSTRAINT order_line_item_adjustment_pkey PRIMARY KEY (id);


--
-- Name: order_line_item order_line_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_line_item
    ADD CONSTRAINT order_line_item_pkey PRIMARY KEY (id);


--
-- Name: order_line_item_tax_line order_line_item_tax_line_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_line_item_tax_line
    ADD CONSTRAINT order_line_item_tax_line_pkey PRIMARY KEY (id);


--
-- Name: order_payment_collection order_payment_collection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_payment_collection
    ADD CONSTRAINT order_payment_collection_pkey PRIMARY KEY (order_id, payment_collection_id);


--
-- Name: order order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);


--
-- Name: order_promotion order_promotion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_promotion
    ADD CONSTRAINT order_promotion_pkey PRIMARY KEY (order_id, promotion_id);


--
-- Name: order_shipping_method_adjustment order_shipping_method_adjustment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_shipping_method_adjustment
    ADD CONSTRAINT order_shipping_method_adjustment_pkey PRIMARY KEY (id);


--
-- Name: order_shipping_method order_shipping_method_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_shipping_method
    ADD CONSTRAINT order_shipping_method_pkey PRIMARY KEY (id);


--
-- Name: order_shipping_method_tax_line order_shipping_method_tax_line_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_shipping_method_tax_line
    ADD CONSTRAINT order_shipping_method_tax_line_pkey PRIMARY KEY (id);


--
-- Name: order_shipping order_shipping_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_shipping
    ADD CONSTRAINT order_shipping_pkey PRIMARY KEY (id);


--
-- Name: order_summary order_summary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_summary
    ADD CONSTRAINT order_summary_pkey PRIMARY KEY (id);


--
-- Name: order_transaction order_transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_transaction
    ADD CONSTRAINT order_transaction_pkey PRIMARY KEY (id);


--
-- Name: payment_collection_payment_providers payment_collection_payment_providers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_collection_payment_providers
    ADD CONSTRAINT payment_collection_payment_providers_pkey PRIMARY KEY (payment_collection_id, payment_provider_id);


--
-- Name: payment_collection payment_collection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_collection
    ADD CONSTRAINT payment_collection_pkey PRIMARY KEY (id);


--
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (id);


--
-- Name: payment_provider payment_provider_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_provider
    ADD CONSTRAINT payment_provider_pkey PRIMARY KEY (id);


--
-- Name: payment_session payment_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_session
    ADD CONSTRAINT payment_session_pkey PRIMARY KEY (id);


--
-- Name: price_list price_list_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_list
    ADD CONSTRAINT price_list_pkey PRIMARY KEY (id);


--
-- Name: price_list_rule price_list_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_list_rule
    ADD CONSTRAINT price_list_rule_pkey PRIMARY KEY (id);


--
-- Name: price price_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price
    ADD CONSTRAINT price_pkey PRIMARY KEY (id);


--
-- Name: price_preference price_preference_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_preference
    ADD CONSTRAINT price_preference_pkey PRIMARY KEY (id);


--
-- Name: price_rule price_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_rule
    ADD CONSTRAINT price_rule_pkey PRIMARY KEY (id);


--
-- Name: price_set price_set_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_set
    ADD CONSTRAINT price_set_pkey PRIMARY KEY (id);


--
-- Name: product_category product_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT product_category_pkey PRIMARY KEY (id);


--
-- Name: product_category_product product_category_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category_product
    ADD CONSTRAINT product_category_product_pkey PRIMARY KEY (product_id, product_category_id);


--
-- Name: product_collection product_collection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_collection
    ADD CONSTRAINT product_collection_pkey PRIMARY KEY (id);


--
-- Name: product_option product_option_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option
    ADD CONSTRAINT product_option_pkey PRIMARY KEY (id);


--
-- Name: product_option_value product_option_value_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option_value
    ADD CONSTRAINT product_option_value_pkey PRIMARY KEY (id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- Name: product_product_option product_product_option_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_product_option
    ADD CONSTRAINT product_product_option_pkey PRIMARY KEY (id);


--
-- Name: product_product_option_value product_product_option_value_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_product_option_value
    ADD CONSTRAINT product_product_option_value_pkey PRIMARY KEY (id);


--
-- Name: product_sales_channel product_sales_channel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_sales_channel
    ADD CONSTRAINT product_sales_channel_pkey PRIMARY KEY (product_id, sales_channel_id);


--
-- Name: product_shipping_profile product_shipping_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_shipping_profile
    ADD CONSTRAINT product_shipping_profile_pkey PRIMARY KEY (product_id, shipping_profile_id);


--
-- Name: product_tag product_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_tag
    ADD CONSTRAINT product_tag_pkey PRIMARY KEY (id);


--
-- Name: product_tags product_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_tags
    ADD CONSTRAINT product_tags_pkey PRIMARY KEY (product_id, product_tag_id);


--
-- Name: product_type product_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_type
    ADD CONSTRAINT product_type_pkey PRIMARY KEY (id);


--
-- Name: product_variant_inventory_item product_variant_inventory_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant_inventory_item
    ADD CONSTRAINT product_variant_inventory_item_pkey PRIMARY KEY (variant_id, inventory_item_id);


--
-- Name: product_variant_option product_variant_option_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant_option
    ADD CONSTRAINT product_variant_option_pkey PRIMARY KEY (variant_id, option_value_id);


--
-- Name: product_variant product_variant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant
    ADD CONSTRAINT product_variant_pkey PRIMARY KEY (id);


--
-- Name: product_variant_price_set product_variant_price_set_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant_price_set
    ADD CONSTRAINT product_variant_price_set_pkey PRIMARY KEY (variant_id, price_set_id);


--
-- Name: product_variant_product_image product_variant_product_image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant_product_image
    ADD CONSTRAINT product_variant_product_image_pkey PRIMARY KEY (id);


--
-- Name: promotion_application_method promotion_application_method_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion_application_method
    ADD CONSTRAINT promotion_application_method_pkey PRIMARY KEY (id);


--
-- Name: promotion_campaign_budget promotion_campaign_budget_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion_campaign_budget
    ADD CONSTRAINT promotion_campaign_budget_pkey PRIMARY KEY (id);


--
-- Name: promotion_campaign_budget_usage promotion_campaign_budget_usage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion_campaign_budget_usage
    ADD CONSTRAINT promotion_campaign_budget_usage_pkey PRIMARY KEY (id);


--
-- Name: promotion_campaign promotion_campaign_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion_campaign
    ADD CONSTRAINT promotion_campaign_pkey PRIMARY KEY (id);


--
-- Name: promotion promotion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion
    ADD CONSTRAINT promotion_pkey PRIMARY KEY (id);


--
-- Name: promotion_promotion_rule promotion_promotion_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion_promotion_rule
    ADD CONSTRAINT promotion_promotion_rule_pkey PRIMARY KEY (promotion_id, promotion_rule_id);


--
-- Name: promotion_rule promotion_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion_rule
    ADD CONSTRAINT promotion_rule_pkey PRIMARY KEY (id);


--
-- Name: promotion_rule_value promotion_rule_value_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion_rule_value
    ADD CONSTRAINT promotion_rule_value_pkey PRIMARY KEY (id);


--
-- Name: property_label property_label_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property_label
    ADD CONSTRAINT property_label_pkey PRIMARY KEY (id);


--
-- Name: provider_identity provider_identity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provider_identity
    ADD CONSTRAINT provider_identity_pkey PRIMARY KEY (id);


--
-- Name: publishable_api_key_sales_channel publishable_api_key_sales_channel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publishable_api_key_sales_channel
    ADD CONSTRAINT publishable_api_key_sales_channel_pkey PRIMARY KEY (publishable_key_id, sales_channel_id);


--
-- Name: refund refund_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refund
    ADD CONSTRAINT refund_pkey PRIMARY KEY (id);


--
-- Name: refund_reason refund_reason_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refund_reason
    ADD CONSTRAINT refund_reason_pkey PRIMARY KEY (id);


--
-- Name: region_country region_country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region_country
    ADD CONSTRAINT region_country_pkey PRIMARY KEY (iso_2);


--
-- Name: region_payment_provider region_payment_provider_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region_payment_provider
    ADD CONSTRAINT region_payment_provider_pkey PRIMARY KEY (region_id, payment_provider_id);


--
-- Name: region region_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT region_pkey PRIMARY KEY (id);


--
-- Name: reservation_item reservation_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation_item
    ADD CONSTRAINT reservation_item_pkey PRIMARY KEY (id);


--
-- Name: return_fulfillment return_fulfillment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.return_fulfillment
    ADD CONSTRAINT return_fulfillment_pkey PRIMARY KEY (return_id, fulfillment_id);


--
-- Name: return_item return_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.return_item
    ADD CONSTRAINT return_item_pkey PRIMARY KEY (id);


--
-- Name: return return_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.return
    ADD CONSTRAINT return_pkey PRIMARY KEY (id);


--
-- Name: return_reason return_reason_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.return_reason
    ADD CONSTRAINT return_reason_pkey PRIMARY KEY (id);


--
-- Name: sales_channel sales_channel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_channel
    ADD CONSTRAINT sales_channel_pkey PRIMARY KEY (id);


--
-- Name: sales_channel_stock_location sales_channel_stock_location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_channel_stock_location
    ADD CONSTRAINT sales_channel_stock_location_pkey PRIMARY KEY (sales_channel_id, stock_location_id);


--
-- Name: script_migrations script_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.script_migrations
    ADD CONSTRAINT script_migrations_pkey PRIMARY KEY (id);


--
-- Name: search_index search_index_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.search_index
    ADD CONSTRAINT search_index_pkey PRIMARY KEY (id);


--
-- Name: search_index_sync search_index_sync_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.search_index_sync
    ADD CONSTRAINT search_index_sync_pkey PRIMARY KEY (id);


--
-- Name: search_index_version search_index_version_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.search_index_version
    ADD CONSTRAINT search_index_version_pkey PRIMARY KEY (id);


--
-- Name: search_pg_product_v1 search_pg_product_v1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.search_pg_product_v1
    ADD CONSTRAINT search_pg_product_v1_pkey PRIMARY KEY (id);


--
-- Name: search_postgres_index search_postgres_index_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.search_postgres_index
    ADD CONSTRAINT search_postgres_index_pkey PRIMARY KEY (name);


--
-- Name: service_zone service_zone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_zone
    ADD CONSTRAINT service_zone_pkey PRIMARY KEY (id);


--
-- Name: shipping_option shipping_option_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_option
    ADD CONSTRAINT shipping_option_pkey PRIMARY KEY (id);


--
-- Name: shipping_option_price_set shipping_option_price_set_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_option_price_set
    ADD CONSTRAINT shipping_option_price_set_pkey PRIMARY KEY (shipping_option_id, price_set_id);


--
-- Name: shipping_option_rule shipping_option_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_option_rule
    ADD CONSTRAINT shipping_option_rule_pkey PRIMARY KEY (id);


--
-- Name: shipping_option_type shipping_option_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_option_type
    ADD CONSTRAINT shipping_option_type_pkey PRIMARY KEY (id);


--
-- Name: shipping_profile shipping_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_profile
    ADD CONSTRAINT shipping_profile_pkey PRIMARY KEY (id);


--
-- Name: stock_location_address stock_location_address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_location_address
    ADD CONSTRAINT stock_location_address_pkey PRIMARY KEY (id);


--
-- Name: stock_location stock_location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_location
    ADD CONSTRAINT stock_location_pkey PRIMARY KEY (id);


--
-- Name: store_currency store_currency_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_currency
    ADD CONSTRAINT store_currency_pkey PRIMARY KEY (id);


--
-- Name: store_locale store_locale_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_locale
    ADD CONSTRAINT store_locale_pkey PRIMARY KEY (id);


--
-- Name: store store_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store
    ADD CONSTRAINT store_pkey PRIMARY KEY (id);


--
-- Name: tax_provider tax_provider_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_provider
    ADD CONSTRAINT tax_provider_pkey PRIMARY KEY (id);


--
-- Name: tax_rate tax_rate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_rate
    ADD CONSTRAINT tax_rate_pkey PRIMARY KEY (id);


--
-- Name: tax_rate_rule tax_rate_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_rate_rule
    ADD CONSTRAINT tax_rate_rule_pkey PRIMARY KEY (id);


--
-- Name: tax_region tax_region_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_region
    ADD CONSTRAINT tax_region_pkey PRIMARY KEY (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user_preference user_preference_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_preference
    ADD CONSTRAINT user_preference_pkey PRIMARY KEY (id);


--
-- Name: user_rbac_role user_rbac_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_rbac_role
    ADD CONSTRAINT user_rbac_role_pkey PRIMARY KEY (user_id, rbac_role_id);


--
-- Name: view_configuration view_configuration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.view_configuration
    ADD CONSTRAINT view_configuration_pkey PRIMARY KEY (id);


--
-- Name: workflow_execution workflow_execution_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.workflow_execution
    ADD CONSTRAINT workflow_execution_pkey PRIMARY KEY (workflow_id, transaction_id, run_id);


--
-- Name: IDX_account_holder_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_account_holder_deleted_at" ON public.account_holder USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_account_holder_id_5cb3a0c0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_account_holder_id_5cb3a0c0" ON public.customer_account_holder USING btree (account_holder_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_account_holder_provider_id_external_id_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_account_holder_provider_id_external_id_unique" ON public.account_holder USING btree (provider_id, external_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_api_key_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_api_key_deleted_at" ON public.api_key USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_api_key_redacted; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_api_key_redacted" ON public.api_key USING btree (redacted) WHERE (deleted_at IS NULL);


--
-- Name: IDX_api_key_revoked_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_api_key_revoked_at" ON public.api_key USING btree (revoked_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_api_key_token_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_api_key_token_unique" ON public.api_key USING btree (token);


--
-- Name: IDX_api_key_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_api_key_type" ON public.api_key USING btree (type);


--
-- Name: IDX_application_method_allocation; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_application_method_allocation" ON public.promotion_application_method USING btree (allocation);


--
-- Name: IDX_application_method_target_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_application_method_target_type" ON public.promotion_application_method USING btree (target_type);


--
-- Name: IDX_application_method_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_application_method_type" ON public.promotion_application_method USING btree (type);


--
-- Name: IDX_auth_identity_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_auth_identity_deleted_at" ON public.auth_identity USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_auth_mfa_factor_auth_identity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_auth_mfa_factor_auth_identity_id" ON public.auth_mfa_factor USING btree (auth_identity_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_auth_mfa_factor_auth_identity_provider_active; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_auth_mfa_factor_auth_identity_provider_active" ON public.auth_mfa_factor USING btree (auth_identity_id, provider) WHERE ((deleted_at IS NULL) AND (status = ANY (ARRAY['pending'::text, 'enabled'::text])));


--
-- Name: IDX_auth_mfa_factor_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_auth_mfa_factor_deleted_at" ON public.auth_mfa_factor USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_auth_mfa_recovery_code_auth_identity_code_hash; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_auth_mfa_recovery_code_auth_identity_code_hash" ON public.auth_mfa_recovery_code USING btree (auth_identity_id, code_hash) WHERE (deleted_at IS NULL);


--
-- Name: IDX_auth_mfa_recovery_code_auth_identity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_auth_mfa_recovery_code_auth_identity_id" ON public.auth_mfa_recovery_code USING btree (auth_identity_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_auth_mfa_recovery_code_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_auth_mfa_recovery_code_deleted_at" ON public.auth_mfa_recovery_code USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_auth_password_reset_token_auth_identity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_auth_password_reset_token_auth_identity_id" ON public.auth_password_reset_token USING btree (auth_identity_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_auth_password_reset_token_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_auth_password_reset_token_deleted_at" ON public.auth_password_reset_token USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_auth_password_reset_token_expires_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_auth_password_reset_token_expires_at" ON public.auth_password_reset_token USING btree (expires_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_auth_password_reset_token_provider_identity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_auth_password_reset_token_provider_identity_id" ON public.auth_password_reset_token USING btree (provider_identity_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_auth_password_reset_token_token_hash; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_auth_password_reset_token_token_hash" ON public.auth_password_reset_token USING btree (token_hash) WHERE (deleted_at IS NULL);


--
-- Name: IDX_auth_verification_auth_identity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_auth_verification_auth_identity_id" ON public.auth_verification USING btree (auth_identity_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_auth_verification_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_auth_verification_deleted_at" ON public.auth_verification USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_auth_verification_unique_auth_identity_entity_id_entity_typ; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_auth_verification_unique_auth_identity_entity_id_entity_typ" ON public.auth_verification USING btree (auth_identity_id, entity_id, entity_type) WHERE (deleted_at IS NULL);


--
-- Name: IDX_campaign_budget_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_campaign_budget_type" ON public.promotion_campaign_budget USING btree (type);


--
-- Name: IDX_capture_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_capture_deleted_at" ON public.capture USING btree (deleted_at);


--
-- Name: IDX_capture_payment_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_capture_payment_id" ON public.capture USING btree (payment_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_cart_address_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_cart_address_deleted_at" ON public.cart_address USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_cart_billing_address_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_cart_billing_address_id" ON public.cart USING btree (billing_address_id) WHERE ((deleted_at IS NULL) AND (billing_address_id IS NOT NULL));


--
-- Name: IDX_cart_credit_line_reference_reference_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_cart_credit_line_reference_reference_id" ON public.credit_line USING btree (reference, reference_id) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_cart_currency_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_cart_currency_code" ON public.cart USING btree (currency_code);


--
-- Name: IDX_cart_customer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_cart_customer_id" ON public.cart USING btree (customer_id) WHERE ((deleted_at IS NULL) AND (customer_id IS NOT NULL));


--
-- Name: IDX_cart_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_cart_deleted_at" ON public.cart USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_cart_id_-4a39f6c9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_cart_id_-4a39f6c9" ON public.cart_payment_collection USING btree (cart_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_cart_id_-71069c16; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_cart_id_-71069c16" ON public.order_cart USING btree (cart_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_cart_id_-a9d4a70b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_cart_id_-a9d4a70b" ON public.cart_promotion USING btree (cart_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_cart_line_item_adjustment_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_cart_line_item_adjustment_deleted_at" ON public.cart_line_item_adjustment USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_cart_line_item_adjustment_item_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_cart_line_item_adjustment_item_id" ON public.cart_line_item_adjustment USING btree (item_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_cart_line_item_cart_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_cart_line_item_cart_id" ON public.cart_line_item USING btree (cart_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_cart_line_item_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_cart_line_item_deleted_at" ON public.cart_line_item USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_cart_line_item_tax_line_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_cart_line_item_tax_line_deleted_at" ON public.cart_line_item_tax_line USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_cart_line_item_tax_line_item_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_cart_line_item_tax_line_item_id" ON public.cart_line_item_tax_line USING btree (item_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_cart_region_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_cart_region_id" ON public.cart USING btree (region_id) WHERE ((deleted_at IS NULL) AND (region_id IS NOT NULL));


--
-- Name: IDX_cart_sales_channel_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_cart_sales_channel_id" ON public.cart USING btree (sales_channel_id) WHERE ((deleted_at IS NULL) AND (sales_channel_id IS NOT NULL));


--
-- Name: IDX_cart_shipping_address_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_cart_shipping_address_id" ON public.cart USING btree (shipping_address_id) WHERE ((deleted_at IS NULL) AND (shipping_address_id IS NOT NULL));


--
-- Name: IDX_cart_shipping_method_adjustment_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_cart_shipping_method_adjustment_deleted_at" ON public.cart_shipping_method_adjustment USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_cart_shipping_method_adjustment_shipping_method_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_cart_shipping_method_adjustment_shipping_method_id" ON public.cart_shipping_method_adjustment USING btree (shipping_method_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_cart_shipping_method_cart_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_cart_shipping_method_cart_id" ON public.cart_shipping_method USING btree (cart_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_cart_shipping_method_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_cart_shipping_method_deleted_at" ON public.cart_shipping_method USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_cart_shipping_method_tax_line_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_cart_shipping_method_tax_line_deleted_at" ON public.cart_shipping_method_tax_line USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_cart_shipping_method_tax_line_shipping_method_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_cart_shipping_method_tax_line_shipping_method_id" ON public.cart_shipping_method_tax_line USING btree (shipping_method_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_category_handle_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_category_handle_unique" ON public.product_category USING btree (handle) WHERE (deleted_at IS NULL);


--
-- Name: IDX_collection_handle_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_collection_handle_unique" ON public.product_collection USING btree (handle) WHERE (deleted_at IS NULL);


--
-- Name: IDX_credit_line_cart_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_credit_line_cart_id" ON public.credit_line USING btree (cart_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_credit_line_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_credit_line_deleted_at" ON public.credit_line USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_customer_address_customer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_customer_address_customer_id" ON public.customer_address USING btree (customer_id);


--
-- Name: IDX_customer_address_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_customer_address_deleted_at" ON public.customer_address USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_customer_address_unique_customer_billing; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_customer_address_unique_customer_billing" ON public.customer_address USING btree (customer_id) WHERE (is_default_billing = true);


--
-- Name: IDX_customer_address_unique_customer_shipping; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_customer_address_unique_customer_shipping" ON public.customer_address USING btree (customer_id) WHERE (is_default_shipping = true);


--
-- Name: IDX_customer_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_customer_deleted_at" ON public.customer USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_customer_email_has_account_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_customer_email_has_account_unique" ON public.customer USING btree (email, has_account) WHERE (deleted_at IS NULL);


--
-- Name: IDX_customer_group_customer_customer_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_customer_group_customer_customer_group_id" ON public.customer_group_customer USING btree (customer_group_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_customer_group_customer_customer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_customer_group_customer_customer_id" ON public.customer_group_customer USING btree (customer_id);


--
-- Name: IDX_customer_group_customer_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_customer_group_customer_deleted_at" ON public.customer_group_customer USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_customer_group_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_customer_group_deleted_at" ON public.customer_group USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_customer_group_name_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_customer_group_name_unique" ON public.customer_group USING btree (name) WHERE (deleted_at IS NULL);


--
-- Name: IDX_customer_id_5cb3a0c0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_customer_id_5cb3a0c0" ON public.customer_account_holder USING btree (customer_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_deleted_at_-1d67bae40; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_deleted_at_-1d67bae40" ON public.publishable_api_key_sales_channel USING btree (deleted_at);


--
-- Name: IDX_deleted_at_-1e5992737; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_deleted_at_-1e5992737" ON public.location_fulfillment_provider USING btree (deleted_at);


--
-- Name: IDX_deleted_at_-31ea43a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_deleted_at_-31ea43a" ON public.return_fulfillment USING btree (deleted_at);


--
-- Name: IDX_deleted_at_-4a39f6c9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_deleted_at_-4a39f6c9" ON public.cart_payment_collection USING btree (deleted_at);


--
-- Name: IDX_deleted_at_-71069c16; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_deleted_at_-71069c16" ON public.order_cart USING btree (deleted_at);


--
-- Name: IDX_deleted_at_-71518339; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_deleted_at_-71518339" ON public.order_promotion USING btree (deleted_at);


--
-- Name: IDX_deleted_at_-85069d44; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_deleted_at_-85069d44" ON public.invite_rbac_role USING btree (deleted_at);


--
-- Name: IDX_deleted_at_-a9d4a70b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_deleted_at_-a9d4a70b" ON public.cart_promotion USING btree (deleted_at);


--
-- Name: IDX_deleted_at_-e88adb96; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_deleted_at_-e88adb96" ON public.location_fulfillment_set USING btree (deleted_at);


--
-- Name: IDX_deleted_at_-e8d2543e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_deleted_at_-e8d2543e" ON public.order_fulfillment USING btree (deleted_at);


--
-- Name: IDX_deleted_at_17a262437; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_deleted_at_17a262437" ON public.product_shipping_profile USING btree (deleted_at);


--
-- Name: IDX_deleted_at_17b4c4e35; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_deleted_at_17b4c4e35" ON public.product_variant_inventory_item USING btree (deleted_at);


--
-- Name: IDX_deleted_at_1c934dab0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_deleted_at_1c934dab0" ON public.region_payment_provider USING btree (deleted_at);


--
-- Name: IDX_deleted_at_20b454295; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_deleted_at_20b454295" ON public.product_sales_channel USING btree (deleted_at);


--
-- Name: IDX_deleted_at_26d06f470; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_deleted_at_26d06f470" ON public.sales_channel_stock_location USING btree (deleted_at);


--
-- Name: IDX_deleted_at_52b23597; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_deleted_at_52b23597" ON public.product_variant_price_set USING btree (deleted_at);


--
-- Name: IDX_deleted_at_5cb3a0c0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_deleted_at_5cb3a0c0" ON public.customer_account_holder USING btree (deleted_at);


--
-- Name: IDX_deleted_at_64ff0c4c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_deleted_at_64ff0c4c" ON public.user_rbac_role USING btree (deleted_at);


--
-- Name: IDX_deleted_at_ba32fa9c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_deleted_at_ba32fa9c" ON public.shipping_option_price_set USING btree (deleted_at);


--
-- Name: IDX_deleted_at_f42b9949; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_deleted_at_f42b9949" ON public.order_payment_collection USING btree (deleted_at);


--
-- Name: IDX_fulfillment_address_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_fulfillment_address_deleted_at" ON public.fulfillment_address USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_fulfillment_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_fulfillment_deleted_at" ON public.fulfillment USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_fulfillment_id_-31ea43a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_fulfillment_id_-31ea43a" ON public.return_fulfillment USING btree (fulfillment_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_fulfillment_id_-e8d2543e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_fulfillment_id_-e8d2543e" ON public.order_fulfillment USING btree (fulfillment_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_fulfillment_item_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_fulfillment_item_deleted_at" ON public.fulfillment_item USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_fulfillment_item_fulfillment_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_fulfillment_item_fulfillment_id" ON public.fulfillment_item USING btree (fulfillment_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_fulfillment_item_inventory_item_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_fulfillment_item_inventory_item_id" ON public.fulfillment_item USING btree (inventory_item_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_fulfillment_item_line_item_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_fulfillment_item_line_item_id" ON public.fulfillment_item USING btree (line_item_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_fulfillment_label_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_fulfillment_label_deleted_at" ON public.fulfillment_label USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_fulfillment_label_fulfillment_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_fulfillment_label_fulfillment_id" ON public.fulfillment_label USING btree (fulfillment_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_fulfillment_location_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_fulfillment_location_id" ON public.fulfillment USING btree (location_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_fulfillment_provider_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_fulfillment_provider_deleted_at" ON public.fulfillment_provider USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_fulfillment_provider_id_-1e5992737; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_fulfillment_provider_id_-1e5992737" ON public.location_fulfillment_provider USING btree (fulfillment_provider_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_fulfillment_set_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_fulfillment_set_deleted_at" ON public.fulfillment_set USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_fulfillment_set_id_-e88adb96; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_fulfillment_set_id_-e88adb96" ON public.location_fulfillment_set USING btree (fulfillment_set_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_fulfillment_set_name_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_fulfillment_set_name_unique" ON public.fulfillment_set USING btree (name) WHERE (deleted_at IS NULL);


--
-- Name: IDX_fulfillment_shipping_option_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_fulfillment_shipping_option_id" ON public.fulfillment USING btree (shipping_option_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_geo_zone_city; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_geo_zone_city" ON public.geo_zone USING btree (city) WHERE ((deleted_at IS NULL) AND (city IS NOT NULL));


--
-- Name: IDX_geo_zone_country_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_geo_zone_country_code" ON public.geo_zone USING btree (country_code) WHERE (deleted_at IS NULL);


--
-- Name: IDX_geo_zone_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_geo_zone_deleted_at" ON public.geo_zone USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_geo_zone_province_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_geo_zone_province_code" ON public.geo_zone USING btree (province_code) WHERE ((deleted_at IS NULL) AND (province_code IS NOT NULL));


--
-- Name: IDX_geo_zone_service_zone_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_geo_zone_service_zone_id" ON public.geo_zone USING btree (service_zone_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_id_-1d67bae40; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_id_-1d67bae40" ON public.publishable_api_key_sales_channel USING btree (id);


--
-- Name: IDX_id_-1e5992737; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_id_-1e5992737" ON public.location_fulfillment_provider USING btree (id);


--
-- Name: IDX_id_-31ea43a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_id_-31ea43a" ON public.return_fulfillment USING btree (id);


--
-- Name: IDX_id_-4a39f6c9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_id_-4a39f6c9" ON public.cart_payment_collection USING btree (id);


--
-- Name: IDX_id_-71069c16; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_id_-71069c16" ON public.order_cart USING btree (id);


--
-- Name: IDX_id_-71518339; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_id_-71518339" ON public.order_promotion USING btree (id);


--
-- Name: IDX_id_-85069d44; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_id_-85069d44" ON public.invite_rbac_role USING btree (id);


--
-- Name: IDX_id_-a9d4a70b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_id_-a9d4a70b" ON public.cart_promotion USING btree (id);


--
-- Name: IDX_id_-e88adb96; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_id_-e88adb96" ON public.location_fulfillment_set USING btree (id);


--
-- Name: IDX_id_-e8d2543e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_id_-e8d2543e" ON public.order_fulfillment USING btree (id);


--
-- Name: IDX_id_17a262437; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_id_17a262437" ON public.product_shipping_profile USING btree (id);


--
-- Name: IDX_id_17b4c4e35; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_id_17b4c4e35" ON public.product_variant_inventory_item USING btree (id);


--
-- Name: IDX_id_1c934dab0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_id_1c934dab0" ON public.region_payment_provider USING btree (id);


--
-- Name: IDX_id_20b454295; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_id_20b454295" ON public.product_sales_channel USING btree (id);


--
-- Name: IDX_id_26d06f470; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_id_26d06f470" ON public.sales_channel_stock_location USING btree (id);


--
-- Name: IDX_id_52b23597; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_id_52b23597" ON public.product_variant_price_set USING btree (id);


--
-- Name: IDX_id_5cb3a0c0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_id_5cb3a0c0" ON public.customer_account_holder USING btree (id);


--
-- Name: IDX_id_64ff0c4c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_id_64ff0c4c" ON public.user_rbac_role USING btree (id);


--
-- Name: IDX_id_ba32fa9c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_id_ba32fa9c" ON public.shipping_option_price_set USING btree (id);


--
-- Name: IDX_id_f42b9949; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_id_f42b9949" ON public.order_payment_collection USING btree (id);


--
-- Name: IDX_image_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_image_deleted_at" ON public.image USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_image_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_image_product_id" ON public.image USING btree (product_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_inventory_item_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_inventory_item_deleted_at" ON public.inventory_item USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_inventory_item_id_17b4c4e35; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_inventory_item_id_17b4c4e35" ON public.product_variant_inventory_item USING btree (inventory_item_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_inventory_item_sku; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_inventory_item_sku" ON public.inventory_item USING btree (sku) WHERE (deleted_at IS NULL);


--
-- Name: IDX_inventory_level_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_inventory_level_deleted_at" ON public.inventory_level USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_inventory_level_inventory_item_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_inventory_level_inventory_item_id" ON public.inventory_level USING btree (inventory_item_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_inventory_level_location_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_inventory_level_location_id" ON public.inventory_level USING btree (location_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_inventory_level_location_id_inventory_item_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_inventory_level_location_id_inventory_item_id" ON public.inventory_level USING btree (inventory_item_id, location_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_invite_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_invite_deleted_at" ON public.invite USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_invite_email_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_invite_email_unique" ON public.invite USING btree (email) WHERE (deleted_at IS NULL);


--
-- Name: IDX_invite_id_-85069d44; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_invite_id_-85069d44" ON public.invite_rbac_role USING btree (invite_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_invite_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_invite_token" ON public.invite USING btree (token) WHERE (deleted_at IS NULL);


--
-- Name: IDX_layout_configuration_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_layout_configuration_deleted_at" ON public.layout_configuration USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_layout_configuration_zone_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_layout_configuration_zone_unique" ON public.layout_configuration USING btree (zone) WHERE ((is_system_default = true) AND (deleted_at IS NULL));


--
-- Name: IDX_layout_configuration_zone_user_id_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_layout_configuration_zone_user_id_unique" ON public.layout_configuration USING btree (zone, user_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_line_item_adjustment_promotion_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_line_item_adjustment_promotion_id" ON public.cart_line_item_adjustment USING btree (promotion_id) WHERE ((deleted_at IS NULL) AND (promotion_id IS NOT NULL));


--
-- Name: IDX_line_item_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_line_item_product_id" ON public.cart_line_item USING btree (product_id) WHERE ((deleted_at IS NULL) AND (product_id IS NOT NULL));


--
-- Name: IDX_line_item_product_type_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_line_item_product_type_id" ON public.order_line_item USING btree (product_type_id) WHERE ((deleted_at IS NULL) AND (product_type_id IS NOT NULL));


--
-- Name: IDX_line_item_tax_line_tax_rate_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_line_item_tax_line_tax_rate_id" ON public.cart_line_item_tax_line USING btree (tax_rate_id) WHERE ((deleted_at IS NULL) AND (tax_rate_id IS NOT NULL));


--
-- Name: IDX_line_item_variant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_line_item_variant_id" ON public.cart_line_item USING btree (variant_id) WHERE ((deleted_at IS NULL) AND (variant_id IS NOT NULL));


--
-- Name: IDX_notification_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_notification_deleted_at" ON public.notification USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_notification_idempotency_key_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_notification_idempotency_key_unique" ON public.notification USING btree (idempotency_key) WHERE (deleted_at IS NULL);


--
-- Name: IDX_notification_provider_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_notification_provider_deleted_at" ON public.notification_provider USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_notification_provider_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_notification_provider_id" ON public.notification USING btree (provider_id);


--
-- Name: IDX_notification_receiver_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_notification_receiver_id" ON public.notification USING btree (receiver_id);


--
-- Name: IDX_option_value_option_id_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_option_value_option_id_unique" ON public.product_option_value USING btree (option_id, value) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_address_customer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_address_customer_id" ON public.order_address USING btree (customer_id);


--
-- Name: IDX_order_address_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_address_deleted_at" ON public.order_address USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_billing_address_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_billing_address_id" ON public."order" USING btree (billing_address_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_change_action_claim_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_change_action_claim_id" ON public.order_change_action USING btree (claim_id) WHERE ((claim_id IS NOT NULL) AND (deleted_at IS NULL));


--
-- Name: IDX_order_change_action_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_change_action_deleted_at" ON public.order_change_action USING btree (deleted_at);


--
-- Name: IDX_order_change_action_exchange_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_change_action_exchange_id" ON public.order_change_action USING btree (exchange_id) WHERE ((exchange_id IS NOT NULL) AND (deleted_at IS NULL));


--
-- Name: IDX_order_change_action_order_change_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_change_action_order_change_id" ON public.order_change_action USING btree (order_change_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_change_action_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_change_action_order_id" ON public.order_change_action USING btree (order_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_change_action_ordering; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_change_action_ordering" ON public.order_change_action USING btree (ordering) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_change_action_return_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_change_action_return_id" ON public.order_change_action USING btree (return_id) WHERE ((return_id IS NOT NULL) AND (deleted_at IS NULL));


--
-- Name: IDX_order_change_change_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_change_change_type" ON public.order_change USING btree (change_type);


--
-- Name: IDX_order_change_claim_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_change_claim_id" ON public.order_change USING btree (claim_id) WHERE ((claim_id IS NOT NULL) AND (deleted_at IS NULL));


--
-- Name: IDX_order_change_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_change_deleted_at" ON public.order_change USING btree (deleted_at);


--
-- Name: IDX_order_change_exchange_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_change_exchange_id" ON public.order_change USING btree (exchange_id) WHERE ((exchange_id IS NOT NULL) AND (deleted_at IS NULL));


--
-- Name: IDX_order_change_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_change_order_id" ON public.order_change USING btree (order_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_change_order_id_version; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_change_order_id_version" ON public.order_change USING btree (order_id, version);


--
-- Name: IDX_order_change_return_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_change_return_id" ON public.order_change USING btree (return_id) WHERE ((return_id IS NOT NULL) AND (deleted_at IS NULL));


--
-- Name: IDX_order_change_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_change_status" ON public.order_change USING btree (status) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_change_version; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_change_version" ON public.order_change USING btree (order_id, version) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_claim_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_claim_deleted_at" ON public.order_claim USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_claim_display_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_claim_display_id" ON public.order_claim USING btree (display_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_claim_item_claim_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_claim_item_claim_id" ON public.order_claim_item USING btree (claim_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_claim_item_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_claim_item_deleted_at" ON public.order_claim_item USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_claim_item_image_claim_item_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_claim_item_image_claim_item_id" ON public.order_claim_item_image USING btree (claim_item_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_claim_item_image_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_claim_item_image_deleted_at" ON public.order_claim_item_image USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_order_claim_item_item_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_claim_item_item_id" ON public.order_claim_item USING btree (item_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_claim_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_claim_order_id" ON public.order_claim USING btree (order_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_claim_return_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_claim_return_id" ON public.order_claim USING btree (return_id) WHERE ((return_id IS NOT NULL) AND (deleted_at IS NULL));


--
-- Name: IDX_order_credit_line_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_credit_line_deleted_at" ON public.order_credit_line USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_order_credit_line_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_credit_line_order_id" ON public.order_credit_line USING btree (order_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_credit_line_order_id_version; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_credit_line_order_id_version" ON public.order_credit_line USING btree (order_id, version) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_currency_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_currency_code" ON public."order" USING btree (currency_code) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_custom_display_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_order_custom_display_id" ON public."order" USING btree (custom_display_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_customer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_customer_id" ON public."order" USING btree (customer_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_deleted_at" ON public."order" USING btree (deleted_at);


--
-- Name: IDX_order_display_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_display_id" ON public."order" USING btree (display_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_exchange_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_exchange_deleted_at" ON public.order_exchange USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_exchange_display_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_exchange_display_id" ON public.order_exchange USING btree (display_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_exchange_item_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_exchange_item_deleted_at" ON public.order_exchange_item USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_exchange_item_exchange_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_exchange_item_exchange_id" ON public.order_exchange_item USING btree (exchange_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_exchange_item_item_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_exchange_item_item_id" ON public.order_exchange_item USING btree (item_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_exchange_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_exchange_order_id" ON public.order_exchange USING btree (order_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_exchange_return_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_exchange_return_id" ON public.order_exchange USING btree (return_id) WHERE ((return_id IS NOT NULL) AND (deleted_at IS NULL));


--
-- Name: IDX_order_id_-71069c16; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_id_-71069c16" ON public.order_cart USING btree (order_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_id_-71518339; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_id_-71518339" ON public.order_promotion USING btree (order_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_id_-e8d2543e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_id_-e8d2543e" ON public.order_fulfillment USING btree (order_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_id_f42b9949; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_id_f42b9949" ON public.order_payment_collection USING btree (order_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_is_draft_order; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_is_draft_order" ON public."order" USING btree (is_draft_order) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_item_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_item_deleted_at" ON public.order_item USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_order_item_item_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_item_item_id" ON public.order_item USING btree (item_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_item_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_item_order_id" ON public.order_item USING btree (order_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_item_order_id_version; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_item_order_id_version" ON public.order_item USING btree (order_id, version) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_line_item_adjustment_item_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_line_item_adjustment_item_id" ON public.order_line_item_adjustment USING btree (item_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_line_item_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_line_item_product_id" ON public.order_line_item USING btree (product_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_line_item_tax_line_item_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_line_item_tax_line_item_id" ON public.order_line_item_tax_line USING btree (item_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_line_item_variant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_line_item_variant_id" ON public.order_line_item USING btree (variant_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_region_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_region_id" ON public."order" USING btree (region_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_sales_channel_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_sales_channel_id" ON public."order" USING btree (sales_channel_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_shipping_address_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_shipping_address_id" ON public."order" USING btree (shipping_address_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_shipping_claim_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_shipping_claim_id" ON public.order_shipping USING btree (claim_id) WHERE ((claim_id IS NOT NULL) AND (deleted_at IS NULL));


--
-- Name: IDX_order_shipping_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_shipping_deleted_at" ON public.order_shipping USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_order_shipping_exchange_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_shipping_exchange_id" ON public.order_shipping USING btree (exchange_id) WHERE ((exchange_id IS NOT NULL) AND (deleted_at IS NULL));


--
-- Name: IDX_order_shipping_item_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_shipping_item_id" ON public.order_shipping USING btree (shipping_method_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_shipping_method_adjustment_shipping_method_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_shipping_method_adjustment_shipping_method_id" ON public.order_shipping_method_adjustment USING btree (shipping_method_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_shipping_method_adjustment_version_shipping_method; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_order_shipping_method_adjustment_version_shipping_method" ON public.order_shipping_method_adjustment USING btree (version, shipping_method_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_shipping_method_shipping_option_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_shipping_method_shipping_option_id" ON public.order_shipping_method USING btree (shipping_option_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_shipping_method_tax_line_shipping_method_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_shipping_method_tax_line_shipping_method_id" ON public.order_shipping_method_tax_line USING btree (shipping_method_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_shipping_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_shipping_order_id" ON public.order_shipping USING btree (order_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_shipping_order_id_version; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_shipping_order_id_version" ON public.order_shipping USING btree (order_id, version) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_shipping_return_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_shipping_return_id" ON public.order_shipping USING btree (return_id) WHERE ((return_id IS NOT NULL) AND (deleted_at IS NULL));


--
-- Name: IDX_order_shipping_shipping_method_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_shipping_shipping_method_id" ON public.order_shipping USING btree (shipping_method_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_summary_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_summary_deleted_at" ON public.order_summary USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_order_summary_order_id_version; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_summary_order_id_version" ON public.order_summary USING btree (order_id, version) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_transaction_claim_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_transaction_claim_id" ON public.order_transaction USING btree (claim_id) WHERE ((claim_id IS NOT NULL) AND (deleted_at IS NULL));


--
-- Name: IDX_order_transaction_currency_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_transaction_currency_code" ON public.order_transaction USING btree (currency_code) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_transaction_exchange_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_transaction_exchange_id" ON public.order_transaction USING btree (exchange_id) WHERE ((exchange_id IS NOT NULL) AND (deleted_at IS NULL));


--
-- Name: IDX_order_transaction_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_transaction_order_id" ON public.order_transaction USING btree (order_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_transaction_order_id_version; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_transaction_order_id_version" ON public.order_transaction USING btree (order_id, version) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_transaction_reference_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_transaction_reference_id" ON public.order_transaction USING btree (reference_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_transaction_return_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_transaction_return_id" ON public.order_transaction USING btree (return_id) WHERE ((return_id IS NOT NULL) AND (deleted_at IS NULL));


--
-- Name: IDX_payment_collection_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_payment_collection_deleted_at" ON public.payment_collection USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_payment_collection_id_-4a39f6c9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_payment_collection_id_-4a39f6c9" ON public.cart_payment_collection USING btree (payment_collection_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_payment_collection_id_f42b9949; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_payment_collection_id_f42b9949" ON public.order_payment_collection USING btree (payment_collection_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_payment_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_payment_deleted_at" ON public.payment USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_payment_payment_collection_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_payment_payment_collection_id" ON public.payment USING btree (payment_collection_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_payment_payment_session_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_payment_payment_session_id" ON public.payment USING btree (payment_session_id);


--
-- Name: IDX_payment_payment_session_id_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_payment_payment_session_id_unique" ON public.payment USING btree (payment_session_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_payment_provider_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_payment_provider_deleted_at" ON public.payment_provider USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_payment_provider_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_payment_provider_id" ON public.payment USING btree (provider_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_payment_provider_id_1c934dab0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_payment_provider_id_1c934dab0" ON public.region_payment_provider USING btree (payment_provider_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_payment_session_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_payment_session_deleted_at" ON public.payment_session USING btree (deleted_at);


--
-- Name: IDX_payment_session_payment_collection_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_payment_session_payment_collection_id" ON public.payment_session USING btree (payment_collection_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_price_currency_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_price_currency_code" ON public.price USING btree (currency_code) WHERE (deleted_at IS NULL);


--
-- Name: IDX_price_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_price_deleted_at" ON public.price USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_price_list_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_price_list_deleted_at" ON public.price_list USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_price_list_id_status_starts_at_ends_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_price_list_id_status_starts_at_ends_at" ON public.price_list USING btree (id, status, starts_at, ends_at) WHERE ((deleted_at IS NULL) AND (status = 'active'::text));


--
-- Name: IDX_price_list_rule_attribute; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_price_list_rule_attribute" ON public.price_list_rule USING btree (attribute) WHERE (deleted_at IS NULL);


--
-- Name: IDX_price_list_rule_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_price_list_rule_deleted_at" ON public.price_list_rule USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_price_list_rule_price_list_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_price_list_rule_price_list_id" ON public.price_list_rule USING btree (price_list_id) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_price_list_rule_value; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_price_list_rule_value" ON public.price_list_rule USING gin (value) WHERE (deleted_at IS NULL);


--
-- Name: IDX_price_preference_attribute_value; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_price_preference_attribute_value" ON public.price_preference USING btree (attribute, value) WHERE (deleted_at IS NULL);


--
-- Name: IDX_price_preference_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_price_preference_deleted_at" ON public.price_preference USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_price_price_list_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_price_price_list_id" ON public.price USING btree (price_list_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_price_price_set_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_price_price_set_id" ON public.price USING btree (price_set_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_price_rule_attribute; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_price_rule_attribute" ON public.price_rule USING btree (attribute) WHERE (deleted_at IS NULL);


--
-- Name: IDX_price_rule_attribute_value; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_price_rule_attribute_value" ON public.price_rule USING btree (attribute, value) WHERE (deleted_at IS NULL);


--
-- Name: IDX_price_rule_attribute_value_price_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_price_rule_attribute_value_price_id" ON public.price_rule USING btree (attribute, value, price_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_price_rule_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_price_rule_deleted_at" ON public.price_rule USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_price_rule_operator; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_price_rule_operator" ON public.price_rule USING btree (operator);


--
-- Name: IDX_price_rule_operator_value; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_price_rule_operator_value" ON public.price_rule USING btree (operator, value) WHERE (deleted_at IS NULL);


--
-- Name: IDX_price_rule_price_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_price_rule_price_id" ON public.price_rule USING btree (price_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_price_rule_price_id_attribute_operator_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_price_rule_price_id_attribute_operator_unique" ON public.price_rule USING btree (price_id, attribute, operator) WHERE (deleted_at IS NULL);


--
-- Name: IDX_price_set_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_price_set_deleted_at" ON public.price_set USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_price_set_id_52b23597; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_price_set_id_52b23597" ON public.product_variant_price_set USING btree (price_set_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_price_set_id_ba32fa9c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_price_set_id_ba32fa9c" ON public.shipping_option_price_set USING btree (price_set_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_category_parent_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_product_category_parent_category_id" ON public.product_category USING btree (parent_category_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_category_path; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_product_category_path" ON public.product_category USING btree (mpath) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_collection_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_product_collection_deleted_at" ON public.product_collection USING btree (deleted_at);


--
-- Name: IDX_product_collection_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_product_collection_id" ON public.product USING btree (collection_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_product_deleted_at" ON public.product USING btree (deleted_at);


--
-- Name: IDX_product_handle_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_product_handle_unique" ON public.product USING btree (handle) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_id_17a262437; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_product_id_17a262437" ON public.product_shipping_profile USING btree (product_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_id_20b454295; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_product_id_20b454295" ON public.product_sales_channel USING btree (product_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_image_rank; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_product_image_rank" ON public.image USING btree (rank) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_image_rank_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_product_image_rank_product_id" ON public.image USING btree (rank, product_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_image_url; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_product_image_url" ON public.image USING btree (url) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_image_url_rank_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_product_image_url_rank_product_id" ON public.image USING btree (url, rank, product_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_option_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_product_option_deleted_at" ON public.product_option USING btree (deleted_at);


--
-- Name: IDX_product_option_global_title_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_product_option_global_title_unique" ON public.product_option USING btree (title) WHERE ((deleted_at IS NULL) AND (is_exclusive = false));


--
-- Name: IDX_product_option_value_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_product_option_value_deleted_at" ON public.product_option_value USING btree (deleted_at);


--
-- Name: IDX_product_option_value_option_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_product_option_value_option_id" ON public.product_option_value USING btree (option_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_product_option_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_product_product_option_deleted_at" ON public.product_product_option USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_product_option_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_product_product_option_product_id" ON public.product_product_option USING btree (product_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_product_option_product_option_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_product_product_option_product_option_id" ON public.product_product_option USING btree (product_option_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_product_option_value_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_product_product_option_value_deleted_at" ON public.product_product_option_value USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_product_option_value_product_option_value_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_product_product_option_value_product_option_value_id" ON public.product_product_option_value USING btree (product_option_value_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_product_option_value_product_product_option_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_product_product_option_value_product_product_option_id" ON public.product_product_option_value USING btree (product_product_option_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_product_option_value_product_product_option_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_product_product_option_value_product_product_option_id_fk" ON public.product_product_option_value USING btree (product_product_option_id);


--
-- Name: IDX_product_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_product_status" ON public.product USING btree (status) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_tag_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_product_tag_deleted_at" ON public.product_tag USING btree (deleted_at);


--
-- Name: IDX_product_type_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_product_type_deleted_at" ON public.product_type USING btree (deleted_at);


--
-- Name: IDX_product_type_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_product_type_id" ON public.product USING btree (type_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_variant_barcode_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_product_variant_barcode_unique" ON public.product_variant USING btree (barcode) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_variant_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_product_variant_deleted_at" ON public.product_variant USING btree (deleted_at);


--
-- Name: IDX_product_variant_ean_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_product_variant_ean_unique" ON public.product_variant USING btree (ean) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_variant_id_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_product_variant_id_product_id" ON public.product_variant USING btree (id, product_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_variant_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_product_variant_product_id" ON public.product_variant USING btree (product_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_variant_product_image_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_product_variant_product_image_deleted_at" ON public.product_variant_product_image USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_variant_product_image_image_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_product_variant_product_image_image_id" ON public.product_variant_product_image USING btree (image_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_variant_product_image_variant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_product_variant_product_image_variant_id" ON public.product_variant_product_image USING btree (variant_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_variant_sku_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_product_variant_sku_unique" ON public.product_variant USING btree (sku) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_variant_upc_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_product_variant_upc_unique" ON public.product_variant USING btree (upc) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_application_method_currency_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_promotion_application_method_currency_code" ON public.promotion_application_method USING btree (currency_code) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_promotion_application_method_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_promotion_application_method_deleted_at" ON public.promotion_application_method USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_application_method_promotion_id_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_promotion_application_method_promotion_id_unique" ON public.promotion_application_method USING btree (promotion_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_campaign_budget_campaign_id_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_promotion_campaign_budget_campaign_id_unique" ON public.promotion_campaign_budget USING btree (campaign_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_campaign_budget_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_promotion_campaign_budget_deleted_at" ON public.promotion_campaign_budget USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_campaign_budget_usage_attribute_value_budget_id_u; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_promotion_campaign_budget_usage_attribute_value_budget_id_u" ON public.promotion_campaign_budget_usage USING btree (attribute_value, budget_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_campaign_budget_usage_budget_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_promotion_campaign_budget_usage_budget_id" ON public.promotion_campaign_budget_usage USING btree (budget_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_campaign_budget_usage_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_promotion_campaign_budget_usage_deleted_at" ON public.promotion_campaign_budget_usage USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_campaign_campaign_identifier_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_promotion_campaign_campaign_identifier_unique" ON public.promotion_campaign USING btree (campaign_identifier) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_campaign_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_promotion_campaign_deleted_at" ON public.promotion_campaign USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_campaign_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_promotion_campaign_id" ON public.promotion USING btree (campaign_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_promotion_deleted_at" ON public.promotion USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_id_-71518339; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_promotion_id_-71518339" ON public.order_promotion USING btree (promotion_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_id_-a9d4a70b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_promotion_id_-a9d4a70b" ON public.cart_promotion USING btree (promotion_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_is_automatic; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_promotion_is_automatic" ON public.promotion USING btree (is_automatic) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_rule_attribute; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_promotion_rule_attribute" ON public.promotion_rule USING btree (attribute);


--
-- Name: IDX_promotion_rule_attribute_operator; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_promotion_rule_attribute_operator" ON public.promotion_rule USING btree (attribute, operator) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_rule_attribute_operator_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_promotion_rule_attribute_operator_id" ON public.promotion_rule USING btree (operator, attribute, id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_rule_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_promotion_rule_deleted_at" ON public.promotion_rule USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_rule_operator; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_promotion_rule_operator" ON public.promotion_rule USING btree (operator);


--
-- Name: IDX_promotion_rule_value_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_promotion_rule_value_deleted_at" ON public.promotion_rule_value USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_rule_value_promotion_rule_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_promotion_rule_value_promotion_rule_id" ON public.promotion_rule_value USING btree (promotion_rule_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_rule_value_rule_id_value; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_promotion_rule_value_rule_id_value" ON public.promotion_rule_value USING btree (promotion_rule_id, value) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_rule_value_value; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_promotion_rule_value_value" ON public.promotion_rule_value USING btree (value) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_promotion_status" ON public.promotion USING btree (status) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_promotion_type" ON public.promotion USING btree (type);


--
-- Name: IDX_property_label_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_property_label_deleted_at" ON public.property_label USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_property_label_entity; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_property_label_entity" ON public.property_label USING btree (entity) WHERE (deleted_at IS NULL);


--
-- Name: IDX_property_label_entity_property_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_property_label_entity_property_unique" ON public.property_label USING btree (entity, property) WHERE (deleted_at IS NULL);


--
-- Name: IDX_provider_identity_auth_identity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_provider_identity_auth_identity_id" ON public.provider_identity USING btree (auth_identity_id);


--
-- Name: IDX_provider_identity_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_provider_identity_deleted_at" ON public.provider_identity USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_provider_identity_provider_entity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_provider_identity_provider_entity_id" ON public.provider_identity USING btree (entity_id, provider);


--
-- Name: IDX_publishable_key_id_-1d67bae40; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_publishable_key_id_-1d67bae40" ON public.publishable_api_key_sales_channel USING btree (publishable_key_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_rbac_role_id_-85069d44; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_rbac_role_id_-85069d44" ON public.invite_rbac_role USING btree (rbac_role_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_rbac_role_id_64ff0c4c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_rbac_role_id_64ff0c4c" ON public.user_rbac_role USING btree (rbac_role_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_refund_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_refund_deleted_at" ON public.refund USING btree (deleted_at);


--
-- Name: IDX_refund_payment_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_refund_payment_id" ON public.refund USING btree (payment_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_refund_payment_id_idempotency_key_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_refund_payment_id_idempotency_key_unique" ON public.refund USING btree (payment_id, idempotency_key) WHERE ((idempotency_key IS NOT NULL) AND (deleted_at IS NULL));


--
-- Name: IDX_refund_reason_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_refund_reason_deleted_at" ON public.refund_reason USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_refund_refund_reason_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_refund_refund_reason_id" ON public.refund USING btree (refund_reason_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_region_country_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_region_country_deleted_at" ON public.region_country USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_region_country_region_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_region_country_region_id" ON public.region_country USING btree (region_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_region_country_region_id_iso_2_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_region_country_region_id_iso_2_unique" ON public.region_country USING btree (region_id, iso_2);


--
-- Name: IDX_region_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_region_deleted_at" ON public.region USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_region_id_1c934dab0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_region_id_1c934dab0" ON public.region_payment_provider USING btree (region_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_reservation_item_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_reservation_item_deleted_at" ON public.reservation_item USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_reservation_item_inventory_item_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_reservation_item_inventory_item_id" ON public.reservation_item USING btree (inventory_item_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_reservation_item_line_item_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_reservation_item_line_item_id" ON public.reservation_item USING btree (line_item_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_reservation_item_location_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_reservation_item_location_id" ON public.reservation_item USING btree (location_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_return_claim_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_return_claim_id" ON public.return USING btree (claim_id) WHERE ((claim_id IS NOT NULL) AND (deleted_at IS NULL));


--
-- Name: IDX_return_display_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_return_display_id" ON public.return USING btree (display_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_return_exchange_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_return_exchange_id" ON public.return USING btree (exchange_id) WHERE ((exchange_id IS NOT NULL) AND (deleted_at IS NULL));


--
-- Name: IDX_return_id_-31ea43a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_return_id_-31ea43a" ON public.return_fulfillment USING btree (return_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_return_item_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_return_item_deleted_at" ON public.return_item USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_return_item_item_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_return_item_item_id" ON public.return_item USING btree (item_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_return_item_reason_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_return_item_reason_id" ON public.return_item USING btree (reason_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_return_item_return_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_return_item_return_id" ON public.return_item USING btree (return_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_return_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_return_order_id" ON public.return USING btree (order_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_return_reason_parent_return_reason_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_return_reason_parent_return_reason_id" ON public.return_reason USING btree (parent_return_reason_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_return_reason_value; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_return_reason_value" ON public.return_reason USING btree (value) WHERE (deleted_at IS NULL);


--
-- Name: IDX_sales_channel_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_sales_channel_deleted_at" ON public.sales_channel USING btree (deleted_at);


--
-- Name: IDX_sales_channel_id_-1d67bae40; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_sales_channel_id_-1d67bae40" ON public.publishable_api_key_sales_channel USING btree (sales_channel_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_sales_channel_id_20b454295; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_sales_channel_id_20b454295" ON public.product_sales_channel USING btree (sales_channel_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_sales_channel_id_26d06f470; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_sales_channel_id_26d06f470" ON public.sales_channel_stock_location USING btree (sales_channel_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_search_index_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_search_index_deleted_at" ON public.search_index USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_search_index_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_search_index_name" ON public.search_index USING btree (name) WHERE (deleted_at IS NULL);


--
-- Name: IDX_search_index_sync_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_search_index_sync_deleted_at" ON public.search_index_sync USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_search_index_sync_job_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_search_index_sync_job_id" ON public.search_index_sync USING btree (job_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_search_index_sync_search_index_version_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_search_index_sync_search_index_version_id" ON public.search_index_sync USING btree (search_index_version_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_search_index_version_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_search_index_version_deleted_at" ON public.search_index_version USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_search_index_version_search_index_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_search_index_version_search_index_id" ON public.search_index_version USING btree (search_index_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_search_index_version_search_index_id_version; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_search_index_version_search_index_id_version" ON public.search_index_version USING btree (search_index_id, version) WHERE (deleted_at IS NULL);


--
-- Name: IDX_service_zone_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_service_zone_deleted_at" ON public.service_zone USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_service_zone_fulfillment_set_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_service_zone_fulfillment_set_id" ON public.service_zone USING btree (fulfillment_set_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_service_zone_name_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_service_zone_name_unique" ON public.service_zone USING btree (name) WHERE (deleted_at IS NULL);


--
-- Name: IDX_shipping_method_adjustment_promotion_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_shipping_method_adjustment_promotion_id" ON public.cart_shipping_method_adjustment USING btree (promotion_id) WHERE ((deleted_at IS NULL) AND (promotion_id IS NOT NULL));


--
-- Name: IDX_shipping_method_option_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_shipping_method_option_id" ON public.cart_shipping_method USING btree (shipping_option_id) WHERE ((deleted_at IS NULL) AND (shipping_option_id IS NOT NULL));


--
-- Name: IDX_shipping_method_tax_line_tax_rate_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_shipping_method_tax_line_tax_rate_id" ON public.cart_shipping_method_tax_line USING btree (tax_rate_id) WHERE ((deleted_at IS NULL) AND (tax_rate_id IS NOT NULL));


--
-- Name: IDX_shipping_option_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_shipping_option_deleted_at" ON public.shipping_option USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_shipping_option_id_ba32fa9c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_shipping_option_id_ba32fa9c" ON public.shipping_option_price_set USING btree (shipping_option_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_shipping_option_provider_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_shipping_option_provider_id" ON public.shipping_option USING btree (provider_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_shipping_option_rule_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_shipping_option_rule_deleted_at" ON public.shipping_option_rule USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_shipping_option_rule_shipping_option_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_shipping_option_rule_shipping_option_id" ON public.shipping_option_rule USING btree (shipping_option_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_shipping_option_service_zone_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_shipping_option_service_zone_id" ON public.shipping_option USING btree (service_zone_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_shipping_option_shipping_option_type_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_shipping_option_shipping_option_type_id" ON public.shipping_option USING btree (shipping_option_type_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_shipping_option_shipping_profile_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_shipping_option_shipping_profile_id" ON public.shipping_option USING btree (shipping_profile_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_shipping_option_type_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_shipping_option_type_deleted_at" ON public.shipping_option_type USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_shipping_profile_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_shipping_profile_deleted_at" ON public.shipping_profile USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_shipping_profile_id_17a262437; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_shipping_profile_id_17a262437" ON public.product_shipping_profile USING btree (shipping_profile_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_shipping_profile_name_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_shipping_profile_name_unique" ON public.shipping_profile USING btree (name) WHERE (deleted_at IS NULL);


--
-- Name: IDX_single_default_region; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_single_default_region" ON public.tax_rate USING btree (tax_region_id) WHERE ((is_default = true) AND (deleted_at IS NULL));


--
-- Name: IDX_stock_location_address_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_stock_location_address_deleted_at" ON public.stock_location_address USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_stock_location_address_id_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_stock_location_address_id_unique" ON public.stock_location USING btree (address_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_stock_location_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_stock_location_deleted_at" ON public.stock_location USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_stock_location_id_-1e5992737; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_stock_location_id_-1e5992737" ON public.location_fulfillment_provider USING btree (stock_location_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_stock_location_id_-e88adb96; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_stock_location_id_-e88adb96" ON public.location_fulfillment_set USING btree (stock_location_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_stock_location_id_26d06f470; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_stock_location_id_26d06f470" ON public.sales_channel_stock_location USING btree (stock_location_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_store_currency_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_store_currency_deleted_at" ON public.store_currency USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_store_currency_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_store_currency_store_id" ON public.store_currency USING btree (store_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_store_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_store_deleted_at" ON public.store USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_store_locale_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_store_locale_deleted_at" ON public.store_locale USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_store_locale_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_store_locale_store_id" ON public.store_locale USING btree (store_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_tag_value_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_tag_value_unique" ON public.product_tag USING btree (value) WHERE (deleted_at IS NULL);


--
-- Name: IDX_tax_provider_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_tax_provider_deleted_at" ON public.tax_provider USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_tax_rate_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_tax_rate_deleted_at" ON public.tax_rate USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_tax_rate_rule_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_tax_rate_rule_deleted_at" ON public.tax_rate_rule USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_tax_rate_rule_reference_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_tax_rate_rule_reference_id" ON public.tax_rate_rule USING btree (reference_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_tax_rate_rule_tax_rate_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_tax_rate_rule_tax_rate_id" ON public.tax_rate_rule USING btree (tax_rate_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_tax_rate_rule_unique_rate_reference; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_tax_rate_rule_unique_rate_reference" ON public.tax_rate_rule USING btree (tax_rate_id, reference_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_tax_rate_tax_region_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_tax_rate_tax_region_id" ON public.tax_rate USING btree (tax_region_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_tax_region_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_tax_region_deleted_at" ON public.tax_region USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_tax_region_parent_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_tax_region_parent_id" ON public.tax_region USING btree (parent_id);


--
-- Name: IDX_tax_region_provider_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_tax_region_provider_id" ON public.tax_region USING btree (provider_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_tax_region_unique_country_nullable_province; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_tax_region_unique_country_nullable_province" ON public.tax_region USING btree (country_code) WHERE ((province_code IS NULL) AND (deleted_at IS NULL));


--
-- Name: IDX_tax_region_unique_country_province; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_tax_region_unique_country_province" ON public.tax_region USING btree (country_code, province_code) WHERE (deleted_at IS NULL);


--
-- Name: IDX_type_value_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_type_value_unique" ON public.product_type USING btree (value) WHERE (deleted_at IS NULL);


--
-- Name: IDX_unique_promotion_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_unique_promotion_code" ON public.promotion USING btree (code) WHERE (deleted_at IS NULL);


--
-- Name: IDX_user_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_user_deleted_at" ON public."user" USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_user_email_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_user_email_unique" ON public."user" USING btree (email) WHERE (deleted_at IS NULL);


--
-- Name: IDX_user_id_64ff0c4c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_user_id_64ff0c4c" ON public.user_rbac_role USING btree (user_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_user_preference_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_user_preference_deleted_at" ON public.user_preference USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_user_preference_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_user_preference_user_id" ON public.user_preference USING btree (user_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_user_preference_user_id_key_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_user_preference_user_id_key_unique" ON public.user_preference USING btree (user_id, key) WHERE (deleted_at IS NULL);


--
-- Name: IDX_variant_id_17b4c4e35; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_variant_id_17b4c4e35" ON public.product_variant_inventory_item USING btree (variant_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_variant_id_52b23597; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_variant_id_52b23597" ON public.product_variant_price_set USING btree (variant_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_view_configuration_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_view_configuration_deleted_at" ON public.view_configuration USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_view_configuration_entity_is_system_default; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_view_configuration_entity_is_system_default" ON public.view_configuration USING btree (entity, is_system_default) WHERE (deleted_at IS NULL);


--
-- Name: IDX_view_configuration_entity_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_view_configuration_entity_user_id" ON public.view_configuration USING btree (entity, user_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_view_configuration_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_view_configuration_user_id" ON public.view_configuration USING btree (user_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_workflow_execution_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_workflow_execution_deleted_at" ON public.workflow_execution USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_workflow_execution_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_workflow_execution_id" ON public.workflow_execution USING btree (id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_workflow_execution_retention_time_updated_at_state; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_workflow_execution_retention_time_updated_at_state" ON public.workflow_execution USING btree (retention_time, updated_at, state) WHERE ((deleted_at IS NULL) AND (retention_time IS NOT NULL));


--
-- Name: IDX_workflow_execution_run_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_workflow_execution_run_id" ON public.workflow_execution USING btree (run_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_workflow_execution_state; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_workflow_execution_state" ON public.workflow_execution USING btree (state) WHERE (deleted_at IS NULL);


--
-- Name: IDX_workflow_execution_state_updated_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_workflow_execution_state_updated_at" ON public.workflow_execution USING btree (state, updated_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_workflow_execution_transaction_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_workflow_execution_transaction_id" ON public.workflow_execution USING btree (transaction_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_workflow_execution_updated_at_retention_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_workflow_execution_updated_at_retention_time" ON public.workflow_execution USING btree (updated_at, retention_time) WHERE ((deleted_at IS NULL) AND (retention_time IS NOT NULL) AND ((state)::text = ANY ((ARRAY['done'::character varying, 'failed'::character varying, 'reverted'::character varying])::text[])));


--
-- Name: IDX_workflow_execution_workflow_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_workflow_execution_workflow_id" ON public.workflow_execution USING btree (workflow_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_workflow_execution_workflow_id_transaction_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_workflow_execution_workflow_id_transaction_id" ON public.workflow_execution USING btree (workflow_id, transaction_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_workflow_execution_workflow_id_transaction_id_run_id_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_workflow_execution_workflow_id_transaction_id_run_id_unique" ON public.workflow_execution USING btree (workflow_id, transaction_id, run_id) WHERE (deleted_at IS NULL);


--
-- Name: idx_script_name_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_script_name_unique ON public.script_migrations USING btree (script_name);


--
-- Name: search_pg_product_v1_fts_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX search_pg_product_v1_fts_idx ON public.search_pg_product_v1 USING gin (search_vector);


--
-- Name: search_pg_product_v1_indexed_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX search_pg_product_v1_indexed_idx ON public.search_pg_product_v1 USING gin (indexed jsonb_path_ops);


--
-- Name: search_pg_product_v1_trgm_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX search_pg_product_v1_trgm_idx ON public.search_pg_product_v1 USING gin (search_text public.gin_trgm_ops);


--
-- Name: tax_rate_rule FK_tax_rate_rule_tax_rate_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_rate_rule
    ADD CONSTRAINT "FK_tax_rate_rule_tax_rate_id" FOREIGN KEY (tax_rate_id) REFERENCES public.tax_rate(id) ON DELETE CASCADE;


--
-- Name: tax_rate FK_tax_rate_tax_region_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_rate
    ADD CONSTRAINT "FK_tax_rate_tax_region_id" FOREIGN KEY (tax_region_id) REFERENCES public.tax_region(id) ON DELETE CASCADE;


--
-- Name: tax_region FK_tax_region_parent_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_region
    ADD CONSTRAINT "FK_tax_region_parent_id" FOREIGN KEY (parent_id) REFERENCES public.tax_region(id) ON DELETE CASCADE;


--
-- Name: tax_region FK_tax_region_provider_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_region
    ADD CONSTRAINT "FK_tax_region_provider_id" FOREIGN KEY (provider_id) REFERENCES public.tax_provider(id) ON DELETE SET NULL;


--
-- Name: application_method_buy_rules application_method_buy_rules_application_method_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_method_buy_rules
    ADD CONSTRAINT application_method_buy_rules_application_method_id_foreign FOREIGN KEY (application_method_id) REFERENCES public.promotion_application_method(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: application_method_buy_rules application_method_buy_rules_promotion_rule_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_method_buy_rules
    ADD CONSTRAINT application_method_buy_rules_promotion_rule_id_foreign FOREIGN KEY (promotion_rule_id) REFERENCES public.promotion_rule(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: application_method_target_rules application_method_target_rules_application_method_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_method_target_rules
    ADD CONSTRAINT application_method_target_rules_application_method_id_foreign FOREIGN KEY (application_method_id) REFERENCES public.promotion_application_method(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: application_method_target_rules application_method_target_rules_promotion_rule_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_method_target_rules
    ADD CONSTRAINT application_method_target_rules_promotion_rule_id_foreign FOREIGN KEY (promotion_rule_id) REFERENCES public.promotion_rule(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: auth_mfa_factor auth_mfa_factor_auth_identity_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_mfa_factor
    ADD CONSTRAINT auth_mfa_factor_auth_identity_id_foreign FOREIGN KEY (auth_identity_id) REFERENCES public.auth_identity(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: auth_mfa_recovery_code auth_mfa_recovery_code_auth_identity_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_mfa_recovery_code
    ADD CONSTRAINT auth_mfa_recovery_code_auth_identity_id_foreign FOREIGN KEY (auth_identity_id) REFERENCES public.auth_identity(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: auth_password_reset_token auth_password_reset_token_auth_identity_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_password_reset_token
    ADD CONSTRAINT auth_password_reset_token_auth_identity_id_foreign FOREIGN KEY (auth_identity_id) REFERENCES public.auth_identity(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: auth_password_reset_token auth_password_reset_token_provider_identity_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_password_reset_token
    ADD CONSTRAINT auth_password_reset_token_provider_identity_id_foreign FOREIGN KEY (provider_identity_id) REFERENCES public.provider_identity(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: auth_verification auth_verification_auth_identity_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_verification
    ADD CONSTRAINT auth_verification_auth_identity_id_foreign FOREIGN KEY (auth_identity_id) REFERENCES public.auth_identity(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: capture capture_payment_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.capture
    ADD CONSTRAINT capture_payment_id_foreign FOREIGN KEY (payment_id) REFERENCES public.payment(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cart cart_billing_address_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_billing_address_id_foreign FOREIGN KEY (billing_address_id) REFERENCES public.cart_address(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: cart_line_item_adjustment cart_line_item_adjustment_item_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_line_item_adjustment
    ADD CONSTRAINT cart_line_item_adjustment_item_id_foreign FOREIGN KEY (item_id) REFERENCES public.cart_line_item(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cart_line_item cart_line_item_cart_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_line_item
    ADD CONSTRAINT cart_line_item_cart_id_foreign FOREIGN KEY (cart_id) REFERENCES public.cart(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cart_line_item_tax_line cart_line_item_tax_line_item_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_line_item_tax_line
    ADD CONSTRAINT cart_line_item_tax_line_item_id_foreign FOREIGN KEY (item_id) REFERENCES public.cart_line_item(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cart cart_shipping_address_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_shipping_address_id_foreign FOREIGN KEY (shipping_address_id) REFERENCES public.cart_address(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: cart_shipping_method_adjustment cart_shipping_method_adjustment_shipping_method_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_shipping_method_adjustment
    ADD CONSTRAINT cart_shipping_method_adjustment_shipping_method_id_foreign FOREIGN KEY (shipping_method_id) REFERENCES public.cart_shipping_method(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cart_shipping_method cart_shipping_method_cart_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_shipping_method
    ADD CONSTRAINT cart_shipping_method_cart_id_foreign FOREIGN KEY (cart_id) REFERENCES public.cart(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cart_shipping_method_tax_line cart_shipping_method_tax_line_shipping_method_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_shipping_method_tax_line
    ADD CONSTRAINT cart_shipping_method_tax_line_shipping_method_id_foreign FOREIGN KEY (shipping_method_id) REFERENCES public.cart_shipping_method(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: credit_line credit_line_cart_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_line
    ADD CONSTRAINT credit_line_cart_id_foreign FOREIGN KEY (cart_id) REFERENCES public.cart(id) ON UPDATE CASCADE;


--
-- Name: customer_address customer_address_customer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_address
    ADD CONSTRAINT customer_address_customer_id_foreign FOREIGN KEY (customer_id) REFERENCES public.customer(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: customer_group_customer customer_group_customer_customer_group_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_group_customer
    ADD CONSTRAINT customer_group_customer_customer_group_id_foreign FOREIGN KEY (customer_group_id) REFERENCES public.customer_group(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: customer_group_customer customer_group_customer_customer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_group_customer
    ADD CONSTRAINT customer_group_customer_customer_id_foreign FOREIGN KEY (customer_id) REFERENCES public.customer(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fulfillment fulfillment_delivery_address_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fulfillment
    ADD CONSTRAINT fulfillment_delivery_address_id_foreign FOREIGN KEY (delivery_address_id) REFERENCES public.fulfillment_address(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: fulfillment_item fulfillment_item_fulfillment_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fulfillment_item
    ADD CONSTRAINT fulfillment_item_fulfillment_id_foreign FOREIGN KEY (fulfillment_id) REFERENCES public.fulfillment(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fulfillment_label fulfillment_label_fulfillment_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fulfillment_label
    ADD CONSTRAINT fulfillment_label_fulfillment_id_foreign FOREIGN KEY (fulfillment_id) REFERENCES public.fulfillment(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fulfillment fulfillment_provider_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fulfillment
    ADD CONSTRAINT fulfillment_provider_id_foreign FOREIGN KEY (provider_id) REFERENCES public.fulfillment_provider(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: fulfillment fulfillment_shipping_option_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fulfillment
    ADD CONSTRAINT fulfillment_shipping_option_id_foreign FOREIGN KEY (shipping_option_id) REFERENCES public.shipping_option(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: geo_zone geo_zone_service_zone_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geo_zone
    ADD CONSTRAINT geo_zone_service_zone_id_foreign FOREIGN KEY (service_zone_id) REFERENCES public.service_zone(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: image image_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.product(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: inventory_level inventory_level_inventory_item_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_level
    ADD CONSTRAINT inventory_level_inventory_item_id_foreign FOREIGN KEY (inventory_item_id) REFERENCES public.inventory_item(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: notification notification_provider_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_provider_id_foreign FOREIGN KEY (provider_id) REFERENCES public.notification_provider(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: order order_billing_address_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_billing_address_id_foreign FOREIGN KEY (billing_address_id) REFERENCES public.order_address(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: order_change_action order_change_action_order_change_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_change_action
    ADD CONSTRAINT order_change_action_order_change_id_foreign FOREIGN KEY (order_change_id) REFERENCES public.order_change(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order_change order_change_order_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_change
    ADD CONSTRAINT order_change_order_id_foreign FOREIGN KEY (order_id) REFERENCES public."order"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order_credit_line order_credit_line_order_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_credit_line
    ADD CONSTRAINT order_credit_line_order_id_foreign FOREIGN KEY (order_id) REFERENCES public."order"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order_item order_item_item_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_item_id_foreign FOREIGN KEY (item_id) REFERENCES public.order_line_item(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order_item order_item_order_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_order_id_foreign FOREIGN KEY (order_id) REFERENCES public."order"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order_line_item_adjustment order_line_item_adjustment_item_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_line_item_adjustment
    ADD CONSTRAINT order_line_item_adjustment_item_id_foreign FOREIGN KEY (item_id) REFERENCES public.order_line_item(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order_line_item_tax_line order_line_item_tax_line_item_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_line_item_tax_line
    ADD CONSTRAINT order_line_item_tax_line_item_id_foreign FOREIGN KEY (item_id) REFERENCES public.order_line_item(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order_line_item order_line_item_totals_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_line_item
    ADD CONSTRAINT order_line_item_totals_id_foreign FOREIGN KEY (totals_id) REFERENCES public.order_item(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order order_shipping_address_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_shipping_address_id_foreign FOREIGN KEY (shipping_address_id) REFERENCES public.order_address(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: order_shipping_method_adjustment order_shipping_method_adjustment_shipping_method_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_shipping_method_adjustment
    ADD CONSTRAINT order_shipping_method_adjustment_shipping_method_id_foreign FOREIGN KEY (shipping_method_id) REFERENCES public.order_shipping_method(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order_shipping_method_tax_line order_shipping_method_tax_line_shipping_method_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_shipping_method_tax_line
    ADD CONSTRAINT order_shipping_method_tax_line_shipping_method_id_foreign FOREIGN KEY (shipping_method_id) REFERENCES public.order_shipping_method(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order_shipping order_shipping_order_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_shipping
    ADD CONSTRAINT order_shipping_order_id_foreign FOREIGN KEY (order_id) REFERENCES public."order"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order_summary order_summary_order_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_summary
    ADD CONSTRAINT order_summary_order_id_foreign FOREIGN KEY (order_id) REFERENCES public."order"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order_transaction order_transaction_order_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_transaction
    ADD CONSTRAINT order_transaction_order_id_foreign FOREIGN KEY (order_id) REFERENCES public."order"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: payment_collection_payment_providers payment_collection_payment_providers_payment_col_aa276_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_collection_payment_providers
    ADD CONSTRAINT payment_collection_payment_providers_payment_col_aa276_foreign FOREIGN KEY (payment_collection_id) REFERENCES public.payment_collection(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: payment_collection_payment_providers payment_collection_payment_providers_payment_pro_2d555_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_collection_payment_providers
    ADD CONSTRAINT payment_collection_payment_providers_payment_pro_2d555_foreign FOREIGN KEY (payment_provider_id) REFERENCES public.payment_provider(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: payment payment_payment_collection_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_payment_collection_id_foreign FOREIGN KEY (payment_collection_id) REFERENCES public.payment_collection(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: payment_session payment_session_payment_collection_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_session
    ADD CONSTRAINT payment_session_payment_collection_id_foreign FOREIGN KEY (payment_collection_id) REFERENCES public.payment_collection(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: price_list_rule price_list_rule_price_list_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_list_rule
    ADD CONSTRAINT price_list_rule_price_list_id_foreign FOREIGN KEY (price_list_id) REFERENCES public.price_list(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: price price_price_list_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price
    ADD CONSTRAINT price_price_list_id_foreign FOREIGN KEY (price_list_id) REFERENCES public.price_list(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: price price_price_set_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price
    ADD CONSTRAINT price_price_set_id_foreign FOREIGN KEY (price_set_id) REFERENCES public.price_set(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: price_rule price_rule_price_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_rule
    ADD CONSTRAINT price_rule_price_id_foreign FOREIGN KEY (price_id) REFERENCES public.price(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: product_category product_category_parent_category_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT product_category_parent_category_id_foreign FOREIGN KEY (parent_category_id) REFERENCES public.product_category(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: product_category_product product_category_product_product_category_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category_product
    ADD CONSTRAINT product_category_product_product_category_id_foreign FOREIGN KEY (product_category_id) REFERENCES public.product_category(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: product_category_product product_category_product_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category_product
    ADD CONSTRAINT product_category_product_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.product(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: product product_collection_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_collection_id_foreign FOREIGN KEY (collection_id) REFERENCES public.product_collection(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: product_option_value product_option_value_option_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option_value
    ADD CONSTRAINT product_option_value_option_id_foreign FOREIGN KEY (option_id) REFERENCES public.product_option(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: product_product_option product_product_option_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_product_option
    ADD CONSTRAINT product_product_option_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.product(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: product_product_option product_product_option_product_option_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_product_option
    ADD CONSTRAINT product_product_option_product_option_id_foreign FOREIGN KEY (product_option_id) REFERENCES public.product_option(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: product_product_option_value product_product_option_value_product_option_value_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_product_option_value
    ADD CONSTRAINT product_product_option_value_product_option_value_id_foreign FOREIGN KEY (product_option_value_id) REFERENCES public.product_option_value(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: product_product_option_value product_product_option_value_product_product_option_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_product_option_value
    ADD CONSTRAINT product_product_option_value_product_product_option_id_foreign FOREIGN KEY (product_product_option_id) REFERENCES public.product_product_option(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: product_tags product_tags_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_tags
    ADD CONSTRAINT product_tags_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.product(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: product_tags product_tags_product_tag_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_tags
    ADD CONSTRAINT product_tags_product_tag_id_foreign FOREIGN KEY (product_tag_id) REFERENCES public.product_tag(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: product product_type_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_type_id_foreign FOREIGN KEY (type_id) REFERENCES public.product_type(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: product_variant_option product_variant_option_option_value_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant_option
    ADD CONSTRAINT product_variant_option_option_value_id_foreign FOREIGN KEY (option_value_id) REFERENCES public.product_option_value(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: product_variant_option product_variant_option_variant_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant_option
    ADD CONSTRAINT product_variant_option_variant_id_foreign FOREIGN KEY (variant_id) REFERENCES public.product_variant(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: product_variant product_variant_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant
    ADD CONSTRAINT product_variant_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.product(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: product_variant_product_image product_variant_product_image_image_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant_product_image
    ADD CONSTRAINT product_variant_product_image_image_id_foreign FOREIGN KEY (image_id) REFERENCES public.image(id) ON DELETE CASCADE;


--
-- Name: promotion_application_method promotion_application_method_promotion_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion_application_method
    ADD CONSTRAINT promotion_application_method_promotion_id_foreign FOREIGN KEY (promotion_id) REFERENCES public.promotion(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: promotion_campaign_budget promotion_campaign_budget_campaign_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion_campaign_budget
    ADD CONSTRAINT promotion_campaign_budget_campaign_id_foreign FOREIGN KEY (campaign_id) REFERENCES public.promotion_campaign(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: promotion_campaign_budget_usage promotion_campaign_budget_usage_budget_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion_campaign_budget_usage
    ADD CONSTRAINT promotion_campaign_budget_usage_budget_id_foreign FOREIGN KEY (budget_id) REFERENCES public.promotion_campaign_budget(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: promotion promotion_campaign_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion
    ADD CONSTRAINT promotion_campaign_id_foreign FOREIGN KEY (campaign_id) REFERENCES public.promotion_campaign(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: promotion_promotion_rule promotion_promotion_rule_promotion_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion_promotion_rule
    ADD CONSTRAINT promotion_promotion_rule_promotion_id_foreign FOREIGN KEY (promotion_id) REFERENCES public.promotion(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: promotion_promotion_rule promotion_promotion_rule_promotion_rule_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion_promotion_rule
    ADD CONSTRAINT promotion_promotion_rule_promotion_rule_id_foreign FOREIGN KEY (promotion_rule_id) REFERENCES public.promotion_rule(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: promotion_rule_value promotion_rule_value_promotion_rule_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion_rule_value
    ADD CONSTRAINT promotion_rule_value_promotion_rule_id_foreign FOREIGN KEY (promotion_rule_id) REFERENCES public.promotion_rule(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: provider_identity provider_identity_auth_identity_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provider_identity
    ADD CONSTRAINT provider_identity_auth_identity_id_foreign FOREIGN KEY (auth_identity_id) REFERENCES public.auth_identity(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: refund refund_payment_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refund
    ADD CONSTRAINT refund_payment_id_foreign FOREIGN KEY (payment_id) REFERENCES public.payment(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: region_country region_country_region_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region_country
    ADD CONSTRAINT region_country_region_id_foreign FOREIGN KEY (region_id) REFERENCES public.region(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: reservation_item reservation_item_inventory_item_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation_item
    ADD CONSTRAINT reservation_item_inventory_item_id_foreign FOREIGN KEY (inventory_item_id) REFERENCES public.inventory_item(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: return_reason return_reason_parent_return_reason_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.return_reason
    ADD CONSTRAINT return_reason_parent_return_reason_id_foreign FOREIGN KEY (parent_return_reason_id) REFERENCES public.return_reason(id);


--
-- Name: search_index_sync search_index_sync_search_index_version_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.search_index_sync
    ADD CONSTRAINT search_index_sync_search_index_version_id_foreign FOREIGN KEY (search_index_version_id) REFERENCES public.search_index_version(id) ON UPDATE CASCADE;


--
-- Name: search_index_version search_index_version_search_index_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.search_index_version
    ADD CONSTRAINT search_index_version_search_index_id_foreign FOREIGN KEY (search_index_id) REFERENCES public.search_index(id) ON UPDATE CASCADE;


--
-- Name: service_zone service_zone_fulfillment_set_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_zone
    ADD CONSTRAINT service_zone_fulfillment_set_id_foreign FOREIGN KEY (fulfillment_set_id) REFERENCES public.fulfillment_set(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: shipping_option shipping_option_provider_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_option
    ADD CONSTRAINT shipping_option_provider_id_foreign FOREIGN KEY (provider_id) REFERENCES public.fulfillment_provider(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: shipping_option_rule shipping_option_rule_shipping_option_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_option_rule
    ADD CONSTRAINT shipping_option_rule_shipping_option_id_foreign FOREIGN KEY (shipping_option_id) REFERENCES public.shipping_option(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: shipping_option shipping_option_service_zone_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_option
    ADD CONSTRAINT shipping_option_service_zone_id_foreign FOREIGN KEY (service_zone_id) REFERENCES public.service_zone(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: shipping_option shipping_option_shipping_option_type_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_option
    ADD CONSTRAINT shipping_option_shipping_option_type_id_foreign FOREIGN KEY (shipping_option_type_id) REFERENCES public.shipping_option_type(id) ON UPDATE CASCADE;


--
-- Name: shipping_option shipping_option_shipping_profile_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_option
    ADD CONSTRAINT shipping_option_shipping_profile_id_foreign FOREIGN KEY (shipping_profile_id) REFERENCES public.shipping_profile(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: stock_location stock_location_address_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_location
    ADD CONSTRAINT stock_location_address_id_foreign FOREIGN KEY (address_id) REFERENCES public.stock_location_address(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: store_currency store_currency_store_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_currency
    ADD CONSTRAINT store_currency_store_id_foreign FOREIGN KEY (store_id) REFERENCES public.store(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: store_locale store_locale_store_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_locale
    ADD CONSTRAINT store_locale_store_id_foreign FOREIGN KEY (store_id) REFERENCES public.store(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

