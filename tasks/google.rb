require 'kinchan'
require 'cgi'

module Google
  # Navigates to the Google search results for a query
  class Search < Kinchan::Task
    def initialize(**options)
      super
      @query = options[:query]
    end

    def execute(browser)
      browser.navigate.to "https://www.google.com/search?q=#{CGI.escape(@query)}"
    end
  end

  # Print the title of the first search result for a query
  # Runs the search task first
  class PrintFirstResult < Kinchan::Task
    def initialize(**options)
      super
      @before_tasks << { task: :search, options: options }
    end

    def execute(browser)
      puts browser.execute_script "return document.querySelector('.srg a').innerText"
    end
  end

  # Print the title of the first search result in a carousel for a query
  # Runs the search task first
  class PrintFirstCarouselResult < Kinchan::Task
    def initialize(**options)
      super
      @before_tasks << { task: :search, options: options }
    end

    def execute(browser)
      puts browser.execute_script "return document.querySelector('g-scrolling-carousel a').innerText"
    end
  end
end
