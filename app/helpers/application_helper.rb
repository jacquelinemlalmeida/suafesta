# app/helpers/application_helper.rb
module ApplicationHelper
  def form_builder_for(model)
    form = ActionView::Helpers::FormBuilder.new("participant[guests_attributes][]", model, self, {}, Proc.new {})
    render(partial: "participants/guest_fields", locals: { f: form })
  end
end
