class LogingateController < ApplicationController
  def signup
  end

def signdup    # ログインボタン押下
    name = params[:name]    # パラメータからユーザー名を取り出す
    pass = params[:pass]    # パラメータからパスワードを取り出す

    if !(name.nil?) then
      currentUser = User.where(:name => name).first    # 既に登録されているか調べる
      if currentUser.nil? then                         # 登録が無い場合
        puts '* not found *'  # 確認用ログ出力
        render :action => 'register'                   # ユーザ登録画面へ移動
      elsif pass != currentUser.pass then              # パスワードが違う場合
        puts '* password error *'  # 確認用ログ出力
        render :text => 'パスワードがまちがっています。'
      else                                             # ユーザーIDとパスワードが一致した場合
        session[:currentUser] = currentUser            # セッションにユーザーオブジェクトを入れる
        render :action => 'wellcome'                   # サインアップ完了画面へ移動
      end
    end

  end    # ログインボタン押下



  def registered    # 新規登録ボタン押下
    name = params[:name]    # パラメータからユーザー名を取り出す
    pass = params[:pass]    # パラメータからパスワードを取り出す
    mail = params[:mail]    # パラメータからメールアドレスを取り出す

    currentUser = User.new()    # モデルクラスのインスタンスを初期化
    currentUser.name = name     # モデルクラスに値を設定(ユーザー名)
    currentUser.pass = pass     # モデルクラスに値を設定(パスワード)
    currentUser.mail = mail     # モデルクラスに値を設定(メールアドレス)
    currentUser.save()          # 登録

    session[:currentUser] = currentUser   # セッションにユーザーオブジェクトを入れる
    render :action => 'wellcome'          # サインアップ完了画面へ移動

  end    # 新規登録ボタン押下



  def deleteuser    # ユーザの削除(試しに)

puts "%%%%%%%%%%"

    render :text => 'ユーザー削除のてすと中'

    currentUser = session[:currentUser] 
    puts currentUser.name
#    puts currentUser.delete
#puts "----------delete----------"
#    puts currentUser.name
#puts "----------save?----------"
currentUser.name = "#####"
currentUser.save

  end    # ユーザーの削除(試しに)

end
