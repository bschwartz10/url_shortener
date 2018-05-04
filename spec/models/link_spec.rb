require 'rails_helper'

describe Link do
  it "it should return a links information" do

    link = create(:link)

    expect(link.given_url).to eq('https://www.google.com/maps')
    expect(link.slug).to eq('maps')
    expect(link.display_slug).to eq('http://url-shortener.bs/maps')
  end

  it "it should return a links information if link isn't given slug" do

    link = create(:link, slug: nil)

    expect(link.given_url).to eq('https://www.google.com/maps')
    expect(link.slug).to_not eq(nil)
    expect(link.display_slug).to_not eq(nil)
  end
end
