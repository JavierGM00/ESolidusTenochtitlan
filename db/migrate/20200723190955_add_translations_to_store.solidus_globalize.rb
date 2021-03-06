# frozen_string_literal: true
# This migration comes from solidus_globalize (originally 20150323210949)

class AddTranslationsToStore < SolidusSupport::Migration[4.2]
  def up
    unless table_exists?(:spree_store_translations)
      params = { name: :string, meta_description: :text, meta_keywords: :text, seo_title: :string }
      Spree::Store.create_translation_table!(params, migrate_data: true)
    end
  end

  def down
    Spree::Store.drop_translation_table! migrate_data: true
  end
end
