require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models/count.rb'

before do
  if Count.all.size == 0
    # データベースの初期化
    Count.create(number: 0, name:'きゃみ')
    Count.create(number: 0, name:'さきね')
    Count.create(number: 0, name:'まーしー')
    Count.create(number: 0, name:'あっぷる')
    Count.create(number: 0, name:'パセリ')
    Count.create(number: 0, name:'D')
    Count.create(number: 0, name:'みぞ')
    Count.create(number: 0, name:'ちゃつみ')
    Count.create(number: 0, name:'ぬくり')
    Count.create(number: 0, name:'みやじー')
    Count.create(number: 0, name:'きむち')
  end
end

get '/' do
  @number = Count.all
  @mentorphotos = ['']
  @mentors = ['きゃみ', 'さきね', 'まーしー','あっぷる','きむち','パセリ','D','みぞ','ちゃつみ','ぬくり','みやじー']
  erb :index
end

post '/:name/plus' do
  count = Count.all.find_by(name: params[:name])
  count.number = count.number + 1
  count.save
  
  # ページを返すのではなく更新されたnumberをstringで返す
  # 返された値をjqueryで処理
  count.number.to_s
end
