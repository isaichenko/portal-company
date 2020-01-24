module ApplicationHelper

  def active? path
    "active" if current_page?(path)
  end

  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])

    if alert
      alert_generator alert
    end
  end

  def alert_generator msg
    js add_gritter(msg, title: "Портал Долина.", sticky: false)
  end
end
