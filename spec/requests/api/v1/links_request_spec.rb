require 'rails_helper'

describe "Links API" do
  it "can create a new link with given_url and slug params" do
    link_params = { given_url: 'https://www.google.com/maps', slug: 'maps' }

    post "/api/v1/links", params: link_params
    link = Link.last

    expect(response.status).to eq(200)
    expect(link.given_url).to eq(link_params[:given_url])
    expect(link.slug).to eq(link_params[:slug])
  end

  it "a value is assigned to slug if new link isn't created with slug params" do
    link_params = { given_url: 'https://www.google.com/maps' }

    post "/api/v1/links", params: link_params
    link = Link.last

    expect(response.status).to eq(200)
    expect(link.given_url).to eq(link_params[:given_url])
    expect(link.slug).to_not eq(nil)
  end
  it "does not create a link if url is invalid" do
    link_params = { given_url: 'fakeurl' }

    post "/api/v1/links", params: link_params
    error = JSON.parse(response.body)
    link = Link.last

    expect(response.status).to eq(200)
    expect(error['given_url'][0]).to eq('is not a valid URL')
    expect(link).to eq(nil)
  end
end
