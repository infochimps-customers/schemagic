class Emailer < ActionMailer::Base

  def schema(dataset)
    recipients env_email
    from       "no-reply@infochimps.org"
    subject    "#{dataset.company_name} submitted a schema on Schemagic!"
    sent_on    Time.now
    body  :dataset => dataset

    # attachment "application/yaml" do |a|
    #   a.body = ActionController::Base.render_to_string :file => "/app/views/emailer/schema.erb", :dataset => dataset
    # end

  end

  def env_email
    RAILS_ENV == "production" ? "bd@infochimps.org" : "infochimps@mailinator.com"
  end
end
