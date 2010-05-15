class AccessoriesHooks < Spree::ThemeSupport::HookListener

  insert_after :admin_product_tabs do
    %(<%= "<li>" + link_to(t("accessories"), selected_admin_product_accessories_path(@product)) + "</li>" %>)
  end

end
