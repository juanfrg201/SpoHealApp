class HelloWorker
  include Sidekiq::Worker

  def perform(*args)
    
  end
end
