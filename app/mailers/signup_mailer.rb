class SignupMailer < ActionMailer::Base
	default :from => 'renato.pedula@sr2.uerj.br'

	def confirm_email(user)
		@user = user
		@confirmation_link = confirmation_url({
	    token: @user.confirmation_token
    	})
		
		mail({
			:to  		=> user.email,
			:bcc 		=>['sing ups <renato.pedula@sr2.uerj.br'],
			:subject	=>I18n.t('signup_mailer.confirm_email.subject')
		})
	end
end