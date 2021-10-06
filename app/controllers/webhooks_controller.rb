class WebhooksController < ApplicationController
  #skip_before_action :verify_authenticity_token
  protect_from_forgery with: :null_session
  
  def comunicacion
    # lectura y validacion de JSON de entrada
    begin
      event = JSON.parse(request.body.read)
      method = "handle_" + event['type'].tr('.', '_')
      self.send method, event
    rescue JSON::ParserError => e
      render json: {:status => 400, :error => "Invalid payload"} and return
    rescue NoMethodError => e
      # missing event handler
    end
    
    # logica asociada a cada accion
    result=event["queryResult"]
    intent=result["intent"]["displayName"]

    if intent=="ConsultarDatosProfexNombre - save"
      text = helpers.contacto_profesor_nombre(result)
    elsif intent=="ConsultarDatosCurso - save"
      text = helpers.contacto_curso(result)
    elsif intent=="ConsultarDatosProfexCursoxAsignatura - save"
      text = helpers.contacto_profesor_curso(result)
    end

    puts intent

    # respuesta a chatbot
    resp = {
      "fulfillmentMessages": [
        {
          "text": {
            "text": [
              text
              ]
            }
          }
        ]
      }
    #resp = {
    #  "fulfillmentMessages": [
    #    {
    #      "card": {
    #        "title": "Respuesta",
    #        "subtitle": text,
    #        "imageUri": "https://articulos.elclasificado.com/wp-content/uploads/2014/11/pinguinos_de_madagascar.jpg",
    #        "buttons": [
    #          {
    #            "text": "si",
    #            "postback": "dime el contacto de la profesora emma martinez"
    #          },
    #          {
    #            "text": "no",
    #            #"postback": "https://example.com/path/for/end-user/to/follow"
    #          }
    #        ]
    #      }
    #    }
    #  ]
    #}
    

    render json: resp
    
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_webhook
    @webhook = Webhook.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def webhook_params
    params.require(:webhook).permit(:request)
  end

end
