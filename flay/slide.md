!SLIDE title-slide

# Flay

## helps with DRY


!SLIDE code

# flaying Jekyll

    
    $ flay jekyll/lib/
    Total score (lower is better) = 144
    
    1) Similar code found in :iter (mass = 42)
      lib/jekyll/site.rb:162
      lib/jekyll/site.rb:163
    
    2) Similar code found in :when (mass = 38)
      lib/jekyll/convertible.rb:39
      lib/jekyll/convertible.rb:42


!SLIDE code

    @@@ Ruby
    def transform
      case self.content_type
      when 'textile'
        self.ext = ".html"
        self.content = self.site.textile(self.content)
      when 'markdown'
        self.ext = ".html"
        self.content = self.site.markdown(self.content)
      end
    end
