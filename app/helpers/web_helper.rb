# frozen_string_literal: true

module WebHelper
  WA_PHONE = '+59891902588'

  # rubocop:disable Layout/LineLength
  def book_wa_link(treatment)
    wa_link(
      "Hola!%20Te%20contacto%20desde%20la%20web%20para%20obtener%20m%C3%A1s%20informaci%C3%B3n%20sobre%20#{treatment.name}.%20Gracias!"
    )
  end
  # rubocop:enable Layout/LineLength

  # rubocop:disable Layout/LineLength
  def contact_wa_link
    wa_link(
      'Hola!%20Te%20contacto%20desde%20la%20web%20para%20consultar%20sobre%20los%20tratamientos%20de%20belleza.%20Gracias!'
    )
  end
  # rubocop:enable Layout/LineLength

  def wa_link(msg)
    "https://wa.me/#{WA_PHONE}?text=#{msg}"
  end
end
