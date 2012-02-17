require 'spec_helper'

describe UserMailer do
  describe 'reset_password_email' do
    let(:mail) { UserMailer.reset_password_email(Factory.create(:user)) }

    #ensure the subject is correct
    it 'renders the correct subject' do
      mail.subject.should == 'Password reset confirmation from 48 Harley Street'
    end

    # the email should be sent to the correct person
    it 'should send the email to the users address' do
      mail.to.should == ['example@example.com']
    end

    it 'should send the email from "48 Harley Street Notifier"' do
      mail.from.should == ['48harleystreet.notifier@gmail.com']
    end

    it 'should include @name' do
      mail.body.encoded.should match('John')
    end

    it 'should include @url' do
      mail.body.encoded.should match('http://178.79.159.74/password-reset')
    end
  end
end
