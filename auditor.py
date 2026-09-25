def analyze_batch_transactions(transactions):
    print("--- Python Statistical Audit Processing ---")

    total_volume = sum(t["amount"] for t in transactions)

    high_value_txs = [
        t for t in transactions
        if t["amount"] >= 5000.0
    ]

    print(f"Total Daily Processing Volume: ${total_volume:,.2f}")
    print(f"Total Transactions Processed: {len(transactions)}")
    print(f"High-Risk / High-Value Flagged: {len(high_value_txs)}")

    for tx in high_value_txs:
        print(
            f" - Flagged Tx #{tx['id']}: "
            f"Account {tx['account_id']} | "
            f"${tx['amount']:,.2f} | "
            f"Category: {tx['category']}"
        )


if __name__ == "__main__":
    sample_batch = [
        {
            "id": 10001,
            "account_id": 5001,
            "amount": 250.00,
            "category": "Electronics"
        },
        {
            "id": 10002,
            "account_id": 5001,
            "amount": 9800.00,
            "category": "Crypto_Exchange"
        },
        {
            "id": 10003,
            "account_id": 5002,
            "amount": 12000.00,
            "category": "Wire_Transfer"
        }
    ]

    analyze_batch_transactions(sample_batch)
