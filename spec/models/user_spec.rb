require 'spec_helper'

describe User do
  subject { User.new(username: "foobar",
                     email: "foo@bar.com",
                     password: "password") }

  describe "#username" do
    it "must validate presence and length" do
      subject.username = "foo"
      subject.valid?.must_equal false
      subject.username = "foobar"
      subject.valid?.must_equal true
      subject.username = ""
      subject.valid?.must_equal false
    end
  end

  describe "#email" do
    it "must validate presence and length" do
      subject.email = "fooatbar.com"
      subject.valid?.must_equal false
      subject.email = "foo@bar.com"
      subject.valid?.must_equal true
      subject.email = ""
      subject.valid?.must_equal false
    end
  end
end
