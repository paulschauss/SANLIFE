module ApplicationHelper

  def stringify(impact)
    impact.transform_keys! { |k| "<b>#{k}</b>" }
    impact.transform_values! { |v| "(#{v}%)" }
    array = impact.keys.zip impact.values
    sentence = array[0..-2].map{ |a| a.join(" ") }.join(', ')
    "#{sentence} and #{array.last.flatten.join(' ')}".html_safe
    # (sentence + " and " + array.last.flatten.join(' ')).html_safe
  end
end
