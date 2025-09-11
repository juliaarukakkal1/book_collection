require 'rails_helper'

RSpec.describe "CreatingBlogPosts", type: :system do
  before do
    driven_by(:rack_test)
  end
  it 'saves and displays the resulting blog post' do
    visit '/posts/new'

    fill_in 'Title', with: 'Hello, World!'
    fill_in 'Body', with: 'Hello, I say!'

    click_on 'Create Blog Post'

    expect(page).to have_content('Hello, World')
    expect(page).to have_content('Hello, I say!')

    post = Post.order("id").last
    expect(post.title).to eq('Hello, World!')
    expect(post.body).to eq('Hello, I say!')
  end
end
