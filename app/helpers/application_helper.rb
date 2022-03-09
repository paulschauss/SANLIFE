module ApplicationHelper
  def stringify(illness_nutrients)

    impact = {}
    illness_nutrients.each do |illness_nutrient|
      impact[illness_nutrient.nutrient.name] = illness_nutrient.impact # merci paul pour le non titleize.
    end

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

  def render_svg(name, options = {})
    options[:title] ||= name.underscore.humanize
    options[:aria] = true
    options[:nocomment] = true
    options[:class] = options.fetch(:styles, "fill-current text-gray-500")

    filename = "#{name}.svg"
    inline_svg_tag(filename, options)
  end
end
