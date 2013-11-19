# encoding: utf-8

class IpaUploader < CarrierWave::Uploader::Base
  include ::CarrierWave::Backgrounder::Delay

  storage :qiniu

  def store_dir
    "ipa_files"
  end

  def extension_white_list
    %w(ipa)
  end

  def filename
    if super.present?
      @secure_token ||= SecureRandom.uuid
      "#{@secure_token}.#{file.extension.downcase}"
    end
  end
end
