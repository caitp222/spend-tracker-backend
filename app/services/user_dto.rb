module UserDto

  def find_user_dto(id)
    user = User.find_by(id: id)
    return nil unless user

    return {
      name: "#{user.first_name} #{user.last_name}",
      total_records: user.money_records.count,
      created_at: user.created_at.to_date,
    }
  end

end
