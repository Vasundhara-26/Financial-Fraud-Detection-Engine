#include <iostream>
#include <vector>
#include <string>

struct Transaction {
    int id;
    int accountId;
    double amount;
    std::string merchantCategory;
};

class LowLatencyFraudEngine {
public:
    static double calculateRiskScore(const Transaction& tx) {
        double risk = 0.0;

        if (tx.amount > 5000.0)
            risk += 50.0;

        if (tx.merchantCategory == "Crypto_Exchange")
            risk += 40.0;

        if (tx.amount > 10000.0)
            risk += 30.0;

        return (risk > 100.0) ? 100.0 : risk;
    }
};

int main() {
    std::vector<Transaction> transactions = {
        {10001, 5001, 250.00, "Electronics"},
        {10002, 5001, 9800.00, "Crypto_Exchange"},
        {10003, 5002, 12000.00, "Wire_Transfer"}
    };

    std::cout << "=== Low-Latency C++ Fraud Engine Running ===\n";

    for (const auto& tx : transactions) {
        double risk = LowLatencyFraudEngine::calculateRiskScore(tx);

        std::string status =
            (risk >= 70.0) ? "FLAGGED FOR BLOCKING" : "APPROVED";

        std::cout << "Tx ID: " << tx.id
                  << " | Amount: $" << tx.amount
                  << " | Risk Score: " << risk
                  << "%"
                  << " | Decision: " << status
                  << "\n";
    }

    return 0;
}
