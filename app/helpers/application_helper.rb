module ApplicationHelper
  def has_ganalytics?
    Rails.application.secrets.ganalytics
  end

  def ganalytics_config
    { tracking_id: Rails.application.secrets.ganalytics['tracking_id'], domain_name: Rails.application.secrets.ganalytics['domain_name'] }
  end

  def lineman_app_css
    if Rails.env == "test"
      "#{Rails.application.config.lineman_root}/stylesheets/lineman/app.css"
    else
      "/stylesheets/lineman/app"
    end
  end

  def lineman_app_js
    if Rails.env == "test"
      "#{Rails.application.config.lineman_root}/javascripts/lineman/app.js"
    else
      "/javascripts/lineman/app"
    end
  end
end
