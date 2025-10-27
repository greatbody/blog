module ApplicationHelper
  class HTMLWithRouge < Redcarpet::Render::HTML
    def block_code(code, language)
      language = language || "text"
      formatter = Rouge::Formatters::HTML.new
      lexer = Rouge::Lexer.find_fancy(language, code) || Rouge::Lexers::PlainText.new
      formatted_code = formatter.format(lexer.lex(code))
      "<pre class=\"highlight\"><code class=\"language-#{language}\">#{formatted_code}</code></pre>"
    end
  end

  def markdown(text)
    return "" if text.blank?

    renderer = HTMLWithRouge.new(
      filter_html: false,
      hard_wrap: true,
      link_attributes: { target: '_blank', rel: 'noopener' }
    )

    options = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true,
      tables: true,
      footnotes: true
    }

    markdown_renderer = Redcarpet::Markdown.new(renderer, options)
    markdown_renderer.render(text).html_safe
  end
end
