module ListsHelper
  # lists helper teve que ser adicionado à mão. está disponivel para todo o programa e permite fazer refactor
  def image_cloudinary(list)
    if list.photo.attached?
      cl_image_path list.photo.key, crop: :fill
    else
      'https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png'
    end
  end
heroku
  def image_cloudinary_tag(list)
    if list.photo.attached?
      cl_image_path list.photo.key
    else
      image_tag 'https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png'
    end
  end
end
