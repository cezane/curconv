require "test_helper"

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transaction = transactions(:one)
  end

  test "should get index" do
    get transactions_url
    assert_response :success
  end

  test "should get new" do
    get new_transaction_url
    assert_response :success
  end

  test "should create transaction" do
    assert_difference("Transaction.count") do
      post transactions_url, params: { transaction: { from_cur: @transaction.from_cur, from_val: @transaction.from_val, rate: @transaction.rate, timestamp: @transaction.timestamp, to_cur: @transaction.to_cur, to_val: @transaction.to_val, user_id: @transaction.user_id } }
    end

    assert_redirected_to transaction_url(Transaction.last)
  end

  test "should show transaction" do
    get transaction_url(@transaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_transaction_url(@transaction)
    assert_response :success
  end

  test "should update transaction" do
    patch transaction_url(@transaction), params: { transaction: { from_cur: @transaction.from_cur, from_val: @transaction.from_val, rate: @transaction.rate, timestamp: @transaction.timestamp, to_cur: @transaction.to_cur, to_val: @transaction.to_val, user_id: @transaction.user_id } }
    assert_redirected_to transaction_url(@transaction)
  end

  test "should destroy transaction" do
    assert_difference("Transaction.count", -1) do
      delete transaction_url(@transaction)
    end

    assert_redirected_to transactions_url
  end
end
