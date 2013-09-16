class Build
  include Mongoid::Document
  include Mongoid::Timestamps

  field :ipa_file, type: String
  field :name, type: String
  field :bundle_identifier, type: String
  field :version, type: String

  mount_uploader :ipa_file, IpaUploader

  before_create :generate_info

  def to_plist
    {
      items: [
        assets: [
          {
            kind: 'software-package',
            url: ipa_file.file.url
          }
        ],
        metadata: {
          'bundle-identifier' => bundle_identifier,
          'bundle-version' => version,
          kind: 'software',
          title: name
        }
      ]
    }.to_plist
  end

  private

  def generate_info
    ipa = IpaReader::IpaFile.new(ipa_file.file.path)
    self.name = ipa.name
    self.bundle_identifier = ipa.bundle_identifier
    self.version = ipa.version
  end
end
