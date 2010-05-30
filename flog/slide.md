!SLIDE

# Flog

## hunting ugly code
### large methods, "smart" code


!SLIDE code

# flogging Jekyll

    $ flog jekyll/lib/
      1450.4: flog total
        15.0: flog/method average
    
        98.5: main#none
        67.2: Typo::process                    lib/jekyll/converters/typo.rb:25
        60.4: Site#setup                       lib/jekyll/site.rb:34
        50.4: MT::process                      lib/jekyll/converters/mt.rb:22


!SLIDE code

    @@@ Ruby
    def self.process dbname, user, pass, host='localhost'
      FileUtils.mkdir_p '_posts'
      db = Sequel.mysql dbname, :user => user, :password => pass, :host => host
      db[SQL].each do |post|
        next unless post[:state] =~ /Published/

        name = [ sprintf("%.04d", post[:date].year),
                 sprintf("%.02d", post[:date].month),
                 sprintf("%.02d", post[:date].day),
                 post[:slug].strip ].join('-')
        # Can have more than one text filter in this field, but we just want
        # the first one for this
        name += '.' + post[:filter].split(' ')[0]

        File.open("_posts/#{name}", 'w') do |f|
          f.puts({ 'layout'   => 'post',
                   'title'    => post[:title].to_s,
                   'typo_id'  => post[:id]
                 }.delete_if { |k, v| v.nil? || v == '' }.to_yaml)
          f.puts '---'
          f.puts post[:body].delete("\r")
        end
      end
    end



!SLIDE

# simple (naive) metrics are easy to cheat


!SLIDE

# gaming Flog
## split stuff into methods
