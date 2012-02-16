require 'spec_helper'

describe AskAQuestionMailer do
  describe 'the_users_question' do
    let(:mail) { AskAQuestionMailer.the_users_question('full name', 'full.name@mail.com', 'a question' ) }

    #ensure the subject is correct
    it 'renders the correct subject' do
      mail.subject.should == 'full name has asked a question'
    end

    # the email should be sent to the correct person
    it 'should send the email to the doctors address' do
      mail.to.should == ['facebook.spotify@gmail.com']
    end

    it 'should send the email from "48 Harley Street Notifier"' do
      mail.from.should == ['48harleystreet.notifier@gmail.com']
    end

    it 'should include @name' do
      mail.body.encoded.should match('full name')
    end

    it 'should include @question' do
      mail.body.encoded.should match('a question')
    end

    it 'should include @email' do
      mail.body.encoded.should match('full.name@mail.com')
    end
  end
end
