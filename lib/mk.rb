class MK
  def self.markdown(text, options = {})
    options.reverse_merge!(
      fenced_code_blocks: true,
      disable_indented_code_blocks: true,
      superscript: true,
      autolink: true,
      highlight: true
    )
    options.reject! { |k, v| !v }
    r = Redcarpet::Render::HTML.new(escape_html: true,
                                    with_toc_data: true)
    Redcarpet::Markdown.new(r, options).render(text)
  end
end
