module ApplicationHelper
   def active(*models)
    models.each do |model|
      if request.fullpath.include? "#{model}"
        return "active"
      end
    end
  end
end
