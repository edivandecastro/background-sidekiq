class JobsController < ApplicationController
  def index
    JobWorker.perform_async
  end
end
