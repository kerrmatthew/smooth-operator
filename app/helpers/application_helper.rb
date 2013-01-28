module ApplicationHelper

  def progress_item_delegate_fields(form)
    raw( render partial: 'progress_item_delegates/fields', object: form )
  end

end
