module ApplicationHelper
  #ページごとにタイトルを変更する
  def full_title(page_title = '')
    base_title = "Shareversary"
      if page_title.empty? #タイトルが設定されていない場合
        base_title #サイト名だけ表示
      else
        "#{ page_title } / #{ base_title }"
      end
  end
end
