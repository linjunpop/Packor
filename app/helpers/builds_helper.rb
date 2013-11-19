module BuildsHelper
  def itms_url_for(build)
    "itms-services://?action=download-manifest&url=#{build_url(build, format: 'plist')}"
  end

  def qr_image_tag(build)
    image_tag "http://api.qrserver.com/v1/create-qr-code/?size=250x250&data=" +
      build_url(build)
  end
end
