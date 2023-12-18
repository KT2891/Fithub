module Public::RelationshipsHelper

  # 確認用
  def relationship_text
    if @flag == :following
      t("follow")
    elsif @flag == :followers
      t("follower")
    end
  end

end
