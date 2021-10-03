class WebhooksController < ApplicationController
  before_action :set_webhook, only: %i[ show update destroy ]
  protect_from_forgery with: :null_session #Para saltarse el error del Token NO BORRAR AUN
  def comunicacion
  end
end
