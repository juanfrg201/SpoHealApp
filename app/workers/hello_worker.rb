class HelloWorker
  include Sidekiq::Worker

  def perform(*args)
    puts "hola mundo"
  end
end
