json.array!(@builds) do |build|
  json.extract! build, :ipa_file
  json.url build_url(build, format: :json)
end
