require 'rdoc'

class Markdown
  attr_accessor :text, :options, :parser, :formatter

  def initialize(text)
    @text = text
    @options = RDoc::Options.new
    @parser = RDoc::Markdown.new
  end

  def to_html
    @formatter = RDoc::Markup::ToHtml.new(@options, nil)
    @parser.parse(@text).accept(@formatter)
  end
end

md = <<-EOS
# hi im a heading

some paragraph

```ruby
def some_ruby_code
puts 'hi'
end
```
EOS

markdown = Markdown.new(md)
puts markdown.to_html
