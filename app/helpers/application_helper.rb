# app/helpers/application_helper.rb
module ApplicationHelper
  def form_builder_for(model)
    form = ActionView::Helpers::FormBuilder.new("participant[guests_attributes][]", model, self, {}, Proc.new {})
    render(partial: "participants/guest_fields", locals: { f: form })
  end

  def show_sidebar?
    !(on_login_page? || on_signup_page?)
  end

  def on_login_page?
    controller_name == "sessions" && action_name == "new"
  end

  def on_signup_page?
    controller_name == "users" && action_name == "new"
  end
end
