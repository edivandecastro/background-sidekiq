class JobsController < ApplicationController
  def push
    Sidekiq::Client.push('class' => 'JobWorker', 'args' => [params[:id], event_attributes])

    render json: { status: 'ok' }
  end

  def perform
    JobWorker.perform_async(params[:id], event_attributes)

    render json: { status: 'ok' }
  end

  private

  def event_attributes
    {
      name: 'WORK_ORDER_REGISTRATION',
      description: 'event that registers the service order for a customer',
      start_time: DateTime.now.iso8601,
      end_time: DateTime.now.iso8601,
      active: true
    }
  end
end
