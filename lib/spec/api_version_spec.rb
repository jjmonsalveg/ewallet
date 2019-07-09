require 'spec_helper'
require 'api_version'

describe ApiVersion do
  let(:api_constraints_v1) { ApiVersion.new(version: 1) }
  let(:api_constraints_v2) { ApiVersion.new(version: 2, default: true) }

  describe '.matches?' do

    it "returns true when the version matches the 'Accept' header" do
      request = double(host: 'api.ewallet.dev',
                       headers: { 'Accept' => 'application/vnd.ewallet.v1+json'})
      expect(api_constraints_v1.matches?(request)).to be_truthy
    end

    it "returns the default version when 'default' option is specified" do
      request = double(host: 'api.ewallet.dev')
      expect(api_constraints_v2.matches?(request)).to be_truthy
    end
  end
end