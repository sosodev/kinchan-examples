require_relative 'tasks/google'

Google::PrintFirstCarouselResult.new(**{ query: 'Kinchan' }).run
