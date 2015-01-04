def fill_autocomplete(field, options = {})
  fill_in field, with: options[:with]
  selector = %Q{li.ui-menu-item:contains("#{options[:with]}")}
  expect(page).to have_selector('ul.ui-autocomplete li.ui-menu-item')
  page.execute_script %Q{ $('#{selector}').trigger('mouseenter').click() }
end
