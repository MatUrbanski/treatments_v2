module ApplicationHelper
   def active(*models)
    models.each do |model|
      if request.fullpath.include? "#{model}"
        return "active"
      end
    end
  end

  def submit_button(form)
    form.button :button, t('submit'), data: {disable_with:
      "<i class='fa fa-spinner fa-spin'></i> #{t('saving')}"}, class: 'btn btn-primary'
  end
end
