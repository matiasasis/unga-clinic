module ApplicationHelper
  def app_name
    'Unga - Clinica'
  end

  def delete_resource_icon(resource, size: 'btn-sm')
    render 'layouts/confirm_resource_delete_modal', resource: resource, size: size
  end

  def link_to_icon(text, path, clazz, icon, target = '_self')
    link_to(path, class: clazz, target: target) do
      content_tag(:i, '', class: icon).html_safe + (" #{text}" if text.present?)
    end
  end

  def link_to_icon_modal(text, clazz, icon, modal)
    link_to('#', class: clazz, 'data-toggle': 'modal', 'data-target': modal) do
      content_tag(:i, '', class: icon).html_safe + (" #{text}" if text.present?)
    end
  end
end
