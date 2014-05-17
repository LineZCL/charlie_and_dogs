json.array!(@pedigrees) do |pedigree|
  json.extract! pedigree, :id
  json.url pedigree_url(pedigree, format: :json)
end
