require './bank_account'
describe BankAccount do
  it "is created with an opening balance and the name of the client" do
    account = BankAccount.new(500, "Sarah")
    expect(account).to be_a(BankAccount)
  end
  it "can report it's balance" do
    account = BankAccount.new(500, "Sarah")
    expect(account.balance).to eq(500)
  end
  it "can make deposits" do
    account = BankAccount.new(400, "Sarah")
    account.deposit(400)
    expect(account.balance).to eq(800)
  end
  it "can make withdrawals" do
    account = BankAccount.new(400, "Sarah")
    account.withdrawal(200)
    expect(account.balance).to eq(200)
  end
  it "can transfer funds to another bank account" do
    account1 = BankAccount.new(500, "Sarah")
    account2 = BankAccount.new(500, "John")
    account1.transfer(200, account2)
    expect(account1.balance).to eq(300)
    expect(account2.balance).to eq(700)
  end
  it "throws an error if minimum opening balance of 200 is not met" do
    # given account setup
    # then
    expect{(BankAccount.new(100, "Sarah"))}.to raise_error(ArgumentError)
  end
  it "allows the user to change the minimum balance" do
     BankAccount.minimum_balance = 300
     expect{(BankAccount.new(250, "Sarah"))}.to raise_error(ArgumentError)
  end
end
