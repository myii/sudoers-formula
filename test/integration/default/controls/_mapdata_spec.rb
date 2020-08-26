# frozen_string_literal: true

require 'yaml'

control '`map.jinja` YAML dump' do
  title 'should contain exactly the same data as the comparison file'

  mapdata_file = "_mapdata/#{system.platform[:finger].split('.').first}.yaml"
  mapdata_dump = YAML.safe_load(inspec.profile.file(mapdata_file))

  describe yaml('/tmp/salt_mapdata_dump.yaml').params do
    it { should eq mapdata_dump }
  end
end
