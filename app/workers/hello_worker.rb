# frozen_string_literal: true

class HelloWorker
  include Sidekiq::Worker

  def perform(*_args)
    puts 'hola mundo'
  end
end
