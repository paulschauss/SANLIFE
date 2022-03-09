module ApplicationHelper
  def stringify(impact)
    impact.transform_keys! { |k| "<b>#{k}</b>" }
    impact.transform_values! { |v| "<span class='pill'>#{v}%</span>" }
    array = impact.keys.zip impact.values
    if array.count > 1
      sentence = array[0..-2].map{ |a| a.join(" ") }.join(', ')
      "#{sentence} and #{array.last.flatten.join(' ')}".html_safe
    else
      sentence = array.map { |a| a.join(" ") }.join(', ')
      sentence.to_s.html_safe
    end
  end
end
