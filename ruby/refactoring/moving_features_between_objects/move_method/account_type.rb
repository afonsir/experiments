class AccountType
  def overdraft_charge(days_overdrawn)
    if premium?
      result = 10
      result += (days_overdrawn - 7) * 0.85 if days_overdrawn > 7
      result
    else
      days_overdrawn * 1.75
    end
  end
end
