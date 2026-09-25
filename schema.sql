-- High-Frequency Financial Fraud Detection Schema (Oracle SQL)

CREATE TABLE Accounts (
    account_id NUMBER PRIMARY KEY,
    account_holder VARCHAR2(100) NOT NULL,
    balance NUMBER(12,2) DEFAULT 0.00,
    status VARCHAR2(20) DEFAULT 'ACTIVE'
);

CREATE TABLE Transactions (
    transaction_id NUMBER PRIMARY KEY,
    account_id NUMBER REFERENCES Accounts(account_id),
    amount NUMBER(10,2) NOT NULL,
    merchant_category VARCHAR2(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Fraud_Alerts (
    alert_id NUMBER PRIMARY KEY,
    transaction_id NUMBER REFERENCES Transactions(transaction_id),
    risk_score NUMBER(5,2),
    reason VARCHAR2(200),
    flagged_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Seed Data
INSERT INTO Accounts VALUES (5001, 'Vasundhara Yadav', 15000.00, 'ACTIVE');
INSERT INTO Accounts VALUES (5002, 'John Doe', 2500.00, 'ACTIVE');

INSERT INTO Transactions VALUES (10001, 5001, 250.00, 'Electronics', CURRENT_TIMESTAMP);
INSERT INTO Transactions VALUES (10002, 5001, 9800.00, 'Crypto_Exchange', CURRENT_TIMESTAMP);

-- Audit Query: Extract high-value or elevated-risk transactions
SELECT t.transaction_id, a.account_holder, t.amount, t.merchant_category
FROM Transactions t
JOIN Accounts a ON t.account_id = a.account_id
WHERE t.amount > 5000.00 OR t.merchant_category = 'Crypto_Exchange';
