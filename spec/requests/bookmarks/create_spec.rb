require 'rails_helper'

describe 'POST /bookmarks', type: :request do
    it 'validates parameters' do
        post '/bookmarks', params: { 
            bookmark: { 
            title: 'Test',
            url: 'http://example.com'
            }
        }

        expect(response.status).to eq(201)\

        json = JSON.parse(response.body).deep_symbolize_keys

        expect(json[:title]).to eq('Test')
        expect(json[:url]).to eq('http://example.com')

        expect(Bookmark.count).to eq(1)
        expect(Bookmark.last.title).to eq('Test')

    end

    it 'invalidates parameters' do
        post '/bookmarks', params: {
            bookmark: { 
                        title: 'Test'
            }
        }

        expect(response.status).to eq(422)

        json=JSON.parse(response.body).deep_symbolize_keys

        expect(json[:url]).to include("can't be blank")
        expect(Bookmark.count).to eq(0)
    end
end
