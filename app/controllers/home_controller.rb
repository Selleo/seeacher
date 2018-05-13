class HomeController < ApplicationController
  def show
    @image_example = ImageExample.new
    @image_examples = ImageExample.all
  end
end
