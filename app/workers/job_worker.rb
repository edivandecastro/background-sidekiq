class JobWorker
  include Sidekiq::Worker

  def perform(*args)
    id, event_attributes = args

    Event.where(active: false).each do |event|
      if event.id.to_s == id
        event.update(event_attributes)
      else
        event.active = true
        sleep 1
        event.save
      end
    end
  end
end
