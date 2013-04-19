#! /usr/bin/env ruby
# encoding:utf-8

require 'date'

class ArticleSet
  
  attr_accessor :title, :articles
  
  def initialize(title)
    @title = title
  end
  
  #expects set of articles in the form
  #[{:doi=>"123",:year=>2009,:citations=>2},{:doi=>"456",:year=>1987,:citations=>3}]
  
    
  def hindex(yearsback=500)  #optional yearsback arg defaults to aribtrarily long time ago
    
    #select articles in chosen time period
    period_articles = self.articles.select {|article| article[:year] > (Date.today.year - yearsback)} 
    
    #sort the articles in descending order of citation count
    ordered_articles = period_articles.sort_by { |article| article[:citations] }
    ordered_articles = ordered_articles.reverse!
    
    #find h where at least h articles have h citations - that's the h index
    ordered_articles.each_with_index do |article,index|
      if index+1 >= article[:citations] 
        @hindex = index
        break
      end
    end    
    
    @hindex  
  end

end