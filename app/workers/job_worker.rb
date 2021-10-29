class JobWorker
  include Sidekiq::Worker

  def perform(*args)
    puts "teste"
  end
end
