class ImageExamplesController < ApplicationController
  def create
    @image_example = ImageExample.new(image_example_params)
    @image_example.save
    redirect_to :root
  end

  private

  def image_example_params
    params.require(:image_example).permit(:image)
  end
end
