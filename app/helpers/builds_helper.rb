module BuildsHelper
  def itms_url_for(build)
    "itms-services://?action=download-manifest&url=#{build_url(build, format: 'plist')}"
  end
end
