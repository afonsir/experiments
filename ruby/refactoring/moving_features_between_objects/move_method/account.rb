class Account
  def overdraft_charge
    @account_type.overdraft_charge(@days_overdrawn)
  end

  def bank_charge
    result = 4.5
    result += overdraft_charge if @days_overdrawn.positive?
    result
  end
end
