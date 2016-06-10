describe Ascent::AscentController, type: :controller do
  describe 'GET #dashboard' do
    expect(response).to render_template(:dashboard)
  end
end

