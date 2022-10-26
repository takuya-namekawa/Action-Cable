class RoomChannel < ApplicationCable::Channel
  def subscribed  #「購読する」という意味  クライアントがサーバーに接続したと同時に実行されるメソッド
    stream_from "room_channel"  #これはroom_channel.jsで実行されたspeakのメッセージを受け取り、room_channel.jsのreceivedメソッドにブロードキャスト（送信）する記述
  end                           #端的に言うと、room_channel.jsのreceivedメソッドにdata[‘message’]を送信

  def unsubscribed  #クライアントの接続が解除されたと同時に実行されるメソッド
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)  #Action Cableが保持しているメソッドの1つで、データの送受信を行う
    Message.create! content: data['message']  #room_channelを宣言することによって、room_channel間（room_channel.rbとroom_channel.js）でデータを送受信する
  end
end


