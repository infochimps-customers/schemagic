class Emailer < ActionMailer::Base

  def schema(dataset)
    recipients "david@infochimps.org"
    from       "no-reply@infochimps.org"
    subject    "#{dataset.company_name} submitted a schema on Schemagic!"
    sent_on    Time.now
    body  :dataset => dataset

    # attachment "application/yaml" do |a|
    #   a.body = ActionController::Base.render_to_string :file => "/app/views/emailer/schema.erb", :dataset => dataset
    # end

  end
end
