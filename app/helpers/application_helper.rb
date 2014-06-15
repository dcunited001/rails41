module ApplicationHelper
  def has_ganalytics?
    Rails.application.secrets.ganalytics
  end

  def ganalytics_config
    { tracking_id: Rails.application.secrets.ganalytics['tracking_id'], domain_name: Rails.application.secrets.ganalytics['domain_name'] }
  end
end
