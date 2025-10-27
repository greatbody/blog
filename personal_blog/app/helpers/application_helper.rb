module ApplicationHelper
  class HTMLWithRouge < Redcarpet::Render::HTML
    def block_code(code, language)
      language = language || "text"
      language_label = language.capitalize
      formatter = Rouge::Formatters::HTML.new
      lexer = Rouge::Lexer.find_fancy(language, code) || Rouge::Lexers::PlainText.new
      formatted_code = formatter.format(lexer.lex(code))
      
      # Wrap in our design system structure with copy button
      <<~HTML
        <div class="code-block" data-controller="code-copy">
          <div class="code-block-header">
            <span class="code-block-language">#{language_label}</span>
            <button class="code-block-copy" data-code-copy-target="button" data-action="click->code-copy#copy">Copy</button>
          </div>
          <pre><code data-code-copy-target="source" class="highlight language-#{language}">#{formatted_code}</code></pre>
        </div>
      HTML
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

  # Alias for markdown method for consistency
  def render_markdown(text)
    markdown(text)
  end

  def calculate_reading_time(content)
    return 0 if content.blank?
    
    # Average reading speed: 200 words per minute
    words_per_minute = 200
    word_count = content.split.size
    reading_time = (word_count.to_f / words_per_minute).ceil
    
    # Minimum reading time of 1 minute
    [reading_time, 1].max
  end
end
