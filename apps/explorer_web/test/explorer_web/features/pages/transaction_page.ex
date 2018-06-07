defmodule ExplorerWeb.TransactionPage do
  @moduledoc false

  use Wallaby.DSL

  import Wallaby.Query, only: [css: 1, css: 2]

  alias Explorer.Chain.{InternalTransaction, Transaction, Hash}

  def click_logs(session) do
    click(session, css("[data-test='transaction_logs_link']"))
  end

  def detail_hash(%Transaction{hash: transaction_hash}) do
    css("[data-test='transaction_detail_hash']", text: Hash.to_string(transaction_hash))
  end

  def contract_creation_address_hash(%InternalTransaction{created_contract_address_hash: hash}) do
    css("[data-test='created_contract_address_hash']", text: Hash.to_string(hash))
  end

  def visit_page(session, %Transaction{hash: transaction_hash}) do
    visit(session, "/en/transactions/#{transaction_hash}")
  end
end
