# frozen_string_literal: true

module ApplicationHelper
  def app_name
    'Clinica Unga'
  end

  def app_initials
    'CU'
  end

  def delete_resource_icon(resource, size: 'btn-sm')
    render 'layouts/confirm_resource_delete_modal', resource:, size:
  end

  def link_to_icon(text, path, clazz, icon, target = '_self')
    link_to(path, class: clazz, target:) do
      content_tag(:i, '', class: icon).html_safe + (" #{text}" if text.present?)
    end
  end

  def link_to_icon_modal(text, clazz, icon, modal)
    link_to('#', class: clazz, 'data-toggle': 'modal', 'data-target': modal) do
      content_tag(:i, '', class: icon).html_safe + (" #{text}" if text.present?)
    end
  end

  def menu_item_html(path:, icon:, menu_active_path:, text:)
    content_tag(:li, class: menu_active?(*menu_active_path).to_s) do
      link_to(path) do
        content_tag(:i, '', class: icon).html_safe + content_tag(:p, text)
      end
    end
  end

  def menu_active?(*patterns)
    'active' if patterns.any? { |p| request.path.start_with?(p) }
  end

  def alert_title(level)
    { notice: 'Buen Trabajo!', success: 'Buen Trabajo!', error: 'Algo ha salido mal!', alert: 'Oops!' }[level.to_sym]
  end

  def alert_icon(level)
    { notice: 'icon-check-2',
      success: 'icon-check-2',
      error: 'icon-simple-remove',
      alert: 'icon-simple-remove' }[level.to_sym]
  end

  def flash_class(level)
    { notice: 'success', success: 'success', error: 'danger', alert: 'danger' }[level.to_sym]
  end

  def alert_delay(level)
    { notice: 5000, success: 5000, error: 0, alert: 0 }[level.to_sym]
  end

  def resource_human_name(resource_name)
    I18n.t("activerecord.models.#{resource_name.to_s.underscore}.one")
  end

  def association_select(form, association_field, relation)
    form.select(association_field,
                relation.collect { |p| [p.to_s, p.id] },
                { prompt: ' - Seleccione una opción - ' },
                class: 'form-control')
  end
end
