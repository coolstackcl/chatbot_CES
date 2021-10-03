class WebhooksController < ApplicationController
  before_action :set_webhook, only: %i[ show update destroy ]
  protect_from_forgery with: :null_session #Para saltarse el error del Token NO BORRAR AUN
  def comunicacion
    begin
      event = JSON.parse(request.body.read)
      method = "handle_" + event['type'].tr('.', '_')
      self.send method, event

    rescue JSON::ParserError => e
      render json: {:status => 400, :error => "Invalid payload"} and return
    rescue NoMethodError => e
      # missing event handler
    end
    #contacto="adedfvdfsdfwdf@gfdsm.cl"

    result=event["queryResult"]

    text = result["fulfillmentText"]
    nombre = result["parameters"]["nombre"]

    contacto= Usuario.find_by(nombre: nombre)

    texto= text.gsub('#{contacto}', contacto.email.to_s)

    #aqui va la respuesta
      render json: {
      "fulfillmentMessages": [
        {
          "text": {
            "text": [
              " #{texto}"
            ]
          }
        }
      ]
    }
  end

  # PATCH/PUT /webhooks/1
  # PATCH/PUT /webhooks/1.json
  def update
    if @webhook.update(webhook_params)
      render :show, status: :ok, location: @webhook
    else
      render json: @webhook.errors, status: :unprocessable_entity
    end
  end
  end
end
