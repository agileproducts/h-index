#! /usr/bin/env ruby
# encoding:utf-8

require_relative '../article_set'
require 'date'

describe ArticleSet do
  
  before(:each) do
    @journal = ArticleSet.new("Journal of Whatever")
    @journal.articles = [{:doi=>"123-123",:year=>Date.today.year,:citations=>6},
                        {:doi=>"123-456",:year=>Date.today.year - 1,:citations=>17},
                        {:doi=>"123-890",:year=>Date.today.year - 2,:citations=>3},
                        {:doi=>"123-321",:year=>Date.today.year - 3,:citations=>9},
                        {:doi=>"123-654",:year=>Date.today.year - 4,:citations=>2},
                        {:doi=>"123-987",:year=>Date.today.year - 5,:citations=>1},
                        {:doi=>"123-213",:year=>Date.today.year - 6,:citations=>10},
                        {:doi=>"123-546",:year=>Date.today.year - 7,:citations=>8}]
  end    

  it "should calculate the total h-index correctly" do
    expected = 5
    @journal.hindex.should == expected
  end
  
  it "should calculate the h5-index correctly" do 
    expected = 3
    @journal.hindex(5).should ==expected
  end
  
end