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

  def flash_message
    flash.each do |key, msg|
      return render "layouts/#{key}", msg: msg
    end
  end

  def start_days?(days, default)
    if params[:start_days].present?
      params[:start_days] == days ? "active" : nil
    elsif params[:treatment].present?
      params[:treatment][:start_days] == days ? "active" : nil
    elsif default == true
      "active"
    end
  end
end
