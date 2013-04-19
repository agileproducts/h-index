h-index calculator
=============
The [h-index](http://en.wikipedia.org/wiki/H-index) is a way to measure the relative importance of a scholarly author or journal. 

This is a quick bit of ruby code for calculating the h-index of a given collection of articles - this could be an individual author's output or a complete journal. 

You can set up an ArticleSet object like this

    journal = ArticleSet.new("Journal of Whatever")
    
    journal.articles = [{:doi=>"123-123",:year=>2012,:citations=>6},
                        {:doi=>"123-456",:year=>2013,:citations=>17},
                        {:doi=>"123-890",:year=>2011,:citations=>3},
                        {:doi=>"123-321",:year=>2008,:citations=>9},
                        {:doi=>"123-654",:year=>2009,:citations=>2},
                        {:doi=>"123-987",:year=>2010,:citations=>1},
                        {:doi=>"123-213",:year=>2004,:citations=>10},
                        {:doi=>"123-546",:year=>1997,:citations=>8}]

But typically you'd load the article set from a database, csv file or etcetera. The articles don't need to be in any particular order - ruby is good at sorting arrays and hashes!

There's only one interesting method in this class:

    journal.hindex 

which returns an integer value of h. 

If you supply an argument like this:

    journal.hindex(5)

Then it returns the h-index for that number of years back - for example you can obtain the h5-index used by [Google Scholar](http://scholar.google.co.uk/intl/en/scholar/metrics.html#metrics). 


Testing
----------

You can test this by running the included bit of RSpec: 

    /spec/article_set_spec.rb