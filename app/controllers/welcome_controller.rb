class WelcomeController < ApplicationController
  def index

  end
  def home
  end

  def aboutus
  end

  def project
  end

  def hello
    @random = Place.order("RANDOM()").limit(3)
  end

  def start
  end

end
