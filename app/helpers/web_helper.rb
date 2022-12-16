# frozen_string_literal: true

module WebHelper

  def divide_in_cols(list, cols)
    size = list.size/cols
    result = []
    list.each.with_index do |item, index|
      result[index] = [] if result[index].blank?
      result[index] << item
    end
    result

    #
    # list.each_slice(size)
    # list.each_slice((list.size/cols.to_f).round).to_a
  end
end
