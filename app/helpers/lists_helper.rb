module ListsHelper
  # lists helper teve que ser adicionado à mão
  def image_cloudinary(list)
    if list.photo.attached?
      cl_image_path list.photo.key, crop: :fill
    else
      image_path "placeholder.jpg"
    end
  end
  def image_cloudinary_tag(list)
    if list.photo.attached?
      cl_image_tag list.photo.key
    else
      image_tag "placeholder.jpg"
    end
  end
end
