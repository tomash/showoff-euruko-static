!SLIDE title-slide

# Reek

## actively searching for antipatterns


!SLIDE bullets

# antipatterns like:

* Long Method, Large Class
* Feature Envy                                                            
* Uncommunicative Name
* ...and many more


!SLIDE code

# reeking Jekyll

    $ reek lib/                     
    lib//jekyll.rb -- 1 warning:                                        
      Jekyll#self.configuration has approx 9 statements (LongMethod)    
    lib//jekyll/albino.rb -- 4 warnings:                                
      Albino declares the class variable @@bin (ClassVariable)          
      Albino#execute contains iterators nested 2 deep (NestedIterators) 
      Albino#execute has approx 7 statements (LongMethod)               
      Albino#execute refers to stdin more than self (LowCohesion)       
    lib//jekyll/converters/csv.rb -- 4 warnings:                        
      Jekyll::CSV#self.process calls row[0] twice (Duplication)         
      Jekyll::CSV#self.process contains iterators nested 2 deep (NestedIterators)
      Jekyll::CSV#self.process has approx 11 statements (LongMethod)             
      Jekyll::CSV#self.process has the variable name 'f' (UncommunicativeName)   

