module ApplicationHelper
  # Safely get Cloudinary image path, fallback to asset path if Cloudinary not configured
  def safe_cl_image_path(image_name, options = {})
    begin
      cl_image_path(image_name, options)
    rescue CloudinaryException, Cloudinary::CloudinaryException, NoMethodError, ArgumentError => e
      begin
        # Try to find the asset in the pipeline
        asset_path(image_name)
      rescue Sprockets::Rails::Helper::AssetNotFound, ActionView::Template::Error
        # Return empty string if asset not found (allows CSS to handle missing image gracefully)
        ""
      end
    end
  end

  # Safely get Cloudinary image tag, fallback to regular image_tag if Cloudinary not configured
  def safe_cl_image_tag(image_path, options = {})
    begin
      cl_image_tag(image_path, options)
    rescue CloudinaryException, Cloudinary::CloudinaryException, NoMethodError, ArgumentError => e
      begin
        image_tag(image_path, options)
      rescue Sprockets::Rails::Helper::AssetNotFound, ActionView::Template::Error
        # Return empty string if asset not found
        "".html_safe
      end
    end
  end

  # Safely get Cloudinary image path for photo model, fallback to nil if Cloudinary not configured or no photo
  def safe_cl_image_path_for_photo(photo)
    return nil unless photo.present?
    begin
      cl_image_path(photo.photo)
    rescue CloudinaryException, Cloudinary::CloudinaryException, NoMethodError, ArgumentError => e
      photo.photo_url if photo.respond_to?(:photo_url)
    end
  end
end
