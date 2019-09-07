module ApplicationHelper
  def errors_for(form)
    return if form.errors.empty?

    base_errors = Array(form.errors.delete(:base))

    if base_errors.empty?
      title = 'Please correct the errors below:'
      base_errors = ''
    else
      title = 'An error occurred with your form submission, please get in touch with our customer service:'
      base_errors = error_list(base_errors)
    end

    error_banner(title, base_errors)
  end

  def error_list(errors)
    content_tag(:ul, class: 'errors-list') do
      errors.map { |error| content_tag(:li, error, class: 'font-size-sm') }.join.html_safe
    end
  end

  def error_banner(title, base_errors = '')
    content_tag(:p, class: 'alert alert-danger font-weight-bold') do
      concat content_tag(:span, title, class: 'caption text-danger')
      concat base_errors
    end
  end
end
